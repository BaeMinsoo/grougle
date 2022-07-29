package kh.spring.grougle.eforml.domain;

import org.springframework.stereotype.Component;

@Component
public class EformRe {
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
	private int creator;
	
	//forms_content(양식내용)
	private String forms_content;
	
	//양식분류 - 카테고리명, 카테고리번호
	private int category_no;

	@Override
	public String toString() {
		return "EformRe [forms_title=" + forms_title + ", creator=" + creator + ", forms_content=" + forms_content
				+ ", category_no=" + category_no + "]";
	}

	public String getForms_title() {
		return forms_title;
	}

	public void setForms_title(String forms_title) {
		this.forms_title = forms_title;
	}

	public int getCreator() {
		return creator;
	}

	public void setCreator(int creator) {
		this.creator = creator;
	}

	public String getForms_content() {
		return forms_content;
	}

	public void setForms_content(String forms_content) {
		this.forms_content = forms_content;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	
	
	
	
}
