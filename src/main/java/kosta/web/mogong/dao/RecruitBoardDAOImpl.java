package kosta.web.mogong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kosta.web.mogong.dto.BoardCommentDTO;
import kosta.web.mogong.dto.BoardDTO;

@Component
public class RecruitBoardDAOImpl implements RecruitBoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> selectAll() {
		
		return sqlSession.selectList("recruitBoardMapper.boardSelectAll");
	}

	@Override
	public int insert(BoardDTO dto) {
		return sqlSession.insert("recruitBoardMapper.boardInsert",dto);
	}

	@Override
	public BoardDTO selectById(String boardCode) {
		return sqlSession.selectOne("recruitBoardMapper.SelectById", boardCode);
	}

	@Override
	public int commentInsert(BoardCommentDTO dto) {
		return sqlSession.insert("recruitBoardMapper.commentInsert", dto);
	}

	@Override
	public List<BoardCommentDTO> commentSelectAll(String boardCode) {
		return sqlSession.selectList("recruitBoardMapper.commentSelectAll", boardCode);
	}

}
