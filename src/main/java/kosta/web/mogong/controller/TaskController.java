package kosta.web.mogong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("member/study/task")
public class TaskController {
	@RequestMapping("")
	public String task() {
		return "task/taskMain";
	}
	
	/*@RequestMapping("/insertTask")
	@ResponseBody
	public  */
}
