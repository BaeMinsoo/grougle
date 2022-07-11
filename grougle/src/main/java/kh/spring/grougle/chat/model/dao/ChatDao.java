package kh.spring.grougle.chat.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.grougle.chat.domain.ChatRoom;

@Repository
public class ChatDao {
	@Autowired
	private SqlSession sqlsession;
	private Map<String, ChatRoom> chatRoomMap;
	
//	// 채팅방 리스트
//	public List<Map<String, Object>> selectAllRooms(String emp_id, String emp_no) {
//		return sqlsession.selectList("Messenger.selectAllRooms", emp_id);
//	}
	// 채팅방 리스트
	public List<Map<String, Object>> selectAllRooms(String emp_no) {
		return sqlsession.selectList("Chat.selectAllRooms", emp_no);
	}
	// 채팅방 멤버
	public List<Map<String, Object>> selectRoomMember(String rm_id) {
		return sqlsession.selectList("Chat.selectRoomMember", rm_id);
	}
	
	
}
