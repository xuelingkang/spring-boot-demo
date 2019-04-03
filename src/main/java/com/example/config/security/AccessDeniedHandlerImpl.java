package com.example.config.security;

import com.example.model.vo.ResultVO;
import com.example.util.ResponseUtil;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.example.model.vo.ResultVO.FORBIDDEN;

public class AccessDeniedHandlerImpl implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException exception) throws IOException {
        ResultVO resultVO = new ResultVO<>(FORBIDDEN, "权限不足！", null);
        ResponseUtil.println(response, resultVO);
    }

}
