package kh.spring.grougle.position.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.grougle.position.domain.Position;

public interface PositionService {
	public int insertPosition(Position position);
	
	
	public List<Position> selectListPosition();
}
