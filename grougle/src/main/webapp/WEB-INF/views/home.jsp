<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>grougle</title>

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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/chat/chatstyle.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/chat/chatstyle.min.css">

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
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
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
	<%@ include file="./header/header.jsp"%>
	<%@ include file="./sidebar/rightsidebar.jsp"%>
	<%@ include file="./sidebar/chatsidebar.jsp"%>
	<%@ include file="./sidebar/leftsidebar.jsp"%>
	<div class="main-container">	
		
		<c:if test="${login != null}">
		<p>${employee.emp_name}님 반갑습니다.</p>
		<button id="logoutBtn" type="button" onclick="location.href='<%=request.getContextPath()%>/employee/logout'">로그아웃 </button>
		</c:if>
		<c:if test="${loginSsInfo == null}">
		<div>
		<button type="button"onclick="location.href='<%=request.getContextPath()%>/employee/login'">로그인</button>
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/employee/agreement'">회원가입</button>
		</div>
		</c:if>		
		<c:if test="${not empty loginSsInfo}">
			<div>
				<p>${employee.emp_name}님 반갑습니다.</p>
				<button id="logoutBtn" type="button" onclick="location.href='<%=request.getContextPath()%>/employee/logout'">로그아웃 </button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">아이디나 패스워드가 일치하지 않습니다.</p>
		</c:if>
	
	dkdkfafeia;efjeaidkfjaeifjfaiefadfjeaikdfjeialkdfajeiadf;aei;fkadjfaiefajdfiaekfjdfiwekfajdfiefadfadf<br>
	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf
	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf
		 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf
	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf
	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf
	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf
	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf
	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf
	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf
	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf
	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf
	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf
	 fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf fadfadf
	</div>

</body>
</html>
