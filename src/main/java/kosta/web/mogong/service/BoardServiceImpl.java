package kosta.web.mogong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.web.mogong.dao.BoardDAO;
import kosta.web.mogong.dto.BoardCommentDTO;
import kosta.web.mogong.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public int boardInsert(BoardDTO boardDTO) {

		return boardDAO.boardInsert(boardDTO);
	}

	@Override
	public List<BoardDTO> boardSelectAll() {

		return boardDAO.boardSelectAll();
	}

	@Override
	public BoardDTO boardSelectById(String boardCode) {
		
		return boardDAO.boardSelectById(boardCode);
	}

	@Override
	public int commentInsert(BoardCommentDTO boardCommentDTO) {
		return boardDAO.commentInsert(boardCommentDTO);
	}

	@Override
	public List<BoardCommentDTO> commentSelectAll(String boardCode) {
		return boardDAO.commentSelectAll(boardCode);
	}

}
