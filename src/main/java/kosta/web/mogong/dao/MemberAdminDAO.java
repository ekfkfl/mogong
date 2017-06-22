package kosta.web.mogong.dao;

import java.util.List;

import kosta.web.mogong.dto.UserDTO;

public interface MemberAdminDAO {
	
	/**
	 * 전체 멤버 가져오기
	 * */
	List<UserDTO> selectAll(String id);
	
	
	/**
	 * 선택한 멤버 등급 수정
	 * */
	int updateGrade(String grade, String id, String studyCode);
	
	/**
	 * 선택한 멤버 탈퇴
	 * */
	int memberDelete(String id, String studyCode);
	
	/**
	 * 초대할 ID 검색하기
	 * */
	List<String> searchID(String keyWord);
	
	/**
	 * 초대하기 메세지 보내기
	 * */
	int inviteMember(String id,String recvId, String studyCode);
	
}
