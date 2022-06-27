<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
<!-- fullcalendar -->
	<link href="<%=request.getContextPath() %>/resources/css/calendar/lib/main.css" rel='stylesheet' />
	<script src="<%=request.getContextPath() %>/resources/css/calendar/lib/main.js"></script>

    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

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
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath() %>/resources/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath() %>/resources/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath() %>/resources/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath() %>/resources/src/plugins/datatables/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath() %>/resources/vendors/styles/style.css">
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath() %>/resources/css/chat/chat.css">
	
	<!-- js -->
	<script src="<%=request.getContextPath() %>/resources/vendors/scripts/core.js"></script>
	<script src="<%=request.getContextPath() %>/resources/vendors/scripts/script.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/vendors/scripts/process.js"></script>
	<script src="<%=request.getContextPath() %>/resources/vendors/scripts/layout-settings.js"></script>
	<script src="<%=request.getContextPath() %>/resources/src/plugins/apexcharts/apexcharts.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/chat-sidebar.js"></script>
	<script
		src="<%=request.getContextPath() %>/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/vendors/scripts/dashboard.js"></script>
	
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
			<div id='calendar' style="width: 90%;"></div>
		
		</div>
	</div>
</body>
</html>