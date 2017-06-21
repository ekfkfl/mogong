package kosta.web.mogong.service;

import java.util.List;

import kosta.web.mogong.dto.CommCodeDTO;
import kosta.web.mogong.dto.StudyDTO;

public interface MainService {
	
	int insertStudy(StudyDTO studyDTO);
	
	StudyDTO selectByStudyCode(String studyCode, boolean state);
	
	String messageCount(String id);
	
	List<CommCodeDTO> getAreaCode(String areaCode);
}
