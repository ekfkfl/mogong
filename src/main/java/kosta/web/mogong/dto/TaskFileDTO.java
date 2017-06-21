package kosta.web.mogong.dto;

public class TaskFileDTO {
	
	private int taskFileCode;
	private int taskCode;
	private String id;
	private String name;
	private String fileName; //태스크 파일명
	private String path; //태스크 파일경로
	private int fileSize; //태스크 파일크기
	private String writeDate; //태스크 파일 등록일
	
	public TaskFileDTO() {}

	public TaskFileDTO(int taskFileCode, int taskCode, String id, String name, String fileName, String path,
			int fileSize, String writeDate) {
		super();
		this.taskFileCode = taskFileCode;
		this.taskCode = taskCode;
		this.id = id;
		this.name = name;
		this.fileName = fileName;
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

	public int getTaskCode() {
		return taskCode;
	}

	public void setTaskCode(int taskCode) {
		this.taskCode = taskCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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
