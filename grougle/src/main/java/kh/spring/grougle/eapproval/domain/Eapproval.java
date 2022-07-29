package kh.spring.grougle.eapproval.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Eapproval {
	
		private int draft_no;
		private String drafter_id;
		private String drafter_name;
		private String position_name;
		private String dept_name;
		private Date draft_date;
		private String draft_title;
		private String draft_content;
		private int draft_status;
		private Integer draft_first;
		private String draft_first_name;
		private String draft_first_position_name;
		private Integer draft_second;
		private String draft_second_name;
		private String draft_second_position_name;
		private Integer draft_third;
		private String draft_third_name;
		private String draft_third_position_name;
		private Integer draft_fourth;
		private String draft_fourth_name;
		private String draft_fourth_position_name;
		private Integer draft_fifth;
		private String draft_fifth_name;
		private String draft_fifth_position_name;
		private int approval_status;
		private int fastline_empno;
		private String open_yn;
		private int draft_version;
		private int final_approval;
		private Date first_date;
		private Date second_date;
		private Date third_date;
		private Date fourth_date;
		private Date fifth_date;
		private int category_no;
		private String category_name;
		private int reject_empno;
		private String reject_reason;
		private Integer emp_no;
		@Override
		public String toString() {
			return "Eapproval [draft_no=" + draft_no + ", drafter_id=" + drafter_id + ", drafter_name=" + drafter_name
					+ ", position_name=" + position_name + ", dept_name=" + dept_name + ", draft_date=" + draft_date
					+ ", draft_title=" + draft_title + ", draft_content=" + draft_content + ", draft_status="
					+ draft_status + ", draft_first=" + draft_first + ", draft_first_name=" + draft_first_name
					+ ", draft_first_position_name=" + draft_first_position_name + ", draft_second=" + draft_second
					+ ", draft_second_name=" + draft_second_name + ", draft_second_position_name="
					+ draft_second_position_name + ", draft_third=" + draft_third + ", draft_third_name="
					+ draft_third_name + ", draft_third_position_name=" + draft_third_position_name + ", draft_fourth="
					+ draft_fourth + ", draft_fourth_name=" + draft_fourth_name + ", draft_fourth_position_name="
					+ draft_fourth_position_name + ", draft_fifth=" + draft_fifth + ", draft_fifth_name="
					+ draft_fifth_name + ", draft_fifth_position_name=" + draft_fifth_position_name
					+ ", approval_status=" + approval_status + ", fastline_empno=" + fastline_empno + ", open_yn="
					+ open_yn + ", draft_version=" + draft_version + ", final_approval=" + final_approval
					+ ", first_date=" + first_date + ", second_date=" + second_date + ", third_date=" + third_date
					+ ", fourth_date=" + fourth_date + ", fifth_date=" + fifth_date + ", category_no=" + category_no
					+ ", category_name=" + category_name + ", reject_empno=" + reject_empno + ", reject_reason="
					+ reject_reason + ", emp_no=" + emp_no + "]";
		}
		public int getDraft_no() {
			return draft_no;
		}
		public void setDraft_no(int draft_no) {
			this.draft_no = draft_no;
		}
		public String getDrafter_id() {
			return drafter_id;
		}
		public void setDrafter_id(String drafter_id) {
			this.drafter_id = drafter_id;
		}
		public String getDrafter_name() {
			return drafter_name;
		}
		public void setDrafter_name(String drafter_name) {
			this.drafter_name = drafter_name;
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
		public Date getDraft_date() {
			return draft_date;
		}
		public void setDraft_date(Date draft_date) {
			this.draft_date = draft_date;
		}
		public String getDraft_title() {
			return draft_title;
		}
		public void setDraft_title(String draft_title) {
			this.draft_title = draft_title;
		}
		public String getDraft_content() {
			return draft_content;
		}
		public void setDraft_content(String draft_content) {
			this.draft_content = draft_content;
		}
		public int getDraft_status() {
			return draft_status;
		}
		public void setDraft_status(int draft_status) {
			this.draft_status = draft_status;
		}
		public Integer getDraft_first() {
			return draft_first;
		}
		public void setDraft_first(Integer draft_first) {
			this.draft_first = draft_first;
		}
		public String getDraft_first_name() {
			return draft_first_name;
		}
		public void setDraft_first_name(String draft_first_name) {
			this.draft_first_name = draft_first_name;
		}
		public String getDraft_first_position_name() {
			return draft_first_position_name;
		}
		public void setDraft_first_position_name(String draft_first_position_name) {
			this.draft_first_position_name = draft_first_position_name;
		}
		public Integer getDraft_second() {
			return draft_second;
		}
		public void setDraft_second(Integer draft_second) {
			this.draft_second = draft_second;
		}
		public String getDraft_second_name() {
			return draft_second_name;
		}
		public void setDraft_second_name(String draft_second_name) {
			this.draft_second_name = draft_second_name;
		}
		public String getDraft_second_position_name() {
			return draft_second_position_name;
		}
		public void setDraft_second_position_name(String draft_second_position_name) {
			this.draft_second_position_name = draft_second_position_name;
		}
		public Integer getDraft_third() {
			return draft_third;
		}
		public void setDraft_third(Integer draft_third) {
			this.draft_third = draft_third;
		}
		public String getDraft_third_name() {
			return draft_third_name;
		}
		public void setDraft_third_name(String draft_third_name) {
			this.draft_third_name = draft_third_name;
		}
		public String getDraft_third_position_name() {
			return draft_third_position_name;
		}
		public void setDraft_third_position_name(String draft_third_position_name) {
			this.draft_third_position_name = draft_third_position_name;
		}
		public Integer getDraft_fourth() {
			return draft_fourth;
		}
		public void setDraft_fourth(Integer draft_fourth) {
			this.draft_fourth = draft_fourth;
		}
		public String getDraft_fourth_name() {
			return draft_fourth_name;
		}
		public void setDraft_fourth_name(String draft_fourth_name) {
			this.draft_fourth_name = draft_fourth_name;
		}
		public String getDraft_fourth_position_name() {
			return draft_fourth_position_name;
		}
		public void setDraft_fourth_position_name(String draft_fourth_position_name) {
			this.draft_fourth_position_name = draft_fourth_position_name;
		}
		public Integer getDraft_fifth() {
			return draft_fifth;
		}
		public void setDraft_fifth(Integer draft_fifth) {
			this.draft_fifth = draft_fifth;
		}
		public String getDraft_fifth_name() {
			return draft_fifth_name;
		}
		public void setDraft_fifth_name(String draft_fifth_name) {
			this.draft_fifth_name = draft_fifth_name;
		}
		public String getDraft_fifth_position_name() {
			return draft_fifth_position_name;
		}
		public void setDraft_fifth_position_name(String draft_fifth_position_name) {
			this.draft_fifth_position_name = draft_fifth_position_name;
		}
		public int getApproval_status() {
			return approval_status;
		}
		public void setApproval_status(int approval_status) {
			this.approval_status = approval_status;
		}
		public int getFastline_empno() {
			return fastline_empno;
		}
		public void setFastline_empno(int fastline_empno) {
			this.fastline_empno = fastline_empno;
		}
		public String getOpen_yn() {
			return open_yn;
		}
		public void setOpen_yn(String open_yn) {
			this.open_yn = open_yn;
		}
		public int getDraft_version() {
			return draft_version;
		}
		public void setDraft_version(int draft_version) {
			this.draft_version = draft_version;
		}
		public int getFinal_approval() {
			return final_approval;
		}
		public void setFinal_approval(int final_approval) {
			this.final_approval = final_approval;
		}
		public Date getFirst_date() {
			return first_date;
		}
		public void setFirst_date(Date first_date) {
			this.first_date = first_date;
		}
		public Date getSecond_date() {
			return second_date;
		}
		public void setSecond_date(Date second_date) {
			this.second_date = second_date;
		}
		public Date getThird_date() {
			return third_date;
		}
		public void setThird_date(Date third_date) {
			this.third_date = third_date;
		}
		public Date getFourth_date() {
			return fourth_date;
		}
		public void setFourth_date(Date fourth_date) {
			this.fourth_date = fourth_date;
		}
		public Date getFifth_date() {
			return fifth_date;
		}
		public void setFifth_date(Date fifth_date) {
			this.fifth_date = fifth_date;
		}
		public int getCategory_no() {
			return category_no;
		}
		public void setCategory_no(int category_no) {
			this.category_no = category_no;
		}
		public String getCategory_name() {
			return category_name;
		}
		public void setCategory_name(String category_name) {
			this.category_name = category_name;
		}
		public int getReject_empno() {
			return reject_empno;
		}
		public void setReject_empno(int reject_empno) {
			this.reject_empno = reject_empno;
		}
		public String getReject_reason() {
			return reject_reason;
		}
		public void setReject_reason(String reject_reason) {
			this.reject_reason = reject_reason;
		}
		public Integer getEmp_no() {
			return emp_no;
		}
		public void setEmp_no(Integer emp_no) {
			this.emp_no = emp_no;
		}
		
		
		
		
		
		
		
		
}
