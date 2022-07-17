package kh.spring.grougle.attendance.model.service;

import kh.spring.grougle.attendance.domain.Attendance;


public interface AttendanceService {

	public Attendance selectOffTime(String empNo);
	
	public Attendance selectWeekTime(String empNo);
	
	public Attendance selectMonthTime(String empNo);
	
	
}
