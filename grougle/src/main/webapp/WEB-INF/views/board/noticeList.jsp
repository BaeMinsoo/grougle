<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div><button type="button" onclick="location.href='<%=request.getContextPath() %>/'">홈</button></div>

<c:choose>
<c:when test="${empty boardlist}">
	<div>작성된 글이 없습니다.</div>
</c:when>
<c:otherwise>
	<div>
		<table border="1">
			<tr>
				<td>No.</td>
				<td>제목</td>
				<td>작성일</td>
				<td>작성자</td>
				<td>조회수</td>	
			
				<td>level</td>	
				<td>ref</td>	
				<td>rref</td>	
				<td>seq</td>			
							
			</tr>
<c:forEach items="${boardlist }" var="board">
			<tr>
				<c:forEach begin="1" end="${board.wb_level }">
				&#9755;
				</c:forEach>
				<td><a href="<%=request.getContextPath()%>/board/read?wb_no=${board.wb_no }">${board.wb_no }</a></td>
				<td>${board.wb_title }</td>
				<td>${board.wb_date }</td>
				<td>${board.wb_writer }</td>
				<td>${board.wb_readcount }</td>	
				
				
				<td>${board.wb_level }</td>	
				<td>${board.wb_ref }</td>	
				<td>${board.wb_reply_ref }</td>	
				<td>${board.wb_reply_seq }</td>
	
				
				
			</tr>
</c:forEach>
		</table>
	</div>
</c:otherwise>
</c:choose>
</body>
</html>