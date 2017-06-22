package kosta.web.mogong.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.web.mogong.dto.ChatDTO;
import kosta.web.mogong.dto.MemberDTO;
import kosta.web.mogong.dto.UserDTO;

@Controller
public class SocketController {
	
	@RequestMapping("/member/study/chatting")
	public ModelAndView viewChattingPage(HttpSession session, HttpServletRequest request){
		
		UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
<<<<<<< HEAD
		
=======
>>>>>>> e3bf9108cc09444ab9b73878ae4be2a43372d34c
		request.setAttribute("sessionId", userDTO.getId());
		request.setAttribute("sessionPhoto", userDTO.getPath());
		
		FileReader fr = null;
		BufferedReader br= null;
		List<String> list = new ArrayList<>();
		
		try {
			fr = new FileReader("C:\\edu\\save2.txt");
			br = new BufferedReader(fr);
			
			String line= null;
			
			try {
				while((line=br.readLine())!=null){
					list.add(line);
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}finally {
			try {
				if(fr!=null)fr.close();
			} catch (IOException e) {}
		}
		
		List<ChatDTO> chatList = new ArrayList<>();
		
		for(int j=0;j<list.size();j++){
			
			String str[] = list.get(j).split(",");
			chatList.add(new ChatDTO(str[0], str[1], str[2], str[3]));
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("chatList", chatList);
		mv.setViewName("/member/chatting");
		
		return mv;
	}
	
	@RequestMapping("/member/study/fileSave")
	@ResponseBody
	public void fileSave(String sessionId, String message, String date, String photo){
		
		File file = new File("C:\\edu\\save2.txt");
		FileWriter fw = null;
		try {
			
			fw = new FileWriter(file,true);
			fw.write(sessionId+","+message+","+date+","+photo+"\r\n");
			/*fw.append(sessionId+","+message+","+date+","+photo+"\r\n");*/
			fw.flush();
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fw.close();
			} catch (IOException e){}
		}
	
	}

}
