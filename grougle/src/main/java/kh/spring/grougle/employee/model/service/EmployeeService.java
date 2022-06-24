package kh.spring.grougle.employee.model.service;

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
}
