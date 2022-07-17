package kh.spring.grougle.calendar.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.grougle.calendar.domain.Calendar;
import kh.spring.grougle.calendar.model.dao.CalendarDao;

@Service
public class CalendarService {
	@Autowired
	private CalendarDao dao;

}
