package kosta.web.mogong.service;

import kosta.web.mogong.dto.StudyDTO;

public interface MainService {
	
	int insertStudy(StudyDTO studyDTO);
	
	StudyDTO selectByStudyCode(String studyCode, boolean state);

}
