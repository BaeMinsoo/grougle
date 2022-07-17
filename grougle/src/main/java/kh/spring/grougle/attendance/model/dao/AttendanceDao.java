package kh.spring.grougle.attendance.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.grougle.attendance.domain.Attendance;

@Repository
public class AttendanceDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public Attendance selectOffTime(String empNo) {		
		Attendance selectOffTime = (Attendance) sqlSession.selectOne("Attendance.selectOffTime", empNo);
		System.out.println("select att_OffTime:" + selectOffTime);
		return selectOffTime;
	}
	
	public Attendance selectWeekTime(String empNo) {
		return sqlSession.selectOne("Attendance.selectWeekTime", empNo);
	}

	public Attendance selectMonthTime(String empNo) {
		return sqlSession.selectOne("Attendance.selectMonthTime", empNo);
	}
	
}

