package kh.spring.grougle.employee.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.grougle.employee.domain.Employee;
@Repository
public class EmployeeDao {

	@Autowired
	private SqlSession sqlsession;
	
	// 회원가입
	public int insertEmployee(Employee emp) {
		return sqlsession.insert("Employee.insertEmployee", emp);
	}

	// ID 중복체크
	public int empIdcheck(String emp_id) {
		 int idCount = sqlsession.selectOne("Employee.empIdcheck", emp_id);
		 return idCount;
	}
	
	// 이메일 중복 검사
		public int empEmailcheck(String emp_email) throws Exception{
			return sqlsession.selectOne("Employee.empEmailcheck", emp_email);
		}
	
	//로그인
	public Employee empLogin(Employee emp) throws Exception{
		return sqlsession.selectOne("Employee.empLogin", emp);
	}
	public Employee empLogin(String emp_id) {
		return sqlsession.selectOne("Employee.empLogin", emp_id);
	}	

	// 아이디 찾기
	public String findId(String emp_email) throws Exception{
		return sqlsession.selectOne("Employee.findId", emp_email);
	}
	
	// 비밀번호 변경
	@Transactional
	public int updatePwd(Employee emp) throws Exception{
		return sqlsession.update("Employee.updatePwd", emp);
	}
	
	// 비밀번호 찾기
	public Employee findPwd(Employee emp) {
		Employee ee = sqlsession.selectOne("Employee.findPwd", emp);
		return ee;
	}
	
	// 이메일 인증
		@Transactional
		public int approvalEmp(Employee emp) throws Exception{
			return sqlsession.update("Employee.approvalEmp", emp);
		}
	
	// 마이페이지
	@Transactional
	public int updateEmpPage(Employee emp) throws Exception{
		return sqlsession.update("Employee.updateEmpPage", emp);
	}

	
	
}
