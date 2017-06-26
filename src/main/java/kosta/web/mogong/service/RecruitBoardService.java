package kosta.web.mogong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.web.mogong.dao.RecruitBoardDAO;
import kosta.web.mogong.dto.BoardCommentDTO;
import kosta.web.mogong.dto.BoardDTO;

@Service
public class RecruitBoardService {
	
	@Autowired
	RecruitBoardDAO recruitBoardDAO;
	
	public List<BoardDTO> selectAll(){
		
		return recruitBoardDAO.selectAll();
	}
	
	public int insert(BoardDTO dto){
		return recruitBoardDAO.insert(dto);
	}
	
	public BoardDTO selectById(String boardCode){
		return recruitBoardDAO.selectById(boardCode);
	}
	
	public int commentInsert(BoardCommentDTO dto){
		return recruitBoardDAO.commentInsert(dto);
	}
	
	public List<BoardCommentDTO> commentSelectAll(String boardCode){
		return recruitBoardDAO.commentSelectAll(boardCode);
	}
}
