package kh.spring.grougle.chat.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import kh.spring.grougle.chat.common.ReplyEchoHandler;
import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSocket
@RequiredArgsConstructor
public class WebSocketConfig {
	private final ReplyEchoHandler replyEchoHandler;
	
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(replyEchoHandler,"/chat.do/chat");
    }
}
