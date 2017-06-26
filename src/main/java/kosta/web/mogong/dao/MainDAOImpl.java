package kosta.web.mogong.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.CommCodeDTO;
import kosta.web.mogong.dto.MemberDTO;
import kosta.web.mogong.dto.PageDTO;
import kosta.web.mogong.dto.StudyDTO;

@Repository
public class MainDAOImpl implements MainDAO {

	@Autowired
	private SqlSession sqlSession;	
	
	/**
	 * 스터디 등록하기
	 * */
	@Override
	public int insertStudy(StudyDTO studyDTO) {
		
		int result = sqlSession.insert("mainMapper.enrollStudy", studyDTO);
		return result;
	}
	/**
	 * 스터디 상세보기 페이지
	 * */
	@Override
	public StudyDTO selectByStudyCode(String studyCode) {
		StudyDTO studyDTO = sqlSession.selectOne("mainMapper.studyDetailView", studyCode);
		return studyDTO;
	}

	/**
	 * 스터디 코드에 해당하는 조회수 증가시키기
	 * */
	@Override
	public int readNumUpdate(String studyCode) {
		
		int result = sqlSession.update("mainMapper", studyCode);
		
		return result;
	}
	
	@Override
	public String messageCount(String id) {
		return sqlSession.selectOne("mainMapper.messageCount", id);
	}
	@Override
	public List<CommCodeDTO> getAreaCode(String areaCode) {
		return sqlSession.selectList("mainMapper.selectAreaCode", areaCode);
	}
	@Override
	public List<StudyDTO> selectRecentStudy() {
		return sqlSession.selectList("mainMapper.selectRecentStudy");
	}
	
	@Override
	public PageDTO selectSearchStudy(PageDTO pageDTO) {
		
		Map<String,Object>map=pageDTO.getResultMap();
		map.put("startIndex", pageDTO.getStartIndex()+1);
		map.put("endIndex", pageDTO.getEndIndex()+1);

		
		pageDTO.setTotalCnt(sqlSession.selectOne("mainMapper.selectSearchStudyCnt", map));
		List<StudyDTO> studyDTOList=sqlSession.selectList("mainMapper.selectSearchStudy", map);
		
		pageDTO.getResultMap().put("studyDTOList", studyDTOList);
		
		return pageDTO;
	}
	@Override
	public String selectStudyMember(MemberDTO memberDTO) {
		return sqlSession.selectOne("mainMapper.selectStudyMember", memberDTO);
	}
	@Override
	public int studyUpdate(StudyDTO studyDTO) {
		return sqlSession.update("mainMapper.studyUpdate", studyDTO);
	}
	@Override
	public int studyJoin(MemberDTO memberDTO) {
		return sqlSession.insert("mainMapper.studyJoin", memberDTO);
	}
	@Override
	public int studyJoinCheckMember(int studyCode) {
		return sqlSession.selectOne("mainMapper.studyJoinCheckMember", studyCode);
	}
	@Override
	public int studyJoinCheckPeople(int studyCode) {
		return sqlSession.selectOne("mainMapper.studyJoinCheckPeople", studyCode);
	}
	@Override
	public MemberDTO memberCode(String id, int studyCode) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("id", id);
		map.put("studyCode", studyCode);
		
		return sqlSession.selectOne("mainMapper.memberCode", map);
	}
}
