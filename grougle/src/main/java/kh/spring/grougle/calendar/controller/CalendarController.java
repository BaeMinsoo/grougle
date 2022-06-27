package kh.spring.grougle.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.grougle.calendar.model.service.CalendarService;

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
