package kosta.web.mogong.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.StudyDTO;

@Repository
public class StudyEnrollDAOImpl implements StudyEnrollDAO {

	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public int insertStudy(StudyDTO studyDTO) {
		
		int result = sqlSession.insert("studyEnrollMapper.enrollStudy", studyDTO);
		return result;
	}

}
