<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<c:choose>
		<c:when test="${empty eformlist}">
			<div>생성된 양식이 없습니다.</div>
		</c:when>
		<c:when test="${!empty eformlist}">
			<div class="formscount">양식의 갯수: 총 ${fn:length(eformlist)}개</div>
			<div class="formslisttitle">양식 리스트(제목순)</div>
			<c:forEach items="${eformlist }" var="formlist" varStatus="status">
				<table id="formlisttable">
					<tr>
						<th rowspan="5"><div id="formlistno" class="${status.count }">&nbsp ${status.count } &nbsp&nbsp&nbsp</div></th>
						<td>제목: </td>
						<td><div id="forms_title" class="${status.count }">${formlist.forms_title }</div></td>
					</tr>
					<tr>
						<td>분류: </td>
						<td><div id="category_name" class="${status.count }">${formlist.category_name }</div></td>
					</tr>
					<tr>
						<td>생성자: </td>
						<td><div id="emp_name" class="${status.count }">${formlist.emp_name }</div></td>
					</tr>
					<tr>
						<td>생성자: </td>
						<td><div id="create_date" class="${status.count }">${formlist.create_date }</div></td>
					</tr>
				</table>
			</c:forEach>
		</c:when>
	</c:choose>
	
