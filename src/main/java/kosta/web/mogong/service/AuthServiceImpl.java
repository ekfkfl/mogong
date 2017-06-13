package kosta.web.mogong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.web.mogong.dao.AuthDAO;
import kosta.web.mogong.dto.AuthorityDTO;
import kosta.web.mogong.dto.UserDTO;
import kosta.web.mogong.util.Constants;

@Service
@Transactional
public class AuthServiceImpl implements AuthService {
	@Autowired
	private AuthDAO authDAO;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@Override
	public int insertUser(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDTO selectUser(String id) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@Override
	@Transactional
	public int joinMember(UserDTO userDTO) {
		//비밀번호 암호화
		String encodePass=passwordEncoder.encode(userDTO.getPassword());
		userDTO.setPassword(encodePass);
		authDAO.insertUser(userDTO);
		
		//권한등록
		authDAO.insertAuthority(new AuthorityDTO(userDTO.getId(), Constants.ROLE_MEMBER));
		
		//관리자인경우 권한등록
			
		if(userDTO.getUserType().equals("1")){
			authDAO.insertAuthority(new AuthorityDTO(userDTO.getId(), Constants.ROLE_ADMIN));
		}

		return 1;
	}

}
