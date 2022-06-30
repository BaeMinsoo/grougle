package kh.spring.grougle.chat.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDao {
	@Autowired
	private SqlSession sqlsession;
	
	public List<Map<String, Object>> selectAllRooms(String userId) {
		return sqlsession.selectList("Messenger.selectAllRooms", userId);
	}
	public int insertChatRoom(String name) {
		int maxnum = sqlsession.selectOne("Chat.maxmessageroomno");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("maxnum", maxnum);
		return sqlsession.insert("Chat.insertChatRoom", map);
	}
	
	public List<Map<String, Object>> selectRoomByRoomId(String roomId) {
		return sqlsession.selectList("Chat.selectRoomByRoomId", roomId);
	}
	
}
