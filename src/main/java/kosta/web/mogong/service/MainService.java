package kosta.web.mogong.service;

import java.util.List;

import kosta.web.mogong.dto.CommCodeDTO;
import kosta.web.mogong.dto.MemberDTO;
import kosta.web.mogong.dto.StudyDTO;

public interface MainService {
	
	int insertStudy(StudyDTO studyDTO);
	
	StudyDTO selectByStudyCode(String studyCode, boolean state);
	
	String messageCount(String id);
	
	List<CommCodeDTO> getAreaCode(String areaCode);
	
	List<StudyDTO> selectRecentStudy();
	
	List<StudyDTO> selectSearchStudy(StudyDTO studyDTO, int page);
	
	String selectStudyMember(MemberDTO memberDTO);
	
	int studyUpdate(StudyDTO studyDTO);
	
	String studyJoin(MemberDTO memberDTO);
}
