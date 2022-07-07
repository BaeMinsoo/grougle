package kh.spring.grougle.employee.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.util.WebUtils;

import kh.spring.grougle.employee.domain.Employee;
import kh.spring.grougle.employee.model.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Autowired
	private EmployeeService service;

	// 회원가입 GET
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void insertEmployee() {
	}

	// 회원가입 POST
	@RequestMapping(value = "/joindo", method = RequestMethod.POST)
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

	// 로그인 
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String empLogin(
			@ModelAttribute("Employee")Employee emp,
			HttpServletRequest request,
			Model model) {
		logger.info("login");
		
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		if(null != inputFlashMap) {
			model.addAttribute("msg",(String) inputFlashMap.get("msg"));
		}
		return "employee/login";
	}
		

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String empLogin(
			@ModelAttribute("Employee") Employee emp
			, HttpServletRequest req
			, HttpSession httpSession
			, RedirectAttributes rttr
			, Model model) throws Exception {
		logger.info("loginVO"+emp.getEmp_id());

		HttpSession session = req.getSession();
		Employee login = service.empLogin(emp);
		logger.info("Pw"+ emp);

		if (login == null) {
			session.setAttribute("loginSsInfo", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("loginSsInfo", login);
		}
		System.out.println("loginSsInfo 로그인 접속:" +login);
		return "redirect:/";
	}
			
	//로그아웃
	@RequestMapping(value="/logout" , method=RequestMethod.GET)
	public String empLogout(
			HttpServletRequest request
			,  HttpSession session
			, HttpServletResponse response
			,ModelMap model)throws Exception{
		logger.info("logout");
		
		Object URL = session.getAttribute("URL");
		Object object = session.getAttribute("login");
		if(object != null) {
			Employee emp = (Employee) object;
			session.removeAttribute("login");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(emp.getEmp_id(),"none",new Date());
				
			}
		}
		logger.info("URL"+ URL);
		 String requestURL = "/";		
		return "redirect:"+requestURL;		
	}
	// 아이디 찾기 폼
	@RequestMapping(value = "/findId_form")
	public String findId() throws Exception {
		return "/employee/findId_form";
	}

	// 비밀번호 찾기 폼
	@RequestMapping(value = "/findPwd_form")
	public String findPwd() throws Exception {
		return "/employee/findPwd_form";
	}

	// 아이디 찾기
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findId(HttpServletResponse response,
			@RequestParam(value = "emp_email", required = false) String emp_email, Model md) throws Exception {
		md.addAttribute("emp_id", service.findId(response, emp_email));
		return "/employee/findId";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/findPwd", method = RequestMethod.POST)
	@ResponseBody
	public String findPwd(
			@ModelAttribute Employee emp
			, HttpServletResponse response
			) throws Exception {
		service.findPwd(response, emp);
	System.out.println(emp);
	// Mail Server 설정
	String charSet = "utf-8";
	String hostSMTP = "smtp.naver.com";
	String hostSMTPid = "91desperado@naver.com"; // 본인의 아이디 입력
	String hostSMTPpwd = "c8980c8980d"; // 비밀번호 입력

	
	// 보내는 사람 EMail, 제목, 내용
	String fromEmail = "dnwls.KH@google.com"; // 보내는 사람 email
	String fromName = "Grougle"; // 보내는 사람 이름
	String subject = "이메일 발송 테스트"; // 제목

	// 받는 사람 E-Mail 주소
	String mail = "91desperado@naver.com";
	
		try{
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); // SMTP 포트 번호 입력
	
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg("<p>이메일 발송 테스트 입니다.</p>"); // 본문 내용
			email.send();
		}catch(Exception e){
			System.out.println(e);
		}
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
}
