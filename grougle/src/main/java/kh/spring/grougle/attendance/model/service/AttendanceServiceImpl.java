package kh.spring.grougle.attendance.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.grougle.attendance.domain.Attendance;
import kh.spring.grougle.attendance.model.dao.AttendanceDao;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private AttendanceDao attDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Attendance selectOffTime(int empNo) {
		return attDAO.selectOffTime(empNo);
	}

	@Override
	public Attendance selectWeekTime(int empNo) {
		return attDAO.selectWeekTime(empNo);
	}

	@Override
	public Attendance selectMonthTime(int empNo) {
		return attDAO.selectMonthTime(empNo);
	}
	
	
	@Override 
	public int insertStartTime(Attendance attStatus) {
		return attDAO.insertStartTime(attStatus);
	}

	@Override
	public Attendance selectStartTime(int empNo) {
		return attDAO.selectStartTime(empNo);
	}
	
	@Override
	public int updateEndTime(Attendance attStatus) {
		return attDAO.updateEndTime(attStatus);
	}

	@Override
	public int updateStatus(Attendance attStatus) {
		int result = attDAO.updateStatus(attStatus);
		return result;
	}
	
	@Override
	public int updateTotalTime(Attendance att) {
		return attDAO.updateTotalTime(att);
	}
	 
	
}
