package kh.spring.grougle.board.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Component;


@Component
public class Board {
	
/*	WB_NO					NUMBER
	WB_TYPE					VARCHAR2(1 BYTE)
	WB_TITLE				VARCHAR2(60 BYTE)
	WB_CONTENT				VARCHAR2(3900 BYTE)
	WB_COUNT				NUMBER
	WB_WRITER				VARCHAR2(45 BYTE)
	WB_DATE					TIMESTAMP(6)
	WB_ORIGINAL_FILENAME	VARCHAR2(500 BYTE)
	WB_RENAME_FILENAME		VARCHAR2(500 BYTE)
	WB_LEVEL 				NUMBER DEFAULT 0, 		-- 글레벨 : 원글 0, 원글의 답글 1, 답글의답글 2
	WB_REF 					NUMBER, 				-- 원글일때는 자기번호, 답글일 때 참조하는 원글 번호
	WB_REPLY_REF 			NUMBER,					-- 원글일때는 0, 레벨이 1이면 자기번호, 레벨이 2이면 참조하는 답글번호
	WB_REPLY_SEQ 			NUMBER DEFAULT 0, 		-- 답글의 순번
	WB_COUNT 				NUMBER DEFAULT 0, 		-- 조회수*/
	
	
	private String wb_no;
	private String emp_no;
	private String wbf_no;
	private String wb_title;
	private String wb_writer;
	private String wb_content;
	private String wb_original_filename;	
	private String wb_rename_filename;	
	private Timestamp wb_date;
	private int wb_level;
	private int wb_ref;
	private int wb_reply_ref;
	private int wb_reply_seq;
	private int wb_count;	
	private int refnum;
	private int reCommentCnt;
	private List<BoardComment> reCommentList;
	public String getWb_no() {
		return wb_no;
	}
	public void setWb_no(String wb_no) {
		this.wb_no = wb_no;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getWbf_no() {
		return wbf_no;
	}
	public void setWbf_no(String wbf_no) {
		this.wbf_no = wbf_no;
	}
	public String getWb_title() {
		return wb_title;
	}
	public void setWb_title(String wb_title) {
		this.wb_title = wb_title;
	}
	public String getWb_writer() {
		return wb_writer;
	}
	public void setWb_writer(String wb_writer) {
		this.wb_writer = wb_writer;
	}
	public String getWb_content() {
		return wb_content;
	}
	public void setWb_content(String wb_content) {
		this.wb_content = wb_content;
	}
	public String getWb_original_filename() {
		return wb_original_filename;
	}
	public void setWb_original_filename(String wb_original_filename) {
		this.wb_original_filename = wb_original_filename;
	}
	public String getWb_rename_filename() {
		return wb_rename_filename;
	}
	public void setWb_rename_filename(String wb_rename_filename) {
		this.wb_rename_filename = wb_rename_filename;
	}
	public Timestamp getWb_date() {
		return wb_date;
	}
	public void setWb_date(Timestamp wb_date) {
		this.wb_date = wb_date;
	}
	public int getWb_level() {
		return wb_level;
	}
	public void setWb_level(int wb_level) {
		this.wb_level = wb_level;
	}
	public int getWb_ref() {
		return wb_ref;
	}
	public void setWb_ref(int wb_ref) {
		this.wb_ref = wb_ref;
	}
	public int getWb_reply_ref() {
		return wb_reply_ref;
	}
	public void setWb_reply_ref(int wb_reply_ref) {
		this.wb_reply_ref = wb_reply_ref;
	}
	public int getWb_reply_seq() {
		return wb_reply_seq;
	}
	public void setWb_reply_seq(int wb_reply_seq) {
		this.wb_reply_seq = wb_reply_seq;
	}
	public int getWb_count() {
		return wb_count;
	}
	public void setWb_count(int wb_count) {
		this.wb_count = wb_count;
	}
	public int getRefnum() {
		return refnum;
	}
	public void setRefnum(int refnum) {
		this.refnum = refnum;
	}
	public int getReCommentCnt() {
		return reCommentCnt;
	}
	public void setReCommentCnt(int reCommentCnt) {
		this.reCommentCnt = reCommentCnt;
	}
	public List<BoardComment> getReCommentList() {
		return reCommentList;
	}
	public void setReCommentList(List<BoardComment> reCommentList) {
		this.reCommentList = reCommentList;
	}
	
	
	@Override
	public String toString() {
		return "Board [wb_no=" + wb_no + ", emp_no=" + emp_no + ", wbf_no=" + wbf_no + ", wb_title=" + wb_title
				+ ", wb_writer=" + wb_writer + ", wb_content=" + wb_content + ", wb_original_filename="
				+ wb_original_filename + ", wb_rename_filename=" + wb_rename_filename + ", wb_date=" + wb_date
				+ ", wb_level=" + wb_level + ", wb_ref=" + wb_ref + ", wb_reply_ref=" + wb_reply_ref + ", wb_reply_seq="
				+ wb_reply_seq + ", wb_count=" + wb_count + ", refnum=" + refnum + ", reCommentCnt=" + reCommentCnt
				+ ", reCommentList=" + reCommentList + "]";
	}

	
}
