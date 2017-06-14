package kosta.web.mogong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member/study/schedule")
public class ScheduleController {
	
	@RequestMapping("")
	public String schedule(){
		
		return "member/studySchedule";
	}
	
}
