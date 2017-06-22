package kosta.web.mogong.dao;

import java.util.List;

import kosta.web.mogong.dto.CommCodeDTO;
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
	
	/**
	 * 지역코드 가져오기
	 */
	List<CommCodeDTO> getAreaCode(String areaCode);
	
	/**
	 * 등록순 상위 8개 스터디 이름 가져오기
	 */
	List<StudyDTO> selectRecentStudy();
	
	/**
	 * 스터디 검색
	 */
	List<StudyDTO> selectSearchStudy(StudyDTO studyDTO, int page);
}
