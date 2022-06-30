package kh.spring.grougle.chat.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import kh.spring.grougle.chat.domain.Chat;
import lombok.RequiredArgsConstructor;

@Controller()
@RequiredArgsConstructor
public class StompChatClient {
    private final SimpMessagingTemplate messagingTemplate;

    @MessageMapping(value = "/chat/enter")
    public void enter(Chat message) {
        System.out.println("연결성공");
        message.setMsg_content(message.getMsg_id() + "님이 채팅방에 참여하셨습니다.");
        messagingTemplate.convertAndSend("/sub/chat/message/" + message.getMr_no(), message);
    }

    @MessageMapping(value = "/chat/message")
    public void message(Chat message) {
        messagingTemplate.convertAndSend("/sub/chat/message/"+message.getMr_no(),message);
    }
}