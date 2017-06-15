package kosta.web.mogong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.web.mogong.dto.TaskDTO;
import kosta.web.mogong.service.ScheduleService;

@Controller
@RequestMapping("member/study/schedule")
public class ScheduleController {
	
	@Autowired
	ScheduleService scheduleService;
	
	@RequestMapping("")
	public String schedule(){
		
		return "member/studySchedule";
	}
	
	@RequestMapping("/data")
	@ResponseBody
	public List<TaskDTO> data(){
		List<TaskDTO> list = scheduleService.getScheduleData();
		
		return list;
	}
	
}
