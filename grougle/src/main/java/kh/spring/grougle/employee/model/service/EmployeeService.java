package kh.spring.grougle.employee.model.service;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.grougle.employee.domain.Employee;
import kh.spring.grougle.employee.model.dao.EmployeeDao;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeDao dao;

	public int insertEmployee(Employee emp) {
		return dao.insertEmployee(emp);
	}

	public int empIdcheck(String emp_id) {
		int idCnt = dao.empIdcheck(emp_id);
		return idCnt;
	}
	//로그인
	public Employee empLogin(Employee emp) throws Exception {
		return dao.empLogin(emp);
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
	public void findPwd(HttpServletResponse response, Employee emp) throws Exception {
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
			send_mail(emp, "findPwd");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	// 이메일 발송
	public void send_mail(Employee emp, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "91desperado@naver.com";
		String hostSMTPpwd = "c8980c8980d";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "dnwls.KH@google.com";
		String fromName = "Grougle";
		String subject = "[Grougle]임시 비밀번호안내입니다.";
		String msg = "Grougle에서 보내는 메일입니다.";

		if (div.equals("findPwd")) {
			subject = "Spring Homepage 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += emp.getEmp_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += emp.getEmp_pwd() + "</p></div>";
		}

		/*// 받는 사람 E-Mail 주소
		String mail = emp.getEmp_email();
		try {
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
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}*/
		
		// email 전송
		String mail = emp.getEmp_email();
        try {
            HtmlEmail email = new HtmlEmail();
            email.setDebug(true);
            email.setCharset(charSet);
            email.setSSLOnConnect(true);     // SSL 사용 (TLS가 없는 경우 SSL 사용)
            email.setHostName(hostSMTP);
            email.setSmtpPort(465);          // SMTP 포트 번호

            email.setAuthentication(hostSMTPid, hostSMTPpwd);
            email.setStartTLSEnabled(true);  // TLS 사용
            email.addTo(mail, charSet);
            email.setFrom(fromEmail, fromName, charSet);
            email.setSubject(subject);
            email.setHtmlMsg(msg);
            email.send();
        } catch (Exception e) {
        	System.out.println("메일발송 실패 : " + e);
        }
    }

	public void keepLogin(String emp_id, String string, Date date) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

