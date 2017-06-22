package kosta.web.mogong.dao;

import java.util.List;

import kosta.web.mogong.dto.BoardCommentDTO;
import kosta.web.mogong.dto.BoardDTO;
import kosta.web.mogong.dto.MemberDTO;

public interface BoardDAO {
	
	int boardInsert(BoardDTO boardDTO);
	
	List<BoardDTO> boardSelectAll(BoardDTO boardDTO);
	
	BoardDTO boardSelectById(String boardCode);
	
	int commentInsert(BoardCommentDTO boardCommentDTO);
	
	List<BoardCommentDTO> commentSelectAll(String boardCode);
	
	int getCount(String field);
	
	int selectMemberCode(MemberDTO memberDTO);
}
