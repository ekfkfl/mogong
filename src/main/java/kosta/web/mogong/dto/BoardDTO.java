package kosta.web.mogong.dto;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {
	private int boardCode;
	private int studyCode;
	private int memberCode;
	private String title;
	private String content;
	private String writeDate;
	private int hit;
	private String fileName;
	private int fileSize;
	private String name;
	private String notice;
	private String path;
	
	private MultipartFile file;
	
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

	public BoardDTO(int studyCode, int memberCode, String title, String content,String name,String fileName,String notice) {
		this.studyCode = studyCode;
		this.memberCode = memberCode;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.name = name;
		this.notice = notice;
	}
	public BoardDTO(String title, String content, String writeDate, String fileName, String name, String path) {
		super();
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.fileName = fileName;
		this.name = name;
		this.path = path;
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

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
}
