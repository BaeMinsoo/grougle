package kh.spring.grougle.eapproval.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.grougle.eapproval.domain.Eapproval;
import kh.spring.grougle.eapproval.service.EapprovalService;
import kh.spring.grougle.eforml.domain.Eform;
import kh.spring.grougle.eforml.domain.EformRe;
import kh.spring.grougle.employee.domain.Employee;

@Controller
@RequestMapping("/eapproval")
public class EapprovalController {

	@Autowired
	private EapprovalService service;
	
	//기안 올린리는 페이지
		@GetMapping("/makeapprovalpage")
		public ModelAndView selectformandmake(ModelAndView mv
				, Eform eform) {
			Eform formsInfo = service.selectformandmake(eform);
			mv.addObject("formsInfo", formsInfo);
			mv.setViewName("eapproval/makeapproval");
			return mv;
		}
	//기안 올리면 결재로 처리하는 페이지
		@PostMapping("/makeapproval")
		public ModelAndView makeapproval(ModelAndView mv
				, Eapproval eapp) {
			int result = service.makeapproval(eapp);
			mv.setViewName("redirect:/eapproval/approvalingpage");
			return mv;
		}	
		
	//결재 메인페이지
	@GetMapping("/approvalingpage")
	public ModelAndView selectapproval(ModelAndView mv
			, HttpSession httpSession
			, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Employee emp = (Employee)session.getAttribute("loginSsInfo");
		Integer emp_no = emp.getEmp_no();
		//내가 결재를 해야 하는
		List<Eapproval> approvalongoing = service.selectapproval(emp_no);
		//내가 결재를 올린 것들
		List<Eapproval> approvalmake = service.selectapproval2(emp_no);
		//결재완료된 것들
		List<Eapproval> approvalfinish = service.selectapproval3(emp_no);
		//반려처리된 것들
		List<Eapproval> approvalreject = service.selectapproval4(emp_no);
		mv.addObject("approvalongoing", approvalongoing);
		mv.addObject("approvalmake", approvalmake);
		mv.addObject("approvalfinish", approvalfinish);
		mv.addObject("approvalreject", approvalreject);
		mv.setViewName("eapproval/mainpage");
		return mv;
	}
	
	//결재 메인 - 결재페이지 프로세스 처리
	@PostMapping("/approvaldo")
	public ModelAndView selectapprovaldo(ModelAndView mv
			, @RequestParam(name="draft_no", required = true) int draft_no) {
		Eapproval draftInfo = service.selectapprovaldo(draft_no);
		mv.addObject("draftInfo", draftInfo);
		mv.setViewName("eapproval/approvalwithform");
		return mv;
	}
	
	//결재페이지에서 결재 프로세스 처리
		@PostMapping("/approvaling")
		public ModelAndView updateapproval(ModelAndView mv
				, Eapproval eapp) {
			int result = service.updateapproval(eapp);
			mv.setViewName("redirect:/eapproval/approvalingpage");
			return mv;
		}
	
	//반려 프로세스 처리
	/*
		@PostMapping("/rejectapproval")
		public ModelAndView insertreject(ModelAndView mv
				, @RequestParam(name="draft_no", required = true) int draft_no) {
			Eapproval draftInfo = service.selectapprovaldo(draft_no);
			mv.addObject("draftInfo", draftInfo);
			mv.setViewName("eapproval/approvalwithform");
			return mv;
		}
	*/
	
}
