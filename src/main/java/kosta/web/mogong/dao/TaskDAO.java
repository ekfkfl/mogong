package kosta.web.mogong.dao;

import java.util.List;

import kosta.web.mogong.dto.TaskDTO;

public interface TaskDAO {
	List<TaskDTO> selectAllTask(String studyCode);
	
	TaskDTO selectOneTask(String taskCode);
	
	int insertTask(TaskDTO taskDTO);
	
	int moveTask(String taskCode);
	
	int updateTask(TaskDTO taskDTO);
	
	int deleteTask(String taskCode);
}
