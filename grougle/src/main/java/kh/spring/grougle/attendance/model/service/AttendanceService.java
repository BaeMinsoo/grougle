package kh.spring.grougle.attendance.model.service;

import kh.spring.grougle.attendance.domain.Attendance;


public interface AttendanceService {

	public Attendance selectOffTime(int empNo);
	
	public Attendance selectWeekTime(int empNo);
	
	public Attendance selectMonthTime(int empNo);
	
	int insertStartTime(Attendance attStatus);
	
	public Attendance selectStartTime(int empNo);
	
	int updateEndTime(Attendance attStatus);

	int updateStatus(Attendance attStatus);
	
	int updateTotalTime(Attendance att);
	
}
