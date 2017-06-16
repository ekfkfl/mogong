package kosta.web.mogong.service;

import java.util.List;

import kosta.web.mogong.dto.TaskDTO;

public interface ScheduleService {
	
	List<TaskDTO> getScheduleData();
	
	int scheduleInsert(TaskDTO taskDTO);
}
