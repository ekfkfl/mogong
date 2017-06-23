package kosta.web.mogong.dto;

public class MemberDTO {
	
	private int memberCode; 
	private int studyCode;
	private String memberId; 
	private int joinStatus; //가입상태
	private String grade; //등급
	private String name;
	private String path;
	private String phone;
	private String email;
	private String gender;
	private String intro;
	
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}
	
}
