package kh.spring.grougle.eforml.domain;

import org.springframework.stereotype.Component;

@Component
public class Eform {
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
	
	private int forms_no;
	private String category_no;
	private String forms_title;
	private String forms_content;
	private String delete_yn;
	private int creator;
	private String create_date;
	private String category_name;
	private String emp_name;
	private String upper_category_no;
	@Override
	public String toString() {
		return "Eform [forms_no=" + forms_no + ", category_no=" + category_no + ", forms_title=" + forms_title
				+ ", forms_content=" + forms_content + ", delete_yn=" + delete_yn + ", creator=" + creator
				+ ", create_date=" + create_date + ", category_name=" + category_name + ", emp_name=" + emp_name
				+ ", upper_category_no=" + upper_category_no + "]";
	}
	public int getForms_no() {
		return forms_no;
	}
	public void setForms_no(int forms_no) {
		this.forms_no = forms_no;
	}
	public String getCategory_no() {
		return category_no;
	}
	public void setCategory_no(String category_no) {
		this.category_no = category_no;
	}
	public String getForms_title() {
		return forms_title;
	}
	public void setForms_title(String forms_title) {
		this.forms_title = forms_title;
	}
	public String getForms_content() {
		return forms_content;
	}
	public void setForms_content(String forms_content) {
		this.forms_content = forms_content;
	}
	public String getDelete_yn() {
		return delete_yn;
	}
	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getUpper_category_no() {
		return upper_category_no;
	}
	public void setUpper_category_no(String upper_category_no) {
		this.upper_category_no = upper_category_no;
	}
	
	
	
	
	
}
