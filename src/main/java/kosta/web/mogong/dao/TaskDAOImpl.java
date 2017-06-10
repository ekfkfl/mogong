package kosta.web.mogong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.TaskDTO;

@Repository
public class TaskDAOImpl implements TaskDAO {

	@Autowired
	private SqlSession sqlSession;

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
	public int insertTask(TaskDTO taskDTO) {
		return sqlSession.insert("taskMapper.insertTask", taskDTO);
	}

	@Override
	public int moveTask(String taskCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTask(TaskDTO taskDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTask(String taskCode) {
		// TODO Auto-generated method stub
		return 0;
	}
}
