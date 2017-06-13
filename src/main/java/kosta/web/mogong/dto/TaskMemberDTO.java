package kosta.web.mogong.dto;

public class TaskMemberDTO {
	private int taskCode;
	private int memberCode;
	private String name;
	
	public TaskMemberDTO() {}
	
	public TaskMemberDTO(int memberCode, String name) {
		super();
		this.memberCode = memberCode;
		this.name = name;
	}

	public TaskMemberDTO(int taskCode, int memberCode, String name) {
		super();
		this.taskCode = taskCode;
		this.memberCode = memberCode;
		this.name = name;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
