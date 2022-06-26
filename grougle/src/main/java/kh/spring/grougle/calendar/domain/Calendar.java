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
	private int scdNo;
	private String scdWriter;
	private Timestamp scdWriteDate;
	private Timestamp scdUpdateDate;
	private String scdType;
	private String scdName;
	private String scdDate;
	private String scdTime;
	private String scdContent;
	private String scdPlace;
	private int empNo;
	
	
	@Override
	public String toString() {
		return "Calendar [scdNo=" + scdNo + ", scdWriter=" + scdWriter + ", scdWriteDate=" + scdWriteDate
				+ ", scdUpdateDate=" + scdUpdateDate + ", scdType=" + scdType + ", scdName=" + scdName + ", scdDate="
				+ scdDate + ", scdTime=" + scdTime + ", scdContent=" + scdContent + ", scdPlace=" + scdPlace
				+ ", empNo=" + empNo + "]";
	}


	public int getScdNo() {
		return scdNo;
	}


	public void setScdNo(int scdNo) {
		this.scdNo = scdNo;
	}


	public String getScdWriter() {
		return scdWriter;
	}


	public void setScdWriter(String scdWriter) {
		this.scdWriter = scdWriter;
	}


	public Timestamp getScdWriteDate() {
		return scdWriteDate;
	}


	public void setScdWriteDate(Timestamp scdWriteDate) {
		this.scdWriteDate = scdWriteDate;
	}


	public Timestamp getScdUpdateDate() {
		return scdUpdateDate;
	}


	public void setScdUpdateDate(Timestamp scdUpdateDate) {
		this.scdUpdateDate = scdUpdateDate;
	}


	public String getScdType() {
		return scdType;
	}


	public void setScdType(String scdType) {
		this.scdType = scdType;
	}


	public String getScdName() {
		return scdName;
	}


	public void setScdName(String scdName) {
		this.scdName = scdName;
	}


	public String getScdDate() {
		return scdDate;
	}


	public void setScdDate(String scdDate) {
		this.scdDate = scdDate;
	}


	public String getScdTime() {
		return scdTime;
	}


	public void setScdTime(String scdTime) {
		this.scdTime = scdTime;
	}


	public String getScdContent() {
		return scdContent;
	}


	public void setScdContent(String scdContent) {
		this.scdContent = scdContent;
	}


	public String getScdPlace() {
		return scdPlace;
	}


	public void setScdPlace(String scdPlace) {
		this.scdPlace = scdPlace;
	}


	public int getEmpNo() {
		return empNo;
	}


	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	
	
	
	
	
}
