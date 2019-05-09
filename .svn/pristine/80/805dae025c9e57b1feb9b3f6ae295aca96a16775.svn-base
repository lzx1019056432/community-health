package com.test.websocket;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class PubHandler extends TextWebSocketHandler {

	private Map<String, WebSocketSession> wssession;
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		// TODO Auto-generated method stub
		if(wssession==null){
			wssession=new HashMap<String, WebSocketSession>();
		}
		wssession.put(session.getId(),session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		Timer tmr=new Timer();
		tmr.scheduleAtFixedRate(new Mytask(), 100, 2000);
	}
	class Mytask extends TimerTask{
		
		@Override
		public void run() {
			try {
				TextMessage tmsg=new TextMessage("server :"+new Timestamp(System.currentTimeMillis()));
				Set<String> idset = wssession.keySet(); 
				for (String ks : idset) {
					wssession.get(ks).sendMessage(tmsg);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
