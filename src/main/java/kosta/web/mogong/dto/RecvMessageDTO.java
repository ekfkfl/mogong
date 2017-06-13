package kosta.web.mogong.dto;

public class RecvMessageDTO {
	private int recvMessageCode;
	private String id; //받는 회원 ID
	private String title; //제목
	private String content; //내용
	private String sendId; //보낸 회원 ID
	private String writeDate; //작성일
	private String confirm; //받은 쪽지 확인 유무
	
	public RecvMessageDTO() {}
	
	public RecvMessageDTO(int recvMessageCode, String id, String title, String content, String sendId, String writeDate,
			String confirm) {
		super();
		this.recvMessageCode = recvMessageCode;
		this.id = id;
		this.title = title;
		this.content = content;
		this.sendId = sendId;
		this.writeDate = writeDate;
		this.confirm = confirm;
	}
	public int getRecvMessageCode() {
		return recvMessageCode;
	}
	public void setRecvMessageCode(int recvMessageCode) {
		this.recvMessageCode = recvMessageCode;
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
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	
}
