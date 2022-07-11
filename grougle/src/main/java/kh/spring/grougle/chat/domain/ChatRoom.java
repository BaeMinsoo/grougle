package kh.spring.grougle.chat.domain;

import java.util.UUID;

import lombok.Data;

@Data
public class ChatRoom {
	private String rm_id;
	private String rm_name;
	
	public static ChatRoom createChatRoom (String rm_name) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.rm_id = UUID.randomUUID().toString();
		chatRoom.rm_name = rm_name;
		
		return chatRoom;
	}
}
