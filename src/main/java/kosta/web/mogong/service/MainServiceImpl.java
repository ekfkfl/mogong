package kosta.web.mogong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.web.mogong.dao.MainDAO;
import kosta.web.mogong.dto.BoardDTO;
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
		return  mainDAO.selectByStudyCode(studyCode);
	}

	@Override
	public String messageCount(String id) {
		return mainDAO.messageCount(id);
	}

}
