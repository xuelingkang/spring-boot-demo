package com.example.config.security.model;

import com.example.model.po.Role;
import com.example.model.po.User;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
@NoArgsConstructor
public class UserDetailsImpl implements UserDetails, Serializable {

    private User user;
    private String token;
    /** 登陆时间戳 */
    private Long loginTime;
    /** 过期时间戳 */
    private Long expireTime;

    public UserDetailsImpl(User user) {
        this.user = user;
    }
    @Override
    @JsonIgnore
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Set<SimpleGrantedAuthority> authorities = new HashSet<>();
        List<Role> roles = user.getRoles();
        for (Role role: roles) {
            authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
        }
        return authorities;
    }
    @Override
    @JsonIgnore
    public String getPassword() {
        return user.getPassword();
    }
    @Override
    @JsonIgnore
    public String getUsername() {
        return user.getUsername();
    }
    // 账户是否未过期
    @Override
    @JsonIgnore
    public boolean isAccountNonExpired() {
        return true;
    }
    // 账户是否未锁定
    @Override
    @JsonIgnore
    public boolean isAccountNonLocked() {
        return true;
    }
    // 密码是否未过期
    @Override
    @JsonIgnore
    public boolean isCredentialsNonExpired() {
        return true;
    }
    // 账户是否激活
    @Override
    @JsonIgnore
    public boolean isEnabled() {
        return true;
    }

}
