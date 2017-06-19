package kosta.web.mogong.dto;

import java.util.List;

public class AllTaskCodeDTO {
	private List<String> allTaskCode1;
	private List<String> allTaskCode2;
	
	public AllTaskCodeDTO() {};
	
	public AllTaskCodeDTO(List<String> allTaskCode1, List<String> allTaskCode2) {
		super();
		this.allTaskCode1 = allTaskCode1;
		this.allTaskCode2 = allTaskCode2;
	}

	public List<String> getAllTaskCode1() {
		return allTaskCode1;
	}

	public void setAllTaskCode1(List<String> allTaskCode1) {
		this.allTaskCode1 = allTaskCode1;
	}

	public List<String> getAllTaskCode2() {
		return allTaskCode2;
	}

	public void setAllTaskCode2(List<String> allTaskCode2) {
		this.allTaskCode2 = allTaskCode2;
	}
}
