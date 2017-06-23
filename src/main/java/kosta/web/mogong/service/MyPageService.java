package kosta.web.mogong.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kosta.web.mogong.dto.RecvMessageDTO;
import kosta.web.mogong.dto.SendMessageDTO;
import kosta.web.mogong.dto.StudyDTO;

public interface MyPageService {
	/**
	 * 신청중인 목록 가져오기
	 * */
	List<StudyDTO> studyRequestList(String id);
	
	/**
	 * 진행중인 목록 가져오기
	 * */
	List<StudyDTO> ongoingStudyList(String id);
	
	/**
	 * 모집중인 목록 가져오기
	 * */
	List<StudyDTO> recruitStudyList(String id);
	
	/**
	 * 메세지 보내기
	 * */
	int sendMessageInsert(SendMessageDTO sendMessage);
	
	/**
	 * 메세지 보내기(받은메세지 등록)
	 * */
	int recvMessageInsert(SendMessageDTO sendMessage);
	
	/**
	 * 받은 메세지 목록 가져오기
	 * */
	List<RecvMessageDTO> recvMail(String id);
	
	/**
	 * 보낸 메세지 목록 가져오기
	 * */
	List<SendMessageDTO> sendMail(String id);
	
	/**
	 * 메세지 불러오기
	 * */
	RecvMessageDTO readMail(int recvMessageCode);
	
	/**
	 * 보낸 메세지 불러오기
	 * */
	SendMessageDTO sendReadMail(int sendMessageCode);
	
	/**
	 * 읽은 메세지 업데이트
	 * */
	int readMessageUpdate(int recvMessageCode);
	
	/**
	 * 메세지 삭제하기
	 * */
	int deleteMessage(int messageCode);
	
	/**
	 * 보낸메세지 삭제하기
	 * */
	int deleteSendMessage(int messageCode);
	
	/**
	 * 검색하기(보낸메세지)
	 * */
	List<SendMessageDTO> searchSendMail(String id, String word);
	
	/**
	 * 검색하기(받은메세지)
	 * */
	List<RecvMessageDTO> searchRecvMail(String id, String word);
	
	/**
	 * 스터디 초대 수락
	 * */
	 int inviteAgree(String id, String studyCode);
	 
	 /**
	  * 스터디 초대 거부
	  * */
	 int inviteRejection(String id, String idAndStudyCode);
	
}
