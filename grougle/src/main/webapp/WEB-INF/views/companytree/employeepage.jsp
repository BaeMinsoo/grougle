<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${empty companytreeEmployeelist}">
			<div>생성된 조직도가 없거나 부서원이 존재하지 않습니다.<br>부서 정보를 확인하여 주시고 이상이 지속하여 발생 시 관리자에게 문의해주시기 바랍니다.</div>
		</c:when>
		
		<c:when test="${!empty companytreeEmployeelist}">
			
			<div class="deptempcount">총원: ${fn:length(companytreeEmployeelist)} 명</div>
			<div class="deptempguide">직원 정보(직급순)</div>
			
			<c:forEach items="${companytreeEmployeelist }" var="companytreeEmployee" varStatus="status">
				
				<table id="emptable">
					<tr>
						<th rowspan="6"><div id="emplistno" class="${status.count }">&nbsp ${status.count } &nbsp&nbsp&nbsp</div></th>
						<td>이름: </td>
						<td><div id="emp_name" class="${status.count }">${companytreeEmployee.emp_name }</div></td>
					</tr>
					<tr>
						<td>직급: </td>
						<td><div id="position_name" class="${status.count }">${companytreeEmployee.position_name }</div></td>
					</tr>
					<tr>
						<td>부서: </td>
						<td><div id="dept_name" class="${status.count }">${companytreeEmployee.dept_name }</div></td>
					</tr>
					<tr>
						<td>Email: </td>
						<td><div id="emp_email" class="${status.count }">${companytreeEmployee.emp_email }</div></td>
					</tr>
					<tr>
						<td>Tel: </td>
						<td><div id="emp_tel" class="${status.count }">${companytreeEmployee.emp_tel }</div></td>
					</tr>
				</table>
				
			</c:forEach>
			
		</c:when>
	</c:choose>

</body>
</html>