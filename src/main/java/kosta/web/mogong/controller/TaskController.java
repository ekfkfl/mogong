package kosta.web.mogong.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.web.mogong.dto.TaskDTO;
import kosta.web.mogong.dto.TaskMemberDTO;
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
	
	/**
	 *	성훈 스터디 메인 페이지 
	 */
	@RequestMapping("/main")
	public ModelAndView taskMain(){
		List<TaskDTO> list = taskService.selectMainTask("6");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/studyMainContent");
		List<String> stateList = new ArrayList<>();
		
		mv.addObject("today", "0");
		mv.addObject("week", "0");
		mv.addObject("month", "0");
		mv.addObject("noEnd", "0");
		mv.addObject("end", "0");
		
		for(TaskDTO dto : list){
			stateList.add(dto.getState());
		}
		if(stateList.contains("1"))
			mv.addObject("today", "1");
		if(stateList.contains("2"))
			mv.addObject("week", "1");
		if(stateList.contains("3"))
			mv.addObject("month", "1");
		if(stateList.contains("4"))
			mv.addObject("noEnd", "1");
		if(stateList.contains("5"))
			mv.addObject("end", "1");
		
		mv.addObject("list",list);
		return mv;
	}
	
	

	@RequestMapping("/selectTaksMember")
	@ResponseBody
	public List<TaskMemberDTO> selectTaksMember(String taskCode) {
		return taskService.selectTaksMember(taskCode);
	}
	
	@RequestMapping("/test")
	public String test() {
		return "task/test";
	}
}
