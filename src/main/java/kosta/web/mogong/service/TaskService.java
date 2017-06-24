package kosta.web.mogong.service;

import java.util.List;

import kosta.web.mogong.dto.AllTaskCodeDTO;
import kosta.web.mogong.dto.StudyDTO;
import kosta.web.mogong.dto.TaskCommentDTO;
import kosta.web.mogong.dto.TaskDTO;
import kosta.web.mogong.dto.TaskFileDTO;

public interface TaskService {
	List<TaskDTO> selectAllTask(String studyCode);
	
	List<TaskDTO> selectMainTask(String studyCode);

	TaskDTO selectOneTask(String taskCode,String studyCode);

	TaskDTO insertTask(TaskDTO taskDTO);

	void moveTask(AllTaskCodeDTO allTaskCodeDTO);

	void updateTask(TaskDTO taskDTO);

	void deleteTask(String taskCode);
	
	List<TaskDTO> chartResult(String studyCode);
	
	TaskCommentDTO insertTaskComment(TaskCommentDTO taskCommentDTO);
	
	List<TaskCommentDTO> selectTaskComment(int taskCode);
	
	void insertTaskFile(TaskFileDTO taskFileDTO);
	
	List<TaskFileDTO> selectTaskFile(int taskCode);
	
	TaskFileDTO selectOneTaskFile(int taskFileCode);
	
	String selectTaskGroupJang(StudyDTO studyDTO);
}
