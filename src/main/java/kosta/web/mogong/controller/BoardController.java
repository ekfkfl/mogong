package kosta.web.mogong.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.InvalidCsrfTokenException;
import org.springframework.security.web.csrf.MissingCsrfTokenException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.web.mogong.dto.BoardCommentDTO;
import kosta.web.mogong.dto.BoardDTO;
import kosta.web.mogong.service.BoardService;

@Controller
@RequestMapping("/member/study")
public class BoardController {
	
	@Autowired
	BoardService boardService;

	/*@RequestMapping("/board")
	public String boardMain(){
		
		return "board/board"; 
	}*/
	@RequestMapping("/writeForm")
	public String writeForm(){
		
		return "board/writeForm";
	}
	@RequestMapping("/board/insert")
	public String insert(HttpServletRequest request, BoardDTO dto,String[] check) throws IOException{
		MultipartFile multiFile = dto.getFile();
		String fileName = multiFile.getOriginalFilename();
		int fileSize =(int)multiFile.getSize();
		
		if(check != null)
			dto.setNotice(check[0]);
		else
			dto.setNotice("0");
			
		dto.setFileName(fileName);
		dto.setFileSize(fileSize);
		String path = request.getRealPath("/")+"save";
		
		File file = new File(path);
		if(!file.exists()){
			file.mkdirs();
		}
		File uploadFile = new File(path+"/"+fileName);
		if(!uploadFile.exists()){
			multiFile.transferTo(uploadFile);
		}
		dto.setMemberCode(2);
		dto.setStudyCode(6);
		
		int result = boardService.boardInsert(dto);
		
		return "redirect:selectAll";
	}
	
	@RequestMapping("/board/selectAll")
	public ModelAndView boardSelectAll(){
		List<BoardDTO> list = boardService.boardSelectAll();
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/board");
		mv.addObject("list", list);
		
		return mv;
	}
	
/*	@RequestMapping("/board/read")
	public ModelAndView readForm(HttpServletRequest request,String boardCode) {
		BoardDTO dto = boardService.boardSelectById(boardCode);
		List<BoardCommentDTO> list = boardService.commentSelectAll(boardCode);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/readForm");
		mv.addObject("boardDTO", dto);
		mv.addObject("list", list);
		
		return mv;
	}*/
	
	@RequestMapping("/board/selectById")
	public ModelAndView boardSelectById(String boardCode){
		BoardDTO dto = boardService.boardSelectById(boardCode);
		List<BoardCommentDTO> list = boardService.commentSelectAll(boardCode);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/readForm");
		mv.addObject("boardDTO", dto);
		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping("/board/comment")
	public String commentInsert(HttpServletRequest request, String boardCode,String content){
		boardService.commentInsert(new BoardCommentDTO(Integer.parseInt(boardCode), 2, 6, content));
		
		return "board/readForm";
	}
	
	@RequestMapping("/board/download")
	public ModelAndView down(HttpServletRequest request,String fname){
		return new ModelAndView("downLoadView","fname",new File(request.getRealPath("/")+"save/"+fname));
	}
	
	
}
