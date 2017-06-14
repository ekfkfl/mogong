package kosta.web.mogong.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@RequestMapping("/chartResult")
	@ResponseBody
	public Map<String, Object> chartResult(){
		Map<String, Object> map = new HashMap<>();
		List<Integer> list = taskService.chartResult();
		List<TaskDTO> taskList = taskService.selectMainTask("6");
		int todoArr[] = {0,0,0,0,0};
		int doingArr[] = {0,0,0,0,0};
		
		for(TaskDTO dto : taskList){
			if(dto.getState().equals("1")){ //오늘까지
				if(dto.getProgressStatus().equals("0001")){ //To Do
					todoArr[0]++;
				} else if(dto.getProgressStatus().equals("0002")){ //Doing
					doingArr[0]++;
				}
			} else if(dto.getState().equals("2")){
				if(dto.getProgressStatus().equals("0001")){ //To Do
					todoArr[1]++;
				} else if(dto.getProgressStatus().equals("0002")){ //Doing
					doingArr[1]++;
				}
			} else if(dto.getState().equals("3")){
				if(dto.getProgressStatus().equals("0001")){ //To Do
					todoArr[2]++;
				} else if(dto.getProgressStatus().equals("0002")){ //Doing
					doingArr[2]++;
				}
			}else if(dto.getState().equals("4")){
				if(dto.getProgressStatus().equals("0001")){ //To Do
					todoArr[3]++;
				} else if(dto.getProgressStatus().equals("0002")){ //Doing
					doingArr[3]++;
				}
			}else if(dto.getState().equals("5")){
				if(dto.getProgressStatus().equals("0001")){ //To Do
					todoArr[4]++;
				} else if(dto.getProgressStatus().equals("0002")){ //Doing
					doingArr[4]++;
				}
			}
			
		}
		
		map.put("todo", list.get(0));
		map.put("doing", list.get(1));
		map.put("done", list.get(2));
		map.put("todaytodo", todoArr[0]);
		map.put("weektodo", todoArr[1]);
		map.put("monthtodo", todoArr[2]);
		map.put("noendtodo", todoArr[3]);
		map.put("endtodo", todoArr[4]);
		map.put("todaydoing", doingArr[0]);
		map.put("weekdoing", doingArr[1]);
		map.put("monthdoing", doingArr[2]);
		map.put("noenddoing", doingArr[3]);
		map.put("enddoing", doingArr[4]);
		
		return map;
	}
	
	@RequestMapping("/test")
	public String test() {
		return "task/test";
	}
	
	
}
