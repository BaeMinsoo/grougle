package kh.spring.grougle.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import kh.spring.grougle.chat.domain.ChatMessage;
import kh.spring.grougle.chat.model.service.ChatServiceImpl;
import lombok.RequiredArgsConstructor;

@Controller()
@RequiredArgsConstructor
public class StompChatClient {
    private final SimpMessagingTemplate messagingTemplate;

    @Autowired
    ChatServiceImpl service;
    
    @MessageMapping(value = "/chat/message")
    public void message(ChatMessage message) {
    	System.out.println("제에바알: " + message.getRm_id());
    	String ch_msgid = service.selectMaxMsgNo();
    	message.setCh_msgid(ch_msgid);
    	System.out.println("▶▶▶▶메시지번호야: " + message.getCh_msgid());
    	service.insertMessage(message);
    	String ch_time = service.selectMsgSdate(ch_msgid);
    	message.setCh_time(ch_time);
		messagingTemplate.convertAndSend("/sub/chat/message/" + message.getRm_id(), message);
    }
    
    @MessageMapping(value = "/chat/enter")
    public void enter(ChatMessage message) {
    	messagingTemplate.convertAndSend("/sub/chat/message/", message);
    }
}



//@Controller()
//@RequiredArgsConstructor
//public class StompChatClient {
//    private final SimpMessagingTemplate messagingTemplate;
//
//    @Autowired
//    private ChatServiceImpl service;
//    
//    @MessageMapping(value = "/chat/message")
//    public void message(ChatMessage message) {
//    	String ch_msgid = service.selectMaxMsgNo();
//    	message.setCh_msgid(ch_msgid);
//    	service.insertMessage(message);
//    	String ch_time = service.selectMsgSdate(ch_msgid);
//    	message.setCh_time(ch_time);
//    	messagingTemplate.convertAndSend("/sub/chat/message/"+message.getRm_id(),message);
//    }
//    
//    @MessageMapping(value = "/chat/enter")
//    public void enter(ChatMessage message) {
//    	messagingTemplate.convertAndSend("/sub/chat/message/"+message.getRm_id(),message);
//    }
//}