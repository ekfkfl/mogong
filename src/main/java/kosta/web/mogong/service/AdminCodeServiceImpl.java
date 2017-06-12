package kosta.web.mogong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.web.mogong.dao.AdminCodeDAO;
import kosta.web.mogong.dto.CommCodeDTO;

@Service
public class AdminCodeServiceImpl implements AdminCodeService {
	@Autowired
	private AdminCodeDAO adminCodeDAO;
	
	@Override
	public List<CommCodeDTO> selectCodeAll() {
		return adminCodeDAO.selectCodeAll();
	}

	@Override
	public List<CommCodeDTO> selectCodeByName(String codeName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CommCodeDTO> selectCodeByParentCode(String parentCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertCode(CommCodeDTO commCodeDTO) {
		int result=0;
		if(commCodeDTO.getCodeName()==null || commCodeDTO.getCodeDesc()==null || commCodeDTO.getCodeName().equals("") || commCodeDTO.getCodeDesc().equals("")){
			return result;
		}
		
		System.out.println(commCodeDTO);
		if(commCodeDTO.getCodeUsed()==null){
			commCodeDTO.setCodeUsed("N");
		}else{
			commCodeDTO.setCodeUsed("Y");
		}
		

		if(commCodeDTO.getParentCode()!=null){
			List<CommCodeDTO> commCodeDTOList=adminCodeDAO.selectCodeByParentCode(commCodeDTO.getParentCode());
			commCodeDTO.setCodeOrder(commCodeDTOList.size()+1);
		}

		result=adminCodeDAO.insertCode(commCodeDTO);
		
		return result;
	}

	@Override
	public int insertCode(List<CommCodeDTO> commCodeList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCode(CommCodeDTO commCodeDTO) {
		int result=0;
		if(commCodeDTO.getCommCode()==null || commCodeDTO.getCommCode().equals("")){
			return result;
		}
		
		if(commCodeDTO.getParentCode()==null || commCodeDTO.getParentCode().equals("-")){
			commCodeDTO.setParentCode("");
		}
		
		if(commCodeDTO.getCodeUsed()==null){
			commCodeDTO.setCodeUsed("N");
		}else{
			commCodeDTO.setCodeUsed("Y");
		}
		
		

		return adminCodeDAO.updateCode(commCodeDTO);
	}

	@Override
	public int deleteCode(String commCode) {
		return adminCodeDAO.deleteCode(commCode);
	}

}
