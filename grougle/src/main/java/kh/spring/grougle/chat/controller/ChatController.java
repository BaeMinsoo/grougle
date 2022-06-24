package kh.spring.grougle.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.grougle.chat.model.service.ChatService;

@Controller
@RequestMapping("/chat.do")
public class ChatController {

	@Autowired
	private ChatService service;
	
	@GetMapping("/chat")
	public ModelAndView chat(ModelAndView mv) {
		mv.setViewName("chat/chat");
// 사용자 정보 출력
//		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		System.out.println("username : " + user.getUsername());
//		
//		System.out.println("normal chat page");
//		mv.addObject("userid", user.getUsername());
		
		return mv;
	}
	
}
