package kh.spring.grougle.attendance.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import kh.spring.grougle.attendance.domain.Attendance;
import kh.spring.grougle.attendance.model.service.AttendanceService;
import kh.spring.grougle.employee.domain.Employee;


@Controller
public class AttendanceController {
	
	private static final Logger logger = LoggerFactory.getLogger(Attendance.class);
	
	@Autowired
	private AttendanceService service;
	
	@RequestMapping("attendance")
	public ModelAndView AttendanceMain(HttpSession session, HttpServletRequest request, ModelAndView mv) {
		
		// 세션에서 로그인정보 가져오기
		session = request.getSession();
		Employee empInfo = (Employee)session.getAttribute("loginSsInfo");
		int empNo = empInfo.getEmp_no();
		logger.info("▶▶▶▶▶▶▶▶▶▶▶" + empInfo.getEmp_no());
		// empNo = "202202002";
		
		Attendance att = new Attendance();
		Attendance att1 = service.selectOffTime(empNo);
		System.out.println("AttendanceMain 사원번호:"+empNo);
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
			System.out.println("AttendanceMain 누적시간은? :"+ att1);
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
	
	
	@RequestMapping("startTime")
	public ModelAndView insertStartTime(@RequestParam("nowTime") String nowTime,
			@RequestParam("day") Date day, 
			Attendance attendance,
			HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		response.setContentType("application/json; charset=UTF-8");
		
		session = request.getSession();
		Employee empInfo = (Employee)session.getAttribute("loginSsInfo");
		int empNo = empInfo.getEmp_no();
		String statusValue = "WK";
		attendance = new Attendance(0,empNo,statusValue,null,null,null,null,null);
		Attendance att = service.selectStartTime(empNo);
		if(att == null) {
			int result = service.insertStartTime(attendance);
		}
		// 로그인 정보 담아서 보내기..
		Attendance att1 = service.selectStartTime(empNo);
		System.out.println("insertStartTime 출근:" + att1);

		mv.addObject("att1", att1);
		mv.setViewName("redirect:/");
		
		Gson gson = new GsonBuilder().create();
		try {

			gson.toJson(att1, response.getWriter());
		} catch (JsonIOException | IOException e) {

			e.printStackTrace();
		}
		mv.setViewName("redirect:/");
		return mv;
	}
	
	
	@RequestMapping("selectStartTime")
	public ModelAndView selectStartTime(HttpSession session,HttpServletRequest request, ModelAndView mv) {
		session = request.getSession();
		Employee empInfo = (Employee)session.getAttribute("loginSsInfo");
		int empNo = empInfo.getEmp_no();
		
		Attendance att = service.selectStartTime(empNo);
		 
		 mv.addObject("att", att);
		 logger.debug("▶▶▶▶▶▶▶▶▶▶▶" + att);
		return mv;
	}
	
	@RequestMapping("updateStatus")
	  public void updateStatus(@RequestParam(value="statusValue", required=false) String statusValue,
			  				   @RequestParam("offTime") String offTime, 
			                   @RequestParam("off") Date off, 
			                   HttpSession session, 
			                   HttpServletResponse response, 
			                   HttpServletRequest request, 
			                   Attendance attendance, 
			                   ModelAndView mv) {
		  
		response.setContentType("application/json; charset=UTF-8");
		  
		  session = request.getSession();
		  Employee empInfo = (Employee)session.getAttribute("loginSsInfo");
		  int empNo = empInfo.getEmp_no();
		  
		  attendance = new Attendance(0,empNo,statusValue,null,null,null,null,null);
		  Attendance att1 = null;
		 
		  if(!statusValue.equals("업무상태선택")) {
			  //아이디 가져오기
			  int result = service.updateStatus(attendance);
			  att1 = service.selectOffTime(empNo);
			  //업무 종료를 클릭하면 현재시간이 퇴근시간으로  DB에 저장되게 함
			 if(statusValue.equals("EK")) {
				
				result = service.updateEndTime(attendance);
				/* att1 = updateStatus(mv, empNo); */
				
			 }
			 Gson gson = new GsonBuilder().create();

			try {
				//empStatus = new EmpStatus(0, null, null, null, null, null, id, null, null);
				// EmpStatus empStatus1 = esService.selectOffTime(id);
				 System.out.println("updateStatus 퇴근 :"+att1);

				 mv.addObject("att1", att1);
				gson.toJson(att1,response.getWriter());
			} catch (JsonIOException | IOException e) {
				
				e.printStackTrace();
			} 
		  
		  }
	  }
	
	
	public ModelAndView updateStatus(ModelAndView mv, int empNo) {
		Attendance att1 = service.selectOffTime(empNo);
		  long ti = att1.getAttEnd().getTime() - att1.getAttStart().getTime();	  
		  int tiSeconds = (int)(ti / 1000 % 60);
		  int tiMinutes = (int)(ti / (60 * 1000) % 60);
		  int tiHours = (int)(ti / (60 * 60 * 1000) % 24);
		  int tiDays = (int)(ti / (24 * 60 * 60 * 1000));
	      int tiHours2 = 0;
	      String gap = null;
	      String over = null;
	     // DateFormat df = new SimpleDateFormat("HH:mm:ss"); // HH=24h, hh=12h
	     
			  if(tiHours >= 9) {
				  tiHours = 9;
				  gap =  tiHours + ":" + tiMinutes + ":" + tiSeconds;
				  tiHours2 = tiHours - 1;
				  over = tiHours + ":" + tiMinutes + ":" + tiSeconds;
				  System.out.println("updateStatus 갭타임"+tiMinutes);
			  }else {
				  gap =  tiHours + ":" + tiMinutes + ":" + tiSeconds; 
			  }
		   Date gapTime = new Date(new GregorianCalendar(0, 0, 0, tiHours, tiMinutes, tiSeconds).getTimeInMillis());
		  Date overTime = new Date(new GregorianCalendar(0, 0, 0, tiHours2, tiMinutes, tiSeconds).getTimeInMillis());
		 
		  Attendance att = null;
			if(tiHours >= 9) {
				Timestamp gapTimeStamp = new Timestamp(gapTime.getTime()); 
				Timestamp overTimeStamp = new Timestamp(overTime.getTime()); 
				att = new Attendance(0, empNo, null, null, null, null, gapTimeStamp, overTimeStamp);
				System.out.println("--------");
				System.out.println(att);
				
			}else{
				Timestamp gapTimeStamp = new Timestamp(gapTime.getTime()); 
				
				att = new Attendance(0, empNo, null, null, null, null, gapTimeStamp, null); 
				System.out.println(att);
			}
			
		int result3 =  service.updateTotalTime(att);
		att1 = service.selectOffTime(empNo);
		System.out.println(" updateStatus 오프타임:"+att1);
		   
		  return mv;
	  }
	
	@RequestMapping("endTime") 
	  public ModelAndView updateEndTime(@ModelAttribute Attendance attendance, @RequestParam("endTime") String endTime, 
			                    @RequestParam("end") Date end, @RequestParam("status") String status, HttpSession session,
			                    HttpServletResponse response, HttpServletRequest request, ModelAndView mv) {
	  
	  response.setContentType("application/json; charset=UTF-8");
	  
	  session = request.getSession();
	  Employee empInfo = (Employee)session.getAttribute("loginSsInfo");
	  int empNo = empInfo.getEmp_no();
	  System.out.println("updateEndTime 업무상태:"+status);
	 
	  attendance = new Attendance(0, empNo, status, null, null,  null, null, null);

	  int result = service.updateEndTime(attendance);

	  Attendance att1 = service.selectOffTime(empNo);
	  long ti = att1.getAttEnd().getTime() - att1.getAttStart().getTime();	  
	  int tiSeconds = (int)(ti / 1000 % 60);
	  int tiMinutes = (int)(ti / (60 * 1000) % 60);
	  int tiHours = (int)(ti / (60 * 60 * 1000) % 24);
	  int tiDays = (int)(ti / (24 * 60 * 60 * 1000));
    int tiHours2 = 0;
    String gap = null;
    String over = null;
   
		  if(tiHours >= 9) {
			  tiHours = 9;
			  gap =  tiHours + ":" + tiMinutes + ":" + tiSeconds;
			  tiHours2 = tiHours - 1;
			  over = tiHours + ":" + tiMinutes + ":" + tiSeconds;
		  }else {
			  gap =  tiHours + ":" + tiMinutes + ":" + tiSeconds; 
		  }
	  Date gapTime = new Date(new GregorianCalendar(0, 0, 0, tiHours, tiMinutes, tiSeconds).getTimeInMillis());
	  Date overTime = new Date(new GregorianCalendar(0, 0, 0, tiHours2, tiMinutes, tiSeconds).getTimeInMillis());
	 
	  Attendance att = null;
		if(tiHours >= 9) {
			Timestamp totalTimeStamp = new Timestamp(gapTime.getTime()); 
			Timestamp overTimeStamp = new Timestamp(overTime.getTime()); 
			att = new Attendance(0, empNo, null, null, null, null, totalTimeStamp, overTimeStamp);
			
		}else{
			Timestamp totalTimeStamp = new Timestamp(gapTime.getTime()); 
			
			att = new Attendance(0, empNo, null, null, null, null, totalTimeStamp, null); 
			System.out.println("updateEndTime-att : "+att);
		}
		
	int result3 =  service.updateTotalTime(att);
	att1 = service.selectOffTime(empNo);

	  Gson gson = new GsonBuilder().create(); 
	  try { 
		  mv.addObject("att1", att1);
		  gson.toJson(att1,response.getWriter()); 
		  } catch (JsonIOException | IOException e) {
	  
			  e.printStackTrace();
		  }
	return mv;	  
	  }
	
	
}
