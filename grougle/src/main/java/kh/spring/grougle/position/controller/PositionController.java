package kh.spring.grougle.position.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.grougle.position.domain.Position;
import kh.spring.grougle.position.model.service.PositionService;
import kh.spring.grougle.position.model.service.PositionServiceImpl;

@Controller
@RequestMapping("/position")
public class PositionController {
	
	@Autowired
	private PositionService service;
	
//	@GetMapping("/insert")
//	public ModelAndView pageinsertPosition(ModelAndView mv) {
//		mv.setViewName("position/insert");
//		return mv;
//	}
	@GetMapping("/insert")
	public String pageinsertPosition() {
		return "position/insert";
	}
	
	@PostMapping("/insert")
	public ModelAndView insertPosition(ModelAndView mv
			, Position position
			) {
		int result = service.insertPosition(position);
		System.out.println(result);
		return mv;
	}
	
	@GetMapping("/list")
	public ModelAndView selectListPosition(ModelAndView mv) {
		return mv;
	}
}
