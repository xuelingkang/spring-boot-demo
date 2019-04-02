package com.example.config.security;

import com.example.mapper.ResourceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;

import java.util.Collection;

@Component
public class FilterInvocationSecurityMetadataSourceImpl implements FilterInvocationSecurityMetadataSource {

    @Autowired
    private ResourceMapper resourceMapper;

    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
//        HttpServletRequest request = ((FilterInvocation) object).getHttpRequest();
//        // 得到用户的请求地址,控制台输出一下
//        String requestUrl = request.getMethod() + " " + ((FilterInvocation) object).getRequestUrl();
//        System.out.println("用户请求的地址是：" + requestUrl);
//
//        // 如果登录页面就不需要权限
//        if ("/login".equals(requestUrl)) {
//            return null;
//        }
//
//        Resource resource = resourceMapper.selectOne(new QueryWrapper<>(new Resource().setResourceUrl(requestUrl)));
//
//        //如果没有匹配的url则说明大家都可以访问
//        if(resource == null) {
//            return SecurityConfig.createList("ROLE_LOGIN");
//        }
//
//        //将resource所需要到的roles按框架要求封装返回（ResourceService里面的getRoles方法是基于RoleRepository实现的）
//        List<Role> roles = resourceService.getRoles(resource.getId());
//        int size = roles.size();
//        String[] values = new String[size];
//        for (int i = 0; i < size; i++) {
//            values[i] = roles.get(i).getRoleName();
//        }
//        return SecurityConfig.createList(values);
        return null;
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return false;
    }

}
