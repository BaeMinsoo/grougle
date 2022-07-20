package kh.spring.grougle.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.grougle.chat.domain.ChatMessage;
import kh.spring.grougle.chat.model.dao.ChatDao;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDao dao;
	
	// 채팅방 리스트
	@Override
	public List<Map<String, Object>> selectAllRooms(String emp_no) {
		return dao.selectAllRooms(emp_no);
	}
	// 사원 리스트
	@Override
	public List<Map<String, Object>> selectEmployeeList() {
		return dao.selectEmployeeList();
	}
	// 채팅방
	public  List<Map<String, Object>> selectRoomByRoomId(String rm_id) {
		return dao.selectRoomByRoomId(rm_id);
	}
	// 채팅방 멤버
	@Override
	public List<Map<String, Object>> selectRoomMember(String rm_id) {
		return dao.selectRoomMember(rm_id);
	}
	// TODO 채팅방 멤버 카운트
	@Override
	public String memberCount(String rm_id) {
		return dao.memberCount(rm_id);
	}
	// 메시지
	@Override
	public void insertMessage(ChatMessage chatMessage) {
		dao.insertMessage(chatMessage);
	}
	public String selectMaxMsgNo() {
		return dao.selectMaxMsgNo();
	}
	public String selectMsgSdate(String ch_msgid) {
		return dao.selectMsgSdate(ch_msgid);
	}
	// 메시지 호출
	public List<ChatMessage> selectMessage(String rm_id) {
		return dao.selectMessage(rm_id);
	}
	
}
