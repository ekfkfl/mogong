package kosta.web.mogong.dto;

public class ChatDTO {
	private String sessionId;
	private String content;
	private String date;
	private String path;
	
	public ChatDTO() {}
	
	public ChatDTO(String sessionId, String content, String date, String path) {
		super();
		this.sessionId = sessionId;
		this.content = content;
		this.date = date;
		this.path = path;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
}
