package kosta.web.mogong.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.web.mogong.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageServiceImpl;

	@RequestMapping("/mypage/studyRequest")
	public String studyRequest(HttpSession session){
		
		String id = (String)session.getAttribute("id");
		
		
		return "/mypage/studyRequest";
	}
	
}
