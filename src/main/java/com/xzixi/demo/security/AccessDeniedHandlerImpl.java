package com.xzixi.demo.security;

import com.xzixi.demo.model.vo.ResultVO;
import com.xzixi.demo.util.ResponseUtil;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.xzixi.demo.model.vo.ResultVO.FORBIDDEN;

// 权限不足
@Component
public class AccessDeniedHandlerImpl implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException exception) throws IOException {
        ResultVO resultVO = new ResultVO<>(FORBIDDEN, exception.getMessage(), null);
        ResponseUtil.println(response, resultVO);
    }

}
