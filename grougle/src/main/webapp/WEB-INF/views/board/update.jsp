<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
<div><button type="button" onclick="location.href='<%=request.getContextPath() %>/'">홈</button></div>
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
				<td>${board.wb_no }<a href="<%=request.getContextPath()%>/board/read?wb_no=${board.wb_no }">${board.wb_no }</a></td>
				<td>${board.wb_date }</td>
				<td>${board.wb_writer }</td>
				<td>${board.wb_readcount }</td>	
				<td>${board.wb_level }</td>	
				<td>${board.wb_ref }</td>	
				<td>${board.wb_reply_ref }</td>	
				<td>${board.wb_reply_seq }</td>			
				
			</tr>
		</table>
		<input type="hidden" name="board_num" value="${board.wb_no }">
		<div>
			제목:<input type="text" name="board_title" value="${board.wb_title }">
		</div>		
		<div>
			내용: <input type="text" name="board_content" value="${board.wb_content }">
		</div>
		
		<button type="reset">원래대로</button>
		<button type="submit">수정하기</button>
	</form>
	</div>
</c:otherwise>
</c:choose>
</body>
</html>