package kosta.web.mogong.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import kosta.web.mogong.util.CodeUtil;

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

		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");

		if (userDTO != null) {
			model.addAttribute("messageCount", service.messageCount(userDTO.getId()));
		}

		model.addAttribute("studyList", service.selectRecentStudy());

		return "main/index";
	}

	@RequestMapping("/main/mypage")
	public String myPage(HttpSession session, Model model) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");

		if (userDTO != null) {
			model.addAttribute("messageCount", service.messageCount(userDTO.getId()));
		}

		return "/mypage/mypageMain";
	}

	@RequestMapping("/loginForm")
	public String loginForm() {
		return "main/login/loginForm";
	}

	@RequestMapping("/search/study")
	public ModelAndView search(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");

		if (userDTO != null) {
			model.addAttribute("messageCount", service.messageCount(userDTO.getId()));
		}
		
		ModelAndView mv=new ModelAndView();
		
		StudyDTO studyDTO=new StudyDTO();
		studyDTO.setName("");
		int page=1;
		
		List<StudyDTO> studyDTOList=service.selectSearchStudy(studyDTO, page);
		Map<String, CommCodeDTO> categoryMap=CodeUtil.getChildCodeDTO("0157");
		Map<String, CommCodeDTO> cityCodeMap=CodeUtil.getChildCodeDTO("0061");

		mv.addObject("studyDTOList", studyDTOList);
		mv.addObject("categoryMap", categoryMap);
		mv.addObject("cityCodeMap", cityCodeMap);
		mv.setViewName("main/search/searchStudy");
		
		return mv;
	}

	// 회원가입 입력 폼
	@RequestMapping("/login/signupForm")
	public String signUpForm() {
		return "main/login/signUpForm";
	}

	// 아이디, 패스워드를 받아서 로그인처리할때 사용됨.

	@RequestMapping("/login/signup")
	public String signUp(HttpServletRequest request, UserDTO userDTO) throws Exception {
		String path = request.getSession().getServletContext().getRealPath("/data/user/");

		File dir = new File(path);

		if (!dir.exists()) {
			dir.mkdirs();
		}

		MultipartFile file = userDTO.getFile();

		// 파일이름 구성
		String fileName = file.getOriginalFilename();
		int lastIdx = fileName.lastIndexOf(".");
		String fileExtName = fileName.substring(lastIdx + 1);
		fileName = userDTO.getId() + "." + fileExtName;

		if (file.getSize() > 0) {
			// 파일저장
			try {
				file.transferTo(new File(path + fileName));
				userDTO.setPath("/data/user/" + fileName);
			} catch (Exception e) {
				throw new Exception("파일 저장에 실패했습니다.");
			}
		}

		authService.insertUser(userDTO);

		return "main/index";// 로그인 처리를 하고 메인으로 간다.
	}

	// 로그인 처리
	@RequestMapping("/loginPro")
	public String loginPro(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Authentication auth = (Authentication) request.getUserPrincipal();
		Object userObj = auth.getPrincipal();

		UserDTO userDTO = null;
		if (userObj != null && userObj instanceof UserDTO) {
			userDTO = ((UserDTO) userObj);
		}
		session.setAttribute("userDTO", userDTO);

		List<MemberDTO> memberDTOList = authService.selectMemberById(userDTO.getId());

		model.addAttribute("messageCount", service.messageCount(userDTO.getId()));

		Map<String, String> memberMap = new HashMap<>();
		if (memberDTOList != null) {
			for (MemberDTO memberDTO : memberDTOList) {
				memberMap.put(memberDTO.getStudyCode() + "", memberDTO.getMemberCode() + "");
			}
		}
		session.setAttribute("memberMap", memberMap);
		request.setAttribute("session", session);
		model.addAttribute("studyList", service.selectRecentStudy());

		return "main/index";
	}

	@RequestMapping("/study/info")
	public ModelAndView studyInfo(HttpServletRequest request, String studyCode) {
		ModelAndView mv = new ModelAndView();
		StudyDTO studyDTO = service.selectByStudyCode(studyCode, true);
		mv.addObject("studyDTO", studyCode);
		mv.setViewName("main/study/info");

		return mv;
	}

	// 스터디 모집 폼 화면
	@RequestMapping("/study/enrollForm")
	public String enrollForm(HttpServletRequest request, Model model, StudyDTO studyDTO) {
		HttpSession session = request.getSession();
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		if (userDTO != null) {
			model.addAttribute("messageCount", service.messageCount(userDTO.getId()));
		}

		return "main/study/enroll";
	}

	// 스터디 모집
	// 스터디 등록을 했을 때 뜨는 화면-->메인
	@RequestMapping("/enroll")
	public String insertEnroll(HttpServletRequest request, StudyDTO studyDTO, String datePicker, Model model) {
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("userDTO");
		studyDTO.setId(dto.getId());

		String[] str = datePicker.split("~");
		
		if (dto != null) {
			model.addAttribute("messageCount", service.messageCount(dto.getId()));
		}

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

	// 스터디 수정 폼 화면
	@RequestMapping("/study/updateForm")
	public ModelAndView updateForm(HttpSession session, String studyCode) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");

		StudyDTO dto = service.selectByStudyCode(studyCode, false);
		ModelAndView mv = new ModelAndView();
		
		if (userDTO != null) {
			mv.addObject("messageCount", service.messageCount(userDTO.getId()));
		}
		mv.setViewName("main/study/update");
		mv.addObject("studyCode", studyCode);
		mv.addObject("studyDTO", dto);
		
		return mv;
	}
	
	// 스터디 수정폼에서 수정하기 클릭했을때
	@RequestMapping("/studyUpdate")
	public String studyUpdate(HttpServletRequest request, StudyDTO studyDTO, String datePicker) {
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("userDTO");
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

		service.studyUpdate(studyDTO);
		
		return "redirect: "+request.getContextPath()+"/search/detail?studyCode="+studyDTO.getStudyCode();
	}
	
	// 스터디 가입 신청
	@RequestMapping("/joinStudy")
	@ResponseBody
	public List<String> joinStudy(HttpSession session, HttpServletResponse response, String studyCode) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		response.setContentType("text/html; charset=UTF-8");
		
		List<String> list=new ArrayList<>();
		
		list.add(service.studyJoin(new MemberDTO(Integer.parseInt(studyCode), userDTO.getId())));
		return list;
	}

	@RequestMapping("/study/main")
	public String studyMain(HttpServletRequest request, HttpSession session, Model model) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");

		if (userDTO != null) {
			model.addAttribute("messageCount", service.messageCount(userDTO.getId()));
		}

		return "member/studyMain";
	}

	@RequestMapping("/study/location")
	@ResponseBody
	public List<CommCodeDTO> selectCode(String areaCode) {
		List<CommCodeDTO> list = service.getAreaCode(areaCode);
		return list;
	}

	@RequestMapping("/search/detail")
	public ModelAndView detail(HttpSession session, String studyCode) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");

		String memberId = null;

		if (userDTO != null) {
			memberId = userDTO.getId();
		}

		StudyDTO dto = service.selectByStudyCode(studyCode, false);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/search/detailStudy");
		mv.addObject("messageCount", service.messageCount(memberId));
		mv.addObject("studyCode", studyCode);
		mv.addObject("studyDTO", dto);
		mv.addObject("selectStudyMember",
				service.selectStudyMember(new MemberDTO(Integer.parseInt(studyCode), memberId)));
		return mv;
	}

	@RequestMapping("/search")
	@ResponseBody
	public List<StudyDTO> keywordSearch(StudyDTO studyDTO, int page){
		return service.selectSearchStudy(studyDTO, page);
	}
}
