package kosta.web.mogong.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.web.mogong.dao.ScheduleDAO;
import kosta.web.mogong.dto.TaskDTO;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	ScheduleDAO scheduleDAO;
	
	@Override
	public List<TaskDTO> getScheduleData() {
		List<TaskDTO> list =scheduleDAO.getSchedule(); 
		
		
		return list;
	}

}
