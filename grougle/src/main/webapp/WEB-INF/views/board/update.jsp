<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<!-- 헤더&사이드바 -->
    <!-- Mobile Specific Metas -->
	<meta name="viewport"
		content="width=device-width, initial-scale=1, maximum-scale=1">
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
</head>
<body>
<div>
	<%@ include file="../header/header.jsp"%>
	<%@ include file="../sidebar/rightsidebar.jsp"%>
	<%@include file="nav.jsp"%>
</div>
<c:choose>
<c:when test="${empty board }">
	<script>
		alert("해당글이없습니다. 글목록으로 이동합니다.");
		location.href="<%=request.getContextPath()%>/board/list";
	</script>
</c:when>
<c:otherwise>
	<div>
	<form action="<%=request.getContextPath() %>/board/updateDo" method="post"
		enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>No.</td>
				<td>작성일</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>level</td>	
				<td>ref</td>	
				<td>rref</td>	
				<td>seq</td>			
				
			</tr>
			<tr>
				<td><a href="<%=request.getContextPath()%>/board/read?wb_no=${board.wb_no }">${board.wb_no }</a></td>
				<td>${board.wb_date }</td>
				<td>${board.wb_writer }</td>
				<td>${board.wb_count }</td>	
				<td>${board.wb_level }</td>	
				<td>${board.wb_ref }</td>	
				<td>${board.wb_reply_ref }</td>	
				<td>${board.wb_reply_seq }</td>			
				
			</tr>
		</table>
		<input type="hidden" name="wb_no" value="${board.wb_no }">
		<div>
			제목:<input type="text" name="wb_title" value="${board.wb_title }">
		</div>		
		<div>
			내용: <input type="text" name="wb_content" value="${board.wb_content }">
		</div>
		<div>변경할첨부파일:<input type="file" name="uploadfile"></div>
		
	<c:if test="${not empty board.wb_original_filename }">
		<input type="hidden" name="wb_rename_filename" value="${board.wb_rename_filename }">
		<div>
		기존첨부파일: <input type="text" name="wb_original_filename" value="${board.wb_original_filename }" id="orgFile" readonly>
		<button type="button" onclick="document.getElementById('orgFile').value='';">기존파일삭제</button></div>
		<div><img src="<%=request.getContextPath() %>/${board.wb_rename_filename }" width="500"></div>
	</c:if>
		<button type="submit">수정하기</button>
		<button type="button" onclick="<%=request.getContextPath()%>/board/list">원래대로</button>		
	</form>
	</div>
</c:otherwise>
</c:choose>
</body>
</html>