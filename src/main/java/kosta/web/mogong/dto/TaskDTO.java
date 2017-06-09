package kosta.web.mogong.dto;

public class TaskDTO {
	
	private int taskCode; //테스크 코드
	private int studyCode; //스터디 코드
	private String title; //테스크 제목
	private String content; //태스크 내용
	private int progressStatus; //진행상태
	private String startDate; //시작일
	private String endDate; //종료일
	private String successDate; //완료일
	
	public TaskDTO() {}
	
	public TaskDTO(int taskCode, int studyCode, String title, String content, int progressStatus, String startDate,
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
	public int getProgressStatus() {
		return progressStatus;
	}
	public void setProgressStatus(int progressStatus) {
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
	
}
