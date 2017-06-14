package kosta.web.mogong.dao;

import java.util.List;

import kosta.web.mogong.dto.AuthorityDTO;
import kosta.web.mogong.dto.UserDTO;

public interface AuthDAO {
	/**
	 * 회원가입
	 */
	int insertUser(UserDTO userDTO);
	
	/**
	 * ID에 해당하는 회원정보 검색
	 */
	UserDTO selectUser(String id);
	
	/**
	 * id 삭제
	 */
	UserDTO deleteUser(UserDTO userDTO);
	
	/**
	 * 회원정보 수정
	 */
	int updateUser(UserDTO userDTO);
	
	/**
	 * 전체회원정보 조회
	 */
	List<UserDTO> selectAllUser();
	
	
	
	/**
	 * 사용자 권한 등록
	 * (한 USER(아이디)가 여러개의 권한을 가질 수 있다.
	 */
	int insertAuthority(AuthorityDTO authorityDTO);
	
	
	/**
	 * id에 해당하는 권한 검색
	 */
	List<AuthorityDTO>selectAuthoritesByUserName(String userName);
}
