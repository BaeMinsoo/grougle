package kh.spring.grougle.calendar.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Calendar {
/*	CREATE TABLE `SCHEDULE_CALENDAR` (
			`SCD_NO`	NUMBER	NOT NULL	COMMENT 'SEQ_SCD_NO',
			`SCD_WRITER`	VARCHAR2(100)	NOT NULL,
			`SCD_WRITE_DATE`	TIMESTAMP	NOT NULL	DEFAULT SYSTIMESTAMP	COMMENT 'YYYY/MM/DD',
			`SCD_UPDATE_DATE`	TIMESTAMP	NULL	DEFAULT SYSTIMESTAMP	COMMENT 'YYYY/MM/DD',
			`SCD_TYPE`	VARCHAR2(1)	NOT NULL	COMMENT 'c : 기업,  p : 개인',
			`SCD_NAME`	VARCHAR2(100)	NOT NULL,
			`SCD_DATE`	VARCHAR2(40)	NOT NULL,
			`SCD_TIME`	VARCHAR2(40)	NOT NULL,
			`SCD_CONTENT`	VARCHAR2(4000)	NULL,
			`SCD_PLACE`	VARCHAR2(100)	NULL,
			`EMP_NO`	NUMBER	NOT NULL	COMMENT '년도4자리+부서번호2자리+가입순서 3자리(000~)'
		);*/
	private int scd_no;
	private String scd_writer;
	private Timestamp scd_writeDate;
	private Timestamp scd_updateDate;
	private String scd_type;
	private String scd_name;
	private String scd_date;
	private String scd_time;
	private String scd_content;
	private String scd_place;
	private int emp_no;
	
	
	@Override
	public String toString() {
		return "Calendar [scd_no=" + scd_no + ", scd_writer=" + scd_writer + ", scd_writeDate=" + scd_writeDate
				+ ", scd_updateDate=" + scd_updateDate + ", scd_type=" + scd_type + ", scd_name=" + scd_name
				+ ", scd_date=" + scd_date + ", scd_time=" + scd_time + ", scd_content=" + scd_content + ", scd_place="
				+ scd_place + ", emp_no=" + emp_no + "]";
	}


	public int getScd_no() {
		return scd_no;
	}


	public void setScd_no(int scd_no) {
		this.scd_no = scd_no;
	}


	public String getScd_writer() {
		return scd_writer;
	}


	public void setScd_writer(String scd_writer) {
		this.scd_writer = scd_writer;
	}


	public Timestamp getScd_writeDate() {
		return scd_writeDate;
	}


	public void setScd_writeDate(Timestamp scd_writeDate) {
		this.scd_writeDate = scd_writeDate;
	}


	public Timestamp getScd_updateDate() {
		return scd_updateDate;
	}


	public void setScd_updateDate(Timestamp scd_updateDate) {
		this.scd_updateDate = scd_updateDate;
	}


	public String getScd_type() {
		return scd_type;
	}


	public void setScd_type(String scd_type) {
		this.scd_type = scd_type;
	}


	public String getScd_name() {
		return scd_name;
	}


	public void setScd_name(String scd_name) {
		this.scd_name = scd_name;
	}


	public String getScd_date() {
		return scd_date;
	}


	public void setScd_date(String scd_date) {
		this.scd_date = scd_date;
	}


	public String getScd_time() {
		return scd_time;
	}


	public void setScd_time(String scd_time) {
		this.scd_time = scd_time;
	}


	public String getScd_content() {
		return scd_content;
	}


	public void setScd_content(String scd_content) {
		this.scd_content = scd_content;
	}


	public String getScd_place() {
		return scd_place;
	}


	public void setScd_place(String scd_place) {
		this.scd_place = scd_place;
	}


	public int getEmp_no() {
		return emp_no;
	}


	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

}
