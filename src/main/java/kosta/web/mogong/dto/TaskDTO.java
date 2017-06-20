package kosta.web.mogong.dto;

import java.util.Date;
import java.util.List;

public class TaskDTO {
	
	private int taskCode; //테스크 코드
	private int studyCode; //스터디 코드
	private String title; //테스크 제목
	private String content; //태스크 내용
	private String progressStatus; //진행상태
	private String startDate; //시작일
	private String endDate; //종료일
	private String successDate; //완료일
	private String createDate; //등록일
	private String updateDate; //수정일
	private String state; //완료,진행,마감일없음 상태
	private String remain; //남은 시간 표시
	private Date startSchedule; //시작일 달력표시
	private Date endSchedule; //마감일 달력표시
	private String taskIndex;

	private List<TaskMemberDTO> taskMemberList;
	
	public TaskDTO() {}
	
	public TaskDTO(int studyCode, String title, String progressStatus) {
		this.studyCode=studyCode;
		this.title=title;
		this.progressStatus=progressStatus;
	}
	
	/**
	 * 성훈 schedule 생성자
	 */
	public TaskDTO(int studyCode, String title, String startDate,String endDate) {
		this.studyCode=studyCode;
		this.title=title;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	
	public TaskDTO(int taskCode, List<TaskMemberDTO> taskMemberList) {
		this.taskCode=taskCode;
		this.taskMemberList=taskMemberList;
	}
	
	public TaskDTO(String title, String content, String startDate, String endDate, List<TaskMemberDTO> taskMemberList) {
		this.title=title;
		this.content=content;
		this.startDate=startDate;
		this.endDate=endDate;
		this.taskMemberList=taskMemberList;
	}
	
	public TaskDTO(int taskCode, int studyCode, String title, String content, String progressStatus, String startDate,
			String endDate, String successDate) {
		super();
		this.taskCode = taskCode;
		this.studyCode = studyCode;
		this.title = title;
		this.content = content;
		this.progressStatus = progressStatus;
		this.startDate = startDate;
		this.endDate = endDate;
		this.successDate = successDate;
	}
	public TaskDTO(int taskCode, int studyCode, String title, String content, String progressStatus, String startDate,
			String endDate, String successDate, String createDate) {
		super();
		this.taskCode = taskCode;
		this.studyCode = studyCode;
		this.title = title;
		this.content = content;
		this.progressStatus = progressStatus;
		this.startDate = startDate;
		this.endDate = endDate;
		this.successDate = successDate;
		this.createDate = createDate;
	}
	public int getTaskCode() {
		return taskCode;
	}
	public void setTaskCode(int taskCode) {
		this.taskCode = taskCode;
	}
	public int getStudyCode() {
		return studyCode;
	}
	public void setStudyCode(int studyCode) {
		this.studyCode = studyCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getProgressStatus() {
		return progressStatus;
	}
	public void setProgressStatus(String progressStatus) {
		this.progressStatus = progressStatus;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSuccessDate() {
		return successDate;
	}
	public void setSuccessDate(String successDate) {
		this.successDate = successDate;
	}

	public List<TaskMemberDTO> getTaskMemberList() {
		return taskMemberList;
	}

	public void setTaskMemberList(List<TaskMemberDTO> taskMemberList) {
		this.taskMemberList = taskMemberList;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getRemain() {
		return remain;
	}

	public void setRemain(String remain) {
		this.remain = remain;
	}

	public Date getStartSchedule() {
		return startSchedule;
	}

	public void setStartSchedule(Date startSchedule) {
		this.startSchedule = startSchedule;
	}

	public Date getEndSchedule() {
		return endSchedule;
	}

	public void setEndSchedule(Date endSchedule) {
		this.endSchedule = endSchedule;
	}
	
	public String getTaskIndex() {
		return taskIndex;
	}

	public void setTaskIndex(String taskIndex) {
		this.taskIndex = taskIndex;
	}
	
}
