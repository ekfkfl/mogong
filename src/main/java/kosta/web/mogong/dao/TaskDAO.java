package kosta.web.mogong.dao;

import java.util.List;

import kosta.web.mogong.dto.TaskDTO;
import kosta.web.mogong.dto.TaskMemberDTO;

public interface TaskDAO {
	List<TaskDTO> selectAllTask(String studyCode);
	
	List<TaskDTO> selectMainTask(String studyCode);
	
	TaskDTO selectOneTask(String taskCode);
	
	TaskDTO insertTask(TaskDTO taskDTO);
	
	int moveTask(String taskCode);
	
	int updateTask(TaskDTO taskDTO);
	
	int deleteTask(String taskCode);
	
	List<TaskMemberDTO> selectTaksMember(String taskCode);
	
	int insertTaskMember(TaskMemberDTO taskMemberDTO);
	
	int deleteTaskMember(TaskMemberDTO taskMemberDTO);
}
