package kosta.web.mogong.service;

import java.util.List;

import kosta.web.mogong.dto.ProgressDTO;
import kosta.web.mogong.dto.TaskDTO;
import kosta.web.mogong.dto.TaskMemberDTO;

public interface TaskService {
	List<TaskDTO> selectAllTask(String studyCode);
	
	List<TaskDTO> selectMainTask(String studyCode);

	TaskDTO selectOneTask(String taskCode,String studyCode);

	TaskDTO insertTask(TaskDTO taskDTO);

	void moveTask(String taskCode, ProgressDTO progressDTO);

	void updateTask(TaskDTO taskDTO);

	void deleteTask(String taskCode);
	
	List<Integer> chartResult();
}
