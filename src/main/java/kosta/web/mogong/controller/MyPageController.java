package kosta.web.mogong.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.web.mogong.dto.MemberDTO;
import kosta.web.mogong.dto.RecvMessageDTO;
import kosta.web.mogong.dto.SendMessageDTO;
import kosta.web.mogong.dto.StudyDTO;
import kosta.web.mogong.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageServiceImpl;

	@RequestMapping("/member/mypage/studyRequest")
	public ModelAndView studyRequest(HttpSession session){
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		
		List<StudyDTO> list = myPageServiceImpl.studyRequestList(id);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("/mypage/studyRequest");
		
		return mv;
	}
	
	@RequestMapping("/member/mypage/ongoingStudy")
	public ModelAndView ongoingStudy(HttpSession session){
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		
		List<StudyDTO> list = myPageServiceImpl.ongoingStudyList(id);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("/mypage/ongoingStudy");
		return mv;
	}
	
	@RequestMapping("/member/mypage/recruitStudy")
	public ModelAndView recruitStudy(HttpSession session){
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		
		List<StudyDTO> list = myPageServiceImpl.recruitStudyList(id);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("/mypage/recruitStudy");
		return mv;
	}
	
	@RequestMapping("/member/mypage/mailMypage")
	public ModelAndView mailMypage(HttpSession session){
		
		String id = (String)session.getAttribute("id");
		
		List<RecvMessageDTO> list = myPageServiceImpl.mailMypage(id);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("/mypage/mailMypage");
		
		return mv;
	}
	
	@RequestMapping("/member/mypage/composeMailForm")
	public String composeMailForm(){
		return "/mypage/composeMail";
	}
	
	@RequestMapping("/member/mypage/composeMail")
	public String composeMail(SendMessageDTO sendMessage){
		
		int result = myPageServiceImpl.sendMessageInsert(sendMessage);
		System.out.println("결과 : "+result);
		if(result==1){
			int result2 = myPageServiceImpl.recvMessageInsert(sendMessage);
			System.out.println("받은메세지 : "+ result2);
		}
		
		return "/mypage/composeMail";
	}
	
}
