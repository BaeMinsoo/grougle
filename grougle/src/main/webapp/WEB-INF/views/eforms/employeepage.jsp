<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


	
								<c:choose>
									<c:when test="${empty companytreeEmployeelist}">
										<div>부서를 선택하세요.</div>
									</c:when>
									<c:when test="${!empty companytreeEmployeelist}">
										<div class="deptempguide">직원 정보(직급순)</div>
										<c:forEach items="${companytreeEmployeelist }" var="companytreeEmployee" varStatus="status">
											<table id="emptable" class="emptable">
												<tr>
													<th rowspan="2"><div id="emplistno" class="${status.count }">&nbsp ${status.count }</div></th>
													<td><div id="approval" class="${status.count }">${companytreeEmployee.emp_name }&nbsp&nbsp${companytreeEmployee.position_name }</div></td>
													<td ><div id="emp_name" class="${status.count }" hidden>${companytreeEmployee.emp_name }</div></td>
													<td ><div id="emp_no" class="${status.count }" hidden>${companytreeEmployee.emp_no }</div></td>
													<td ><div id="email_address" class="${status.count }" hidden>${companytreeEmployee.emp_email }</div></td>
													<td ><div id="position_level" class="${status.count }" hidden>${companytreeEmployee.position_level }</div></td>
													<td ><div id="position_name" class="${status.count }" hidden>${companytreeEmployee.position_name }</div></td>
												</tr>
											</table>
										</c:forEach>
									</c:when>
								</c:choose>
						

