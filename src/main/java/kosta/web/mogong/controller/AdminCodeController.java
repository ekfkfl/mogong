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
	public String commCodeList(){
		
		return "admin/commCode";
	}
	
	@RequestMapping("/insertCommCode")
	@ResponseBody
	public int insertCommCode(CommCodeDTO commCodeDTO) throws Exception{
		int result=adminCodeService.insertCode(commCodeDTO);
		return result;
	}
}
