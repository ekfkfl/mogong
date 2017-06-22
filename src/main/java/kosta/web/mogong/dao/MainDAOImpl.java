package kosta.web.mogong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.CommCodeDTO;
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
	public List<StudyDTO> selectSearchStudy(StudyDTO studyDTO, int page) {
		int limit=3;
		int offset=limit*(page-1);
		
		return sqlSession.selectList("mainMapper.selectSearchStudy", studyDTO);
	}
}
