package kosta.web.mogong.dto;

public class TaskCommentDTO {
	
	private int taskCommentCode;
	private int taskCode;
	private String id;
	private String name;
	private String path;
	private String content; //태스크 코멘트 내용
	private String writeDate; //태스크 코멘트 등록일
	
	public TaskCommentDTO() {}

	public TaskCommentDTO(int taskCommentCode, int taskCode, String id, String name, String path, String content,
			String writeDate) {
		super();
		this.taskCommentCode = taskCommentCode;
		this.taskCode = taskCode;
		this.id = id;
		this.name = name;
		this.path = path;
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
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
