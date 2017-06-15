package kosta.web.mogong.websoket.handler;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



public class EchoHandler extends TextWebSocketHandler {
	
	private Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private List<WebSocketSession> connectedUser;
	
	/**
	 * 서버에 연결한 사용자들 저장
	 * */
	public EchoHandler() {
		connectedUser = new ArrayList<WebSocketSession>();
	}
	
	/**
	 * 접속관련 Event Method
	 * @param WebSocketSession 접속한 사용자
	 * */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info(session.getId()+"접속");
		logger.info("연결 IP : "+ session.getRemoteAddress().getHostName());
		connectedUser.add(session);
	}
	
	
	/**
	 * 2가지 이벤트 처리
	 * 1.Send : 클라이언트가 서버에게 메세지를 보냄
	 * 2.Emit : 서버에 연결되어있는 클라이언트에게 메세지를 보냄
	 * @param WebSocketSession 메세지를 보낸 클라이언트
	 * @param TextMessage 메세지의 내용
	 * */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//payload = 사용자가 보낸 메세지
		logger.info(session.getId()+"님 메세지 전송"+ message.getPayload());
		
		for(WebSocketSession webSocketSession : connectedUser){
			//보낸 사용자는 받지 않기위한 조건문
			if(!session.getId().equals(webSocketSession)){
				webSocketSession.sendMessage(new TextMessage(session.getId()+"->"+message.getPayload()));
			}
		}
		
	}
	
	
	/**
	 * 클라이언트가 서버와 연결 종료
	 * 
	 * @param WebSocketSession 연결을 끊은 클라이언트
	 * @param CloseStatus 연결 상태 (확인필요)
	 * */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info(session.getId()+"님 접속종료");
		connectedUser.remove(session);
	}
	
}
