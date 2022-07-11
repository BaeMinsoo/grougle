package kh.spring.grougle.chat.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.interceptor.LoggingCacheErrorHandler;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.spring.grougle.chat.model.service.ChatServiceImpl;
import kh.spring.grougle.employee.domain.Employee;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private ChatServiceImpl service;
//	${loginSsInfo.emp_id}
	// 채팅방 목록 조회
	@GetMapping("chatlist")
	@ResponseBody
	public String chatList(
			@RequestParam(value = "rm_id", defaultValue = "0") String rm_no,
			HttpSession ss) {
		System.out.println("사용자 아이디이이"+ss.getAttribute("loginSsInfo"));
		// 세션에서 아이디
		Employee empInfo = (Employee)ss.getAttribute("loginSsInfo");
//		String emp_id = empInfo.getEmp_id();
		String emp_no =  Integer.toString(empInfo.getEmp_no());
		// 채팅방 리스트
		List<Map<String,Object>> chatList = service.selectAllRooms(emp_no);
		return new Gson().toJson(chatList);
//		mv.addObject("rm_no",rm_no);
//		mv.addObject("chatList", chatList);
//		mv.setViewName("chat/chatlist");
//		
//		return mv;
	}
	@GetMapping("room")
	public ModelAndView chat(ModelAndView mv,
			@RequestParam(value = "rm_id", defaultValue = "0") String rm_id,
			HttpSession ss) {
		System.out.println("사용자 아이디이이"+ss.getAttribute("loginSsInfo"));
		// 채팅방 멤버
		if(!rm_id.equals("0")) {
			System.out.println("aaaaaaaaaaaaaaaaaaaa"+ rm_id);
			List<Map<String,Object>> chatMember = service.selectRoomMember(rm_id);
			mv.addObject("chatMember", chatMember);
		}
		mv.setViewName("chat/room");
		
		return mv;
	}
}