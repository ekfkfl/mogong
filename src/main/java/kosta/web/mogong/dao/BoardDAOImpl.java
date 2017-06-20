package kosta.web.mogong.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.BoardCommentDTO;
import kosta.web.mogong.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int boardInsert(BoardDTO boardDTO) {
		
		return sqlSession.insert("boardMapper.boardInsert", boardDTO);
	}

	@Override
	public List<BoardDTO> boardSelectAll(BoardDTO boardDTO) {
		return sqlSession.selectList("boardMapper.boardSelectAll",boardDTO);
	}

	@Override
	public BoardDTO boardSelectById(String boardCode) {
		
		return sqlSession.selectOne("boardMapper.boardSelectById", boardCode);
	}

	@Override
	public int commentInsert(BoardCommentDTO boardCommentDTO) {
		return sqlSession.insert("boardMapper.commentInsert", boardCommentDTO);
	}

	@Override
	public List<BoardCommentDTO> commentSelectAll(String boardCode) {
		return sqlSession.selectList("boardMapper.commentSelect", boardCode);
	}

	@Override
	public int getCount(String field) {

		return sqlSession.selectOne("boardMapper.boardGetCount", field);
	}
	

	
	
}
