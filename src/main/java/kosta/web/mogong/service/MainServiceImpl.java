package kosta.web.mogong.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.web.mogong.dao.MainDAO;
import kosta.web.mogong.dto.BoardDTO;
import kosta.web.mogong.dto.CommCodeDTO;
import kosta.web.mogong.dto.MemberDTO;
import kosta.web.mogong.dto.PageDTO;
import kosta.web.mogong.dto.StudyDTO;

@Service
@Transactional // 데이터를 삽입하거나 수정하거나 삭제하는 경우 작업을 한번에
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO mainDAO;

	@Override
	public int insertStudy(StudyDTO studyDTO) {

		int result = mainDAO.insertStudy(studyDTO);

		return result;
	}

	@Override
	public StudyDTO selectByStudyCode(String studyCode, boolean state) {

		if(state){
			mainDAO.readNumUpdate(studyCode);
		}
		
		StudyDTO dto =mainDAO.selectByStudyCode(studyCode);
		
		if(dto != null){
			String addr = dto.getAddr1();
			String[] str = addr.split(" ");
			String str2 = "";
			for(int i=0;i<str.length;i++){
				if(i !=0){
					str2 += str[i]+" ";
				}
			}
			dto.setAddr1(str2);
			
			String startDate = dto.getStartDate();
			str = startDate.split(" ");
			dto.setStartDate(str[0]);
			
			String endDate = dto.getEndDate();
			str = endDate.split(" ");
			dto.setEndDate(str[0]);
		}
		return  dto;
	}

	@Override
	public String messageCount(String id) {
		return mainDAO.messageCount(id);
	}

	@Override
	public List<CommCodeDTO> getAreaCode(String areaCode) {
		return mainDAO.getAreaCode(areaCode);
	}

	@Override
	public List<StudyDTO> selectRecentStudy() {
		return mainDAO.selectRecentStudy();
	}
	
	@Override
	public PageDTO selectSearchStudy(StudyDTO studyDTO, int page) {
		PageDTO pageDTO=new PageDTO(10, 3, page);
		Map<String, Object> resultMap=pageDTO.getResultMap();
		resultMap.put("studyDTO", studyDTO);
		return mainDAO.selectSearchStudy(pageDTO);
	}

	@Override
	public String selectStudyMember(MemberDTO memberDTO) {
		return mainDAO.selectStudyMember(memberDTO);
	}

	@Override
	public int studyUpdate(StudyDTO studyDTO) {
		return mainDAO.studyUpdate(studyDTO);
	}

	@Override
	public String studyJoin(MemberDTO memberDTO) {
		String result="정원이 초과되었습니다.";
		
		int member=mainDAO.studyJoinCheckMember(memberDTO.getStudyCode());
		int people=mainDAO.studyJoinCheckPeople(memberDTO.getStudyCode());
		
		if(member < people) {
			result="가입신청 완료 되었습니다.";
			mainDAO.studyJoin(memberDTO);
		}
		
		return result;
	}
}
