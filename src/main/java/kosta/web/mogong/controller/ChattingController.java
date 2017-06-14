package kosta.web.mogong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChattingController {
	
	/**
	 * 광준 스터디 채팅 부분
	 * */
	@RequestMapping("/member/study/task/chatting")
	public String chatting(){
		return "/task/chatting";
	}
	
}
