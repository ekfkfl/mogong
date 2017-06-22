package kosta.web.mogong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kosta.web.mogong.dao.BoardDAO;
import kosta.web.mogong.dto.BoardCommentDTO;
import kosta.web.mogong.dto.BoardDTO;
import kosta.web.mogong.dto.MemberDTO;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public int boardInsert(BoardDTO boardDTO) {

		return boardDAO.boardInsert(boardDTO);
	}

	@Override
	public List<BoardDTO> boardSelectAll(BoardDTO boardDTO) {

		return boardDAO.boardSelectAll(boardDTO);
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

	@Override
	public int getCount(String field) {

		return boardDAO.getCount(field);
	}

	@Override
	public int selectMemberCode(MemberDTO memberDTO) {
		return boardDAO.selectMemberCode(memberDTO);
	}

}
