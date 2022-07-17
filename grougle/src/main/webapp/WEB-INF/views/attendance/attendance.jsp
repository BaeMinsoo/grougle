<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<% Date nowTime = new Date();
	SimpleDateFormat today = new SimpleDateFormat("yyyy년 MM월 dd일");
	SimpleDateFormat time = new SimpleDateFormat("a hh시 mm분 ss초");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태관리</title>
<!-- 헤더&사이드바 -->
<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/vendors/styles/core.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/src/plugins/datatables/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/vendors/styles/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/chat/chat.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/attendance/att.css">

<!-- js -->
<script src="<%=request.getContextPath()%>/resources/vendors/scripts/core.js"></script>
<script	src="<%=request.getContextPath()%>/resources/vendors/scripts/script.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/vendors/scripts/process.js"></script>
<script	src="<%=request.getContextPath()%>/resources/vendors/scripts/layout-settings.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/apexcharts/apexcharts.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/chat-sidebar.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/vendors/scripts/dashboard.js"></script>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-119386393-1');
</script>
</head>

<body>
	<form action="<%=request.getContextPath()%>/attendance" method="post"></form>
	<!-- 헤더&사이드바 -->
	<%@ include file="../header/header.jsp"%>
	<%@ include file="../sidebar/rightsidebar.jsp"%>
	<%@ include file="../sidebar/leftsidebar.jsp"%>
	<!-- 배치를 위한 div 기본틀 -->
	<div class="mobile-menu-overlay"></div>
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
		<!-- -------------------- -->
			<div id="main-wrapper">
				<div class="content-body">
					<div class="container-fluid">
						<div class="col-xl-12 col-xxl-6 col-lg-6 col-md-12">
							<div class="row">
							
							</div>
						</div>

						<!-- 출,퇴근시간 영역 -->
						<div class="row">

							<div class="col-lg-3">
								<div class="card">
									<div class="card-body" id="nowDateDiv">
										<div id="nowDateArea">
											<div>
												<h5><%=today.format(nowTime)%></h5>
												<h7><%=time.format(nowTime)%></h7>
											</div>
										</div>
										<ul style="color: black; margin-top: 30px;">
											<li> 출근시간 
												<c:choose>
													<c:when test="${requestScope.att1 != null }">
														<input id="workInTime" name="workInTime"
															value="${requestScope.att1.getAttStart()}">
													</c:when>
													<c:otherwise>
														<input id="workInTime" name="workInTime">
													</c:otherwise>
												</c:choose>
											</li>
											<li>퇴근시간 <c:choose>
													<c:when test="${requestScope.att1 != null }">
														<input id="workOutTime" name="workOutTime"
															value="${requestScope.att1.getAttEnd()}">
													</c:when>
													<c:otherwise>
														<input id="workOutTime" name="workOutTime">
													</c:otherwise>
												</c:choose>

											</li>
										</ul>
										<div class="basic-dropdown">
											<div class="dropdown"> 업무상태 변경 :
												<c:choose>
													<c:when test="${att1.getAttStatus() eq '업무종료'}">
														<select id="changeStatus" disabled="disabled">
															<option value="업무상태선택">업무상태선택</option>
															<option value="업무중">업무중</option>
															<option value="업무종료" selected="selected">업무종료</option>
															<option value="외근">외근</option>
															<option value="조퇴">조퇴</option>
															<option value="반차">반차</option>
														</select>
													</c:when>
													<c:otherwise>
														<select id="changeStatus">
															<option value="업무상태선택">업무상태선택</option>
															<option value="업무중" <c:if test="${att1.getAttStatus() eq '업무중'}">selected</c:if>>업무중</option>
															<option value="업무종료" <c:if test="${att1.getAttStatus() eq '업무종료'}">selected</c:if>>업무종료</option>
															<option value="외근" <c:if test="${att1.getAttStatus() eq '외근'}">selected</c:if>>외근</option>
															<option value="조퇴" <c:if test="${att1.getAttStatus() eq '출장'}">selected</c:if>>조퇴</option>
															<option value="반차" <c:if test="${att1.getAttStatus() eq '반차'}">selected</c:if>>반차</option>
														</select>
													</c:otherwise>
												</c:choose>
                                    </div>
                                </div>
								
                            </div>
                        </div>
                    </div>
            
                    <!-- 일일 근태현황영역 -->
                    <div class="col-lg-9">
                        <div class="card">
                            <div class="card-header">
	                                <span id="empTitle" class="card-title">일일 근태현황</span>	                   					
                            </div>                        		                   
                            <div class="card-body">
                                <div class="table-responsive">
                                	<table id="WorkTable" class="table table-responsive-sm" style="color: black; text-align: center;">                              
                                        <thead>
                                            <tr>
                                                <th>
                                                	<div id="dailyDateArea">
					                                	<c:set var="date"><%= today.format(nowTime) %></c:set>
														 <c:out value="${date}" />
														 <div id="clock"></div>
													</div>
												</th>
                                            </tr>
                                        </thead>
                                        <tbody style="color:black;">
                                            <tr>
                                                <td>
													업무시간
                                                </td> 
                                                <td>
													초과근무시간
                                                </td>                                               
                                            </tr>
                                            <tr>
                                            <c:choose>
                                            	<c:when test="${'업무종료' &&  null}">                                           		                                            			
			                                           <td style="height: 90px;" id="workingTime">
			                                                	${''}
			                                           </td>
			                                       <%-- <c:choose>
			                                            <c:when test="${null}">
			                                                <td id="overTime">
																
			                                                </td>
			                                            </c:when>
			                                            <c:otherwise>
			                                            	<td id="overTime">
																
			                                                </td>
			                                            </c:otherwise> 
		                                            </c:choose> --%>
	                                            </c:when>
	                                            <c:otherwise>
	                                            	<td style="height: 90px;" id="workingTime1">
																
			                                        </td>
			                                        <td id="overTime">
																 
			                                        </td>
	                                            </c:otherwise>
                                            </c:choose>                                                  
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12 col-xxl-6 col-lg-6 col-md-12">
                	<div class="row">
                    </div>
                </div>
            </div>
                 <div class="row">
                 <div class="col-lg-3"></div>
                     <div class="col-lg-9">
                        <div class="card">
                            <div class="card-header">
                                <span id="totalTitle" class="card-title">누적 근태현황</span>
                   				<span class="breadcrumb-item active"><a id="moreView" href="empStatusTotal.em">더보기</a></span>		
                            </div>
                            
                            <div class="card-body">
                                <div class="table-responsive">
                                <table id="totalWorkTime" class="table table-responsive-sm" style="color: black; text-align: center;">                              
                                        <thead>                                        
                                            <tr>
                                                <th>
													이번 주 업무시간
                                                </th> 
                                                <th> 
													이번 주 초과근무시간
                                                </th>  
                                                <th>
													이번 달 업무시간
                                                </th> 
                                                <th>
													이번 달 초과근무시간
                                                </th>                                                
                                            </tr>
                                            <tr>
                                       </thead>
                                       <tbody>
                                          <c:choose>
                                            	<c:when test="${''}">
	                                                <td style="height: 90px; font-size:25px;">
														
	                                                </td>
	                                            </c:when>
	                                            <c:otherwise>
	                                            	<td style="height: 90px;">
														
	                                                </td>
	                                            </c:otherwise>
                                            </c:choose> 
                                            <c:choose>
                                            	<c:when test="${''}">
	                                                <td style="height: 90px; font-size:25px;">
														
	                                                </td>
	                                            </c:when>
	                                            <c:otherwise>
	                                            	<td>
	                                                </td>
	                                            </c:otherwise>
                                            </c:choose> 
                                                 <td style="height: 90px; font-size:25px;" >
													${''}
                                                </td> 
                                                <td style="height: 90px; font-size:25px;">
													${''}
                                                </td>                                                                                               
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
   
            </div>
        </div>
					<!-- ----------------------------- -->
				</div>
			</div>
		</div>
	</div>

</body>
</html>