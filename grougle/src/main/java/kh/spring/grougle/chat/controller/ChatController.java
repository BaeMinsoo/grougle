package kh.spring.grougle.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.grougle.chat.model.service.ChatService;

@Controller
@RequestMapping("/chat.do")
public class ChatController {

	@Autowired
	private ChatService service;
	
}
