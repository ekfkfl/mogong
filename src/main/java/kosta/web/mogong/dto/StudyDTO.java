package kosta.web.mogong.dto;

public class StudyDTO {
	private int studyCode; //스터디 코드
	private String id; //회원 아이디
	private String category; //카테고리 코드(공통코드에서 가져옴)
	private String cityCode; //도시 코드(공통코드에서 가져옴)
	private String name; //스터디 이름
	private String writeDate; //등록일
	private String startDate; //시작일
	private String endDate; //종료일
	private String day; //요일
	private String startTime; //시작시간
	private String endTime; //종료시간
	private int people; //인원
	private String area; //지역
	private String description; //스터디 설명
	private int read; //조회수

	private String studyStatus;//스터디 상태(모집중, 진행중...)
	
	private MemberDTO memberDTO; //멤버 DTO
	
	private CommCodeDTO commDTO; //공통 코드 DTO
<<<<<<< HEAD
=======
	
	@Override
	public String toString() {
		return "StudyDTO [studyCode=" + studyCode + ", id=" + id + ", category=" + category + ", cityCode=" + cityCode
				+ ", name=" + name + ", writeDate=" + writeDate + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", day=" + day + ", startTime=" + startTime + ", endTime=" + endTime + ", people=" + people
				+ ", area=" + area + ", description=" + description + ", read=" + read + ", studyStatus=" + studyStatus
				+ "]";
	}
>>>>>>> af9f6f27c35ebc363c951ff320bda1b4f998d3c7

	public StudyDTO() {}

	public StudyDTO(int studyCode, String id, String category, String cityCode, String name, String writeDate,
			String startDate, String endDate, String day, String startTime, String endTime, int people, String area,
			String description, int read, String studyStatus, MemberDTO memberDTO, CommCodeDTO commDTO) {
		super();
		this.studyCode = studyCode;
		this.id = id;
		this.category = category;
		this.cityCode = cityCode;
		this.name = name;
		this.writeDate = writeDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.day = day;
		this.startTime = startTime;
		this.endTime = endTime;
		this.people = people;
		this.area = area;
		this.description = description;
		this.read = read;
		this.studyStatus = studyStatus;
		this.memberDTO = memberDTO;
		this.commDTO = commDTO;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getRead() {
		return read;
	}

	public void setRead(int read) {
		this.read = read;
	}

	public String getStudyStatus() {
		return studyStatus;
	}

	public void setStudyStatus(String studyStatus) {
		this.studyStatus = studyStatus;
	}

	public MemberDTO getMemberDTO() {
		return memberDTO;
	}

	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}

	public CommCodeDTO getCommDTO() {
		return commDTO;
	}

	public void setCommDTO(CommCodeDTO commDTO) {
		this.commDTO = commDTO;
	}
<<<<<<< HEAD

=======
>>>>>>> af9f6f27c35ebc363c951ff320bda1b4f998d3c7
}
