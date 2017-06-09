package kosta.web.mogong.dao;

import java.util.List;

import kosta.web.mogong.dto.CommCodeDTO;

public interface AdminCodeDAO {
	/**
	 * 전체 코드 출력
	 * @return
	 */
	List<CommCodeDTO> selectCodeAll();
	
	/**
	 * 코드의 이름으로 검색
	 */
	List<CommCodeDTO> selectCodeByName(String codeName);
	
	/**
	 * 부모코드로 모든 자식코드를 검색
	 */
	List<CommCodeDTO> selectCodeByParentCode(String parentCode);
	
	/**
	 * 새로운 공통코드 하나 생성
	 */
	int insertCode(CommCodeDTO commCodeDTO);
	
	
	/**
	 * 새로운 여러개의 공통코드를   추가
	 */
	int insertCode(List<CommCodeDTO> commCodeList);
	
	/**
	 * 공통코드 정보 수정
	 */
	int updateCode(CommCodeDTO commCode);
	
	/**
	 * 공통코드 삭제
	 */
	int deleteCode(String commCode);
}
