package kosta.web.mogong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.web.mogong.dao.StudyEnrollDAO;
import kosta.web.mogong.dto.StudyDTO;

@Service
@Transactional //데이터를 삽입하거나 수정하거나 삭제하는 경우 작업을 한번에 
public class StudyEnrollServiceImpl implements StudyEnrollService {
		
	@Autowired
	private StudyEnrollDAO studyEnrollDAO;
	
	@Override
	public int insertStudy(StudyDTO studyDTO) {
		
		int result = studyEnrollDAO.insertStudy(studyDTO);		
		return result;
	}

}
