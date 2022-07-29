package kh.spring.grougle.companytree.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.grougle.companytree.domain.Companytree;
import kh.spring.grougle.companytree.domain.Companytree2;
import kh.spring.grougle.companytree.domain.CompanytreeEmployee;
import kh.spring.grougle.companytree.domain.CompanytreeEmployee2;
import kh.spring.grougle.companytree.service.CompanytreeService;



@Controller
@RequestMapping("/companytree")
public class CompanytreeController {

	@Autowired
	private CompanytreeService service;
	
	@GetMapping("/list")
	public ModelAndView selectCompanytreeEmployeeList(ModelAndView mv) {
		List<CompanytreeEmployee> companytreeEmployeelist = service.selectCompanytreeEmployeeList();
		mv.addObject("companytreeEmployeelist", companytreeEmployeelist);
		mv.setViewName("companytree/companytree4");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/listajax")
	public List<Companytree> selectCompanytreeList2(ModelAndView mv) {
		List<Companytree> companytreelist = service.selectCompanytreeList();
		return companytreelist;
	}
	
	@ResponseBody
	@GetMapping("/emplistajax")
	public ModelAndView selectCompanytreeEmployeeAllList(ModelAndView mv
			, @RequestParam(name="dept_name", required = true) String dept_name) {
		List<CompanytreeEmployee> companytreeEmployeelist = service.selectCompanytreeEmployeeAllList(dept_name);
		mv.addObject("companytreeEmployeelist", companytreeEmployeelist);
		mv.setViewName("companytree/employeepage");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/empalllistajax")
	public ModelAndView selectCompanytreeEmployeerealAllList(ModelAndView mv) {
		List<CompanytreeEmployee> companytreeEmployeelist = service.selectCompanytreeEmployeerealAllList();
		mv.addObject("companytreeEmployeelist", companytreeEmployeelist);
		mv.setViewName("companytree/employeepage");
		return mv;
	}
	
	@PostMapping("insertdept")
	public ModelAndView insertdept(ModelAndView mv
			, Companytree companytree) {
		int result = service.insertdept(companytree);
		mv.setViewName("redirect:/companytree/list");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/deptcheckajax")
	public int selectdeptcheck(@RequestParam(name="dept_name", required = true) String dept_name) {
		int result = service.selectdeptcheck(dept_name);
		return result;
	}
	
	@PostMapping("updatedeptname")
	public ModelAndView updatedeptname(ModelAndView mv
			, Companytree2 companytree2) {
		int result = service.updatedeptname(companytree2);
		mv.setViewName("redirect:/companytree/list");
		return mv;
	}
	
	@PostMapping("updatedeptplace")
	public ModelAndView updatedeptplace(ModelAndView mv
			, Companytree companytree) {
		int result = service.updatedeptplace(companytree);
		mv.setViewName("redirect:/companytree/list");
		return mv;
	}
	
	@PostMapping("deletedept")
	public ModelAndView deletedept(ModelAndView mv
			, @RequestParam(name="dept_name", required = true) String dept_name) {
		int result = service.deletedept(dept_name);
		mv.setViewName("redirect:/companytree/list");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/deptcheckajax2")
	public int selectdeptcheck2(@RequestParam(name="dept_no", required = true) String dept_no) {
		int result = service.selectdeptcheck2(dept_no);
		return result;
	}
	
	@ResponseBody
	@GetMapping("/deptupdowncheck")
	public int selectdeptupdowncheck(@RequestParam(name="dept_no1", required = true) int dept_no1
			, @RequestParam(name="dept_no2", required = true) int dept_no2) {
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("dept_no1", dept_no1);
		map.put("dept_no2", dept_no2);
		int result = service.selectdeptupdowncheck(map);
		return result;
	}
	
	@ResponseBody
	@GetMapping("/emplistajaxforformmake")
	public ModelAndView selectCompanytreeEmployeeAllList2(ModelAndView mv
			, @RequestParam(name="dept_name", required = true) String dept_name) {
		List<CompanytreeEmployee2> companytreeEmployeelist = service.selectCompanytreeEmployeeAllList2(dept_name);
		mv.addObject("companytreeEmployeelist", companytreeEmployeelist);
		mv.setViewName("eforms/employeepage");
		return mv;
	}
	
}
