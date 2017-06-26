package kosta.web.mogong.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.BoardCommentDTO;
import kosta.web.mogong.dto.BoardDTO;
import kosta.web.mogong.dto.MemberDTO;

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
	public List<BoardCommentDTO> commentSelectAll(String boardCode,String studyCode) {
		Map<String, String> map = new HashMap<>();
		map.put("boardCode", boardCode);
		map.put("studyCode", studyCode);
		return sqlSession.selectList("boardMapper.commentSelect", map);
	}

	@Override
	public int getCount(String field,String studyCode) {
		Map<String, String> map = new HashMap<>();
		map.put("field", field);
		map.put("studyCode", studyCode);
		return sqlSession.selectOne("boardMapper.boardGetCount", map);
	}

	@Override
	public int selectMemberCode(MemberDTO memberDTO) {
		System.out.println(memberDTO.getMemberId()+"******"+memberDTO.getStudyCode());
		int re = sqlSession.selectOne("boardMapper.selectMemberCode", memberDTO);
		System.out.println(re);
		return re;
	}
}
