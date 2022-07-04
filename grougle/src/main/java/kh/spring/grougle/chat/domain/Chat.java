package kh.spring.grougle.chat.domain;

import lombok.Data;

@Data
public class Chat {
//	private String msg_no;
//    private String mr_no;
//    private String msg_id;
//    private String msg_content;
//    private String msg_sdate;
//    private String msg_useyn;
//    private String msg_ddate;
	
//    CH_MSGID NOT NULL VARCHAR2(255) 
//    CH_MSG            VARCHAR2(255) 
//    CH_TIME           TIMESTAMP(6)  
//    RM_ID    NOT NULL VARCHAR2(255) 
//    EMP_NO   NOT NULL NUMBER  
	private String ch_msgid;
	private String ch_msg;
	private String ch_time;
	private String rm_id;
	private int emp_no;
}
