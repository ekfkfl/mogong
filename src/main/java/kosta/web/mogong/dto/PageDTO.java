package kosta.web.mogong.dto;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PageDTO {
	private int totalCnt;	//전체 검색 수(DB값)
	private int totalPage;	//전체 페이지 수(전체 검색수 입력시 자동 계산)
	private int pageSize;	//페이지 사이즈(초기화 필요)
	private int pageBlockSize;	//페이지 블럭 사이즈(초기화 필요)
	private int nowPage;	//현재 페이지 (입력값)
 	private int startIndex;	//시작 인덱스 값(자동계산)
	private int endIndex;	//마지막 인덱스 값(자동계산)
	private String startRowId;	//시작 RowId(입력값)
	private int prevBlockPageNum;	//이전 블럭 시작 페이지 번호(0은 블럭 없음)
	private int nextBlockPageNum;	//다음 블럭 시작 페이지 번호(0은 블럭 없음)
	private List<Integer> pageNumList;	//페이지에 출력될 페이지 번호 목록;
	Map<String, Object> resultMap=new HashMap<>();	//파라메타나 결과 저장 객체
	
	
	//public PageDTO(){}
	
	
	//페이지 번호로 페이지 정보를 생성할 때
	public PageDTO(int pageSize, int pageBlockSize, int nowPage) {
		//this.pageSize = pageSize;
		this.pageBlockSize = pageBlockSize;
		this.nowPage = nowPage;
		
		setPageSize(pageSize);
		setPageBlockSize(pageBlockSize);
		//setPageNumList();
	}
	
	//RowId로 페이지 정보를 생성할 때
	public PageDTO(int pageSize, int pageBlockSize, String startRowId) {
		this.pageSize = pageSize;
		this.pageBlockSize = pageBlockSize;
		this.startRowId = startRowId;
	}

	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
		this.totalPage=(int) Math.ceil((double)totalCnt/pageSize);
		if(totalPage>pageBlockSize){
			this.nextBlockPageNum=pageBlockSize+1;
		}
		setPageNumList();
	}

	//totalPage는 자동계산값....setter 없음.
	public int getTotalPage() {
		return totalPage;
	}

	public int getPageSize() {
		return pageSize;
	}
	private void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		this.startIndex=pageSize*(nowPage-1);
		this.endIndex=startIndex+pageSize-1;
	}
	public int getPageBlockSize() {
		return pageBlockSize;
	}
	private void setPageBlockSize(int pageBlockSize) {
		this.pageBlockSize = pageBlockSize;
		setPageNumList();
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartIndex() {
		return startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public String getStartRowId() {
		return startRowId;
	}
	public void setStartRowId(String startRowId) {
		this.startRowId = startRowId;
	}
	public Map<String, Object> getResultMap() {
		return resultMap;
	}
	public void setResultMap(Map<String, Object> resultMap) {
		this.resultMap = resultMap;
	}

	public List<Integer> getPageNumList() {
		return pageNumList;
	}
	
	private void setPageNumList() {
		List<Integer> pageNumList=new ArrayList<>();
		this.pageNumList = pageNumList;
		
		int blockNum=(int)Math.ceil((double)nowPage/pageBlockSize);
		
		pageNumList.clear();
		int grpStartPage=pageBlockSize*(blockNum-1)+1;
		int grpEndPage=pageBlockSize*blockNum;
		if(grpEndPage>totalPage) grpEndPage=totalPage;
		for(int i=grpStartPage; i<=grpEndPage; i++){
			pageNumList.add(i);
		}
		
		if(blockNum==1){
			prevBlockPageNum=0;
		}else if(blockNum>1){
			prevBlockPageNum=(blockNum*pageBlockSize)-pageBlockSize;
		}
		
		int lastBlock=(int)Math.ceil((double)totalPage/pageBlockSize);

		if(blockNum==lastBlock){
			nextBlockPageNum=0;
		}else if(blockNum<lastBlock){
			nextBlockPageNum=(blockNum*pageBlockSize)+1;
		}

	}

	public int getPrevBlockPageNum() {
		return prevBlockPageNum;
	}

	public int getNextBlockPageNum() {
		return nextBlockPageNum;
	}

	@Override
	public String toString() {
		return "PageDTO [totalCnt=" + totalCnt + ", totalPage=" + totalPage + ", pageSize=" + pageSize
				+ ", pageBlockSize=" + pageBlockSize + ", nowPage=" + nowPage + ", startIndex=" + startIndex
				+ ", endIndex=" + endIndex + ", startRowId=" + startRowId + ", prevBlockPageNum=" + prevBlockPageNum
				+ ", nextBlockPageNum=" + nextBlockPageNum + ", pageNumList=" + pageNumList + ", resultMap=" + resultMap
				+ "]";
	}

}
