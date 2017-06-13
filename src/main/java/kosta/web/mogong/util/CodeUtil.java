package kosta.web.mogong.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import kosta.web.mogong.dto.CommCodeDTO;

@Component
public class CodeUtil implements ServletContextAware{
	
	@Autowired
	private SqlSession sqlSession;
	public static Map<String, CommCodeDTO> codeMap=new TreeMap<>();

	public CodeUtil(){}


	@Override
	public void setServletContext(ServletContext application) {
		List<CommCodeDTO> commCodeDTOList=sqlSession.selectList("adminCodeMapper.selectCodeAll");
		
		for(CommCodeDTO commCode : commCodeDTOList){
			codeMap.put(commCode.getCommCode(), commCode);
		}
		
		application.setAttribute("codeMap", codeMap);
		codeMap=(Map<String, CommCodeDTO>)application.getAttribute("codeMap");
	}
	
	public static String getCodeName(String commCode){
		String codeName=null;
		
		CommCodeDTO commCodeDTO=codeMap.get(commCode);
		System.out.println(commCodeDTO);
		if(commCodeDTO==null){
			codeName="알수없는 코드";
		}else{
			codeName=commCodeDTO.getCodeName();
		}
		
		return codeName;
	}
	
	public static List<String> getChildCodeName(String commCode){
		List<String> childCodeNames=new ArrayList<>();
		
		Iterator<String> it=codeMap.keySet().iterator();
		
		while(it.hasNext()){
			String key=it.next();
			CommCodeDTO commCodeDTO=codeMap.get(key);
			if(commCodeDTO.getParentCode()==null){
				continue;
			}
			if(commCodeDTO.getParentCode().equals(commCode)){
				childCodeNames.add(commCodeDTO.getCodeName());
			}
		}

		return childCodeNames;
	}
}
