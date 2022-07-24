package kh.spring.grougle.calendar.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.grougle.calendar.domain.Calendar;
import kh.spring.grougle.calendar.model.service.CalendarService;
import kh.spring.grougle.employee.domain.Employee;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

	@Autowired
	private CalendarService service;
	
	@GetMapping("/calendar")
	public ModelAndView calendar(ModelAndView mv) {
		mv.setViewName("calendar/calendar");
		return mv;
	}
	
	
}
