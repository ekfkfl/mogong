package kosta.web.mogong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/study")
public class StudyController {

	@RequestMapping("/main")
	public String studyMain(){
		return "study/studyMain";
	}
	
}
