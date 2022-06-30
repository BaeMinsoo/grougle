package kh.spring.grougle.chat.model.service;

import java.util.List;
import java.util.Map;

public interface ChatService {
	public List<Map<String, Object>> selectAllRooms(String userId);

	public int insertChatRoom(String name);

	public  List<Map<String, Object>> selectRoomByRoomId(String roomId);
}
