package kosta.web.mogong.service;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kosta.web.mogong.dao.TaskDAO;
import kosta.web.mogong.dto.AllTaskCodeDTO;
import kosta.web.mogong.dto.StudyDTO;
import kosta.web.mogong.dto.TaskCommentDTO;
import kosta.web.mogong.dto.TaskDTO;
import kosta.web.mogong.dto.TaskFileDTO;
import kosta.web.mogong.dto.TaskMemberDTO;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class TaskServiceImpl implements TaskService {
	@Autowired
	private TaskDAO taskDAO;

	@Override
	public List<TaskDTO> selectAllTask(String studyCode) {
		return taskDAO.selectAllTask(studyCode);
	}

	/**
	 * 성훈 main selectAll
	 */
	public List<TaskDTO> selectMainTask(String studyCode) {
		List<TaskDTO> list = taskDAO.selectMainTask(studyCode);
		for (TaskDTO dto : list) {
			String endDate = dto.getEndDate();
			if (endDate != null) {
				// 오늘 날짜
				Calendar cal = Calendar.getInstance();
				Date currentDate = new Date(cal.getTimeInMillis());

				int month = cal.get(cal.MONTH) + 1;
				int date = cal.get(cal.DATE);
				int hour = cal.get(cal.HOUR_OF_DAY);
				int minute = cal.get(cal.MINUTE);

				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				try {
					Date dbDate = format.parse(endDate);
					Calendar dbCal = Calendar.getInstance();
					dbCal.setTime(dbDate);

					int dbMonth = dbCal.get(dbCal.MONTH) + 1;
					int dbDay = dbCal.get(dbCal.DATE);
					int dbHour = dbCal.get(dbCal.HOUR_OF_DAY);
					int dbMinute = dbCal.get(dbCal.MINUTE);

					if (dbDay == date && dbMonth == month) {
						dto.setState("1"); // 오늘까지
						if (dbHour == hour) {
							if (dbMinute < minute) {
								dto.setState("5"); // 마감일 지남
								dto.setRemain(Math.abs(dbMinute - minute) + "분 지남");
							} else
								dto.setRemain(Math.abs(dbMinute - minute) + "분 남음");
						} else if (dbHour > hour) {
							dto.setRemain(Math.abs(dbHour - hour) + "시간 남음");
						} else {
							dto.setState("5"); // 마감일 지남
							dto.setRemain(Math.abs(dbHour - hour) + "시간 지남");
						}
					} else if (dbDate.getTime() - currentDate.getTime() > 0
							&& dbDate.getTime() - currentDate.getTime() < 1000 * 60 * 60 * 24 * 7) {

						dto.setState("2"); // 이번주까지
						dto.setRemain("D-" + Math.abs(dbDay - date) + "일 남음");
					} else if (dbDate.getTime() - currentDate.getTime() > 0 && dbMonth == month) {
						dto.setState("3"); // 이번달까지
						dto.setRemain("D-" + Math.abs(dbDay - date) + "일 남음");
					} else if (dbDate.getTime() - currentDate.getTime() < 0) {
						dto.setState("5"); // 마감일 지남
						dto.setRemain("D+" + Math.abs(date - dbDay) + "일 지남");
					} else {
						dto.setState("6"); // 이번달 이후
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
			} else {
				dto.setState("4"); // 마감일 없음
			}
		}
		return list;
	}

	/**
	 * 성훈
	 */
	public List<TaskDTO> chartResult(String studyCode) {
		List<TaskDTO> list = taskDAO.chartResult(studyCode);
		return list;
	}

	@Override
	public TaskDTO selectOneTask(String taskCode, String studyCode) {
		TaskDTO taskDTO = taskDAO.selectOneTask(taskCode);

		List<TaskMemberDTO> taskMemberList = taskDAO.selectMember(studyCode);
		List<TaskMemberDTO> taskSelectedMemberList = taskDAO.selectTaskMember(taskCode);

		if (taskSelectedMemberList.size() > 0) {
			for (TaskMemberDTO tml : taskMemberList) {
				for (TaskMemberDTO tsl : taskSelectedMemberList) {
					if (tml.getMemberCode() == tsl.getMemberCode()) {
						tml.setSelect(1);
						break;
					}
				}
			}
		}

		taskDTO.setTaskMemberList(taskMemberList);

		return taskDTO;
	}

	@Override
	public TaskDTO insertTask(TaskDTO taskDTO) {
		taskDAO.insertTask(taskDTO);

		return taskDTO;
	}

	@Override
	public void moveTask(AllTaskCodeDTO allTaskCodeDTO) {
		List<TaskDTO> allTaskCodeList1=new ArrayList<>();
		List<TaskDTO> allTaskCodeList2=new ArrayList<>();
		
		if (allTaskCodeDTO.getAllTaskCode1() != null) {
			for (int i = 0; i < allTaskCodeDTO.getAllTaskCode1().size(); i++) {
				allTaskCodeList1.add(new TaskDTO(Integer.parseInt(allTaskCodeDTO.getAllTaskCode1().get(i)), i));
			}
		}
		
		if (allTaskCodeDTO.getAllTaskCode2() != null) {
			for (int i = 0; i < allTaskCodeDTO.getAllTaskCode2().size(); i++) {
				allTaskCodeList2.add(new TaskDTO(Integer.parseInt(allTaskCodeDTO.getAllTaskCode2().get(i)), i));
			}
		}

		if (allTaskCodeDTO.getProgressStatus() == null) {
			taskDAO.moveTask(allTaskCodeList1);
		} else {
			if (allTaskCodeList1 != null && allTaskCodeList1.size() > 0) {
				taskDAO.moveTask(allTaskCodeList1);
			}
			
			taskDAO.moveTask(allTaskCodeList2);
			
			taskDAO.moveTaskProgress(allTaskCodeDTO.getTaskCode(), allTaskCodeDTO.getProgressStatus());
		}
	}

	@Override
	public void updateTask(TaskDTO taskDTO) {
		List<TaskMemberDTO> inputList = taskDTO.getTaskMemberList();

		taskDAO.deleteTaskMember(taskDTO.getTaskCode());

		if (inputList != null) {
			if (inputList.size() > 0) {
				taskDAO.insertTaskMember(inputList);
			}
		}

		taskDAO.updateTask(taskDTO);
	}

	@Override
	public void deleteTask(String taskCode) {
		taskDAO.deleteTask(taskCode);
	}

	@Override
	public TaskCommentDTO insertTaskComment(TaskCommentDTO taskCommentDTO) {
		return taskDAO.selectOneTaskComment(taskDAO.insertTaskComment(taskCommentDTO).getTaskCommentCode());
	}

	@Override
	public List<TaskCommentDTO> selectTaskComment(int taskCode) {
		return taskDAO.selectTaskComment(taskCode);
	}

	@Override
	public void insertTaskFile(TaskFileDTO taskFileDTO) {
		taskDAO.insertTaskFile(taskFileDTO);
	}

	@Override
	public List<TaskFileDTO> selectTaskFile(int taskCode) {
		return taskDAO.selectTaskFile(taskCode);
	}

	@Override
	public TaskFileDTO selectOneTaskFile(int taskFileCode) {
		return taskDAO.selectOneTaskFile(taskFileCode);
	}

	@Override
	public String selectTaskGroupJang(StudyDTO studyDTO) {
		return taskDAO.selectTaskGroupJang(studyDTO);
	}
}
