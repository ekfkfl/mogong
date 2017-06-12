package kosta.web.mogong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.web.mogong.dto.TaskDTO;
import kosta.web.mogong.service.TaskService;

@Controller
@RequestMapping("member/study/task")
public class TaskController {
	@Autowired
	private TaskService taskService;
	
	@RequestMapping("")
	public String task() {
		return "task/taskMain";
	}
	
	@RequestMapping("/insertTask")
	@ResponseBody
	public void insertTask(String studyCode, String title, String progressStatus) {
		taskService.insertTask(new TaskDTO(Integer.parseInt(studyCode), title, progressStatus));
	}
}
