package kosta.web.mogong.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.UserDTO;

@Repository
public class MemberAdminDAOImpl implements MemberAdminDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private Map<String, String> map;
	
	@Override
	public List<UserDTO> selectAll(String id) {
		return sqlSession.selectList("studyMemberAdminMapper.memberSelectAll", id);
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
		map.put("studyCode", studyCode);
		
		return sqlSession.delete("studyMemberAdminMapper.memberDelete", map);
	}

	@Override
	public List<String> searchID(String keyWord) {
		return sqlSession.selectList("studyMemberAdminMapper.searchID", keyWord+"%");
	}

}
