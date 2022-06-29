package kh.spring.grougle.employee.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	
	
	
}
