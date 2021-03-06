package kosta.web.mogong.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.web.mogong.dto.MemberDTO;
import kosta.web.mogong.dto.UserDTO;
import kosta.web.mogong.service.MemberAdminService;
import kosta.web.mogong.util.CodeUtil;

@Controller
public class MemberAdminController {
	
	@Autowired
	private MemberAdminService memberAdminServiceImpl;
	
	@RequestMapping("/member/study/memberAdmin")
	public String memberAdmin(HttpServletRequest request, String studyCode){
		request.setAttribute("studyCode", studyCode);
		
		return "/member/memberAdmin";
	}
	
	@RequestMapping("/member/study/memberListAll")
	@ResponseBody
	public List<UserDTO> memberAdmin2(HttpSession session, String studyCode){
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
		List<UserDTO> userList = memberAdminServiceImpl.selectAll(userDTO.getId(), Integer.parseInt(studyCode));
		
		for(UserDTO dto : userList){
			dto.setGender(CodeUtil.getCodeName(dto.getGender()));
		}
		
		return userList;
	}
	
	@RequestMapping("/member/study/updateGrade")
	@ResponseBody
	public void updateGrade(String grade, String id, String studyCode){
		memberAdminServiceImpl.updateGrade(grade, id, studyCode);
	}
	
	@RequestMapping("/member/study/memberDelete")
	@ResponseBody
	public void memberUpdate(String id, String studyCode){
		memberAdminServiceImpl.memberDelete(id, studyCode);
	}
	
	@RequestMapping("/member/study/searchID")
	@ResponseBody
	public List<String> searchID(String keyWord){
		
		List<String> list = memberAdminServiceImpl.searchID(keyWord);
		
		return list;
	}
	
	@RequestMapping("/member/study/inviteMember")
	@ResponseBody
	public int inviteMember(HttpSession session,String recvId, String studyCode){
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
		
		String id = userDTO.getId();
			
		return memberAdminServiceImpl.inviteMember(id, recvId, studyCode);
	}
	
}
