package com.example;

import com.example.mapper.UserMapper;
import com.example.model.po.User;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT)
@Slf4j
public class SpringBootDemoApplicationTests {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    @Autowired
    private UserMapper userMapper;

    @Test
    public void contextLoads() {
        log.info("info");
        log.debug("debug");
        log.trace("trace");
        log.warn("warn");
        log.error("error");
    }

    @Test
    public void testRedis() {
        User user = userMapper.selectById(1);
        redisTemplate.opsForValue().set("user", user);
        Object obj = redisTemplate.opsForValue().get("user");
        System.out.println(obj);
        System.out.println(obj.getClass());
    }

    @Test
    public void testPropertyDescriptor() throws IntrospectionException {
        PropertyDescriptor propertyDescriptor = new PropertyDescriptor("books", User.class);
        System.out.println(propertyDescriptor);
        System.out.println(propertyDescriptor.getPropertyType());
    }

    @Test
    public void testArray() throws IllegalAccessException, InstantiationException {
        User[] users = new User[7];
        Object[] objects = (Object[]) users;
        System.out.println(objects.length);
        System.out.println(objects.getClass());
    }

}
