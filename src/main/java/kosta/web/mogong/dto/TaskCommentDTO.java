package kosta.web.mogong.dto;

public class TaskCommentDTO {
	
	private int taskCommentCode;
	private int taskCode;
	private int memberCode;
	private String content; //태스크 코멘트 내용
	private String writeDate; //태스크 코멘트 등록일
	
	public TaskCommentDTO() {}
	
	public TaskCommentDTO(int taskCommentCode, int taskCode, int memberCode, String content, String writeDate) {
		super();
		this.taskCommentCode = taskCommentCode;
		this.taskCode = taskCode;
		this.memberCode = memberCode;
		this.content = content;
		this.writeDate = writeDate;
	}
	
	public int getTaskCommentCode() {
		return taskCommentCode;
	}
	public void setTaskCommentCode(int taskCommentCode) {
		this.taskCommentCode = taskCommentCode;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	
}
