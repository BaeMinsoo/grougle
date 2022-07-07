package kh.spring.grougle.attendance.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.grougle.attendance.model.dao.AttendanceDao;

@Service
public class AttendanceService {
	@Autowired
	private AttendanceDao dao;
}
