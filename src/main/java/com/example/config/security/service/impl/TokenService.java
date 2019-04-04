package com.example.config.security.service.impl;

import com.example.config.security.model.Token;
import com.example.config.security.model.UserDetailsImpl;
import com.example.config.security.service.ITokenService;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.security.Key;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Service
@Slf4j
public class TokenService implements ITokenService {

    @Value("${token.expire.seconds}")
    private Integer expireSeconds;
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    // 私钥
    @Value("${token.jwtSecret}")
    private String jwtSecret;

    private static Key KEY = null;
    private static final String LOGIN_USER_KEY = "LOGIN_USER_KEY";

    @Override
    public Token saveToken(UserDetailsImpl userDetails) {
        userDetails.setToken(UUID.randomUUID().toString());
        cacheUserDetails(userDetails);
        String token = createToken(userDetails);
        return new Token(token, userDetails.getLoginTime());
    }

    @Override
    public void refresh(UserDetailsImpl userDetails) {
        cacheUserDetails(userDetails);
    }

    @Override
    public UserDetailsImpl getUserDetalis(String token) {
        String uuid = getUUIDFromJWT(token);
        if (uuid != null) {
            return (UserDetailsImpl) redisTemplate.boundValueOps(getTokenKey(uuid)).get();
        }
        return null;
    }

    @Override
    public void deleteToken(String token) {
        String uuid = getUUIDFromJWT(token);
        if (uuid != null) {
            String key = getTokenKey(uuid);
            UserDetailsImpl userDetails = (UserDetailsImpl) redisTemplate.opsForValue().get(key);
            if (userDetails != null) {
                redisTemplate.delete(key);
            }
        }
    }

    // 生成token
    private String createToken(UserDetailsImpl userDetails) {
        Map<String, Object> claims = new HashMap<>();
        claims.put(LOGIN_USER_KEY, userDetails.getToken()); // 放入一个随机字符串，通过该串可找到登陆用户
        return Jwts.builder().setClaims(claims).signWith(SignatureAlgorithm.HS256, getKeyInstance()).compact();
    }

    private Key getKeyInstance() {
        if (KEY == null) {
            synchronized (TokenService.class) {
                if (KEY == null) { // 双重锁
                    byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(jwtSecret);
                    KEY = new SecretKeySpec(apiKeySecretBytes, SignatureAlgorithm.HS256.getJcaName());
                }
            }
        }
        return KEY;
    }

    // redis key
    private String getTokenKey(String uuid) {
        return "tokens:" + uuid;
    }

    // 将userDetails缓存到redis
    private void cacheUserDetails(UserDetailsImpl userDetails) {
        long now = System.currentTimeMillis();
        userDetails.setLoginTime(now);
        userDetails.setExpireTime(now + expireSeconds* 1000);
        // 根据uuid将loginUser缓存
        redisTemplate.boundValueOps(getTokenKey(userDetails.getToken())).set(userDetails, expireSeconds, TimeUnit.SECONDS);
    }

    // 根据token解密，计算出uuid
    private String getUUIDFromJWT(String token) {
        if (StringUtils.isEmpty(token)) {
            return null;
        }
        try {
            Map<String, Object> jwtClaims = Jwts.parser().setSigningKey(getKeyInstance()).parseClaimsJws(token).getBody();
            if (jwtClaims != null) {
                Object uuid = jwtClaims.get(LOGIN_USER_KEY);
                if (uuid != null) {
                    return uuid.toString();
                }
            }
            return null;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

}
