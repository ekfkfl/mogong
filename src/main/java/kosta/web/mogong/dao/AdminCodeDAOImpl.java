package kosta.web.mogong.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.web.mogong.dto.CommCodeDTO;
import kosta.web.mogong.dto.PageDTO;

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
		return sqlSession.insert("adminCodeMapper.insertCode", commCodeDTO);
	}

	@Override
	public int insertCode(List<CommCodeDTO> commCodeList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCode(CommCodeDTO commCodeDTO) {
		System.out.println("dao" + commCodeDTO);
		return sqlSession.update("adminCodeMapper.updateCode", commCodeDTO);
	}

	@Override
	public int deleteCode(String commCode) {
		return sqlSession.delete("adminCodeMapper.deleteCode", commCode);
	}

	@Override
	public PageDTO selectCode(PageDTO pageDTO) {
		Map<String,Object>map=pageDTO.getResultMap();
		map.put("startIndex", pageDTO.getStartIndex()+1);
		map.put("endIndex", pageDTO.getEndIndex()+1);
		
		pageDTO.setTotalCnt(sqlSession.selectOne("adminCodeMapper.selectCodeCnt"));
		List<CommCodeDTO> commCodeList=sqlSession.selectList("adminCodeMapper.selectCode", pageDTO);
		pageDTO.getResultMap().put("commCodeList", commCodeList);
		return pageDTO;
	}

}
