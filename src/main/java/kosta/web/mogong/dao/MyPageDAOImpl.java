package kosta.web.mogong.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.MemberDTO;
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
	public List<RecvMessageDTO> recvMail(String id) {
		return sqlSession.selectList("mypageMapper.recvMail", id);
	}
	
	@Override
	public List<SendMessageDTO> sendMail(String id) {
		return sqlSession.selectList("mypageMapper.sendMail", id);
	}

	@Override
	public int recvMessageInsert(SendMessageDTO sendMessage) {
		return sqlSession.insert("mypageMapper.recvMessageInsert", sendMessage);
	}

	@Override
	public RecvMessageDTO readMail(int recvMessageCode) {
		return sqlSession.selectOne("mypageMapper.readMail", recvMessageCode);
	}
	
	@Override
	public SendMessageDTO sendReadMail(int sendMessageCode) {
		return sqlSession.selectOne("mypageMapper.sendReadMail", sendMessageCode);
	}

	@Override
	public int readMessageUpdate(int recvMessageCode) {
		return sqlSession.update("mypageMapper.readMessageUpdate", recvMessageCode);
	}

	@Override
	public int deleteMessage(int messageCode) {
		return sqlSession.delete("mypageMapper.deleteMessage", messageCode);
	}

	@Override
	public int deleteSendMessage(int messageCode) {
		return sqlSession.delete("mypageMapper.deleteSendMessage", messageCode);
	}

	@Override
	public List<SendMessageDTO> searchSendMail(String id, String word) {
		Map<String, String> map = new HashMap<>();
		
		map.put("id", id);
		map.put("word", word);
		
		return sqlSession.selectList("mypageMapper.searchSendMail", map);
	}

	@Override
	public List<RecvMessageDTO> searchRecvMail(String id, String word) {
		Map<String, String> map = new HashMap<>();
		
		map.put("id", id);
		map.put("word", word);
		
		return sqlSession.selectList("mypageMapper.searchRecvMail", map);
	}

	@Override
	public List<MemberDTO> selectJoinMember(String studyCode) {
		
		return sqlSession.selectList("memberMapper.joinStatusSelect", studyCode);
	}

	@Override
	public int refuse(String memberCode, String studyCode) {
		Map<String, String> map = new HashMap<>();
		map.put("memberCode", memberCode);
		map.put("studyCode", studyCode);
		
		return sqlSession.update("memberMapper.refuse", map);
	}

	@Override
	public int allow(String memberCode, String studyCode) {
		Map<String, String> map = new HashMap<>();
		map.put("memberCode", memberCode);
		map.put("studyCode", studyCode);
		
		return sqlSession.update("memberMapper.allow", map);
	}
}
