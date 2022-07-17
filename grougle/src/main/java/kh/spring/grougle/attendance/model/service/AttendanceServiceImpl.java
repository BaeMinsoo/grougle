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
	
	@Override
	public Attendance selectOffTime(String empNo) {
		return attDAO.selectOffTime(empNo);
	}

	@Override
	public Attendance selectWeekTime(String empNo) {
		return attDAO.selectWeekTime(empNo);
	}

	@Override
	public Attendance selectMonthTime(String empNo) {
		return attDAO.selectMonthTime(empNo);
	}
	
	
	
}
