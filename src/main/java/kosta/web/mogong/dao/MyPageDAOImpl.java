package kosta.web.mogong.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public int studyRequsetDateUpdate(int studyCode) {
		return sqlSession.update("mypageMapper.studyRequsetDateUpdate", studyCode);
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
	public int refuse(String sendId, String memberCode, String studyCode) {
		
		Map<String, String> map = new HashMap<>();
		Map<String, Integer> map2 = new HashMap<>();
		
		map.put("sendId", sendId);
		map2.put("memberCode", Integer.parseInt(memberCode));
		map2.put("studyCode", Integer.parseInt(studyCode));
		MemberDTO memberDTO = sqlSession.selectOne("memberMapper.sendIdValue", Integer.parseInt(memberCode));
		if(sqlSession.delete("memberMapper.refuse", map2)==1){
		  map.put("recvId", memberDTO.getMemberId());
		  map.put("title", "초대 거부");
		  map.put("content", sendId+"님 "+memberDTO.getMemberId()+"님이 거부하셨습니다.");
		  if(sqlSession.insert("memberMapper.sendMessageRefuse", map)==1){
			  return sqlSession.insert("memberMapper.recvMessageRefuse", map);
		  }
		}
		return 0;
	}

	@Override
	public int allow(String memberCode, String studyCode) {
		Map<String, Integer> map = new HashMap<>();
		map.put("memberCode", Integer.parseInt(memberCode));
		map.put("studyCode", Integer.parseInt(studyCode));
		
		return sqlSession.update("memberMapper.allow", map);
	}
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
