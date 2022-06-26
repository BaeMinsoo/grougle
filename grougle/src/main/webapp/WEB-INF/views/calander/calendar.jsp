<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>

</head>
<body>
	<form action="<%=request.getContextPath()%>/calendar/calendar" method="post"></form>
	<%@ include file="../header/header.jsp"%>
	<%@ include file="../sidebar/rightsidebar.jsp"%>
	<%@ include file="../sidebar/leftsidebar.jsp"%>
	
</body>
</html>