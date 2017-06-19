package kosta.web.mogong.websocket.handler;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class EchoHandler extends TextWebSocketHandler {
	
		//세션을 모두 저장한다
		private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
		
		private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
		
		/**
		 * 클라이언트 연결 후에 실행되는 메소드
		 * */
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			sessionList.add(session);
			//0번째 중괄호에 session.getId()를 넣으라는 뜻
			logger.info("{} 연결됨", session.getId());
		}
		
		/**
		 * 클라이언트가 웹소켓 서버로 메세지를 전송 했을 때 실행되는 메소드
		 * */
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
			
			//연결된 모든 클라이언트에게 메세지 전송 : 리스트 방법
			for(WebSocketSession sess : sessionList){
	            sess.sendMessage(new TextMessage(session.getId()+"--->>"+ message.getPayload()));
	        }
		}
		
		/**
		 * 클라이언트 연결을 끊었을때 실행되는 메소드
		 * */
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			sessionList.remove(session);
			logger.info("{} 연결 끊김.", session.getId());
		}
	
}
