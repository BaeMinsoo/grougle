package kh.spring.grougle.chat.domain;

import lombok.Data;

@Data
public class ChatMessage {
	private String ch_msgid;
	private String ch_msg;
	private String ch_time;
	private String rm_id;
	private int emp_no;
}
