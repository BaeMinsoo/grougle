<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>로그인</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/employee/login" method="post">
		<c:if test="${employee == null}">
			<div>
				<label for="emp_id"></label> <input type="text" id="emp_id"
					name="emp_id">
			</div>
			<div>
				<label for="emp_pwd"></label> <input type="password" id="emp_pwd"
					name="emp_pwd">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button type="button" onclick="location.href='<%=request.getContextPath()%>/employee/agreement'">회원가입</button>
				<button type="button" onclick="location.href='<%=request.getContextPath()%>/employee/findId_form'" id="findId">아이디찾기</button>
				<button type="button" onclick="location.href='<%=request.getContextPath()%>/employee/findPwd_form'" id="findPwd">비밀번호찾기</button>
			</div>
		</c:if>
	</form>
	
	<script>
		<%-- $("#findId").click(function(){
			location.href = "<%=request.getContextPath()%>/employee/findId_form";
		});--%>
		$("#findPwd").click(function(){
			location.href = '<%=request.getContextPath()%>/employee/findPwd_form';
		}); 
	</script>
	
	
</body>
</html>