package kh.spring.grougle.chat.domain;

import lombok.Data;

@Data
public class ChatRoomJoin {
//	JN_ID  NOT NULL VARCHAR2(255) 
//	RM_ID  NOT NULL VARCHAR2(255) 
//	EMP_NO NOT NULL NUMBER
	private String jn_id;
	private String rm_id;
	private int emp_no;
}
