package kh.spring.grougle.position.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.grougle.position.domain.Position;
import kh.spring.grougle.position.model.dao.PositionDao;

@Service
public class PositionServiceImpl implements PositionService {
	@Autowired
	private PositionDao dao;
	
	@Override
	public int insertPosition(Position position) {
		return dao.insertPosition(position);
	}
	
	
	public List<Position> selectListPosition() {
		return dao.selectListPosition();
	}
}
