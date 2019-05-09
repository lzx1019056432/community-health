package com.test.websocket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;

import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandleInterceptor extends HttpSessionHandshakeInterceptor{
	public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response,WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception{
		System.out.println("wsHandler"+wsHandler.toString());
		System.out.println("attributes"+attributes);
		 ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
         HttpSession session = servletRequest.getServletRequest().getSession(false);
        System.out.println("uidsession"+session.getAttribute("uid"));
        attributes.put("ids",session.getAttribute("uid"));
         return super.beforeHandshake(request, response, wsHandler, attributes);
		
	}
	public void afterHandshake(ServerHttpRequest request,ServerHttpResponse response,WebSocketHandler wsHandler,Exception ex){
		 super.afterHandshake(request, response, wsHandler, ex);
	}
	
	

}
