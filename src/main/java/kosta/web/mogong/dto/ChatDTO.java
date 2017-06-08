package kosta.web.mogong.dto;

public class ChatDTO {
	private int chatCode;
	private int studyCode;
	private int memberCode;
	private String content;
	private String writeDate;
	
	public ChatDTO() {}
	
	public ChatDTO(int chatCode, int studyCode, int memberCode, String content, String writeDate) {
		super();
		this.chatCode = chatCode;
		this.studyCode = studyCode;
		this.memberCode = memberCode;
		this.content = content;
		this.writeDate = writeDate;
	}

	public int getChatCode() {
		return chatCode;
	}
	public void setChatCode(int chatCode) {
		this.chatCode = chatCode;
	}
	public int getStudyCode() {
		return studyCode;
	}
	public void setStudyCode(int studyCode) {
		this.studyCode = studyCode;
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
