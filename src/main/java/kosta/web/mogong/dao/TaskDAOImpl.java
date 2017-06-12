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
		return sqlSession.selectList("taskMapper.selectAllTask", studyCode);
	}

	@Override
	public TaskDTO selectOneTask(String taskCode) {
		return sqlSession.selectOne("taskMapper.selectOneTask", taskCode);
	}

	@Override
	public int insertTask(TaskDTO taskDTO) {
		return sqlSession.insert("taskMapper.insertTask", taskDTO);
	}

	@Override
	public int moveTask(String taskCode) {
		return sqlSession.update("taskMapper.moveTask", taskCode);
	}

	@Override
	public int updateTask(TaskDTO taskDTO) {
		return sqlSession.update("taskMapper.moveTask", taskDTO);
	}

	@Override
	public int deleteTask(String taskCode) {
		return sqlSession.delete("taskMapper.deleteTask", taskCode);
	}
}
