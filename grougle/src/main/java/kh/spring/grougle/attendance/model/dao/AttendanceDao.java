package kh.spring.grougle.attendance.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.grougle.attendance.domain.Attendance;

@Repository
public class AttendanceDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Attendance selectOffTime(int empNo) {		
		Attendance selectOffTime = (Attendance) sqlSession.selectOne("Attendance.selectOffTime", empNo);
		System.out.println("select att_OffTime:" + selectOffTime);
		return selectOffTime;
	}
	
	public Attendance selectWeekTime(int empNo) {
		return sqlSession.selectOne("Attendance.selectWeekTime", empNo);
	}

	public Attendance selectMonthTime(int empNo) {
		return sqlSession.selectOne("Attendance.selectMonthTime", empNo);
	}
	
	public int insertStartTime(Attendance attendance) {
		System.out.println("dao");
		int result = sqlSession.insert("Attendance.insertStartTime", attendance);
		System.out.println(result);
		return result;
	}
	
	public Attendance selectStartTime(int empNo) {
		//매개변수 2개짜리로 하기
		return sqlSession.selectOne("Attendance.selectStartTime", empNo);
	}
	
	public int updateStatus(Attendance attendance) {
		int result = sqlSession.update("Attendance.updateStatus", attendance);
		System.out.println(result);
		return result;
	}
	
	public int updateEndTime(Attendance attendance) {
		
		return sqlSession.update("Attendance.updateOffTime", attendance);
	}

	public int updateTotalTime(Attendance att) {
		
		return sqlSession.update("Attendance.updateTotalTime", att);
	}
	
}

