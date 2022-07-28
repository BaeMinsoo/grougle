package kh.spring.grougle.chat.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.grougle.chat.domain.ChatMessage;

@Repository
public class ChatDao {
	@Autowired
	private SqlSession sqlsession;
	
	// 채팅방 리스트
	public List<Map<String, Object>> selectAllRooms(String emp_no) {
		return sqlsession.selectList("Chat.selectAllRooms", emp_no);
	}
	// 사원 리스트
	public List<Map<String, Object>> selectEmployeeList() {
		return sqlsession.selectList("Chat.selectEmployeeList");
	}
	// 채팅방
	public List<Map<String, Object>> selectRoomByRoomId(String rm_id) {
		return sqlsession.selectList("Chat.selectRoomByRoomId", rm_id);
	}
	// 채팅방 멤버
	public List<Map<String, Object>> selectRoomMember(String rm_id) {
		return sqlsession.selectList("Chat.selectRoomMember", rm_id);
	}
	// TODO 채팅방 멤버 카운트
	public String memberCount(String rm_id) {
		return sqlsession.selectOne("Chat.memberCount", rm_id);
	}
	// 메시지
	public int insertMessage(ChatMessage chatMessage) {
		return sqlsession.insert("Chat.insertMessage", chatMessage);
	}
	public String selectMaxMsgNo() {
		return sqlsession.selectOne("Chat.selectMaxMsgNo");
	}
	public String selectMsgSdate(String ch_msgid) {
		return sqlsession.selectOne("Chat.selectMsgSdate", ch_msgid);
	}
	public List<ChatMessage> selectMessage(String rm_id) {
		return sqlsession.selectList("Chat.selectMessage", rm_id);
	}
	// 채팅방 생성
	public int createRoom(Map<String, Object> map) {
		return sqlsession.insert("Chat.createRoom", map);
	}
	
}
