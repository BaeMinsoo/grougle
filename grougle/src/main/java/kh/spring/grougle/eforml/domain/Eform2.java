package kh.spring.grougle.eforml.domain;

import org.springframework.stereotype.Component;

@Component
public class Eform2 {
//	***Table E_FORMS
//	FORMS_NO      NOT NULL NUMBER        
//	CATEGORY_NO   NOT NULL VARCHAR2(100) 
//	FORMS_TITLE   NOT NULL VARCHAR2(500) 
//	FORMS_CONTENT          CLOB          
//	DELETE_YN              VARCHAR2(100) 
//	CREATOR                NUMBER        
//	CREATE_DATE            TIMESTAMP(6)  

//	Table FORMS_CATEGORY
//	CATEGORY_NO       NOT NULL VARCHAR2(100) 
//	***CATEGORY_NAME     NOT NULL VARCHAR2(100) 
//	***UPPER_CATEGORY_NO NOT NULL VARCHAR2(100)
	
//	Table FORMS_HISTORY
//	FORMS_NO      NOT NULL NUMBER        
//	VERSION_NO             NUMBER        
//	CATEGORY_NO   NOT NULL VARCHAR2(100) 
//	FORMS_TITLE            VARCHAR2(500) 
//	FORMS_CONTENT          CLOB          
//	REVISER                NUMBER        
//	REVISION_DATE          TIMESTAMP(6)  
	
	//양식제목
	private String forms_title;
	//작성자이름, 직급명, 부서명, 작성자사번, 직급번호, 부서번호
	private String emp_name;
	private String position_name;
	private String dept_name;
	private int creator;
	private int position_no;
	private int dept_no;
	
	//forms_content(양식내용)
	private String forms_content;
	
	//양식분류 - 카테고리명, 카테고리번호
	private String category_name;
	private int category_no;
	
	//결재선 - 1차~5차 결재자 이름, 직급명, 이메일주소
	private String first_approval_name;
	private String first_approval_input_position_name;
	private String first_approval_input_email;
	private String second_approval_name;
	private String second_approval_input_position_name;
	private String second_approval_input_email;
	private String third_approval_name;
	private String third_approval_input_position_name;
	private String third_approval_input_email;
	private String fourth_approval_name;
	private String fourth_approval_input_position_name;
	private String fourth_approval_input_email;
	private String fifth_approval_name;
	private String fifth_approval_input_position_name;
	private String fifth_approval_input_email;
	@Override
	public String toString() {
		return "Eform2 [forms_title=" + forms_title + ", emp_name=" + emp_name + ", position_name=" + position_name
				+ ", dept_name=" + dept_name + ", creator=" + creator + ", position_no=" + position_no + ", dept_no="
				+ dept_no + ", forms_content=" + forms_content + ", category_name=" + category_name + ", category_no="
				+ category_no + ", first_approval_name=" + first_approval_name + ", first_approval_input_position_name="
				+ first_approval_input_position_name + ", first_approval_input_email=" + first_approval_input_email
				+ ", second_approval_name=" + second_approval_name + ", second_approval_input_position_name="
				+ second_approval_input_position_name + ", second_approval_input_email=" + second_approval_input_email
				+ ", third_approval_name=" + third_approval_name + ", third_approval_input_position_name="
				+ third_approval_input_position_name + ", third_approval_input_email=" + third_approval_input_email
				+ ", fourth_approval_name=" + fourth_approval_name + ", fourth_approval_input_position_name="
				+ fourth_approval_input_position_name + ", fourth_approval_input_email=" + fourth_approval_input_email
				+ ", fifth_approval_name=" + fifth_approval_name + ", fifth_approval_input_position_name="
				+ fifth_approval_input_position_name + ", fifth_approval_input_email=" + fifth_approval_input_email
				+ "]";
	}
	public String getForms_title() {
		return forms_title;
	}
	public void setForms_title(String forms_title) {
		this.forms_title = forms_title;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public int getPosition_no() {
		return position_no;
	}
	public void setPosition_no(int position_no) {
		this.position_no = position_no;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public String getForms_content() {
		return forms_content;
	}
	public void setForms_content(String forms_content) {
		this.forms_content = forms_content;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public String getFirst_approval_name() {
		return first_approval_name;
	}
	public void setFirst_approval_name(String first_approval_name) {
		this.first_approval_name = first_approval_name;
	}
	public String getFirst_approval_input_position_name() {
		return first_approval_input_position_name;
	}
	public void setFirst_approval_input_position_name(String first_approval_input_position_name) {
		this.first_approval_input_position_name = first_approval_input_position_name;
	}
	public String getFirst_approval_input_email() {
		return first_approval_input_email;
	}
	public void setFirst_approval_input_email(String first_approval_input_email) {
		this.first_approval_input_email = first_approval_input_email;
	}
	public String getSecond_approval_name() {
		return second_approval_name;
	}
	public void setSecond_approval_name(String second_approval_name) {
		this.second_approval_name = second_approval_name;
	}
	public String getSecond_approval_input_position_name() {
		return second_approval_input_position_name;
	}
	public void setSecond_approval_input_position_name(String second_approval_input_position_name) {
		this.second_approval_input_position_name = second_approval_input_position_name;
	}
	public String getSecond_approval_input_email() {
		return second_approval_input_email;
	}
	public void setSecond_approval_input_email(String second_approval_input_email) {
		this.second_approval_input_email = second_approval_input_email;
	}
	public String getThird_approval_name() {
		return third_approval_name;
	}
	public void setThird_approval_name(String third_approval_name) {
		this.third_approval_name = third_approval_name;
	}
	public String getThird_approval_input_position_name() {
		return third_approval_input_position_name;
	}
	public void setThird_approval_input_position_name(String third_approval_input_position_name) {
		this.third_approval_input_position_name = third_approval_input_position_name;
	}
	public String getThird_approval_input_email() {
		return third_approval_input_email;
	}
	public void setThird_approval_input_email(String third_approval_input_email) {
		this.third_approval_input_email = third_approval_input_email;
	}
	public String getFourth_approval_name() {
		return fourth_approval_name;
	}
	public void setFourth_approval_name(String fourth_approval_name) {
		this.fourth_approval_name = fourth_approval_name;
	}
	public String getFourth_approval_input_position_name() {
		return fourth_approval_input_position_name;
	}
	public void setFourth_approval_input_position_name(String fourth_approval_input_position_name) {
		this.fourth_approval_input_position_name = fourth_approval_input_position_name;
	}
	public String getFourth_approval_input_email() {
		return fourth_approval_input_email;
	}
	public void setFourth_approval_input_email(String fourth_approval_input_email) {
		this.fourth_approval_input_email = fourth_approval_input_email;
	}
	public String getFifth_approval_name() {
		return fifth_approval_name;
	}
	public void setFifth_approval_name(String fifth_approval_name) {
		this.fifth_approval_name = fifth_approval_name;
	}
	public String getFifth_approval_input_position_name() {
		return fifth_approval_input_position_name;
	}
	public void setFifth_approval_input_position_name(String fifth_approval_input_position_name) {
		this.fifth_approval_input_position_name = fifth_approval_input_position_name;
	}
	public String getFifth_approval_input_email() {
		return fifth_approval_input_email;
	}
	public void setFifth_approval_input_email(String fifth_approval_input_email) {
		this.fifth_approval_input_email = fifth_approval_input_email;
	}
	
	
}
