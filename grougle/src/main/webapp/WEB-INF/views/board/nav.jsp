<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	li {list-style: none; display:inline; padding: 6px;}
</style>
<ul>
	<li><a href='<%=request.getContextPath()%>/'>홈</a></li>
	<li>
		<c:if test="${loginSsInfo != null}">
		<li> <a href='<%=request.getContextPath()%>/board/write'>글 작성</a></li>
		<li><a href='<%=request.getContextPath()%>/board/list'>목록</a></li>
		<li><a href='<%=request.getContextPath()%>/employee/logout'>로그아웃</a></li>
		</c:if>
		<c:if test="${loginSsInfo == null}"><a href='<%=request.getContextPath()%>/employee/login'>로그인</a></c:if>
	</li>
	<li>
		<c:if test="${loginSsInfo != null}">
			<p>${loginSsInfo.emp_name}님 안녕하세요.</p>
		</c:if>
	</li>
</ul>
