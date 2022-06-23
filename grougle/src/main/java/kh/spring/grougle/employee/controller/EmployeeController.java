package kh.spring.grougle.employee.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.grougle.employee.domain.Employee;
import kh.spring.grougle.employee.model.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	private EmployeeService service;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public ModelAndView insertEmployee(
			ModelAndView mv
			) {
		return mv;
		
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView insertEmployee(
			ModelAndView mv
			,Employee emp
			) {
		int result = service.insertEmployee(emp);
		mv.setViewName("redirect:/joindo");
		return mv;
		
	}
	
	@RequestMapping(value="/agreement", method=RequestMethod.GET)
	public ModelAndView agreementEmployee(
			ModelAndView mv
			) {
		mv.setViewName("/employee/agreement");
		return mv;		
	}
	
	@PostMapping("/idcheck")
	@ResponseBody
    public String empIdcheck(
    		@RequestParam("emp_id") String emp_id
    		){
        
		String empIdcheck;
		int idCnt = service.empIdcheck(emp_id);
		if(idCnt > 0) 
			empIdcheck = "F";
		else 
			empIdcheck = "S";

		return empIdcheck;
    }
	
	
	
}

