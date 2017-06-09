package kosta.web.mogong.dto;

public class CommCodeDTO {
	private String commCode;
	private String codeName;
	private String codeDesc;
	private String parentCode;
	private String regDate;
	private String updateDate;
	private String codeUsed;
	private int codeOrder;
	
	public CommCodeDTO(){}
	public CommCodeDTO(String commCode, String codeName, String codeDesc, String parentCode, String regDate,
			String updateDate, String codeUsed, int codeOrder) {
		super();
		this.commCode = commCode;
		this.codeName = codeName;
		this.codeDesc = codeDesc;
		this.parentCode = parentCode;
		this.regDate = regDate;
		this.updateDate = updateDate;
		this.codeUsed = codeUsed;
		this.codeOrder = codeOrder;
	}
	
	public String getCommCode() {
		return commCode;
	}
	public void setCommCode(String commCode) {
		this.commCode = commCode;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCodeDesc() {
		return codeDesc;
	}
	public void setCodeDesc(String codeDesc) {
		this.codeDesc = codeDesc;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getCodeUsed() {
		return codeUsed;
	}
	public void setCodeUsed(String codeUsed) {
		this.codeUsed = codeUsed;
	}
	public int getCodeOrder() {
		return codeOrder;
	}
	public void setCodeOrder(int codeOrder) {
		this.codeOrder = codeOrder;
	}
	
	@Override
	public String toString() {
		return "CommCodeDTO [commCode=" + commCode + ", codeName=" + codeName + ", codeDesc=" + codeDesc
				+ ", parentCode=" + parentCode + ", regDate=" + regDate + ", updateDate=" + updateDate + ", codeUsed="
				+ codeUsed + ", codeOrder=" + codeOrder + "]";
	}
	
}
