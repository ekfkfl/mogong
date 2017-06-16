package kosta.web.mogong.dto;

public class ProgressDTO {
	private String startPro;
	private String startPos;
	private String endPro;
	private String endPos;
	
	public ProgressDTO() {}
	
	public ProgressDTO(String startPro, String startPos, String endPro, String endPos) {
		super();
		this.startPro = startPro;
		this.startPos = startPos;
		this.endPro = endPro;
		this.endPos = endPos;
	}
	public String getStartPro() {
		return startPro;
	}
	public void setStartPro(String startPro) {
		this.startPro = startPro;
	}
	public String getStartPos() {
		return startPos;
	}
	public void setStartPos(String startPos) {
		this.startPos = startPos;
	}
	public String getEndPro() {
		return endPro;
	}
	public void setEndPro(String endPro) {
		this.endPro = endPro;
	}
	public String getEndPos() {
		return endPos;
	}
	public void setEndPos(String endPos) {
		this.endPos = endPos;
	}
	
	
}
