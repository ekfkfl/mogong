package kosta.web.mogong.controller;

import java.io.File;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.web.mogong.dto.StudyDTO;
import kosta.web.mogong.dto.TaskDTO;
import kosta.web.mogong.dto.UserDTO;
import kosta.web.mogong.service.AuthService;
import kosta.web.mogong.service.MainService;
import kosta.web.mogong.service.TaskService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	
	@Autowired
	private MainService service;
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private AuthService authService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main/index";
	}
	
	@RequestMapping("/main/mypage")
	public String myPage(HttpSession session){
		
		 String id = "gwang12";
		 session.setAttribute("id", id);
		
		return "/mypage/mypageMain";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm(){
		return "main/login/loginForm";
	}
	
	@RequestMapping("/search/study")
	public String search(){
		return "main/search/searchStudy";
		
	}
	
	//회원가입 입력 폼
	@RequestMapping("/login/signupForm")
	public String signUpForm(){
		return "main/login/signUpForm";
	}
	
	//아이디, 패스워드를 받아서 로그인처리할때 사용됨.
	
	@RequestMapping("/login/signup")
	public String signUp(HttpServletRequest request, UserDTO userDTO) throws Exception{
		String path = request.getSession().getServletContext().getRealPath("/data/user/");
		
		MultipartFile file=userDTO.getFile();

		String fileName=file.getOriginalFilename();
		int lastIdx=fileName.lastIndexOf(".");
		String fileExtName=fileName.substring(lastIdx=1);
		fileName=userDTO.getId() + "." + fileExtName;
		
		
		if(file.getSize()>0){
			//파일저장
			try{
				file.transferTo(new File(path+fileName));
				userDTO.setPath("/data/user/"+fileName);

				System.out.println("파일 저장에 성공했습니다.");
			}catch(Exception e){
				throw new Exception("파일 저정에 실패했습니다.");
			}
		}
		
		
		authService.insertUser(userDTO);
		
		return "main/index";//로그인 처리를 하고 메인으로 간다.
	}
	
	//로그인 처리
	@RequestMapping("/login")
	public String login(){
		System.err.println("로그인 처리...");
		return "main/index";
	}
	
	
	@RequestMapping("/study/info")
	public ModelAndView studyInfo(HttpServletRequest request, String studyCode){
		ModelAndView mv = new ModelAndView();
		StudyDTO studyDTO = service.selectByStudyCode(studyCode, true);
		mv.addObject("studyDTO", studyCode);
		mv.setViewName("main/study/info");
		
		return mv;
	}

	//스터디 모집 폼 화면
	@RequestMapping("/enrollForm")
	public String enrollForm(HttpServletRequest request, StudyDTO studyDTO) {
		System.out.println(studyDTO);
		return "main/study/enroll";
	}
	
	//스터디 모집
	//스터디 등록을 했을 때 뜨는 화면-->메인
	@RequestMapping("/enroll")
	public String insertEnroll(HttpServletRequest request, StudyDTO studyDTO) {
		System.out.println(studyDTO);
		service.insertStudy(studyDTO);

		return "main/index";
	}

	@RequestMapping("/study/main")
	public String studyMain(HttpServletRequest request) {
		return "member/studyMain";
	}
}
