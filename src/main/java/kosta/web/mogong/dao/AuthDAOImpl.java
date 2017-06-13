package kosta.web.mogong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.AuthorityDTO;
import kosta.web.mogong.dto.UserDTO;

@Repository
public class AuthDAOImpl implements AuthDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertUser(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDTO selectUser(String id) {
		System.out.println(id);
		UserDTO userDTO=sqlSession.selectOne("authMapper.selectUser", id);
		System.err.println(userDTO);
		return sqlSession.selectOne("authMapper.selectUser", id);
	}

	@Override
	public UserDTO deleteUser(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateUser(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserDTO> selectAllUser() {
		// TODO Auto-generated method stub
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

}
