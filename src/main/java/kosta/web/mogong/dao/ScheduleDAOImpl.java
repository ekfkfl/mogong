package kosta.web.mogong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.TaskDTO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {

	@Autowired
	SqlSession session;
	
	@Override
	public List<TaskDTO> getSchedule() {
		
		return session.selectList("scheduleMapper.scheduleData");
	}
	
	public int scheduleInsert(TaskDTO taskDTO){
		
		return session.insert("scheduleMapper.scheduleInsert", taskDTO);
	}

}
