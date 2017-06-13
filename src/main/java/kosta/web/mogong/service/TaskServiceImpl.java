package kosta.web.mogong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kosta.web.mogong.dao.TaskDAO;
import kosta.web.mogong.dto.TaskDTO;
import kosta.web.mogong.dto.TaskMemberDTO;

@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class TaskServiceImpl implements TaskService {
	@Autowired
	private TaskDAO taskDAO;

	@Override
	public List<TaskDTO> selectAllTask(String studyCode) {
		return taskDAO.selectAllTask(studyCode);
	}

	@Override
	public TaskDTO selectOneTask(String taskCode) {
		List<TaskMemberDTO> list=taskDAO.selectTaksMember(taskCode);
		TaskDTO taskDTO = taskDAO.selectOneTask(taskCode);
		taskDTO.setTaskMemberList(list);
		
		return taskDTO;
	}
	
	@Override
	public TaskDTO insertTask(TaskDTO taskDTO) {
		taskDAO.insertTask(taskDTO);
		
		return taskDTO;
	}

	@Override
	public void moveTask(String taskCode) {
		taskDAO.moveTask(taskCode);
	}

	@Override
	public void updateTask(TaskDTO taskDTO) {
		taskDAO.updateTask(taskDTO);
	}

	@Override
	public void deleteTask(String taskCode) {
		taskDAO.deleteTask(taskCode);
	}

	@Override
	public List<TaskMemberDTO> selectTaksMember(String taskCode) {
		return taskDAO.selectTaksMember(taskCode);
	}
}
