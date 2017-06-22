package kosta.web.mogong.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.web.mogong.dto.CommCodeDTO;
import kosta.web.mogong.dto.MemberDTO;
import kosta.web.mogong.dto.StudyDTO;
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
	public String home(Locale locale, Model model, HttpSession session, HttpServletRequest request) {
		
		UserDTO userDTO=(UserDTO) session.getAttribute("userDTO");
		
		if(userDTO != null) {
			model.addAttribute("messageCount", service.messageCount(userDTO.getId()));
		}
		
		return "main/index";
	}
	
	@RequestMapping("/main/mypage")
	public String myPage(HttpSession session, Model model){
		UserDTO userDTO=(UserDTO) session.getAttribute("userDTO");
		
		if(userDTO != null) {
			model.addAttribute("messageCount", service.messageCount(userDTO.getId()));
		}
		
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

		//파일이름 구성
		String fileName=file.getOriginalFilename();
		int lastIdx=fileName.lastIndexOf(".");
		String fileExtName=fileName.substring(lastIdx+1);
		fileName=userDTO.getId() + "." + fileExtName;
		
		
		if(file.getSize()>0){
			//파일저장
			try{
				file.transferTo(new File(path+fileName));
				userDTO.setPath("/data/user/"+fileName);
			}catch(Exception e){
				throw new Exception("파일 저정에 실패했습니다.");
			}
		}
		
		
		authService.insertUser(userDTO);
		
		return "main/index";//로그인 처리를 하고 메인으로 간다.
	}
	
	//로그인 처리
	@RequestMapping("/loginPro")
	public String loginPro(HttpServletRequest request, Model model){
		HttpSession session=request.getSession();
		Authentication auth=(Authentication)request.getUserPrincipal();
		Object userObj=auth.getPrincipal();
		
		UserDTO userDTO=null;
		if(userObj!=null && userObj instanceof UserDTO){
			userDTO=((UserDTO)userObj);
		}
		session.setAttribute("userDTO", userDTO);
		
		List<MemberDTO> memberDTOList=authService.selectMemberById(userDTO.getId());
		
		model.addAttribute("messageCount", service.messageCount(userDTO.getId()));
		
		Map<String, String>memberMap=new HashMap<>();
		if(memberDTOList!=null){
			for(MemberDTO memberDTO: memberDTOList){
				memberMap.put(memberDTO.getStudyCode()+"", memberDTO.getMemberCode()+"");
			}
		}
		session.setAttribute("memberMap", memberMap);
		request.setAttribute("session", session);
		
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
	@RequestMapping("/study/enrollForm")
	public String enrollForm(HttpServletRequest request, StudyDTO studyDTO) {
		//System.out.println(studyDTO);
		return "main/study/enroll";
	}
	
	//스터디 모집
	//스터디 등록을 했을 때 뜨는 화면-->메인
	@RequestMapping("/enroll")
	public String insertEnroll(HttpServletRequest request, StudyDTO studyDTO,String datePicker) {
		HttpSession session = request.getSession();
		UserDTO dto =(UserDTO)session.getAttribute("userDTO");	
		studyDTO.setId(dto.getId());
		
		String[] str = datePicker.split("~");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 M월 d일 a HH:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date = sdf.parse(str[0]);
			String s = sdf2.format(date);
			studyDTO.setStartDate(s);
			
			date = sdf.parse(str[1]);
			s = sdf2.format(date);
			studyDTO.setEndDate(s);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		service.insertStudy(studyDTO);

		return "main/index";
	}

	@RequestMapping("/study/main")
	public String studyMain(HttpServletRequest request,HttpSession session, Model model) {
		UserDTO userDTO=(UserDTO) session.getAttribute("userDTO");
		
		if(userDTO != null) {
			model.addAttribute("messageCount", service.messageCount(userDTO.getId()));
		}
		
		return "member/studyMain";
	}
	
	@RequestMapping("/study/location")
	@ResponseBody
	public List<CommCodeDTO> selectCode(String areaCode){
		List<CommCodeDTO> list =  service.getAreaCode(areaCode);
		return list;
	}
}
