package com.test.websocket;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.test.entity.Message;
import com.test.entity.User;

public class Myhandler extends TextWebSocketHandler {
	private Map<String, WebSocketSession> wssession;
	public static final Map<Integer, WebSocketSession> userSocketSessionMap;

	static {
		userSocketSessionMap = new HashMap<Integer, WebSocketSession>();
	}
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		System.out.println("已建立连接"+userSocketSessionMap.size());
		int uid = (int) session.getAttributes().get("ids");
		 
		if (userSocketSessionMap.get(uid) == null) {
			userSocketSessionMap.put(uid, session);
			
		}
		// TODO Auto-generated method stub
		/*super.afterConnectionEstablished(session);
		if(wssession==null){
			wssession = new HashMap<String, WebSocketSession>();
		}
		System.out.println("server-----socket--------");*/
	}

	@Override
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("1"+message.getPayload());
		TextMessage tmsg=new TextMessage(message.getPayload()+" server :"+new Timestamp(System.currentTimeMillis()));
		System.out.println(tmsg);
		Message msg=new Gson().fromJson(message.getPayload().toString(),Message.class);
		msg.setDate(new Date());
		System.out.println("msg.getto"+msg.getTo());
		sendMessageToUser(msg.getTo(), new TextMessage(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(msg)));
	}
	public void sendMessageToUser(int uid, TextMessage message)
			throws IOException {
		WebSocketSession session = userSocketSessionMap.get(uid);
		if (session != null && session.isOpen()) {
			session.sendMessage(message);
		}
	}
	 

}
