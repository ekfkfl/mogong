package kosta.web.mogong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kosta.web.mogong.dao.TaskDAO;
import kosta.web.mogong.dto.TaskDTO;

@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class TaskServiceImpl implements TaskService {
	@Autowired
	private TaskDAO taskDAO;

	@Override
	public List<TaskDTO> selectAllTask(String studyCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TaskDTO selectOneTask(String taskCode) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void insertTask(TaskDTO taskDTO) {
		taskDAO.insertTask(taskDTO);
	}

	@Override
	public void moveTask(String taskCode) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTask(TaskDTO taskDTO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTask(String taskCode) {
		// TODO Auto-generated method stub
		
	}
}
