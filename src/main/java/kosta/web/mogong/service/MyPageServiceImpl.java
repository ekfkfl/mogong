package kosta.web.mogong.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.web.mogong.dao.MyPageDAO;
import kosta.web.mogong.dto.MemberDTO;
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
	public List<RecvMessageDTO> recvMail(String id) {
		return myPageDAOImpl.recvMail(id);
	}
	
	@Override
	public List<SendMessageDTO> sendMail(String id) {
		return myPageDAOImpl.sendMail(id);
	}

	@Override
	public int recvMessageInsert(SendMessageDTO sendMessage) {
		return myPageDAOImpl.recvMessageInsert(sendMessage);
	}

	@Override
	public RecvMessageDTO readMail(int recvMessageCode) {
		return myPageDAOImpl.readMail(recvMessageCode);
	}
	
	@Override
	public SendMessageDTO sendReadMail(int sendMessageCode) {
		return myPageDAOImpl.sendReadMail(sendMessageCode);
	}

	@Override
	public int readMessageUpdate(int recvMessageCode) {
		return myPageDAOImpl.readMessageUpdate(recvMessageCode);
	}

	@Override
	public int deleteMessage(int messageCode) {
		return myPageDAOImpl.deleteMessage(messageCode);
	}

	@Override
	public int deleteSendMessage(int messageCode) {
		return myPageDAOImpl.deleteSendMessage(messageCode);
	}

	@Override
	public List<SendMessageDTO> searchSendMail(String id, String word) {
		return myPageDAOImpl.searchSendMail(id, word);
	}

	@Override
	public List<RecvMessageDTO> searchRecvMail(String id, String word) {
		return myPageDAOImpl.searchRecvMail(id, word);
	}

	@Override
	public List<MemberDTO> selectJoinMember(String studyCode) {

		return myPageDAOImpl.selectJoinMember(studyCode);
	}

	@Override
	public int refuse(String sendId, String memberCode, String studyCode) {

		return myPageDAOImpl.refuse(sendId, memberCode, studyCode);
	}

	@Override
	public int allow(String memberCode, String studyCode) {

		return myPageDAOImpl.allow(memberCode, studyCode);
	}
	
	public int inviteAgree(String id, String studyCode) {
		return myPageDAOImpl.inviteAgree(id, studyCode);
	}

	@Override
	public int inviteRejection(String id, String idAndStudyCode) {
		return myPageDAOImpl.inviteRejection(id, idAndStudyCode);
	}

	


}
