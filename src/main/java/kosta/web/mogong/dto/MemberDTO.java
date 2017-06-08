package kosta.web.mogong.dto;

public class MemberDTO {
	
	private int memberCode; 
	private int studyCode;
	private String id; 
	private int joinStatus; //가입상태
	private int grade; //등급
	
	public MemberDTO() {}
	
	public MemberDTO(int memberCode, int studyCode, String id, int joinStatus, int grade) {
		super();
		this.memberCode = memberCode;
		this.studyCode = studyCode;
		this.id = id;
		this.joinStatus = joinStatus;
		this.grade = grade;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
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
	public int getJoinStatus() {
		return joinStatus;
	}
	public void setJoinStatus(int joinStatus) {
		this.joinStatus = joinStatus;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
