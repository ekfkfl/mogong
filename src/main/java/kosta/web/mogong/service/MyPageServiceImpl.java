package kosta.web.mogong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.web.mogong.dao.MyPageDAO;
import kosta.web.mogong.dto.StudyDTO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO myPageDAOImpl;
	
	@Override
	public List<StudyDTO> studyRequestList(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
