package kosta.web.mogong.dao;

import java.util.List;

import kosta.web.mogong.dto.StudyDTO;

public interface MyPageDAO {
	/**
	 * 신청중인 목록 가져오기
	 * */
	List<StudyDTO> studyRequestList(String id);
}
