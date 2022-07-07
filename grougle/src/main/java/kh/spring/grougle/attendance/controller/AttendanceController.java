package kh.spring.grougle.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.grougle.attendance.model.service.AttendanceService;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	
	@Autowired
	private AttendanceService service;
	
	@GetMapping("/attendance")
	public ModelAndView attendance(ModelAndView mv) {
		mv.setViewName("attendance/attendance");
		return mv;
	}
}
