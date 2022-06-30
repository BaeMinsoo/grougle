package kh.spring.grougle.chat.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.grougle.chat.model.service.ChatService;
import kh.spring.grougle.employee.domain.Employee;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private ChatService service;
	
	@GetMapping("room")
	public ModelAndView chat(ModelAndView mv) {
		mv.setViewName("chat/room");

//		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		System.out.println("username : " + user.getUsername());
//		
//		System.out.println("normal chat page");
//		mv.addObject("userid", user.getUsername());

		return mv;
	}
}