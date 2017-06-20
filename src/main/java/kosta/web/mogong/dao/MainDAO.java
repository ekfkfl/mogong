package kosta.web.mogong.dao;

import java.util.List;

import kosta.web.mogong.dto.StudyDTO;

public interface MainDAO {
	/**
	 * 스터디 등록하기
	 * */
	int insertStudy(StudyDTO studyDTO);
	
	/**
	 * 스터디 상세보기 페이지
	 * */
	StudyDTO selectByStudyCode(String studyCode);
	
	/**
	 * 스터디 코드에 해당하는 조회수 증가시키기
	 * */
	int readNumUpdate(String studyCode);
	
	/**
	 * 읽지 않은 메시지 개수 가져오기
	 */
	String messageCount(String id);
}
