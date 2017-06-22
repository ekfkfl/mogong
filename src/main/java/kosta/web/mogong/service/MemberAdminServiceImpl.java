package kosta.web.mogong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.web.mogong.dao.MemberAdminDAO;
import kosta.web.mogong.dto.UserDTO;

@Service
public class MemberAdminServiceImpl implements MemberAdminService {
	
	@Autowired
	private MemberAdminDAO memberAdminDAOImpl;
	
	@Override
	public List<UserDTO> selectAll(String id) {
		return memberAdminDAOImpl.selectAll(id);
	}

	@Override
	public int updateGrade(String grade, String id, String studyCode) {
		return memberAdminDAOImpl.updateGrade(grade, id, studyCode);
	}

	@Override
	public int memberDelete(String id, String studyCode) {
		return memberAdminDAOImpl.memberDelete(id, studyCode);
	}

	@Override
	public List<String> searchID(String keyWord) {
		return memberAdminDAOImpl.searchID(keyWord);
	}

	@Override
	public int inviteMember(String id, String recvId, String studyCode) {
	
		return memberAdminDAOImpl.inviteMember(id, recvId, studyCode);
	}

}
