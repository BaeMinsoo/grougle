package kh.spring.grougle.position.model.service;

import java.util.List;
import kh.spring.grougle.position.domain.Position;

public interface PositionService {
	
	public int insertPosition(Position position);
	
	public List<Position> selectListPosition();
}
