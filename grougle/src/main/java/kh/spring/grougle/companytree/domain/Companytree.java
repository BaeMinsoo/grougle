package kh.spring.grougle.companytree.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Companytree {
// 사용한 칼럼에 대해 앞에 * 표시
// table dept
//			*DEPT_NO       NOT NULL NUMBER       
//			*UPPER_DEPT_NO          NUMBER       
//			*DEPT_NAME     NOT NULL VARCHAR2(30)	

// table employee
//			*EMP_NO                NOT NULL NUMBER        
//			DEPT_NO               NOT NULL NUMBER        
//			POSITION_NO           NOT NULL NUMBER        
//			EMP_ID                NOT NULL VARCHAR2(18)  
//			EMP_PWD               NOT NULL VARCHAR2(16)  
//			EMP_ORIGINAL_FILENAME          VARCHAR2(500) 
//			*EMP_NAME              NOT NULL VARCHAR2(20)  
//			EMP_GENDER                     VARCHAR2(1)   
//			EMP_BIRTH             NOT NULL VARCHAR2(20)  
//			EMP_EMAIL             NOT NULL VARCHAR2(100) 
//			EMP_TEL               NOT NULL VARCHAR2(20)  
//			EMP_POSTCODE          NOT NULL VARCHAR2(20)  
//			EMP_ADDRESS           NOT NULL VARCHAR2(100) 
//			EMP_DETAIL_ADDRESS    NOT NULL VARCHAR2(100) 
//			EMP_WRITE_DATE                 TIMESTAMP(6)  
//			EMP_UPDATE_DATE                TIMESTAMP(6)  
//			EMP_OUT_DATE                   TIMESTAMP(6)  
//			EMP_RENAME_FILENAME            VARCHAR2(500)

// table org_position
//			*POSITION_NO       NOT NULL NUMBER        
//			*POSITION_NAME     NOT NULL VARCHAR2(100) 
//			*POSITION_LEVEL    NOT NULL VARCHAR2(100) 
//			*UPPER_POSITION_NO          NUMBER

	private String dept_no;
	private String upper_dept_no;
	private String dept_name;
	@Override
	public String toString() {
		return "Companytree [dept_no=" + dept_no + ", upper_dept_no=" + upper_dept_no + ", dept_name=" + dept_name
				+ "]";
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
	
	
}
