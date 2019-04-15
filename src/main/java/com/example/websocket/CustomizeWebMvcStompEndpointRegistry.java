package com.example.websocket;

import com.example.exception.ProjectException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationContext;
import org.springframework.lang.Nullable;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.util.MultiValueMap;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.servlet.handler.AbstractHandlerMapping;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.StompWebSocketEndpointRegistration;
import org.springframework.web.socket.config.annotation.WebMvcStompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebMvcStompWebSocketEndpointRegistration;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;
import org.springframework.web.socket.handler.WebSocketHandlerDecorator;
import org.springframework.web.socket.messaging.StompSubProtocolErrorHandler;
import org.springframework.web.socket.messaging.SubProtocolWebSocketHandler;
import org.springframework.web.socket.server.support.WebSocketHandlerMapping;
import org.springframework.web.util.UrlPathHelper;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 代替{@link org.springframework.web.socket.config.annotation.WebMvcStompEndpointRegistry}
 */
@Slf4j
public class CustomizeWebMvcStompEndpointRegistry extends WebMvcStompEndpointRegistry {

    // 代替父类中的属性
    private final WebSocketHandler webSocketHandler;

    private final TaskScheduler sockJsScheduler;

    private int order = 1;

    @Nullable
    private UrlPathHelper urlPathHelper;

    private final SubProtocolWebSocketHandler subProtocolWebSocketHandler;

    // 使用CustomizeStompSubProtocolHandler代替StompSubProtocolHandler
    private final CustomizeStompSubProtocolHandler stompHandler;

    private final List<WebMvcStompWebSocketEndpointRegistration> registrations = new ArrayList<>();

    public CustomizeWebMvcStompEndpointRegistry(WebSocketHandler webSocketHandler, WebSocketTransportRegistration transportRegistration, TaskScheduler defaultSockJsTaskScheduler) {
        super(webSocketHandler, transportRegistration, defaultSockJsTaskScheduler);
        this.webSocketHandler = webSocketHandler;
        this.subProtocolWebSocketHandler = unwrapSubProtocolWebSocketHandler(webSocketHandler);
        // 使用类反射获取transportRegistration中的属性
        Integer sendTimeLimit = getTransportRegistrationValue(transportRegistration, "sendTimeLimit");
        Integer sendBufferSizeLimit = getTransportRegistrationValue(transportRegistration, "sendBufferSizeLimit");
        Integer timeToFirstMessage = getTransportRegistrationValue(transportRegistration, "timeToFirstMessage");
        Integer messageSizeLimit = getTransportRegistrationValue(transportRegistration, "messageSizeLimit");
        if (sendTimeLimit != null) {
            this.subProtocolWebSocketHandler.setSendTimeLimit(sendTimeLimit);
        }
        if (sendBufferSizeLimit != null) {
            this.subProtocolWebSocketHandler.setSendBufferSizeLimit(sendBufferSizeLimit);
        }
        if (timeToFirstMessage != null) {
            this.subProtocolWebSocketHandler.setTimeToFirstMessage(timeToFirstMessage);
        }
        // 替换为自定义的stompHandler
        this.stompHandler = new CustomizeStompSubProtocolHandler();
        if (messageSizeLimit != null) {
            this.stompHandler.setMessageSizeLimit(messageSizeLimit);
        }
        this.sockJsScheduler = defaultSockJsTaskScheduler;
    }

    private static SubProtocolWebSocketHandler unwrapSubProtocolWebSocketHandler(WebSocketHandler handler) {
        WebSocketHandler actual = WebSocketHandlerDecorator.unwrap(handler);
        if (!(actual instanceof SubProtocolWebSocketHandler)) {
            throw new IllegalArgumentException("No SubProtocolWebSocketHandler in " + handler);
        }
        return (SubProtocolWebSocketHandler) actual;
    }

    @Override
    public StompWebSocketEndpointRegistration addEndpoint(String... paths) {
        this.subProtocolWebSocketHandler.addProtocolHandler(this.stompHandler);
        WebMvcStompWebSocketEndpointRegistration registration =
                new WebMvcStompWebSocketEndpointRegistration(paths, this.webSocketHandler, this.sockJsScheduler);
        this.registrations.add(registration);
        return registration;
    }

    @Override
    public void setOrder(int order) {
        this.order = order;
    }

    @Override
    protected int getOrder() {
        return this.order;
    }

    @Override
    public void setUrlPathHelper(@Nullable UrlPathHelper urlPathHelper) {
        this.urlPathHelper = urlPathHelper;
    }

    @Nullable
    @Override
    protected UrlPathHelper getUrlPathHelper() {
        return this.urlPathHelper;
    }

    @Override
    public CustomizeWebMvcStompEndpointRegistry setErrorHandler(StompSubProtocolErrorHandler errorHandler) {
        this.stompHandler.setErrorHandler(errorHandler);
        return this;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) {
        super.setApplicationContext(applicationContext);
    }

    public AbstractHandlerMapping getHandlerMapping() {
        Map<String, Object> urlMap = new LinkedHashMap<>();
        for (WebMvcStompWebSocketEndpointRegistration registration : this.registrations) {
            MultiValueMap<HttpRequestHandler, String> mappings = registration.getMappings();
            mappings.forEach((httpHandler, patterns) -> {
                for (String pattern : patterns) {
                    urlMap.put(pattern, httpHandler);
                }
            });
        }
        WebSocketHandlerMapping hm = new WebSocketHandlerMapping();
        hm.setUrlMap(urlMap);
        hm.setOrder(this.order);
        if (this.urlPathHelper != null) {
            hm.setUrlPathHelper(this.urlPathHelper);
        }
        return hm;
    }

    // 增加消息拦截器
    public CustomizeWebMvcStompEndpointRegistry addFromClientInterceptor(FromClientInterceptor interceptor) {
        this.stompHandler.addFromClientInterceptor(interceptor);
        return this;
    }

    // 增加消息拦截器
    public CustomizeWebMvcStompEndpointRegistry addToClientInterceptor(ToClientInterceptor interceptor) {
        this.stompHandler.addToClientInterceptor(interceptor);
        return this;
    }

    // 使用反射获取WebSocketTransportRegistration实例的属性
    private static Integer getTransportRegistrationValue(WebSocketTransportRegistration transportRegistration, String fieldName) {
        Integer ret = null;
        try {
            Field limitField = WebSocketTransportRegistration.class.getDeclaredField(fieldName);
            limitField.setAccessible(true);
            Object value = limitField.get(transportRegistration);
            if (value!=null) {
                ret = (Integer) value;
            }
        } catch (NoSuchFieldException|IllegalAccessException e) {
            log.error(e.getMessage(), e);
            throw new ProjectException("获取"+fieldName+"的值出错", e);
        }
        return ret;
    }

}
