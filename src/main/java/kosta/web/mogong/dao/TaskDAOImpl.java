package kosta.web.mogong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.StudyDTO;
import kosta.web.mogong.dto.TaskCommentDTO;
import kosta.web.mogong.dto.TaskDTO;
import kosta.web.mogong.dto.TaskFileDTO;
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
	public List<TaskDTO> chartResult(String studyCode){
		return sqlSession.selectList("taskMapper.chartResult",studyCode);
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
	public int moveTask(List<TaskDTO> allTaskCodeList) {
		return sqlSession.update("taskMapper.moveTask", allTaskCodeList);
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

	@Override
	public List<TaskMemberDTO> selectMember(String studyCode) {
		return sqlSession.selectList("taskMapper.selectMember", studyCode);
	}

	@Override
	public int moveTaskProgress(int taskCode, String progressStatus) {
		return sqlSession.update("taskMapper.moveTaskProgress", new TaskDTO(taskCode, progressStatus));
	}

	@Override
	public TaskCommentDTO insertTaskComment(TaskCommentDTO taskCommentDTO) {
		sqlSession.insert("taskMapper.insertTaskComment", taskCommentDTO);
		
		return taskCommentDTO;
	}

	@Override
	public List<TaskCommentDTO> selectTaskComment(int taskCode) {
		return sqlSession.selectList("taskMapper.selectTaskComment", taskCode);
	}

	@Override
	public TaskCommentDTO selectOneTaskComment(int taskCommentCode) {
		return sqlSession.selectOne("taskMapper.selectOneTaskComment", taskCommentCode);
	}

	@Override
	public int insertTaskFile(TaskFileDTO taskFileDTO) {
		return sqlSession.insert("taskMapper.insertTaskFile", taskFileDTO);
	}

	@Override
	public List<TaskFileDTO> selectTaskFile(int taskCode) {
		return sqlSession.selectList("taskMapper.selectTaskFile", taskCode);
	}

	@Override
	public TaskFileDTO selectOneTaskFile(int taskFileCode) {
		return sqlSession.selectOne("taskMapper.selectOneTaskFile", taskFileCode);
	}

	@Override
	public String selectTaskGroupJang(StudyDTO studyDTO) {
		return sqlSession.selectOne("taskMapper.selectTaskGroupJang", studyDTO);
	}
}
