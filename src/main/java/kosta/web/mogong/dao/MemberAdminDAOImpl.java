package kosta.web.mogong.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.StudyDTO;
import kosta.web.mogong.dto.UserDTO;

@Repository
public class MemberAdminDAOImpl implements MemberAdminDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private Map<String, Object> map;
	
	@Override
	public List<UserDTO> selectAll(String id, int studyCode) {
		
		map = new HashMap<>();
		
		map.put("id", id);
		map.put("studyCode", studyCode);
		
		return sqlSession.selectList("studyMemberAdminMapper.memberSelectAll", map);
	}

	@Override
	public int updateGrade(String grade, String id, String studyCode) { 
		
		map = new HashMap<>();
		
		map.put("grade", grade);
		map.put("id", id);
		map.put("studyCode", studyCode);
		
		return sqlSession.update("studyMemberAdminMapper.updateGrade", map);
	}

	@Override
	public int memberDelete(String id, String studyCode) {
		
		map = new HashMap<>();
		
		map.put("id", id);
		map.put("studyCode", Integer.parseInt(studyCode));
		
		return sqlSession.delete("studyMemberAdminMapper.memberDelete", map);
	}

	@Override
	public List<String> searchID(String keyWord) {
		return sqlSession.selectList("studyMemberAdminMapper.searchID", keyWord+"%");
	}

	@Override
	public int inviteMember(String id, String recvId, String studyCode) {
		
		map = new HashMap<>();
		
		map.put("id", id);
		map.put("studyCode", Integer.parseInt(studyCode));
		
		StudyDTO studyDTO = sqlSession.selectOne("studyMemberAdminMapper.inviteStudyInfo", map);
		System.out.println(studyDTO);
		if(sqlSession.selectOne("studyMemberAdminMapper.idCheck", recvId)==""){
			return 0;
		}
		map.put("recvId", recvId);
		map.put("studyName", studyDTO.getName()+"에서 초대");
		map.put("studyContent", studyDTO.getDescription());
		map.put("joinStatus", "0002");
		
		if(sqlSession.insert("studyMemberAdminMapper.inviteMember", map)!=0){
			return sqlSession.insert("studyMemberAdminMapper.inviteRecvInsert", map);
		}
		return 0;
	}

}
