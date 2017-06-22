package kosta.web.mogong.dto;

public class MemberDTO {
	
	private int memberCode; 
	private int studyCode;
	private String memberId; 
	private int joinStatus; //가입상태
	private String grade; //등급
	
	public MemberDTO() {}
	
	public MemberDTO(int studyCode, String memberId) {
		super();
		this.studyCode = studyCode;
		this.memberId = memberId;
	}
	
	public MemberDTO(int memberCode, int studyCode, String memberId, int joinStatus, String grade) {
		super();
		this.memberCode = memberCode;
		this.studyCode = studyCode;
		this.memberId = memberId;
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
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getJoinStatus() {
		return joinStatus;
	}
	public void setJoinStatus(int joinStatus) {
		this.joinStatus = joinStatus;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
}
