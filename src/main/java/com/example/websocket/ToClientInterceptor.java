package com.example.websocket;

import org.springframework.messaging.Message;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.security.core.Authentication;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.messaging.StompSubProtocolHandler;

/**
 * websocket消息拦截器，
 * 拦截发送给客户端的消息
 */
public interface ToClientInterceptor {

    /**
     * 前置处理
     * @see CustomizeStompSubProtocolHandler#handleMessageToClient(WebSocketSession, Message)
     * @param session websocket session
     * @param authentication 认证信息
     * @param accessor websocket消息头解析器
     * @param payload websocket消息内容
     * @param handler stomp协议控制器
     * @return true 执行后续操作，false 取消后续操作
     */
    default boolean preHandle(WebSocketSession session, Authentication authentication, StompHeaderAccessor accessor, Object payload, StompSubProtocolHandler handler) {
        return true;
    }

    /**
     * 后置处理
     * @see CustomizeStompSubProtocolHandler#handleMessageToClient(WebSocketSession, Message)
     * @param session websocket session
     * @param authentication 认证信息
     * @param accessor websocket消息头解析器
     * @param payload websocket消息内容
     * @param handler stomp协议控制器
     */
    default void postHandle(WebSocketSession session, Authentication authentication, StompHeaderAccessor accessor, Object payload, StompSubProtocolHandler handler) {

    }

}
