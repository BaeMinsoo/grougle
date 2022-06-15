package kh.spring.grougle.position.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.grougle.position.domain.Position;

@Repository
public class PositionDao {
	@Autowired
	private SqlSession sqlsession;
	
	public int insertPosition(Position position ) {
		return sqlsession.insert("Position.insertPosition", position);
		
	}
	
	public List<Position> selectListPosition() {
		return sqlsession.selectList("Position.selectListPosition");
		
	}
	
}
