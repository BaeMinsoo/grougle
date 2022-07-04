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

import kh.spring.grougle.chat.model.service.ChatServiceImpl;
import kh.spring.grougle.employee.domain.Employee;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private ChatServiceImpl service;
	
	@GetMapping("room")
	public ModelAndView chat(ModelAndView mv,
			HttpSession ss) {
		System.out.println("사용자 아이디이이"+ss.getAttribute("loginSsINfo"));
		// ID 저장
		Employee empInfo = (Employee)ss.getAttribute("loginSsINfo");
		String empId = empInfo.getEmp_id();
		
		// ID담기
		mv.addObject("empId", empId);
		mv.setViewName("chat/room");

		return mv;
	}
}