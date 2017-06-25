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
import kosta.web.mogong.dto.MemberDTO;
import kosta.web.mogong.dto.PagingDTO;
import kosta.web.mogong.dto.UserDTO;
import kosta.web.mogong.service.BoardService;

@Controller
@RequestMapping("/member/study")
public class BoardController {
	
	@Autowired
	BoardService boardService;

	@RequestMapping("/writeForm")
	public ModelAndView writeForm(String studyCode){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/writeForm");
		mv.addObject("studyCode", studyCode);
		return mv;
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
		String path = request.getServletContext().getRealPath("/data/save/");
		
		File file = new File(path);
		
		if(!file.exists()){
			file.mkdirs();
		}
		File uploadFile = new File(path+"/"+fileName);
		if(!uploadFile.exists()){
			multiFile.transferTo(uploadFile);
		}
		
		UserDTO userDTO=(UserDTO)request.getSession().getAttribute("userDTO");

		dto.setMemberCode(boardService.selectMemberCode(new MemberDTO(dto.getStudyCode(),userDTO.getId())));
		
		int result = boardService.boardInsert(dto);
		
		return "redirect:selectAll?studyCode="+dto.getStudyCode();
	}
	
	@RequestMapping("/board/selectAll")
	public ModelAndView boardSelectAll(BoardDTO boardDTO) throws IOException{
		String field = boardDTO.getFiled(); 
		if(field != null){
			String[] str = field.split(",");
			boardDTO.setFiled(str[0]);
			field = str[0];
		}
		int totalCount = boardService.getCount(field,boardDTO.getStudyCode()+"");
		boardDTO.setTotalCount(totalCount);
		List<BoardDTO> list = boardService.boardSelectAll(boardDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/board");
		mv.addObject("list", list);
		mv.addObject("boardDTO", boardDTO);
		mv.addObject("studyCode", boardDTO.getStudyCode());
		return mv;
	}
	
	@RequestMapping("/board/selectById")
	public ModelAndView boardSelectById(HttpSession session, String boardCode,String content,String flag){
		UserDTO userDTO=(UserDTO)session.getAttribute("userDTO");
		BoardDTO dto = boardService.boardSelectById(boardCode);
		
		if("true".equals(flag)){
			boardService.commentInsert(new BoardCommentDTO(Integer.parseInt(boardCode), boardService.selectMemberCode(new MemberDTO(dto.getStudyCode(),userDTO.getId())), dto.getStudyCode(), content));
		}
		
		List<BoardCommentDTO> list = boardService.commentSelectAll(boardCode,dto.getStudyCode()+"");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/readForm");
		mv.addObject("boardDTO", dto);
		mv.addObject("list", list);
		mv.addObject("studyCode", dto.getStudyCode());
		
		return mv;
	}
	
	@RequestMapping("/board/download")
	public ModelAndView down(HttpServletRequest request,String fname){
		return new ModelAndView("downLoadView","fname",new File(request.getServletContext().getRealPath("/data/save/")+fname));
	}
}
