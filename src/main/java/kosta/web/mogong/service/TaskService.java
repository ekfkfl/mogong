package kosta.web.mogong.service;

import java.util.List;

import kosta.web.mogong.dto.TaskDTO;

public interface TaskService {
	List<TaskDTO> selectAllTask(String studyCode);
	
	List<TaskDTO> selectMainTask(String studyCode);

	TaskDTO selectOneTask(String taskCode);

	TaskDTO insertTask(TaskDTO taskDTO);

	void moveTask(String taskCode);

	void updateTask(TaskDTO taskDTO);

	void deleteTask(String taskCode);
}
