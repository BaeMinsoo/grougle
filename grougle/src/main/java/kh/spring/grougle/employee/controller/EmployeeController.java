package kh.spring.grougle.employee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.grougle.employee.domain.Employee;
import kh.spring.grougle.employee.model.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	private EmployeeService service;

	// 회원가입 GET
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void insertEmployee() {
//		logger.info("get join");
	}

	// 회원가입 POST
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String insertEmployee(ModelAndView mv, Employee emp) {
		service.insertEmployee(emp);
		mv.setViewName("redirect:/joindo");
		return null;

	}

	// 약관동의
	@RequestMapping(value = "/agreement", method = RequestMethod.GET)
	public ModelAndView agreementEmployee(ModelAndView mv) {
		mv.setViewName("/employee/agreement");
		return mv;
	}

	// ID 중복체크
	@PostMapping("/idcheck")
	@ResponseBody
	public String empIdcheck(@RequestParam("emp_id") String emp_id) {

		String empIdcheck;
		int idCnt = service.empIdcheck(emp_id);
		if (idCnt > 0)
			empIdcheck = "F";
		else
			empIdcheck = "S";

		return empIdcheck;
	}

	// 로그인 & 아웃
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "employee/login";
	}
		
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String empLogin(
			Employee emp
			,@RequestParam("emp_id") String id
			,@RequestParam("emp_pwd") String pwd
			, HttpServletRequest req
			, RedirectAttributes rttr) throws Exception {
//		Logger.info("post login");

		HttpSession session = req.getSession();
		Employee login = service.empLogin(emp);

		if (login == null) {
			session.setAttribute("loginSsInfo", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("loginSsInfo", login);
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String empLogout(
			HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

}
