package kosta.web.mogong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SocketController {
	
	@RequestMapping("/member/task/chatting")
	public String viewChattingPage(){
		return "/task/chatting";
	}

}
