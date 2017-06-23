package kosta.web.mogong.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public int inviteAgree(String id, String studyCode) {
		Map<String, String> map = new HashMap<>();
		
		map.put("id", id);
		map.put("studyCode", studyCode);
		if(sqlSession.insert("mypageMapper.inviteAgree", map)==1){
			return sqlSession.update("mypageMapper.inviteRecvUpdate", map);
		}
		return 0;
	}

	@Override
	public int inviteRejection(String id, String idAndStudyCode) {
		Map<String, String> map = new HashMap<>();
		
		String idAndStudyCodes[] = idAndStudyCode.split(",");
		String sendId = idAndStudyCodes[0];
		String studyCode = idAndStudyCodes[1];
		
		map.put("id", id);
		map.put("sendId", sendId);
		map.put("title", "초대 거부");
		map.put("content", sendId+"님 "+id+"님이 초대 받지 않으셨습니다.");
		map.put("studyCode", studyCode);
		if(sqlSession.insert("mypageMapper.inviteRejection", map)==1){
			sqlSession.insert("mypageMapper.inviteRecvRejection", map);
			return sqlSession.update("mypageMapper.inviteRecvRejectionUpdate", map);
		}
		return 0;
	}
}
