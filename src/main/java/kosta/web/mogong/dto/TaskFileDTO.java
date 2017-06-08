package kosta.web.mogong.dto;

public class TaskFileDTO {
	
	private int taskFileCode;
	private int memberCode;
	private int taskCode;
	private String name; //태스크 파일명
	private String path; //태스크 파일경로
	private int fileSize; //태스크 파일크기
	private String writeDate; //태스크 파일 등록일
	
	public TaskFileDTO() {}
	
	public TaskFileDTO(int taskFileCode, int memberCode, int taskCode, String name, String path, int fileSize,
			String writeDate) {
		super();
		this.taskFileCode = taskFileCode;
		this.memberCode = memberCode;
		this.taskCode = taskCode;
		this.name = name;
		this.path = path;
		this.fileSize = fileSize;
		this.writeDate = writeDate;
	}

	public int getTaskFileCode() {
		return taskFileCode;
	}
	public void setTaskFileCode(int taskFileCode) {
		this.taskFileCode = taskFileCode;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public int getTaskCode() {
		return taskCode;
	}
	public void setTaskCode(int taskCode) {
		this.taskCode = taskCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
}
