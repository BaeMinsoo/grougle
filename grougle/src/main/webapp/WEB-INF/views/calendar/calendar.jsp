<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
<!-- fullcalendar -->
<link
	href="<%=request.getContextPath()%>/resources/css/calendar/lib/main.css"
	rel='stylesheet' />
<script
	src="<%=request.getContextPath()%>/resources/css/calendar/lib/main.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/css/calendar/lib/locales/ko.js"></script>

<script>
<!-- 캘린더 전역변수 설정 -->
    var calendar;

<!-- 전체 모달 닫기 -->
/*window.closeModal = function(){
        $('.modal').modal('hide');
    };

    $(document).ready(function() {
    	readCalList();
		<!-- 캘린더의 체크박스를 조작했을 때 를 실행 -->
    	$(document).on('input.calCheckbox', function() {
    		checkCal();					// checkCal() 함수(체크된 체크박스 검사)
    		calendar.refetchEvents();	// 캘린더 리로드(일정 다시 불러오기)
    	});
    });*/
    
    
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth', locale : 'ko'
        });
        calendar.render();
      });
    
    /* document.addEventListener('DOMContentLoaded', function() {
        var Calendar = FullCalendar.Calendar;
        var Draggable = FullCalendarInteraction.Draggable;
     
        var containerEl = document.getElementById('external-events');
        var calendarEl = document.getElementById('calendar');
        var checkbox = document.getElementById('drop-remove');
     
        // initialize the external events
        // -----------------------------------------------------------------
     
        new Draggable(containerEl, {
          itemSelector: '.fc-event',
          eventData: function(eventEl) {
            return {
              title: eventEl.innerText
            };
          }
        });
        
        calendar.render();
      });  */

    </script>
<!-- 헤더&사이드바 -->
<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/resources/vendors/styles/core.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/resources/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/resources/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/resources/src/plugins/datatables/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/resources/vendors/styles/style.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/resources/css/chat/chat.css">

<!-- js -->
<script	src="<%=request.getContextPath()%>/resources/vendors/scripts/core.js"></script>
<script	src="<%=request.getContextPath()%>/resources/vendors/scripts/script.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/vendors/scripts/process.js"></script>
<script	src="<%=request.getContextPath()%>/resources/vendors/scripts/layout-settings.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/apexcharts/apexcharts.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/chat-sidebar.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/vendors/scripts/dashboard.js"></script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
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
	<form action="<%=request.getContextPath()%>/calendar/calendar" method="post"></form>
<!-- 헤더&사이드바 -->
	<%@ include file="../header/header.jsp"%>
	<%@ include file="../sidebar/rightsidebar.jsp"%>
	<%@ include file="../sidebar/leftsidebar.jsp"%>
<!-- 배치를 위한 div 기본틀 -->
	<div class="mobile-menu-overlay"></div>
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">

<!-- fullcalendar 작성 시작 -->
			<div style="width: 20%; float: left;">
				<ul class="nav" id="side-menu" style="padding-left: 9%;">
					<li style="padding: 10px 0 40px;"><span class="nav_mtitle"
						style="font-weight: bold; font-size: 15pt;">개인일정</span>
						<ul class="nav_ul">

						</ul> <span class="nav_mtitle"
						style="font-weight: bold; font-size: 15pt;">기업일정</span>
						<ul class="nav_share_ul">
							<li style='margin-bottom: 10px;'></li>
							<li>
								<p class='nav_ul_p'>
									<input id='calendar_id_-9999' class='calCheckbox' type='checkbox' /> 
									<input type='hidden' value='-9999' /> 
									<label for='calendar_id_-9999' class='smallText'>&nbsp;초대받은 일정</label> 
									<span class='btn_wrap'> 
										<span class='dot' style='background-color: violet'></span>
									</span>
								</p>
							</li>
						</ul>
						<div class="add_calendar_box dropdown">
							<a class="add_calendar dropdown-toggle" role="button" id="dropdownMenuLink" data-toggle="dropdown" style="color: black;"> 
								<i class="fa fa-plus" style="padding-right: 10px;"></i>개인일정 추가
							</a>

							<div class="dropdown-menu" aria-labelledby="dropdownMenuLink" style="padding: 5px 0; padding-left: 20xp; padding-right: 20xp;">
								<h5 style="font-weight: bold;">&nbsp;개인일정 추가</h5>
								<div>
									<input type="text" maxlength="16" name="cal_name" style="margin-bottom: 10px;" /> <br>
									<button type="button" class="btn blueBtn" onclick="addCal()">확인</button>
									<button type="button" class="btn grayBtn">취소</button>
								</div>

							</div>
						</div>

						<div class="add_calendar_box">
							<a class="add_calendar" href="<%=request.getContextPath()%>/editCal.os" style="color: black;"> 
								<i class="fa fa-cog" style="padding-right: 10px;"></i>개인일정 관리
							</a>
						</div>
					</li>
				</ul>

				<div id="external-events">
					<p>
						<strong>Draggable Events</strong>
					</p>
					<div class="fc-event">My Event 1</div>
					<div class="fc-event">My Event 2</div>
					<div class="fc-event">My Event 3</div>
					<div class="fc-event">My Event 4</div>
					<div class="fc-event">My Event 5</div>
					<p>
						<input type="checkbox" id="drop-remove"> 
						<label for="drop-remove">remove after drop</label>
					</p>
				</div>
				
				<div class="center p-20" style="padding-top: 0px !important;">
					<span class="hide-menu addSchedule">
					<a class="btn btn-info btn-block btn-rounded waves-effect waves-light"
						href="<%=request.getContextPath()%>/goAddDetailSch.os">일정등록</a>
					</span>
				</div>
			</div>


			<div id='calendar' style="width: 75%; float: right;"></div>
		</div>
	</div>
</body>
</html>