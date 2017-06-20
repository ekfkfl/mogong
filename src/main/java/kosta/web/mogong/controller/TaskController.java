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

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.util.JSONPObject;

import kosta.web.mogong.dto.AllTaskCodeDTO;
import kosta.web.mogong.dto.TaskDTO;
import kosta.web.mogong.service.TaskService;

@Controller
@RequestMapping("member/study/task")
public class TaskController {
	@Autowired
	private TaskService taskService;

	@RequestMapping("")
	public String task(String studyCode, Model model) {
		studyCode = "6";

		List<TaskDTO> taskList = taskService.selectAllTask(studyCode);
		List<TaskDTO> todoList = new ArrayList<>();
		List<TaskDTO> doingList = new ArrayList<>();
		List<TaskDTO> doneList = new ArrayList<>();
		
		

		for (TaskDTO dto : taskList) {
			if (dto.getProgressStatus().equals("0142")) {
				todoList.add(dto);
			} else if (dto.getProgressStatus().equals("0143")) {
				doingList.add(dto);
			} else if (dto.getProgressStatus().equals("0144")) {
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
	public TaskDTO insertTask(String studyCode, String title, String progressStatus, String taskIndex) {

		TaskDTO taskDTO = new TaskDTO(Integer.parseInt(studyCode), title, progressStatus);
		taskDTO.setTaskIndex(Integer.parseInt(taskIndex));
		return taskService.insertTask(taskDTO);
	}

	@RequestMapping("/selectOneTask")
	@ResponseBody
	public TaskDTO selectOneTask(String taskCode, String studyCode) {

		return taskService.selectOneTask(taskCode, studyCode);
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

	@RequestMapping("/moveTask")
	@ResponseBody
	public void moveTask(AllTaskCodeDTO allTaskCodeDTO) {
		taskService.moveTask(allTaskCodeDTO);
	}

	/**
	 * 성훈 스터디 메인 페이지
	 */
	@RequestMapping("/main")
	public ModelAndView taskMain() {
		List<TaskDTO> list = taskService.selectMainTask("6");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/studyMainContent");
		List<String> stateList = new ArrayList<>();

		mv.addObject("today", "0");
		mv.addObject("week", "0");
		mv.addObject("month", "0");
		mv.addObject("noEnd", "0");
		mv.addObject("end", "0");
		mv.addObject("after", "0");

		for (TaskDTO dto : list) {
			stateList.add(dto.getState());
		}
		
		if (stateList.contains("1"))
			mv.addObject("today", "1");
		if (stateList.contains("2"))
			mv.addObject("week", "1");
		if (stateList.contains("3"))
			mv.addObject("month", "1");
		if (stateList.contains("4"))
			mv.addObject("noEnd", "1");
		if (stateList.contains("5"))
			mv.addObject("end", "1");
		if (stateList.contains("6"))
			mv.addObject("after", "1");

		mv.addObject("list", list);
		return mv;
	}
	

	@RequestMapping("/chartResult")
	@ResponseBody
	public Map<String, Object> chartResult() {
		Map<String, Object> map = new HashMap<>();
		List<Integer> list = taskService.chartResult();
		List<TaskDTO> taskList = taskService.selectMainTask("6");
		int todoArr[] = {0,0,0,0,0,0};
		int doingArr[] = {0,0,0,0,0,0};
		
		for(TaskDTO dto : taskList){
			if("1".equals(dto.getState())){ //오늘까지
				if(dto.getProgressStatus().equals("0142")){ //To Do
					todoArr[0]++;
				} else if(dto.getProgressStatus().equals("0143")){ //Doing
					doingArr[0]++;
				}
			} else if("2".equals(dto.getState())){
				if(dto.getProgressStatus().equals("0142")){ //To Do
					todoArr[1]++;
				} else if(dto.getProgressStatus().equals("0143")){ //Doing
					doingArr[1]++;
				}
			} else if("3".equals(dto.getState())){
				if(dto.getProgressStatus().equals("0142")){ //To Do
					todoArr[2]++;
				} else if(dto.getProgressStatus().equals("0143")){ //Doing
					doingArr[2]++;
				}
			}else if("4".equals(dto.getState())){
				if(dto.getProgressStatus().equals("0142")){ //To Do
					todoArr[3]++;
				} else if(dto.getProgressStatus().equals("0143")){ //Doing
					doingArr[3]++;
				}
			}else if("5".equals(dto.getState())){
				if(dto.getProgressStatus().equals("0142")){ //To Do
					todoArr[4]++;
				} else if(dto.getProgressStatus().equals("0143")){ //Doing
					doingArr[4]++;
				}
			} else if("6".equals(dto.getState())){
				if(dto.getProgressStatus().equals("0142")){ //To Do
					todoArr[5]++;
				} else if(dto.getProgressStatus().equals("0143")){ //Doing
					doingArr[5]++;
				}
			}
		}

		map.put("todo", "0");
		map.put("doing", "0");
		map.put("done", "0");
		for (int i = 0; i < list.size(); i++) {
			if (i == 0)
				map.put("todo", list.get(i));
			if (i == 1)
				map.put("doing", list.get(i));
			if (i == 2)
				map.put("done", list.get(i));
		}

		map.put("todaytodo", todoArr[0]);
		map.put("weektodo", todoArr[1]);
		map.put("monthtodo", todoArr[2]);
		map.put("noendtodo", todoArr[3]);
		map.put("endtodo", todoArr[4]);
		map.put("aftertodo", todoArr[5]);
		map.put("todaydoing", doingArr[0]);
		map.put("weekdoing", doingArr[1]);
		map.put("monthdoing", doingArr[2]);
		map.put("noenddoing", doingArr[3]);
		map.put("enddoing", doingArr[4]);
		map.put("afterdoing", doingArr[5]);

		return map;
	}
}
