<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서등록</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/position/insert" method="post">
		<input type="text" name="position_name" required="required">
		<input type="text" name="level" required="required">
		<select name="upper_position">
			<option value="null" selected="selected"> 
			<option value="1"> 
		</select>
	</form>
</body>
</html>