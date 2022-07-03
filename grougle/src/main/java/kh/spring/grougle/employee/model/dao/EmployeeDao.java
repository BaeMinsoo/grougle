package kh.spring.grougle.employee.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.grougle.employee.domain.Employee;
@Repository
public class EmployeeDao {

	@Autowired
	private SqlSession sqlssesion;
	
	// 회원가입
	public int insertEmployee(Employee emp) {
		return sqlssesion.insert("Employee.insertEmployee", emp);
	}

	// ID 중복체크
	public int empIdcheck(String emp_id) {
		 int idCount = sqlssesion.selectOne("Employee.empIdcheck", emp_id);
		 return idCount;
	}
	
	//로그인
	public Employee empLogin(Employee emp) throws Exception{
		return sqlssesion.selectOne("Employee.empLogin", emp);
	}

	// 아이디 찾기
	public String findId(String emp_email) throws Exception{
		return sqlssesion.selectOne("Employee.findId", emp_email);
	}
	
	// 비밀번호 변경
	@Transactional
	public int updatePwd(Employee emp) throws Exception{
		return sqlssesion.update("Employee.updatePwd", emp);
	}

	public Employee findPwd(Employee emp) {
		Employee ee = sqlssesion.selectOne("Employee.findPwd", emp);
		System.out.println(ee);
		return ee;
	}
	
	
}
