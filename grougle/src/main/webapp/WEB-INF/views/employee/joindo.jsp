<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입완료</title>
</head>
<body>
	<ul class="join_step">
				<li><strong>1</strong> <span></span></li>
				<li><strong>2</strong> <span>   </span></li>
				<li class="on"><strong>3</strong> <span>신청완료</span></li>
			</ul>

	<!-- end step -->
	<div>
		<div>
			<p>
				<strong>Grougle가입신청</strong> "이 완료 되었습니다."
			</p>
		</div>
		<div>
		<p>		
			"이메일 인증 후"<strong>그룹웨어</strong>"이용이 가능하며" <br> <strong>Grougle</strong>"에
			가입해주셔서 감사합니다." <br>
		</p>
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/employee/login'">로그인페이지 이동</button>
		</div>		
	</div>
</body>
</html>