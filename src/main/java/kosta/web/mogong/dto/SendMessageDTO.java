package kosta.web.mogong.dto;

public class SendMessageDTO {
	private int sendMessageCode;
	private String id; //보낸 회원 ID
	private String title; //제목
	private String content;//내용
	private String recvId; //받은 회원 ID
	private String writeDate; //작성일
	private int studyCode; //멤버 초대 하기 위해서
	private String joinStatus;//멤버 초대 수락 및 거부 판단을 위해서
	
	public SendMessageDTO() {}
	
	public SendMessageDTO(int sendMessageCode, String id, String title, String content, String recvId,
			String writeDate, int studyCode) {
		super();
		this.sendMessageCode = sendMessageCode;
		this.id = id;
		this.title = title;
		this.content = content;
		this.recvId = recvId;
		this.writeDate = writeDate;
		this.studyCode = studyCode;
	}
	public int getSendMessageCode() {
		return sendMessageCode;
	}
	public void setSendMessageCode(int sendMessageCode) {
		this.sendMessageCode = sendMessageCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getRecvId() {
		return recvId;
	}
	public void setRecvId(String recvId) {
		this.recvId = recvId;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public int getStudyCode() {
		return studyCode;
	}

	public void setStudyCode(int studyCode) {
		this.studyCode = studyCode;
	}

	public String getJoinStatus() {
		return joinStatus;
	}

	public void setJoinStatus(String joinStatus) {
		this.joinStatus = joinStatus;
	}
}
