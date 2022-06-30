package kh.spring.grougle.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.grougle.chat.model.dao.ChatDao;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDao dao;
	
	@Override
	public List<Map<String, Object>> selectAllRooms(String userId) {
		return dao.selectAllRooms(userId);
	}

	@Override
	public int insertChatRoom(String name) {
		return dao.insertChatRoom(name);
	}

	@Override
	public  List<Map<String, Object>> selectRoomByRoomId(String roomId) {
		return dao.selectRoomByRoomId(roomId);
	}
}
