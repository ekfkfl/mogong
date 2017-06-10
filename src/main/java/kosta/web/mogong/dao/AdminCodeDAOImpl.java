package kosta.web.mogong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.CommCodeDTO;

@Repository
public class AdminCodeDAOImpl implements AdminCodeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CommCodeDTO> selectCodeAll() {
		return sqlSession.selectList("adminCodeMapper.selectCodeAll");
	}

	@Override
	public List<CommCodeDTO> selectCodeByName(String codeName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CommCodeDTO> selectCodeByParentCode(String parentCode) {
		return sqlSession.selectList("adminCodeMapper.selectCodeByParentCode", parentCode);
	}

	@Override
	public int insertCode(CommCodeDTO commCodeDTO) {
		System.err.println("commCodeDTO : " + commCodeDTO);
		return sqlSession.insert("adminCodeMapper.insertCode", commCodeDTO);
	}

	@Override
	public int insertCode(List<CommCodeDTO> commCodeList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCode(CommCodeDTO commCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCode(String commCode) {
		return sqlSession.delete("adminCodeMapper.deleteCode", commCode);
	}

}
