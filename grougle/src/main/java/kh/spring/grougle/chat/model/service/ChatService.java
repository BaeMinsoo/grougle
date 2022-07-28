package kh.spring.grougle.chat.model.service;

import java.util.List;
import java.util.Map;

import kh.spring.grougle.chat.domain.ChatMessage;

public interface ChatService {
	// 채팅방 리스트
	public List<Map<String, Object>> selectAllRooms(String emp_no);
	
	// 사원 리스트
	public List<Map<String, Object>> selectEmployeeList();
	
	// 채팅방
	public  List<Map<String, Object>> selectRoomByRoomId(String rm_id);
	
	// 채팅방 멤버
	public List<Map<String, Object>> selectRoomMember(String rm_id);
	
	// TODO 채팅방 멤버 카운트
	public String memberCount(String rm_id);
	
	// 메시지
	public void insertMessage(ChatMessage chatMessage);
	public String selectMaxMsgNo();
	public String selectMsgSdate(String ch_msgid);
	
	// 메시지 호출
	public List<ChatMessage> selectMessage(String rm_id);
	
	// 채팅방 생성 및 멤버 인서트
	public int createRoom(Map<String, Object> map);
}
