<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<% Date nowTime = new Date();
	SimpleDateFormat today = new SimpleDateFormat("yyyy년 MM월 dd일");
	SimpleDateFormat time = new SimpleDateFormat("a hh시 mm분 ss초");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.spring.grougle.attendance.domain.Attendance"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	Attendance att1 = (Attendance)session.getAttribute("att1");
	Attendance attEnd = (Attendance)session.getAttribute("attEnd");
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>근태관리</title>
<!-- 헤더&사이드바 -->
<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/vendors/styles/core.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/src/plugins/datatables/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/vendors/styles/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/chat/chat.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/attendance/att.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/attendance/pg-calendar/css/pignose.calendar.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/attendance/pg-calendar/js/pignose.calendar.min.js">

<!-- js -->
<script src="<%=request.getContextPath()%>/resources/vendors/scripts/core.js"></script>
<script	src="<%=request.getContextPath()%>/resources/vendors/scripts/script.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/vendors/scripts/process.js"></script>
<script	src="<%=request.getContextPath()%>/resources/vendors/scripts/layout-settings.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/chat-sidebar.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-119386393-1');
</script>
</head>

<body>
	<form action="<%=request.getContextPath()%>/attendance" method="post"></form>
	<!-- 헤더&사이드바 -->
	<%@ include file="../header/header.jsp"%>
	<%@ include file="../sidebar/rightsidebar.jsp"%>
	<%@ include file="../sidebar/leftsidebar.jsp"%>
	<!-- 배치를 위한 div 기본틀 -->
	<div class="mobile-menu-overlay"></div>
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
		<!-- -------------------- -->
			<div id="main-wrapper">
				<c:set var="today" value="<%=new java.util.Date()%>" />
				<div class="content-body">
					<div class="container-fluid">
						<div class="col-xl-12 col-xxl-6 col-lg-6 col-md-12">
							<div class="row">
							
							</div>
						</div>

						<!-- 출퇴근시간 영역 -->
						<div class="row">

							<div class="col-lg-3">
								<div class="card">
									<div class="card-body" id="nowDateDiv">
										<div id="nowDateArea">
											<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd(E)" /></c:set>
											<c:out value="${date}" />
											<div id="clock"></div>
											<%-- <div>
												<h5><%=today.format(nowTime)%></h5>
												<h7><%=time.format(nowTime)%></h7>
											</div> --%>
										</div>
										<ul style="color: black; margin-top: 30px;">
											<li> 출근시간 
												<c:choose>
													<c:when test="${requestScope.att1 != null }">
														<input id="workInTime" name="workInTime" value="${requestScope.att1.getAttStart()}">
													</c:when>
													<c:otherwise>
														<input id="workInTime" name="workInTime">
													</c:otherwise>
												</c:choose>
											</li>
											<li>퇴근시간 <c:choose>
													<c:when test="${requestScope.att1 != null }">
														<input id="workOutTime" name="workOutTime" value="${requestScope.att1.getAttEnd()}">
													</c:when>
													<c:otherwise>
														<input id="workOutTime" name="workOutTime">
													</c:otherwise>
												</c:choose>

											</li>
										</ul>
										<div class="basic-dropdown">
											<div class="dropdown"> 업무상태 변경 :
											<!-- c:choose 안에 주석은 오류 발생시킴! -->
												<c:choose>
													<c:when test="${att1.getAttStatus() eq 'EW'}"> 
													<!-- 업무종료 선택시 비활성화 -->
														<select id="changeStatus" disabled="disabled">
															<option value="업무상태선택">업무상태선택</option>
															<option value="WK">업무중</option>
															<option value="EW" selected="selected">업무종료</option>
															<option value="OJ">외근</option>
															<option value="LE">조퇴</option>
															<option value="DO">반차</option>
														</select>
													</c:when>
													<c:otherwise>
														<select id="changeStatus">
															<option value="업무상태선택">업무상태선택</option>
															<option value="WK" <c:if test="${att1.getAttStatus() eq 'WK'}">selected</c:if>>업무중</option>
															<option value="EW" <c:if test="${att1.getAttStatus() eq 'EW'}">selected</c:if>>업무종료</option>
															<option value="OJ" <c:if test="${att1.getAttStatus() eq 'OJ'}">selected</c:if>>외근</option>
															<option value="LE" <c:if test="${att1.getAttStatus() eq 'LE'}">selected</c:if>>조퇴</option>
															<option value="DO" <c:if test="${att1.getAttStatus() eq 'DO'}">selected</c:if>>반차</option>
														</select>
													</c:otherwise>
												</c:choose>
                                    		</div>
                                		</div>
										<!-- 출퇴근 버튼 (function 사용)-->
										<c:choose>
											<c:when test="${ requestScope.att1.attStart != null && !empty requestScope.att1 }"> 
			                            		<!-- 이미 출근 버튼 눌렀을때 출근 버튼 비활성화 -->
			                            		<input type="button" id="wkStartBtn" value="출근" class="afterPush" onclick="startTime();" disabled="disabled">
			                            	</c:when>	
			                            	<c:otherwise>
			                            		<input type="button" id="wkStartBtn" value="출근" class="beforePush" onclick="startTime();">
			                            	</c:otherwise>
		                       			</c:choose>	
		                       			<c:choose>
											<c:when test="${ requestScope.att1.getAttEnd() != null && !empty requestScope.att1}"> 
												<!-- 이미 퇴근 버튼 눌렀을때 퇴근 버튼 비활성화 -->
			                            		<input type="button" id="wkEndBtn" value="퇴근" class="afterPush" disabled="disabled">
			                            	</c:when>
			                            	<c:when test="${ requestScope.att1.attStart == null }"> 
			                            		<!-- 출근 버튼 클릭전까진 비활성화 -->
			                            		<input type="button" id="wkEndBtn" value="퇴근" class="afterPush" onclick="endTime();" disabled="disabled">
			                            	</c:when>
			                            	<c:otherwise>
			                            		<input type="button" id="wkEndBtn" class="beforePush" onclick="endTime();" value="퇴근">
			                            	</c:otherwise>		
			                            </c:choose>		
                            		</div>
		                        </div>
		                    </div>
            
                    <!-- 일일 근태현황영역 -->
                    <div class="col-lg-9">
                        <div class="card">
                            <div class="card-header">
	                                <span id="empTitle" class="card-title">일일 근태현황</span>	                   					
                            </div>                        		                   
                            <div class="card-body">
                                <div class="table-responsive">
                                	<table id="WorkTable" class="table table-responsive-sm" style="color: black; text-align: center;">                              
                                        <thead>
                                            <tr>
                                                <th>
                                                	<div id="dailyDateArea">
					                                	<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd(E)" /></c:set>
														 <c:out value="${date}" />
														 <div id="clock"></div>
													</div>
												</th>
                                            </tr>
                                        </thead>
                                        <tbody style="color:black;">
                                            <tr>
                                                <td>
													업무시간
                                                </td> 
                                                <td>
													초과근무시간
                                                </td>                                               
                                            </tr>
                                            <tr>
                                            <!-- function workingTime -->
                                            <c:choose>
                                            	<c:when test="${requestScope.att1.getAttStatus() eq 'EW' && requestScope.att1.getAttEnd() ne null}">                                           		                                            			
			                                           <td style="height: 90px;" id="workingTime">
			                                                	${ requestScope.att1.getAttStrtotalTime }
			                                           </td>
			                                       <c:choose>
			                                            <c:when test="${requestScope.att1.getAttOverTime() ne null}">
			                                                <td id="overTime">
																 ${ requestScope.att1.getAttStroverTime }
			                                                </td>
			                                            </c:when>
			                                            <c:otherwise>
			                                            	<td id="overTime">
																 
			                                                </td>
			                                            </c:otherwise> 
		                                            </c:choose>
	                                            </c:when>
	                                            <c:otherwise>
		                                            	<td style="height: 90px;" id="workingTime1">
																	
				                                        </td>
				                                        <td id="overTime">
																	 
				                                        </td>
	                                            </c:otherwise>
                                            </c:choose>                                                  
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12 col-xxl-6 col-lg-6 col-md-12">
                	<div class="row">
                    </div>
                </div>
            </div>
                 <div class="row">
                 <div class="col-lg-3"></div>
                     <div class="col-lg-9">
                        <div class="card">
                            <div class="card-header">
                                <span id="totalTitle" class="card-title">누적 근태현황</span>
                            </div>
                            
                            <div class="card-body">
                                <div class="table-responsive">
                                <table id="totalWorkTime" class="table table-responsive-sm" style="color: black; text-align: center;">                              
                                        <thead>                                        
                                            <tr>
                                                <th>
													이번 주 업무시간
                                                </th> 
                                                <th> 
													이번 주 초과근무시간
                                                </th>  
                                                <th>
													이번 달 업무시간
                                                </th> 
                                                <th>
													이번 달 초과근무시간
                                                </th>                                                
                                            </tr>
                                       </thead>
                                       <tbody>
                                            <tr>
                                          <c:choose>
                                            	<c:when test="${WeekTime.attStrtotalTime ne '::' || WeekTime.attStrtotalTime ne null}">
	                                                <td style="height: 90px; font-size:25px;">
														${WeekTime.attStrtotalTime}
	                                                </td>
	                                            </c:when>
	                                            <c:otherwise>
	                                            	<td style="height: 90px;">
														-
	                                                </td>
	                                            </c:otherwise>
                                            </c:choose> 
                                            <c:choose>
                                            	<c:when test="${WeekTime.attStroverTime ne '::' || WeekTime.attStroverTime ne null}">
	                                                <td style="height: 90px; font-size:25px;">
														${WeekTime.attStroverTime}
	                                                </td>
	                                            </c:when>
	                                            <c:otherwise>
	                                            	<td>
	                                            	-
	                                                </td>
	                                            </c:otherwise>
                                            </c:choose> 
                                                 <td style="height: 90px; font-size:25px;" >
													${MonthTime.attStrtotalTime}
                                                </td> 
                                                <td style="height: 90px; font-size:25px;">
													${MonthTime.attStroverTime}
                                                </td>                                                                                               
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!--  -->
                    <div class="col-lg-3"></div>
                    <div class="col-lg-9">
                        <div class="card">
                            <div class="card-header">
	                        	<span id="empTitle" class="card-title">누적 근태현황</span>	                   					
                            </div>                        		                   
                            
						<div class="sec_cal">
							  <div class="cal_nav">
							    <a href="javascript:;" class="nav-btn go-prev">prev</a>
							    <div class="year-month" style="color:black;"></div>
							    <a href="javascript:;" class="nav-btn go-next">next</a>
							  </div>
						<div style="display:none;">
							  <div class="cal_wrap">
							    <div class="days">
							      <div class="day">MON</div>
							      <div class="day">TUE</div>
							      <div class="day">WED</div>
							      <div class="day">THU</div>
							      <div class="day">FRI</div>
							      <div class="day">SAT</div>
							      <div class="day">SUN</div>
							    </div>
							    <div class="dates"></div>
							  </div>
						</div>	  	  
						</div>		
							<div class="card">
				                <div class="card-body">
				                	<table id="monthWortkTime" class="table table-responsive-sm" style= "text-align: center;">
                                   		<thead>	
			                        <!-- 한달 총 근무시간 나타내기 -->						  		  
							                <tr>							                  
							                   <td>근무시간</td>
							                   <td>초과시간</td>
							               </tr>
							            </thead>
							            <tbody></tbody>        
			         				 </table> 
			                         <div class="card-block accordion-block" id="accodianA">
						                 <div id="accordion" role="tablist" aria-multiselectable="true">
								                       
						                  </div>
			                         </div>
			                   </div>
			             </div>
                    </div>
           		</div>
   
            </div>
        </div>
					<!-- ----------------------------- -->
				</div>
			</div>
		</div>
	</div>
	<script>
	//현재시간 출력
	function printTime() {
	
		var clock = document.getElementById("clock");// 출력할 장소 선택
	    var now = new Date();// 현재시간
	    var nowTime =  now.getHours() + "시" + now.getMinutes() + "분" + now.getSeconds() + "초";
	
	    clock.innerHTML = nowTime;// 현재시간을 출력
	    
	    setTimeout("printTime()",1000); // setTimeout(“실행할함수”,시간) 시간은1초의 경우 1000
	}
	
	window.onload = function() { // 페이지가 로딩되면 실행
    	printTime();
    	workTime();
	}
	
	//출근시간 출력
	var onClock = document.getElementById("workInTime");// 출력할 장소 선택
	var now = new Date();
	var nowTime =  now.getHours() + "시" + now.getMinutes() + "분" + now.getSeconds() + "초";//현재시간
	workInTime.innerHTML = nowTime;

	
	//업무상태변경 클릭시 해당 상태로 출력
/* 	$('#selectStatus li').on('click', function(){
		console.log(123);
		var selectedStatus = $(this).text();
		var a = $('#changeStatus').text(selectedStatus);
		console.log(selectedStatus);
	}); */
	
	// 출근버튼
	$('#wkStartBtn').click(function() {
		Swal.fire({
			  title: '출근',
			  text: "출근 하시겠습니까?",
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '확인',
			  cancelButtonText: '취소'
		}).then((result) => {
			if(result.value){ //확인
				console.log(result.value);
				return;
			} else {
                return false;
              }
		})
	}); 
	//출근
	function startTime(){
		
		var now = new Date();
		var nowDate =  now.getFullYear() + "/" + (now.getMonth()+1)+"/"+now.getDate();
		var nowTime = now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds() ;//현재시간
		var day = new Date();
		console.log(day);
		
		console.log(nowTime);
		
		$.ajax({
			url:'attendance',
			data:{day:day, nowTime:nowTime},
			dataType: 'json',
			type: 'POST',
			success:function(data){
				console.log(data)
				var onTime = data.attStart;
				var offTime = data.attEnd;
				console.log(onTime)
				console.log(data.attEnd)
				if(onTime != ''){
					$('#wkStartBtn').attr("disabled","disabled");
					$('#wkStartBtn').css('color','gray');
					$('#wkStartBtn').css('border-color','gray');
					$('#wkEndBtn').css({'border': '1px solid #593BDB', 'color': '#593BDB' }).prop('disabled', false);
				} else if(offTime != ''){
					$('#wkEndBtn').attr("disabled","disabled");
					$('#wkEndBtn').css('color','gray');
					$('#wkEndBtn').css('border-color','gray');
				}
			}, error:function(data){
				console.log(data);
			}
		});
	}
	// 퇴근
	function endTime(){
		 // var offTimeCheck = confirm('퇴근하시겠습니까?');
		 Swal.fire({
		  title: '퇴근하시겠습니까?',
		  //text: "이미 생성하셨다면 취소를 눌러주세요.",
		 // icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '확인',
		  cancelButtonText: '취소'
		 }).then((result) => {
			console.log(result.value);
	
		if(result.value){
			var now = new Date();
			var nowDate =  now.getFullYear() + "/" + (now.getMonth()+1)+"/"+now.getDate();
			var off = new Date();
			var offTime = now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds() ;//현재시간
			var status = "EW";
	
			$.ajax({
				url:'attendance',
				data:{off:off, 
					offTime:offTime,
					status:status
					},
				dataType: 'json',
				success:function(data){
					console.log(data);
					
					if(offTime != ''){
						$('#wkEndBtn').attr("disabled","disabled");
						$('#wkEndBtn').css('color','gray');
						$('#wkEndBtn').css('border-color','gray');
						alert('퇴근되었습니다.');
					}
				}, error:function(data){
					console.log(data);
				}
			});
		}
		 })
	  }
	
	// 업무상태 변경
	$('#changeStatus').on('change', function(){
		var offClock = document.getElementById("workOutTime");
		var statusValue = $(this).val();
		console.log(statusValue);

		var now = new Date();
		var nowDate =  now.getFullYear() + "/" + (now.getMonth()+1)+"/"+now.getDate();
		var offTime = now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds() ;//현재시간
		var off = new Date();

			$.ajax({
				url:'attendance',
				data:{
					statusValue:statusValue, 
					offTime:offTime,
					off:off
					},
				dataType: 'json',
				success:function(data){
					console.log(data);	

					 if(statusValue == "EW"){
						 Swal.fire({
							  title: '퇴근하시겠습니까?',
							  //text: "이미 생성하셨다면 취소를 눌러주세요.",
							 // icon: 'warning',
							  showCancelButton: true,
							  confirmButtonColor: '#3085d6',
							  cancelButtonColor: '#d33',
							  confirmButtonText: '확인',
							  cancelButtonText: '취소'
						}).then((result) => {
								console.log(result.value);
								if(result.value){		
									$('#changeStatus').prop("disabled",  true);
									var date = new Date(data.attEnd);
									 var month = date.getMonth() + 1;
									 var day = date.getDate();
									 var hour = date.getHours();
									 var minute = date.getMinutes();
									 var second = date.getSeconds();
			
							        month = month >= 10 ? month : '0' + month;
							        day = day >= 10 ? day : '0' + day;
							        hour = hour >= 10 ? hour : '0' + hour;
							        minute = minute >= 10 ? minute : '0' + minute;
							        second = second >= 10 ? second : '0' + second;
			
							        var offDate = date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
									
							        console.log("function 퇴근:"+offDate);
			
									$('#workOutTime').val(offDate);
								}
						})
					} 
				},
				error:function(data){
					console.log(data);
				}
			});					
		}); 

	  
		
    //업무시간 계산
	
	var gap = document.getElementById("workingTime1");
	var statusValue = $('#changeStatus').val();
	function workTime(){
		var gap = document.getElementById("workingTime1");// 출력할 장소 선택
		var overTimePrint = document.getElementById("overTime");
		var workingTime =  document.getElementById("workInTime");
		var wtVal = workingTime.value;	
				
		var date = new Date();
	
		var hours = ('0' + date.getHours()).slice(-2); 
		var minutes = ('0' + date.getMinutes()).slice(-2);
		var seconds = ('0' + date.getSeconds()).slice(-2); 
	
		var timeString = hours + ':' + minutes  + ':' + seconds;			
	
		var wtDate = new Date(wtVal);
	
		var timeGap = date.getTime() - wtDate.getTime();
				console.log("timeGap:"+timeGap);
		//시간을 시,분,초로 계산
		pDay = timeGap / (60*60*24*1000);
		strDay = Math.floor(pDay);
		pHour = (timeGap - (strDay * (60*60*24*1000))) / (60*60*1000);
		strHour = Math.floor(pHour);
		strMinute = Math.floor((timeGap - (strDay * (60*60*24*1000)) - (strHour * (60*60*1000))) / (60*1000));
		strSec = Math.floor((timeGap - (strDay * (60*60*24*1000)) - (strHour * (60*60*1000)) - (strMinute * (60*1000))) / (1000));
	
				console.log(strDay + " 일 " + strHour + " 시간 " + strMinute + " 분" + strSec + " 초");
	
		var gapTime = strHour + " : " + strMinute + ":" + strSec;
	
				console.log(wtVal);
	
		if(wtVal !='' ){	        	
			gap.innerHTML = gapTime;
	                     	       }
		var statusValue = $('#changeStatus').val();
	
		if(statusValue!="EW"){
			setTimeout("workTime()",1000);
		}else if(statusValue=="EW"){				
			clearTimeout("workTime()");    
		}
	}
	</script>
</body>
</html>