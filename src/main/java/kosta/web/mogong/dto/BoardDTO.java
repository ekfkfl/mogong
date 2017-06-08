package kosta.web.mogong.dto;

public class BoardDTO {
	private int boardCode;
	private int studyCode;
	private int memberCode;
	private String title;
	private String content;
	private String writeDate;
	
	public BoardDTO() {}
	
	public BoardDTO(int boardCode, int studyCode, int memberCode, String title, String content, String writeDate) {
		super();
		this.boardCode = boardCode;
		this.studyCode = studyCode;
		this.memberCode = memberCode;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
	}



	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
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
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	
}
