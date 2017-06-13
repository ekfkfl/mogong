package kosta.web.mogong.security.provider;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kosta.web.mogong.dao.AuthDAO;
import kosta.web.mogong.dto.AuthorityDTO;
import kosta.web.mogong.dto.UserDTO;



@Service
public class MemberAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	private AuthDAO authDAO;

	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {

		//인증처리가 가능한 객체인지 확인 
		if(!supports(auth.getClass())){
			//인증처리가 가능하지 않다면 null을 리턴
			System.out.println("인증불가");
			return null;
		}
		
		//1.인수로 받은 user정보를 가지고 디비에 존재하는지 체크
		String id=auth.getName();//사용자가 입력한 id
		UserDTO userDTO=authDAO.selectUser(id);


		if(userDTO==null){	//id가 없는 경우
			throw new UsernameNotFoundException(id+"는 없는 회원입니다.");
		}

		
		//2. 존재하면 비밀번호 비교
		String password=(String)auth.getCredentials(); //사용자가 입력한 비밀번호
/*		if(!passwordEncoder.matches(password, userDTO.getPassword())){
			throw new BadCredentialsException("패스워드 오류입니다.");
		}*/
		if(!userDTO.getPassword().equals(password)){
			throw new BadCredentialsException("패스워드 오류입니다.");
		}
		//System.out.println("인증전....ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
		//3  모두가 일치하면 Authentication를 만들어서 리턴 
		List<AuthorityDTO> list=authDAO.selectAuthoritesByUserName(id);
		
		
		if(list.isEmpty()){
			//아무 권한이 없는 경우
			throw new UsernameNotFoundException(id+"는 아무 권한이 없습니다.");
		}
		System.out.println("list" + list);
		
		//db에서 가지고 온 권한을 GrantedAuthority로 변환해야 함.
		List<SimpleGrantedAuthority> authList=new ArrayList<>();
		for(AuthorityDTO authority : list){
			authList.add( new SimpleGrantedAuthority(authority.getRole()) );
		}
		
		
		return new UsernamePasswordAuthenticationToken(userDTO, null, authList);
	}

	/**
	 * 해당 타입의 authentication객체를 이용해서 인증 처리를
	 * 할수 있는지 여부를 리턴해주는 메소드
	 * 가능하면 true, 불가능하면 false
	 */
	
	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
