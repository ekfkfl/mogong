package kosta.web.mogong.dto;

public class BoardCommentDTO {
	private int commentCode;
	private int boardCode;
	private int memberCode;
	private int studyCode;
	private String content;
	private String writeDate;
	private String path;
	private String name;
	private String id;
	
	public BoardCommentDTO() {}

	public BoardCommentDTO(int commentCode, int boardCode, int memberCode,int studyCode, String content, String writeDate,String path,String name) {
		super();
		this.commentCode = commentCode;
		this.boardCode = boardCode;
		this.memberCode = memberCode;
		this.content = content;
		this.writeDate = writeDate;
		this.path = path;
		this.name = name;
		this.studyCode = studyCode;
	}
	
	public BoardCommentDTO(int boardCode, int memberCode, int studyCode, String content) {
		super();
		this.boardCode = boardCode;
		this.memberCode = memberCode;
		this.studyCode = studyCode;
		this.content = content;
	}
	

	public BoardCommentDTO(int boardCode, String content, String id) {
		super();
		this.boardCode = boardCode;
		this.content = content;
		this.id = id;
	}

	public int getCommentCode() {
		return commentCode;
	}

	public void setCommentCode(int commentCode) {
		this.commentCode = commentCode;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStudyCode() {
		return studyCode;
	}

	public void setStudyCode(int studyCode) {
		this.studyCode = studyCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
