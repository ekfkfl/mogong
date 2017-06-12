package kosta.web.mogong.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.web.mogong.dto.StudyDTO;
import kosta.web.mogong.service.StudyEnrollService;

@Controller
@RequestMapping("/enroll")
public class StudyEnrollController {
	
	@Autowired
	private StudyEnrollService service;
	
	@RequestMapping("insert")
	public String insert(HttpServletRequest request, StudyDTO studyDTO){
		System.out.println(studyDTO);
		
		service.insertStudy(studyDTO);
		
		return "enroll/enroll";
	}
	
	
	
	

}
