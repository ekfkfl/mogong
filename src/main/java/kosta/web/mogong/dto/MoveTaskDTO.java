package kosta.web.mogong.dto;

public class MoveTaskDTO {
	private int taskCode;
	private String taskIndex;
	private String progressStatus;
	
	public MoveTaskDTO(int taskCode, String taskIndex, String progressStatus) {
		this.taskCode=taskCode;
		this.taskIndex=taskIndex;
		this.progressStatus=progressStatus;
	}

	public int getTaskCode() {
		return taskCode;
	}

	public void setTaskCode(int taskCode) {
		this.taskCode = taskCode;
	}

	public String getTaskIndex() {
		return taskIndex;
	}

	public void setTaskIndex(String taskIndex) {
		this.taskIndex = taskIndex;
	}

	public String getProgressStatus() {
		return progressStatus;
	}

	public void setProgressStatus(String progressStatus) {
		this.progressStatus = progressStatus;
	}
}
