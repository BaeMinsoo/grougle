package kh.spring.grougle.board.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Component;


@Component
public class BoardComment {
	
/*	WBC_NO			NUMBER
	WB_NO			NUMBER
	WBC_CONTENT		VARCHAR2(1024 BYTE)
	WBC_WRITER		VARCHAR2(45 BYTE)
	WBC_DATE		TIMESTAMP(6) */
	
	private String wbc_no;
	private String wb_no;
	private String wbc_content;
	private String wbc_writer;
	private Timestamp wbc_date;
	private int wbp;
	private int wbps;
	private int wbpl;
	private String wbgap;
	private String profile;
	
	
	public String getWbc_no() {
		return wbc_no;
	}
	public void setWbc_no(String wbc_no) {
		this.wbc_no = wbc_no;
	}
	public String getWb_no() {
		return wb_no;
	}
	public void setWb_no(String wb_no) {
		this.wb_no = wb_no;
	}
	public String getWbc_content() {
		return wbc_content;
	}
	public void setWbc_content(String wbc_content) {
		this.wbc_content = wbc_content;
	}
	public String getWbc_writer() {
		return wbc_writer;
	}
	public void setWbc_writer(String wbc_writer) {
		this.wbc_writer = wbc_writer;
	}
	public Timestamp getWbc_date() {
		return wbc_date;
	}
	public void setWbc_date(Timestamp wbc_date) {
		this.wbc_date = wbc_date;
	}	
	public int getWbp() {
		return wbp;
	}
	public void setWbp(int wbp) {
		this.wbp = wbp;
	}
	public int getWbps() {
		return wbps;
	}
	public void setWbps(int wbps) {
		this.wbps = wbps;
	}
	public int getWbpl() {
		return wbpl;
	}
	public void setWbpl(int wbpl) {
		this.wbpl = wbpl;
	}	
	public String getWbgap() {
		return wbgap;
	}
	public void setWbgap(String wbgap) {
		this.wbgap = wbgap;
	}	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	@Override
	public String toString() {
		return "BoardComment [wbc_no=" + wbc_no + ", wb_no=" + wb_no + ", wbc_content=" + wbc_content + ", wbc_writer="
				+ wbc_writer + ", wbc_date=" + wbc_date + ", wbp=" + wbp + ", wbps=" + wbps + ", wbpl=" + wbpl
				+ ", wbgap=" + wbgap + ", profile=" + profile + "]";
	}
}
