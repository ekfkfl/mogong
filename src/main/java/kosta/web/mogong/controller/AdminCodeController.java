package kosta.web.mogong.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.web.mogong.dto.CommCodeDTO;
import kosta.web.mogong.service.AdminCodeService;

@Controller
@RequestMapping("/admin")
public class AdminCodeController {
	@Autowired
	private AdminCodeService adminCodeService;
	
	@RequestMapping("")
	public String adminMain(HttpServletRequest request){
		
		List<CommCodeDTO> commCodeDTOList=adminCodeService.selectCodeAll();
		
		request.setAttribute("commCodeDTOList", commCodeDTOList);
		return "admin/adminMain";
	}
	
	@RequestMapping("/commCodeList")
	@ResponseBody
	public List<CommCodeDTO> commCodeList(){
		return adminCodeService.selectCodeAll();
	}
	
	@RequestMapping("/insertCommCode")
	@ResponseBody
	public int insertCommCode(CommCodeDTO commCodeDTO){
		int result=adminCodeService.insertCode(commCodeDTO);
		return result;
	}
	
	@RequestMapping("/deleteCommCode")
	@ResponseBody
	public int deleteCommCode(String commCode){
		int result=adminCodeService.deleteCode(commCode);
		return result;
	}
}