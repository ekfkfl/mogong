package kosta.web.mogong.service;

import java.util.List;

import kosta.web.mogong.dto.StudyDTO;

public interface MyPageService {
	/**
	 * 신청중인 목록 가져오기
	 * */
	List<StudyDTO> studyRequestList();
}
