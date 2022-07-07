<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>로그인</title>
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/login/login.css">
</head>
<body>
	<form action="<%=request.getContextPath()%>/employee/login" method="post">	
		<fieldset>
		<!-- 구르글 로그인 -->
		<div id="contents">
			<h1>
			<img src="/main/webapp/resources/grougle/dark-grougle.svg" id="logo_img" alt="logo">
			</h1>
		
				<div class="login-box">
				<ul class="form-wrap">
					<li> 
						<input type="text" id="emp_id" name="emp_id" placeholder="아이디">
					</li>
					<li>
						<input type="password" id="emp_pwd" name="emp_pwd" placeholder="비밀번호">
					</li>
				</ul>													
				<ul>
					<li><button type="submit">로그인</button></li>
					<li><a type="hidden" onclick="location.href='<%=request.getContextPath()%>/employee/agreement'">회원가입</a></li>
					<li><a type="hidden" onclick="location.href='<%=request.getContextPath()%>/employee/findId_form'" id="findId">아이디찾기</a></li>
					<li><a type="hidden" onclick="location.href='<%=request.getContextPath()%>/employee/findPwd_form'" id="findPwd">비밀번호찾기</a></li>
				</ul>
				</div>
				<div class="quick-board">
					<div class="notice-wrap">
					<h2>공지사항</h2>
					<ul></ul>
					</div>
					<h2>Grougle 공지사항</h2>
					<ul>
					<li></li>
					<li></li>
					<li></li>
					</ul>
					<div class="system-wrap"></div>
				</div>
		</div>		
				
				
		</fieldset>		
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