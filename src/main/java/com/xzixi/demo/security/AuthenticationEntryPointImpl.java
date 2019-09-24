package com.xzixi.demo.security;

import com.xzixi.demo.model.vo.ResultVO;
import com.xzixi.demo.util.ResponseUtil;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.xzixi.demo.model.vo.ResultVO.UNAUTHORIZED;

@Component
public class AuthenticationEntryPointImpl implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        ResultVO resultVO = new ResultVO<>(UNAUTHORIZED, exception.getMessage(), null);
        ResponseUtil.println(response, resultVO);
    }

}
