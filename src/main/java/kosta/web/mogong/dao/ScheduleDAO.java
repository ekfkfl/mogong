package kosta.web.mogong.dao;

import java.util.List;

import kosta.web.mogong.dto.TaskDTO;

public interface ScheduleDAO {
	
	List<TaskDTO> getSchedule();
}
