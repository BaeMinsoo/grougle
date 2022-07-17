package kh.spring.grougle.attendance.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class Attendance {
/* CREATE TABLE ATTENDANCE (
	ATT_NO	NUMBER	NOT NULL,--	COMMENT 'SEQ_ATT_NO'
	EMP_NO	NUMBER	NOT NULL,--	COMMENT '년도4자리+부서번호2자리+가입순서 3자리(000~)',
	ATT_STATUS	VARCHAR2(4)	NOT NULL CHECK (ATT_STATUS IN ('WK', 'EW', 'OJ', 'LE', 'DO')),--	COMMENT 'WK:업무중, OJ: 외근, LE: 조퇴, DO: 휴가(반차개념)',
	ATT_WORKINGDAY	DATE	NULL,
	ATT_START	TIMESTAMP	NOT NULL,--	COMMENT 'YYYY/MM/DD/HH:MI:SS',
	ATT_END	TIMESTAMP	NULL,--	COMMENT 'YYYY/MM/DD/HH:MI:SS',
	ATT_TOTALTIME	TIMESTAMP	NULL,--	COMMENT 'HH:MI:SS',
	ATT_STRTOTALTIME	VARCHAR2(40)	NULL,
	
	ATT_OVERTIME	TIMESTAMP	NULL,--	COMMENT 'HH:MI':SS,
	ATT_STROVERTIME	VARCHAR2(40)	NULL,
	ATT_LIMITTIME	VARCHAR2(40)	NOT NULL,--	COMMENT 'HH:MI:SS',
	ATT_WEEKNUM	NUMBER	NULL,
	ATT_MONTHOVER	VARCHAR2(40)	NULL,
	ATT_MONTHWORK	VARCHAR2(40)	NULL
);
*/
	private int attNo;
	private int empNo;
	private String attStatus;
	private Date attWorkingday;
	private Timestamp attStart;
	private Timestamp attEnd;
	private Timestamp attTotalTime;
	private String attStrtotalTime;
	private Timestamp attOverTime;;
	private String attStroverTime;
	private String attLimitTime;
	private int attWeekNum;
	private String attMonthOver;
	private String attMonthWork;
	
	
	public Attendance() {}
	
	
	public Attendance(int attNo, int empNo, String attStatus, Date attWorkingday, Timestamp attStart,
			Timestamp attEnd, Timestamp attTotalTime, Timestamp attOverTime) {
		super();
		this.attNo = attNo;
		this.empNo = empNo;
		this.attStatus = attStatus;
		this.attWorkingday = attWorkingday;
		this.attStart = attStart;
		this.attEnd = attEnd;
		this.attTotalTime = attTotalTime;
		this.attOverTime = attOverTime;
	}


	@Override
	public String toString() {
		return "Attendance [attNo=" + attNo + ", empNo=" + empNo + ", attStatus=" + attStatus + ", attWorkingday="
				+ attWorkingday + ", attStart=" + attStart + ", attEnd=" + attEnd + ", attTotalTime=" + attTotalTime
				+ ", attStrtotalTime=" + attStrtotalTime + ", attOverTime=" + attOverTime + ", attStroverTime="
				+ attStroverTime + ", attLimitTime=" + attLimitTime + ", attWeekNum=" + attWeekNum + ", attMonthOver="
				+ attMonthOver + ", attMonthWork=" + attMonthWork + "]";
	}


	public int getAttNo() {
		return attNo;
	}


	public void setAttNo(int attNo) {
		this.attNo = attNo;
	}


	public int getEmpNo() {
		return empNo;
	}


	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}


	public String getAttStatus() {
		return attStatus;
	}


	public void setAttStatus(String attStatus) {
		this.attStatus = attStatus;
	}


	public Date getAttWorkingday() {
		return attWorkingday;
	}


	public void setAttWorkingday(Date attWorkingday) {
		this.attWorkingday = attWorkingday;
	}


	public Timestamp getAttStart() {
		return attStart;
	}


	public void setAttStart(Timestamp attStart) {
		this.attStart = attStart;
	}


	public Timestamp getAttEnd() {
		return attEnd;
	}


	public void setAttEnd(Timestamp attEnd) {
		this.attEnd = attEnd;
	}


	public Timestamp getAttTotalTime() {
		return attTotalTime;
	}


	public void setAttTotalTime(Timestamp attTotalTime) {
		this.attTotalTime = attTotalTime;
	}


	public String getAttStrtotalTime() {
		return attStrtotalTime;
	}


	public void setAttStrtotalTime(String attStrtotalTime) {
		this.attStrtotalTime = attStrtotalTime;
	}


	public Timestamp getAttOverTime() {
		return attOverTime;
	}


	public void setAttOverTime(Timestamp attOverTime) {
		this.attOverTime = attOverTime;
	}


	public String getAttStroverTime() {
		return attStroverTime;
	}


	public void setAttStroverTime(String attStroverTime) {
		this.attStroverTime = attStroverTime;
	}


	public String getAttLimitTime() {
		return attLimitTime;
	}


	public void setAttLimitTime(String attLimitTime) {
		this.attLimitTime = attLimitTime;
	}


	public int getAttWeekNum() {
		return attWeekNum;
	}


	public void setAttWeekNum(int attWeekNum) {
		this.attWeekNum = attWeekNum;
	}


	public String getAttMonthOver() {
		return attMonthOver;
	}


	public void setAttMonthOver(String attMonthOver) {
		this.attMonthOver = attMonthOver;
	}


	public String getAttMonthWork() {
		return attMonthWork;
	}


	public void setAttMonthWork(String attMonthWork) {
		this.attMonthWork = attMonthWork;
	}
	
	
}
