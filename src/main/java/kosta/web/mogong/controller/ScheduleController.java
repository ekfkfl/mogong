package kosta.web.mogong.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/insert")
	@ResponseBody
	public int scheduleInsert(String studyCode,String title,String start,String end) throws ParseException{
		
		return scheduleService.scheduleInsert(new TaskDTO(Integer.parseInt(studyCode), title, start,end));
	}
	
}
