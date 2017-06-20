package kosta.web.mogong.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.web.mogong.dto.CommCodeDTO;
import kosta.web.mogong.dto.UserDTO;
import kosta.web.mogong.service.AdminCodeService;
import kosta.web.mogong.service.MainService;

@Controller
@RequestMapping("/admin")
public class AdminCodeController {
	@Autowired
	private AdminCodeService adminCodeService;
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("")
	public String adminMain(HttpServletRequest request, HttpSession session, Model model){
		UserDTO userDTO=(UserDTO) session.getAttribute("userDTO");
		
		if(userDTO != null) {
			model.addAttribute("messageCount", mainService.messageCount(userDTO.getId()));
		}
		
		List<CommCodeDTO> commCodeDTOList=adminCodeService.selectCodeAll();
		
		request.setAttribute("commCodeDTOList", commCodeDTOList);
		System.out.println(commCodeDTOList);
		return "admin/adminMain";
	}
	
	@RequestMapping("/commCodeList")
	@ResponseBody
	public List<CommCodeDTO> commCodeList(){
		
		System.out.println(adminCodeService.selectCodeAll());
		return adminCodeService.selectCodeAll();
	}
	
	@RequestMapping("/insertCommCode")
	@ResponseBody
	public int insertCommCode(CommCodeDTO commCodeDTO, HttpSession session) throws Exception{
		
		int result=adminCodeService.insertCode(commCodeDTO);
		if(result>0){
			ServletContext application=session.getServletContext();
			setCodeMap(application);
		}
		return result;
	}
	
	@RequestMapping("/deleteCommCode")
	@ResponseBody
	public int deleteCommCode(String commCode, HttpSession session) throws Exception{
		System.out.println(commCode);
		int result=adminCodeService.deleteCode(commCode);
		if(result>0){
			ServletContext application=session.getServletContext();
			setCodeMap(application);
		}
		return result;
	}
	
	@RequestMapping("/updateCommCode")
	@ResponseBody
	public int updateCommCode(CommCodeDTO commCodeDTO, HttpSession session) throws Exception{
		System.out.println(commCodeDTO);
		int result=adminCodeService.updateCode(commCodeDTO);
		if(result>0){
			ServletContext application=session.getServletContext();
			setCodeMap(application);
		}
		return result;
	}
	
	//공통코드 재생성
	private void setCodeMap(ServletContext application){
		List<CommCodeDTO> commCodeDTOList=adminCodeService.selectCodeAll();
		Map<String, CommCodeDTO> codeMap=(Map<String, CommCodeDTO>)application.getAttribute("codeMap");
		
		codeMap.clear();
		for(CommCodeDTO commCode : commCodeDTOList){
			codeMap.put(commCode.getCommCode(), commCode);
		}
	}
}
