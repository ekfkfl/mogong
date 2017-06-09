package kosta.web.mogong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/study")
public class StudyController {

	@RequestMapping("/main")
	public String studyMain(){
		return "member/studyMain";
	}
	
}
