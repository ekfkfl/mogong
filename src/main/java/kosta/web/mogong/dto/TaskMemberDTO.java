package kosta.web.mogong.dto;

public class TaskMemberDTO {
	private int taskCode;
	private int memberCode;
	
	public TaskMemberDTO() {}
	
	
	public TaskMemberDTO(int taskCode, int memberCode) {
		super();
		this.taskCode = taskCode;
		this.memberCode = memberCode;
	}

	public int getTaskCode() {
		return taskCode;
	}
	public void setTaskCode(int taskCode) {
		this.taskCode = taskCode;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	
	
}
