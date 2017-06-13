package kosta.web.mogong.controller;

<<<<<<< HEAD
public class TaskController {
	
	
	
=======
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String task(String studyCode, Model model) {
		studyCode="6";
		
		List<TaskDTO> taskList = taskService.selectAllTask(studyCode);
		List<TaskDTO> todoList = new ArrayList<>();
		List<TaskDTO> doingList = new ArrayList<>();
		List<TaskDTO> doneList = new ArrayList<>();
		
		for(TaskDTO dto : taskList) {
			if(dto.getProgressStatus().equals("0001")) {
				todoList.add(dto);
			} else if(dto.getProgressStatus().equals("0002")) {
				doingList.add(dto);
			} else if(dto.getProgressStatus().equals("0003")) {
				doneList.add(dto);
			}
		}
		
		model.addAttribute("todoList", todoList);
		model.addAttribute("doingList", doingList);
		model.addAttribute("doneList", doneList);
		
		return "task/taskMain";
	}
	
	@RequestMapping("/insertTask")
	@ResponseBody
	public TaskDTO insertTask(String studyCode, String title, String progressStatus) {
		return taskService.insertTask(new TaskDTO(Integer.parseInt(studyCode), title, progressStatus));
	}
	
	@RequestMapping("/selectOneTask")
	@ResponseBody
	public TaskDTO selectOneTask(String taskCode) {
		
		return taskService.selectOneTask(taskCode);
	}
	
	@RequestMapping("/deleteTask")
	@ResponseBody
	public void deleteTask(String taskCode) {
		taskService.deleteTask(taskCode);
	}
	
	@RequestMapping("/updateTask")
	@ResponseBody
	public void updateTask(TaskDTO taskDTO) {
		taskService.updateTask(taskDTO);
	}
>>>>>>> 5cbe507bcd7aa12c9a0430edc0c20007bb419d5d
}
