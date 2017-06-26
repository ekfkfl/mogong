package kosta.web.mogong.service;

import java.util.List;

import kosta.web.mogong.dto.CommCodeDTO;
import kosta.web.mogong.dto.MemberDTO;
import kosta.web.mogong.dto.PageDTO;
import kosta.web.mogong.dto.StudyDTO;

public interface MainService {
	
	int insertStudy(StudyDTO studyDTO);
	
	StudyDTO selectByStudyCode(String studyCode, boolean state);
	
	String messageCount(String id);
	
	List<CommCodeDTO> getAreaCode(String areaCode);
	
	List<StudyDTO> selectRecentStudy();
	
	PageDTO selectSearchStudy(StudyDTO studyDTO, int page);
	
	String selectStudyMember(MemberDTO memberDTO);
	
	int studyUpdate(StudyDTO studyDTO);
	
	String studyJoin(MemberDTO memberDTO);
	
<<<<<<< HEAD
	MemberDTO memberCode(String id, int studyCode);
=======
	int studyJoinKing(MemberDTO memberDTO);
	
	int selectStudyCode(String name);
>>>>>>> c1ec68962c61d805ef3c5519565a3e7c4c092615
}
