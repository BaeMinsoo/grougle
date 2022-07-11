package kh.spring.grougle.chat.model.service;

import java.util.List;
import java.util.Map;

public interface ChatService {
	// 채팅방 리스트
	public List<Map<String, Object>> selectAllRooms(String emp_no);
	
	// 채팅방 멤버
	public List<Map<String, Object>> selectRoomMember(String rm_id);
}
