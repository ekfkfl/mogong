package kosta.web.mogong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.TaskDTO;
import kosta.web.mogong.dto.TaskMemberDTO;

@Repository
public class TaskDAOImpl implements TaskDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<TaskDTO> selectAllTask(String studyCode) {
		return sqlSession.selectList("taskMapper.selectAllTask", studyCode);
	}
	
	/**
	 * 성훈 main select
	 */
	public List<TaskDTO> selectMainTask(String studyCode) {
		return sqlSession.selectList("taskMapper.selectMainTask", studyCode);
	}
	
	/**
	 * 성훈 chartResult
	 */
	public List<Integer> chartResult(){
		return sqlSession.selectList("taskMapper.chartResult");
	}

	@Override
	public TaskDTO selectOneTask(String taskCode) {
		return sqlSession.selectOne("taskMapper.selectOneTask", taskCode);
	}

	@Override
	public TaskDTO insertTask(TaskDTO taskDTO) {
		sqlSession.insert("taskMapper.insertTask", taskDTO);
		
		return taskDTO;
	}

	@Override
	public int moveTask(String taskCode) {
		return sqlSession.update("taskMapper.moveTask", taskCode);
	}

	@Override
	public int updateTask(TaskDTO taskDTO) {
		return sqlSession.update("taskMapper.updateTask", taskDTO);
	}

	@Override
	public int deleteTask(String taskCode) {
		return sqlSession.delete("taskMapper.deleteTask", taskCode);
	}

	@Override
	public List<TaskMemberDTO> selectTaskMember(String taskCode) {
		return sqlSession.selectList("taskMapper.selectTaskMember", taskCode);
	}

	@Override
	public int insertTaskMember(List<TaskMemberDTO> taskMemberList) {
		return sqlSession.insert("taskMapper.insertTaskMember", taskMemberList);
	}

	@Override
	public int deleteTaskMember(int taskCode) {
		return sqlSession.delete("taskMapper.deleteTaskMember", taskCode);
	}
}
