package kosta.web.mogong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.AuthorityDTO;
import kosta.web.mogong.dto.MemberDTO;
import kosta.web.mogong.dto.UserDTO;

@Repository
public class AuthDAOImpl implements AuthDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertUser(UserDTO userDTO) {

		return sqlSession.insert("authMapper.insertUser", userDTO);
	}

	@Override
	public UserDTO selectUser(String id) {
		UserDTO userDTO=sqlSession.selectOne("authMapper.selectUser", id);
		System.out.println("selectUser DAO : " + userDTO);
		return userDTO;
	}

	@Override
	public UserDTO deleteUser(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateUser(UserDTO userDTO) {
		System.out.println("authDAO:update" + userDTO);
		return sqlSession.update("authMapper.updateUser", userDTO);
	}

	@Override
	public List<UserDTO> selectAllUser() {
		return null;
	}

	@Override
	public int insertAuthority(AuthorityDTO authorityDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AuthorityDTO> selectAuthoritesByUserName(String userName) {
		return sqlSession.selectList("authMapper.selectAuthorites", userName);
	}

	@Override
	public List<MemberDTO> selectMemberById(String id) {
		return sqlSession.selectList("authMapper.selectMemberById", id);
	}
	
	

}
