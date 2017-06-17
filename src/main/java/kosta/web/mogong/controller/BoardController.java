package kosta.web.mogong.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kosta.web.mogong.dto.BoardDTO;

@Controller
@RequestMapping("/member/study")
public class BoardController {

	@RequestMapping("/board")
	public String boardMain(){
		
		return "board/board"; 
	}
	@RequestMapping("/writeForm")
	public String writeForm(){
		
		return "board/writeForm";
	}
	@RequestMapping("/board/insert")
	public String insert(HttpServletRequest request, BoardDTO dto) throws IOException{
		MultipartFile multiFile = dto.getFile();
		String fileName = multiFile.getOriginalFilename();
		int fileSize =(int)multiFile.getSize();
		
		dto.setFileName(fileName);
		dto.setFileSize(fileSize);
		String path = request.getRealPath("/")+"save";
		
		File file = new File(path);
		if(file.exists()){
			file.mkdirs();
		}
		multiFile.transferTo(new File(path+"/"+fileName));
		
		
		
		return "board/board";
	}
	
	
	
}
