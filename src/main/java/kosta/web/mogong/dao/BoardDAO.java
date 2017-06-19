package kosta.web.mogong.dao;

import java.util.List;

import kosta.web.mogong.dto.BoardCommentDTO;
import kosta.web.mogong.dto.BoardDTO;

public interface BoardDAO {
	
	int boardInsert(BoardDTO boardDTO);
	
	List<BoardDTO> boardSelectAll();
	
	BoardDTO boardSelectById(String boardCode);
	
	int commentInsert(BoardCommentDTO boardCommentDTO);
	
	List<BoardCommentDTO> commentSelectAll(String boardCode);
}
