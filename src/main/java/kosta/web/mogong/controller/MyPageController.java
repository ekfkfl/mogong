package kosta.web.mogong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	@RequestMapping("/mypage/studyRequest")
	public String studyRequest(){
		
		
		
		return "/mypage/studyRequest";
	}
	
}
