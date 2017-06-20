package kosta.web.mogong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/member/study/board")
	public String boardMain(){
		
		return "board/board"; 
	}
	
}
