package kh.spring.grougle.employee.model.service;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import kh.spring.grougle.employee.domain.Employee;
import kh.spring.grougle.employee.model.dao.EmployeeDao;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeDao dao;
	
	//회원가입	
	public int insertEmployee(
			Employee emp
			, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (dao.empIdcheck(emp.getEmp_id()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
			
		} else if (dao.empEmailcheck(emp.getEmp_email()).equals("1")) {
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;	
		
		} else {
			//인증키 set
			emp.setEmp_approval_key(createKey());
			dao.insertEmployee(emp);
			sendEmail(emp, "join");
			return 1;
		}
	}
	
	// 인증키 생성
	public String createKey() throws Exception {
		String key = "";
		Random rd = new Random();
		
		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}
		
	//아이디 중복 확인
	public int empIdcheck(String emp_id) {
		int idCnt = dao.empIdcheck(emp_id);
		return idCnt;
	}

	// 로그인
	public Employee empLogin(Employee emp, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 등록된 아이디가 없으면
		if(dao.empIdcheck(emp.getEmp_id()) == 0) {
			out.println("<script>");
			out.println("alert('등록된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			String emp_pwd = emp.getEmp_pwd();
			emp = dao.empLogin(emp.getEmp_id());
			// 비밀번호가 다를 경우
			if(!emp.getEmp_pwd().equals(emp_pwd)) {
				out.println("<script>");
				out.println("alert('비밀번호가 다릅니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			// 이메일 인증을 하지 않은 경우
			}else if(!emp.getEmp_approval_status().equals("true")) {
				out.println("<script>");
				out.println("alert('이메일 인증 후 로그인 하세요.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				dao.empLogin(emp);
				return null;
			}else {
				return emp;
			}
		}
	}
	// 로그아웃
		public void empLogout(HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("location.href=document.referrer;");
			out.println("</script>");
			out.close();
		}

	// 아이디 찾기
	public String findId(HttpServletResponse response, String emp_email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String emp_id = dao.findId(emp_email);

		if (emp_id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return emp_id;
		}
	}

	// 비밀번호 찾기
	public void findPwd(
			HttpServletResponse response
			, Employee emp) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 아이디가 없으면
		if (dao.empIdcheck(emp.getEmp_id()) == 0) {
			out.print("아이디가 없습니다.");
			out.close();
		}
		
		// 가입에 사용한 이메일이 아니면
		else if (dao.findPwd(emp) == null) {
			out.print("잘못된 이메일 입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String emp_pwd = "";
			for (int i = 0; i < 12; i++) {
				emp_pwd += (char) ((Math.random() * 26) + 97);
			}
			emp.setEmp_pwd(emp_pwd);
			// 비밀번호 변경
			dao.updatePwd(emp);
			
			// 비밀번호 변경 메일 발송
			sendEmail(emp, "findPwd");

			out.print("입력하신 이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
	
	// 이메일 중복 검사(AJAX)
		public String empEmailcheck(String emp_email, HttpServletResponse response) throws Exception {
			String result = dao.empEmailcheck(emp_email);
			return result;
		}
	
		
	// 이메일 발송
		public void sendEmail(Employee emp, String div) throws Exception {
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com"; // 네이버 이용시 smtp.naver.com
			String hostSMTPid = "91desperado";
			String hostSMTPpwd = "c8980c8980d";

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "91desperado@naver.com";
			String fromName = "Grougle";
			String subject = "[Grougle]임시 비밀번호안내입니다.";
			String msg = "Grougle에서 보내는 메일입니다.";

			if(div.equals("join")) {
				
				// 회원가입 메일 내용
				subject = "Grougle 회원가입 인증 메일입니다.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += emp.getEmp_id() + "님 회원가입을 환영합니다.</h3>";
				msg += "<div style='font-size: 130%'>";
				msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
				msg += "<form method='POST' action='http://localhost:8090/grougle/employee/approvalEmp'>";
				msg += "<input type='hidden' name='emp_email' value='" + emp.getEmp_email() + "'>";
				msg += "<input type='hidden' name='emp_approval_key' value='" + emp.getEmp_approval_key() + "'>";
				msg += "<input type='submit' value='인증'></form><br/></div>";
				
			}else if(div.equals("findPwd")) {
				subject = "Grougle 임시 비밀번호 입니다.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += emp.getEmp_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
				msg += "<p>임시 비밀번호 : ";
				msg += emp.getEmp_pwd() + "</p></div>";
			}
			
			// 받는 사람 E-Mail 주소
			String mail = emp.getEmp_email();
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
		}
			
		// 회원 인증		
		public void approvalEmp(
				Employee emp
				, HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if (dao.approvalEmp(emp) == 0) { // 이메일 인증에 실패하였을 경우
				out.println("<script>");
				out.println("alert('잘못된 접근입니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			} else { // 이메일 인증을 성공하였을 경우
				out.println("<script>");
				out.println("alert('Grougle 가입인증이 완료되었습니다. 로그인 후 이용하세요.');");
				out.println("location.href='http://localhost:8090/grougle/employee/login';");
				out.println("</script>");
				out.close();
			}
		}
		
		// 회원정보 수정
		public Employee updateEmpPage(Employee emp) throws Exception {	
			dao.updateEmpPage(emp);
			return dao.empLogin(emp.getEmp_id());
		}
		
		// 비밀번호 변경
		public Employee updatePwd(
				@RequestParam("emp_pwd") String emp_pwd
				, Employee emp
				, HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if(!emp_pwd.equals(dao.empLogin(emp.getEmp_id()).getEmp_pwd())) {
				out.println("<script>");
				out.println("alert('사원정보 변경완료.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			}else {			
				dao.updatePwd(emp);
				return dao.empLogin(emp.getEmp_id());
			}
		}
}
