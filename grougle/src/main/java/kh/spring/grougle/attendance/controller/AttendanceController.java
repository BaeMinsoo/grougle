package kh.spring.grougle.attendance.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.grougle.attendance.domain.Attendance;
import kh.spring.grougle.attendance.model.service.AttendanceService;
import kh.spring.grougle.employee.domain.Employee;

@Controller
public class AttendanceController {
	
	private static final Logger logger = LoggerFactory.getLogger(Attendance.class);
	
	@Autowired
	private AttendanceService service;
	
	/*
	 * @GetMapping("/attendance") 
	 * public ModelAndView attendance(ModelAndView mv) {
	 * mv.setViewName("attendance/attendance"); 
	 * return mv; }
	 */
	@RequestMapping("/attendance")
	public ModelAndView AttendanceMain(HttpSession session, HttpServletRequest request, ModelAndView mv) {
		
		// 세션에서 로그인정보 가져오기
		session = request.getSession();
		Employee empInfo = (Employee)session.getAttribute("loginSsInfo");
		String empNo = Integer.toString(empInfo.getEmp_no());
		logger.info("▶▶▶▶▶▶▶▶▶▶▶" + empInfo.getEmp_no());
		// empNo = "202202002";
		
		Attendance att = new Attendance();
		Attendance att1 = service.selectOffTime(empNo);
		System.out.println("사원번호:"+empNo);
		if(att1 != null) {

			//이번주 누적시간 구하기
			Attendance WeekTime = service.selectWeekTime(empNo);

			//이번달 누적시간 구하기
			Attendance MonthTime = service.selectMonthTime(empNo);
			
			
			mv.addObject("att1", att1);
			mv.addObject("WeekTime", WeekTime);
			mv.addObject("MonthTime", MonthTime);

			String totalT = WeekTime.getAttStrtotalTime();
			//주간 근무시간이 0일때 ::이 출력되서 ""으로 대체
			if(totalT.equals("::")) {
				WeekTime.setAttStrtotalTime("");
			}
			if(WeekTime.getAttStroverTime().equals("::")) {
				WeekTime.setAttStroverTime("");
			}
			// 월간 근무시간
			if(MonthTime.getAttStrtotalTime().equals("::")) {
				MonthTime.setAttStrtotalTime("");
			}
			if(MonthTime.getAttStroverTime().equals("::")) {
				MonthTime.setAttStroverTime("");
			}
			System.out.println("누적시간은? :"+ att1);
		}else if(att1 == null) {
			//이번주 누적시간 구하기
			Attendance WeekTime = service.selectWeekTime(empNo);

			//이번달 누적시간 구하기
			Attendance MonthTime = service.selectMonthTime(empNo);
			mv.addObject("att1", att1);	
		}
		mv.setViewName("attendance/attendance");
		return mv;
	}
	
	
	
	
	
	
}
