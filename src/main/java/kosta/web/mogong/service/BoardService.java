package kosta.web.mogong.service;

import java.util.List;

import kosta.web.mogong.dto.BoardCommentDTO;
import kosta.web.mogong.dto.BoardDTO;
import kosta.web.mogong.dto.MemberDTO;

public interface BoardService {
	
	int boardInsert(BoardDTO boardDTO);
	
	List<BoardDTO> boardSelectAll(BoardDTO boardDTO);
	
	BoardDTO boardSelectById(String boardCode);
	
	int commentInsert(BoardCommentDTO boardCommentDTO);
	
	List<BoardCommentDTO> commentSelectAll(String boardCode,String studyCode);
	
	int getCount(String field,String studyCode);
	
	int selectMemberCode(MemberDTO memberDTO);
}