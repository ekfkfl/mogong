package kosta.web.mogong.dao;

import java.util.List;

import kosta.web.mogong.dto.RecvMessageDTO;
import kosta.web.mogong.dto.SendMessageDTO;
import kosta.web.mogong.dto.StudyDTO;

public interface MyPageDAO {
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
	 * 받은 메세지 목록 가져오기
	 * */
	List<RecvMessageDTO> mailMypage(String id);
}
