package kh.spring.grougle.position.domain;

import org.springframework.stereotype.Component;


@Component
public class Position {
	private int position_no;
	private String position_name;
	private String level;
	private String upper_position;
	
	@Override
	public String toString() {
		return "Position [position_no=" + position_no + ", position_name=" + position_name + ", level=" + level
				+ ", upper_position=" + upper_position + "]";
	}

	public int getPosition_no() {
		return position_no;
	}

	public void setPosition_no(int position_no) {
		this.position_no = position_no;
	}

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getUpper_position() {
		return upper_position;
	}

	public void setUpper_position(String upper_position) {
		this.upper_position = upper_position;
	}
	
	
	
}
