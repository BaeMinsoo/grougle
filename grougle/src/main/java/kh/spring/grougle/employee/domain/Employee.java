package kh.spring.grougle.employee.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Employee {

	private int emp_no;
	private int dept_no;
	private int position_no;
	private String emp_id;
	private String emp_pwd;
	private String emp_original_filename;
	private String emp_name;
	private String emp_gender;
	private String emp_birth;
	private String emp_email;
	private String emp_tel;
	private String emp_postcode;
	private String emp_address;
	private String emp_detail_address;
	private Timestamp emp_write_date;
	private Timestamp emp_update_date;
	private Timestamp emp_out_date;
	private String emp_approval_key;
	private String emp_approval_status;
	private String position_name;
	private String dept_name;
	@Override
	public String toString() {
		return "Employee [emp_no=" + emp_no + ", dept_no=" + dept_no + ", position_no=" + position_no + ", emp_id="
				+ emp_id + ", emp_pwd=" + emp_pwd + ", emp_original_filename=" + emp_original_filename + ", emp_name="
				+ emp_name + ", emp_gender=" + emp_gender + ", emp_birth=" + emp_birth + ", emp_email=" + emp_email
				+ ", emp_tel=" + emp_tel + ", emp_postcode=" + emp_postcode + ", emp_address=" + emp_address
				+ ", emp_detail_address=" + emp_detail_address + ", emp_write_date=" + emp_write_date
				+ ", emp_update_date=" + emp_update_date + ", emp_out_date=" + emp_out_date + ", emp_approval_key="
				+ emp_approval_key + ", emp_approval_status=" + emp_approval_status + ", position_name=" + position_name
				+ ", dept_name=" + dept_name + "]";
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getPosition_no() {
		return position_no;
	}
	public void setPosition_no(int position_no) {
		this.position_no = position_no;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_pwd() {
		return emp_pwd;
	}
	public void setEmp_pwd(String emp_pwd) {
		this.emp_pwd = emp_pwd;
	}
	public String getEmp_original_filename() {
		return emp_original_filename;
	}
	public void setEmp_original_filename(String emp_original_filename) {
		this.emp_original_filename = emp_original_filename;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_gender() {
		return emp_gender;
	}
	public void setEmp_gender(String emp_gender) {
		this.emp_gender = emp_gender;
	}
	public String getEmp_birth() {
		return emp_birth;
	}
	public void setEmp_birth(String emp_birth) {
		this.emp_birth = emp_birth;
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
	public String getEmp_postcode() {
		return emp_postcode;
	}
	public void setEmp_postcode(String emp_postcode) {
		this.emp_postcode = emp_postcode;
	}
	public String getEmp_address() {
		return emp_address;
	}
	public void setEmp_address(String emp_address) {
		this.emp_address = emp_address;
	}
	public String getEmp_detail_address() {
		return emp_detail_address;
	}
	public void setEmp_detail_address(String emp_detail_address) {
		this.emp_detail_address = emp_detail_address;
	}
	public Timestamp getEmp_write_date() {
		return emp_write_date;
	}
	public void setEmp_write_date(Timestamp emp_write_date) {
		this.emp_write_date = emp_write_date;
	}
	public Timestamp getEmp_update_date() {
		return emp_update_date;
	}
	public void setEmp_update_date(Timestamp emp_update_date) {
		this.emp_update_date = emp_update_date;
	}
	public Timestamp getEmp_out_date() {
		return emp_out_date;
	}
	public void setEmp_out_date(Timestamp emp_out_date) {
		this.emp_out_date = emp_out_date;
	}
	public String getEmp_approval_key() {
		return emp_approval_key;
	}
	public void setEmp_approval_key(String emp_approval_key) {
		this.emp_approval_key = emp_approval_key;
	}
	public String getEmp_approval_status() {
		return emp_approval_status;
	}
	public void setEmp_approval_status(String emp_approval_status) {
		this.emp_approval_status = emp_approval_status;
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
	
	
	
			
}
