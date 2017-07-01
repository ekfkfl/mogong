package kosta.web.mogong.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.web.mogong.dto.BoardCommentDTO;
import kosta.web.mogong.dto.BoardDTO;
import kosta.web.mogong.dto.MemberDTO;
import kosta.web.mogong.dto.UserDTO;
import kosta.web.mogong.service.BoardService;
import kosta.web.mogong.service.MainService;
import kosta.web.mogong.service.RecruitBoardService;

@Controller
public class MemberRecruitController {
	
	@Autowired
	RecruitBoardService boardService;
	
	@Autowired
	MainService service;
	
	@RequestMapping("main/study/RecruitBoard")
	public String recruit(){
		
		return "main/recruit";
	}
	
	@RequestMapping("main/study/board/insert")
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
		dto.setId(userDTO.getId());
		int result = boardService.insert(dto);
		
		return "redirect:selectAll";
	}
	
	@RequestMapping("main/study/board/writeForm")
	public ModelAndView writeForm(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/recruitWriteForm");
		return mv;
	}
	
	@RequestMapping("main/study/board/selectAll")
	public ModelAndView selectAll(BoardDTO boardDTO, HttpSession session){
		String field = boardDTO.getFiled(); 
		if(field != null){
			String[] str = field.split(",");
			boardDTO.setFiled(str[0]);
			field = str[0];
		}
		List<BoardDTO> list = boardService.selectAll();
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/recruit");
		mv.addObject("list", list);
		
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");

		if (userDTO != null) {
			mv.addObject("messageCount", service.messageCount(userDTO.getId()));
		}
		
		
		return mv;
	}
	
	@RequestMapping("main/study/board/selectById")
	public ModelAndView selectById(HttpSession session, String boardCode,String content,String flag){
		UserDTO userDTO=(UserDTO)session.getAttribute("userDTO");
		BoardDTO dto = boardService.selectById(boardCode);
		
		if("true".equals(flag)){
			boardService.commentInsert(new BoardCommentDTO(Integer.parseInt(boardCode), content, userDTO.getId()));
		}
		
		List<BoardCommentDTO> list = boardService.commentSelectAll(boardCode);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/recruitReadForm");
		mv.addObject("boardDTO", dto);
		mv.addObject("list", list);
		
		return mv;
	}
	
}
