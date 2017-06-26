package kosta.web.mogong.dao;

import java.util.List;

import kosta.web.mogong.dto.BoardCommentDTO;
import kosta.web.mogong.dto.BoardDTO;

public interface RecruitBoardDAO {

	List<BoardDTO> selectAll();
	
	int insert(BoardDTO dto);
	
	BoardDTO selectById(String boardCode);
	
	int commentInsert(BoardCommentDTO dto);
	
	List<BoardCommentDTO> commentSelectAll(String boardCode);
}
