package kosta.web.mogong.dto;

import org.springframework.web.multipart.MultipartFile;

public class UserDTO {
	private String id; //회원아이디
	private String password; //비밀번호
	private String name; //이름
	private String path; //사진경로
	private int gender; //성별
	private String birth; //생년월일
	private String addr; //주소
	private String phone; //전화번호
	private String email; //이메일
	private String intro; //자기소개
	
	private MultipartFile file; //프로필 사진
	
	public UserDTO() {}
	
	

	public UserDTO(String id, String password, String name, String path, int gender, String birth, String addr,
			String phone, String email, String intro, MultipartFile file) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.path = path;
		this.gender = gender;
		this.birth = birth;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
		this.intro = intro;
		this.file = file;
	}

	public UserDTO(String id, String password, String name, String path, int gender, String birth, String addr,
			String phone, String email, String intro) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.path = path;
		this.gender = gender;
		this.birth = birth;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
		this.intro = intro;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
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
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
}
