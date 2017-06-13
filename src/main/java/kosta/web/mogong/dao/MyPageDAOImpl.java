package kosta.web.mogong.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.RecvMessageDTO;
import kosta.web.mogong.dto.SendMessageDTO;
import kosta.web.mogong.dto.StudyDTO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<StudyDTO> studyRequestList(String id) {
		return sqlSession.selectList("mypageMapper.studyRequestList", id);
	}

	@Override
	public List<StudyDTO> ongoingStudyList(String id) {
		return sqlSession.selectList("mypageMapper.ongoingStudyList", id);
	}

	@Override
	public List<StudyDTO> recruitStudyList(String id) {
		return sqlSession.selectList("mypageMapper.recruitStudyList", id);
	}

	@Override
	public int sendMessageInsert(SendMessageDTO sendMessage) {
		return sqlSession.insert("mypageMapper.sendMessageInsert", sendMessage);
	}

	@Override
	public List<RecvMessageDTO> mailMypage(String id) {
		return sqlSession.selectList("mypageMapper.mailMypage", id);
	}

	@Override
	public int recvMessageInsert(SendMessageDTO sendMessage) {
		return sqlSession.insert("mypageMapper.recvMessageInsert", sendMessage);
	}

}
