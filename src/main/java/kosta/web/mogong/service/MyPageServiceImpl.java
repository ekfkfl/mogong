package kosta.web.mogong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.web.mogong.dao.MyPageDAO;
import kosta.web.mogong.dto.RecvMessageDTO;
import kosta.web.mogong.dto.SendMessageDTO;
import kosta.web.mogong.dto.StudyDTO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO myPageDAOImpl;
	
	@Override
	public List<StudyDTO> studyRequestList(String id) {
		return myPageDAOImpl.studyRequestList(id);
	}

	@Override
	public List<StudyDTO> ongoingStudyList(String id) {
		return myPageDAOImpl.ongoingStudyList(id);
	}

	@Override
	public List<StudyDTO> recruitStudyList(String id) {
		return myPageDAOImpl.recruitStudyList(id);
	}

	@Override
	public int sendMessageInsert(SendMessageDTO sendMessage) {
		return myPageDAOImpl.sendMessageInsert(sendMessage);
	}

	@Override
	public List<RecvMessageDTO> mailMypage(String id) {
		return myPageDAOImpl.mailMypage(id);
	}

}
