<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


	<c:choose>
		<c:when test="${empty eformpreview}">
			<div>양식의 미리보기가 없습니다.</div>
		</c:when>
		<c:when test="${!empty eformpreview}">
			<div class="previewdivformtitle">${eformpreview.forms_title }</div>
			<div class="previewdivformcontent">${eformpreview.forms_content }</div>	
		</c:when>
	</c:choose>
