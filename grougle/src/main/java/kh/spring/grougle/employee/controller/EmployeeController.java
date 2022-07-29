                                                                                                                                                                                package kh.spring.grougle.employee.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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
	public String insertEmployee(@ModelAttribute Employee emp, RedirectAttributes rttr, HttpServletResponse response)
			throws Exception {
		rttr.addFlashAttribute("result", service.insertEmployee(emp, response));

		return "employee/joindo";
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
			//아이디가 존재하는 경우 
			empIdcheck = "F";
		else
			//아이디가 존재하지 않는 경우
			empIdcheck = "S";

		return empIdcheck;
	}		
	// *로그인 GET
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String empLogin(
			@ModelAttribute("Employee") Employee emp
			, HttpServletRequest request
			, Model model) {
		logger.info("login");

		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		if (null != inputFlashMap) {
			model.addAttribute("msg", (String) inputFlashMap.get("msg"));
		}
		return "employee/login";
	}

	// 로그인 POST
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String empLogin(
			Employee emp
			, @RequestParam("emp_id") String emp_id
			, @RequestParam("emp_pwd") String emp_pwd
			, HttpServletRequest req
			, HttpSession httpSession
			, RedirectAttributes rttr
			, HttpServletResponse response
			, Model model) throws Exception {
		logger.info("loginSsInfo" + emp.getEmp_id());

		HttpSession session = req.getSession();
		Employee loginSsInfo = service.empLogin(emp, response);
		logger.info("Pw" + emp);
		if (loginSsInfo == null) {
			session.setAttribute("loginSsInfo", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("loginSsInfo", loginSsInfo);
		}
		rttr.addFlashAttribute("msg", loginSsInfo.getEmp_name()+"님 로그인되었습니다.");
		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void empLogout(HttpSession session, HttpServletResponse response) throws Exception {
		session.invalidate();
//				session.removeAttribute("emp");
		service.empLogout(response);

	}

	/*
	 * HttpServletRequest request , HttpSession session , HttpServletResponse
	 * response ,ModelMap model)throws Exception{ logger.info("logout");
	 * 
	 * Object URL = session.getAttribute("URL"); Object object =
	 * session.getAttribute("login"); if(object != null) { Employee emp = (Employee)
	 * object; session.removeAttribute("login"); session.invalidate(); Cookie
	 * loginCookie = WebUtils.getCookie(request, "loginCookie"); if(loginCookie !=
	 * null) { loginCookie.setPath("/"); loginCookie.setMaxAge(0);
	 * response.addCookie(loginCookie); service.keepLogin(emp.getEmp_id(),"none",new
	 * Date());
	 * 
	 * } } logger.info("URL"+ URL); String requestURL = "/"; return
	 * "redirect:"+requestURL;
	 */

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
	public String findPwd(@ModelAttribute Employee emp, HttpServletResponse response) throws Exception {
		service.findPwd(response, emp);
		/*
		 * // Mail Server 설정 String charSet = "utf-8"; String hostSMTP =
		 * "smtp.naver.com"; String hostSMTPid = "91desperado"; // 본인의 아이디 입력 String
		 * hostSMTPpwd = "c8980c8980d"; // 비밀번호 입력
		 * 
		 * 
		 * // 보내는 사람 EMail, 제목, 내용 String fromEmail = "91desperado@naver.com"; // 보내는 사람
		 * email String fromName = "Grougle"; // 보내는 사람 이름 String subject =
		 * "[Grougle]임시 비밀번호안내입니다."; // 제목 String msg = "Grougle에서 보내는 메일입니다.";
		 * 
		 * // 받는 사람 E-Mail 주소 String mail = emp.getEmp_email();
		 * 
		 * try{ HtmlEmail email = new HtmlEmail(); email.setDebug(true);
		 * email.setCharset(charSet); email.setSSL(true); email.setHostName(hostSMTP);
		 * email.setSmtpPort(587); // SMTP 포트 번호 입력
		 * 
		 * email.setAuthentication(hostSMTPid, hostSMTPpwd); email.setTLS(true);
		 * email.addTo(mail, charSet); email.setFrom(fromEmail, fromName, charSet);
		 * email.setSubject(subject); email.setHtmlMsg(msg); // 본문 내용 email.send();
		 * }catch(Exception e){ System.out.println(e); }
		 */
		return null;
	}
	
	// 이메일 중복 검사(AJAX)
		@RequestMapping(value = "checkEmail", method = RequestMethod.POST)
		@ResponseBody
		public String check_email(
				@RequestParam("emp_email") String emp_email
				, HttpServletResponse response) throws Exception{
			String result = service.empEmailcheck(emp_email, response);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String data = gson.toJson(result);
			return data;
		}
	

	// 회원 이메일 인증
	@RequestMapping(value = "/approvalEmp", method = RequestMethod.POST)
	public void approvalEmp(
			@ModelAttribute Employee emp
			, HttpServletResponse response) throws Exception {
		service.approvalEmp(emp, response);
	}

	// 마이페이지 이동
	@RequestMapping(value = "/empPage")
	public String empPage() throws Exception {
		return "/employee/empPage";
	}

	// empPage 수정
	@RequestMapping(value = "/updateEmpPage", method = RequestMethod.POST)
	public String update_mypage(
			@ModelAttribute Employee emp
			, HttpSession session
			, RedirectAttributes rttr)
			throws Exception {
		session.setAttribute("Employee", service.updateEmpPage(emp));
		rttr.addFlashAttribute("msg", "사원정보 수정 완료");
		return "redirect:/employee/login";
	}

	// 비밀번호 변경
	@RequestMapping(value = "/updatePwd", method = RequestMethod.POST)
	public String update_pw(
			Employee emp
			, @RequestParam("emp_pwd") String emp_pwd
			, HttpSession session
			, HttpServletResponse response
			, RedirectAttributes rttr) throws Exception {
		session.setAttribute("Employee", service.updatePwd(emp_pwd, emp, response));
		rttr.addFlashAttribute("msg", "사원정보 수정 완료");
		return "redirect:/employee/login";
	}

}
