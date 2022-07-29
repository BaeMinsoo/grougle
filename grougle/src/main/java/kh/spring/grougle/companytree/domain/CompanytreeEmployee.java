package kh.spring.grougle.companytree.domain;

import org.springframework.stereotype.Component;

@Component
public class CompanytreeEmployee {
// 사용한 칼럼에 대해 앞에 * 표시
// table dept
//				DEPT_NO       NOT NULL NUMBER       
//				UPPER_DEPT_NO          NUMBER       
//				*DEPT_NAME     NOT NULL VARCHAR2(30)	
// table employee
//				EMP_NO                NOT NULL NUMBER        
//				DEPT_NO               NOT NULL NUMBER        
//				POSITION_NO           NOT NULL NUMBER        
//				EMP_ID                NOT NULL VARCHAR2(18)  
//				EMP_PWD               NOT NULL VARCHAR2(16)  
//				EMP_ORIGINAL_FILENAME          VARCHAR2(500) 
//				*EMP_NAME              NOT NULL VARCHAR2(20)  
//				EMP_GENDER                     VARCHAR2(1)   
//				EMP_BIRTH             NOT NULL VARCHAR2(20)  
//				*EMP_EMAIL             NOT NULL VARCHAR2(100) 
//				*EMP_TEL               NOT NULL VARCHAR2(20)  
//				EMP_POSTCODE          NOT NULL VARCHAR2(20)  
//				EMP_ADDRESS           NOT NULL VARCHAR2(100) 
//				EMP_DETAIL_ADDRESS    NOT NULL VARCHAR2(100) 
//				EMP_WRITE_DATE                 TIMESTAMP(6)  
//				EMP_UPDATE_DATE                TIMESTAMP(6)  
//				*EMP_OUT_DATE                   TIMESTAMP(6)  
//				EMP_RENAME_FILENAME            VARCHAR2(500)
// table org_position
//				POSITION_NO       NOT NULL NUMBER        
//				*POSITION_NAME     NOT NULL VARCHAR2(100) 
//				POSITION_LEVEL    NOT NULL VARCHAR2(100) 
//				UPPER_POSITION_NO          NUMBER
	
	private String dept_name;
	private String emp_name;
	private String emp_email;
	private String emp_tel;
	private String position_name;
	@Override
	public String toString() {
		return "CompanytreeEmployee [dept_name=" + dept_name + ", emp_name=" + emp_name + ", emp_email=" + emp_email
				+ ", emp_tel=" + emp_tel + ", position_name=" + position_name + "]";
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
		
}
