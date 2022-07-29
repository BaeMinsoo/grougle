package kh.spring.grougle.companytree.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Companytree2 {
// 사용한 칼럼에 대해 앞에 * 표시
// table dept
//			*DEPT_NO       NOT NULL NUMBER       
//			*UPPER_DEPT_NO          NUMBER       
//			*DEPT_NAME     NOT NULL VARCHAR2(30)	


	private String dept_no;
	private String upper_dept_no;
	private String dept_name;
	private String dept_name_new;
	@Override
	public String toString() {
		return "Companytree2 [dept_no=" + dept_no + ", upper_dept_no=" + upper_dept_no + ", dept_name=" + dept_name
				+ ", dept_name_new=" + dept_name_new + "]";
	}
	public String getDept_no() {
		return dept_no;
	}
	public void setDept_no(String dept_no) {
		this.dept_no = dept_no;
	}
	public String getUpper_dept_no() {
		return upper_dept_no;
	}
	public void setUpper_dept_no(String upper_dept_no) {
		this.upper_dept_no = upper_dept_no;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getDept_name_new() {
		return dept_name_new;
	}
	public void setDept_name_new(String dept_name_new) {
		this.dept_name_new = dept_name_new;
	}
	
}