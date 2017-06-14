package kosta.web.mogong.dto;

public class AuthorityDTO {
	private String userName;
	private String role;
	
	
	public AuthorityDTO() {
		super();
	}
	public AuthorityDTO(String userName, String role) {
		super();
		this.userName = userName;
		this.role = role;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "Authority [userName=" + userName + ", role=" + role + "]";
	}
}
