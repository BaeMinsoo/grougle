package kh.spring.grougle.companytree.domain;

import org.springframework.stereotype.Component;

@Component
public class CompanytreeEmployee2 {

	private String dept_name;
	private String emp_name;
	private int emp_no;
	private String emp_email;
	private String emp_tel;
	private String position_name;
	private String position_level;
	private int position_no;
	@Override
	public String toString() {
		return "CompanytreeEmployee2 [dept_name=" + dept_name + ", emp_name=" + emp_name + ", emp_no=" + emp_no
				+ ", emp_email=" + emp_email + ", emp_tel=" + emp_tel + ", position_name=" + position_name
				+ ", position_level=" + position_level + ", position_no=" + position_no + "]";
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public String getEmp_tel() {
		return emp_tel;
	}
	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}
	public String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	public String getPosition_level() {
		return position_level;
	}
	public void setPosition_level(String position_level) {
		this.position_level = position_level;
	}
	public int getPosition_no() {
		return position_no;
	}
	public void setPosition_no(int position_no) {
		this.position_no = position_no;
	}
	
}
