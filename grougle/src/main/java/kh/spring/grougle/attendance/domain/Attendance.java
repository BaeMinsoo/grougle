package kh.spring.grougle.attendance.domain;

import java.sql.Timestamp;

public class Attendance {
/* CREATE TABLE `ATTENDANCE` (
	`EMP_NO`	NUMBER	NOT NULL	COMMENT '년도4자리+부서번호2자리+가입순서 3자리(000~)',
	`ATT_STATUS`	VARCHAR2(4)	NOT NULL	COMMENT 'WK:업무중, OJ: 외근, LE: 조퇴, DO: 휴가(반차개념)',
	`ATT_START`	TIMESTAMP	NOT NULL	DEFAULT SYSTIMESTAMP	COMMENT 'YYYY/MM/DD/HH:MI:SS',
	`ATT_END`	TIMESTAMP	NOT NULL	DEFAULT SYSTIMESTAMP	COMMENT 'YYYY/MM/DD/HH:MI:SS',
	`ATT_TOTALTIME`	VARCHAR2(40)	NOT NULL	COMMENT 'HH:MI',
	`ATT_OVERTIME`	VARCHAR2(40)	NOT NULL	COMMENT 'HH:MI',
	`ATT_LIMITTIME`	VARCHAR2(40)	NOT NULL	COMMENT 'HH:MI',
	`DO_NO`	NUMBER	NOT NULL	COMMENT 'SEQ_DO_NO'
);
*/
	private int emp_no;
	private String att_status;
	private Timestamp att_start;
	private Timestamp att_end;
	private String att_totaltime;
	private String att_overtime;
	private String att_limittime;
	private int do_no;
	
	
	@Override
	public String toString() {
		return "Attendance [emp_no=" + emp_no + ", att_status=" + att_status + ", att_start=" + att_start + ", att_end="
				+ att_end + ", att_totaltime=" + att_totaltime + ", att_overtime=" + att_overtime + ", att_limittime="
				+ att_limittime + ", do_no=" + do_no + "]";
	}


	public int getEmp_no() {
		return emp_no;
	}


	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}


	public String getAtt_status() {
		return att_status;
	}


	public void setAtt_status(String att_status) {
		this.att_status = att_status;
	}


	public Timestamp getAtt_start() {
		return att_start;
	}


	public void setAtt_start(Timestamp att_start) {
		this.att_start = att_start;
	}


	public Timestamp getAtt_end() {
		return att_end;
	}


	public void setAtt_end(Timestamp att_end) {
		this.att_end = att_end;
	}


	public String getAtt_totaltime() {
		return att_totaltime;
	}


	public void setAtt_totaltime(String att_totaltime) {
		this.att_totaltime = att_totaltime;
	}


	public String getAtt_overtime() {
		return att_overtime;
	}


	public void setAtt_overtime(String att_overtime) {
		this.att_overtime = att_overtime;
	}


	public String getAtt_limittime() {
		return att_limittime;
	}


	public void setAtt_limittime(String att_limittime) {
		this.att_limittime = att_limittime;
	}


	public int getDo_no() {
		return do_no;
	}


	public void setDo_no(int do_no) {
		this.do_no = do_no;
	}
	
	
	
}
