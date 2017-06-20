package kosta.web.mogong.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.web.mogong.dto.MemberDTO;
import kosta.web.mogong.dto.RecvMessageDTO;
import kosta.web.mogong.dto.SendMessageDTO;
import kosta.web.mogong.dto.StudyDTO;
import kosta.web.mogong.dto.UserDTO;
import kosta.web.mogong.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageServiceImpl;

	@RequestMapping("/member/mypage/studyRequest")
	public ModelAndView studyRequest(HttpSession session){
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
		
		List<StudyDTO> list = myPageServiceImpl.studyRequestList(userDTO.getId());
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("/mypage/studyRequest");
		
		return mv;
	}
	
	@RequestMapping("/member/mypage/ongoingStudy")
	public ModelAndView ongoingStudy(HttpSession session){
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
		
		List<StudyDTO> list = myPageServiceImpl.ongoingStudyList(userDTO.getId());
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("/mypage/ongoingStudy");
		return mv;
	}
	
	@RequestMapping("/member/mypage/recruitStudy")
	public ModelAndView recruitStudy(HttpSession session){
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
		
		List<StudyDTO> list = myPageServiceImpl.recruitStudyList(userDTO.getId());
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("/mypage/recruitStudy");
		return mv;
	}
	
	@RequestMapping("/member/mypage/recvMail")
	public ModelAndView recvMail(HttpSession session){
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
		
		List<RecvMessageDTO> list = myPageServiceImpl.recvMail(userDTO.getId());
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("/mypage/recvMail");
		
		return mv;
	}
	
	@RequestMapping("/member/mypage/sendMail")
	public ModelAndView sendMail(HttpSession session){
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
		
		List<SendMessageDTO> list = myPageServiceImpl.sendMail(userDTO.getId());
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("/mypage/sendMail");
		
		return mv;
	}
	
	@RequestMapping("/member/mypage/composeMailForm")
	public String composeMailForm(HttpServletRequest request, String sendId){
		 
		 request.setAttribute("sendId", sendId);
		
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
	
	@RequestMapping("/member/mypage/readMail")
	public ModelAndView readMail(int recvMessageCode){
		
		RecvMessageDTO recvDTO = myPageServiceImpl.readMail(recvMessageCode);
		ModelAndView mv = new ModelAndView();
		
		if(recvDTO.getConfirm().equals("0051")){
			int result = myPageServiceImpl.readMessageUpdate(recvMessageCode);
			System.out.println("읽은메세지 : "+result);
		}
		mv.addObject("recvDTO", recvDTO);
		mv.setViewName("/mypage/readMail");
		
		return mv;
	}
	
	@RequestMapping("/member/mypage/readMail2")
	public ModelAndView readMail2(int sendMessageCode){
		
		SendMessageDTO sendDTO = myPageServiceImpl.sendReadMail(sendMessageCode);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("sendDTO", sendDTO);
		mv.setViewName("/mypage/sendReadMail");
		
		return mv;
	}
	
	@RequestMapping("/member/mypage/delete")
	@ResponseBody
	public void delete(String[] messageCode){
		int result=0;
		for(int i=0;i<messageCode.length; i++){
			result = myPageServiceImpl.deleteMessage(Integer.parseInt(messageCode[i]));
		}
		System.out.println("삭제 결과 : "+ result);
	}
	
	@RequestMapping("/member/mypage/sendDelete")
	@ResponseBody
	public void sendDelete(String[] messageCode){
		int result=0;
		for(int i=0;i<messageCode.length; i++){
			result = myPageServiceImpl.deleteSendMessage(Integer.parseInt(messageCode[i]));
		}
		System.out.println("삭제 결과 : "+ result);
	}
	
	@RequestMapping("/member/mypage/searchSendMail")
	public ModelAndView searchSendMail(HttpSession session, String word){
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
		
		List<SendMessageDTO> list = myPageServiceImpl.searchSendMail(userDTO.getId(), word);
		
		return new ModelAndView("/mypage/sendMail", "list", list);
	}
	
	@RequestMapping("/member/mypage/searchRecvMail")
	public ModelAndView searchRecvMail(HttpSession session, String word){
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
		
		List<RecvMessageDTO> list = myPageServiceImpl.searchRecvMail(userDTO.getId(), word);
		
		return new ModelAndView("/mypage/recvMail", "list", list);
	}
	
}
