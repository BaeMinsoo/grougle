<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>
<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/vendors/styles/core.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/src/plugins/datatables/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/vendors/styles/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/chat/chat.css">
<!-- jstree css CDN -->	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<!-- js -->
<script src="<%=request.getContextPath() %>/resources/vendors/scripts/core.js"></script>
<script src="<%=request.getContextPath() %>/resources/vendors/scripts/script.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/vendors/scripts/process.js"></script>
<script src="<%=request.getContextPath() %>/resources/vendors/scripts/layout-settings.js"></script>
<script src="<%=request.getContextPath() %>/resources/src/plugins/apexcharts/apexcharts.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/chat-sidebar.js"></script>
<script
	src="<%=request.getContextPath() %>/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="<%=request.getContextPath() %>/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath() %>/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
<script
	src="<%=request.getContextPath() %>/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/vendors/scripts/dashboard.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'UA-119386393-1');
</script>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
.emptable {
		border: 2px double #29627e;
		width: 300px;
		margin-right: 1%;
		margin-bottom: 1%;
	}
</style>
</head>
<body>
	<%@ include file="../header/header.jsp"%>
	<%@ include file="../sidebar/leftsidebar.jsp"%>
	<%@ include file="../sidebar/rightsidebar.jsp"%>
	<%@ include file="../sidebar/chatsidebar.jsp"%>
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>전자결재</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">전자결재</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				
				
				
					<div class="page-body">
					
						<div id="approvaltake">
							<div>내가 결재해야 하는 문서 리스트</div>
								<form id="formprocess" name="formprocess" method="post" action="<%=request.getContextPath() %>/eapproval/approvaldo">
									<button type="button" id="ongoingsubmitbtn">선택한 문서 결재하기</button>
									<c:forEach items="${approvalongoing }" var="approvalongoing" varStatus="status">
										<div>
											<table class="emptable">
												<tr>
													<th rowspan="5"><div id="emplistno" class="${status.count }">&nbsp ${status.count } &nbsp&nbsp&nbsp</div></th>
													<td>기안번호: </td>
													<td><div id="draft_no" class="${status.count }">${approvalongoing.draft_no }</div></td>
												</tr>
												<tr>
													<td>제목: </td>
													<td><div id="draft_title" class="${status.count }">${approvalongoing.draft_title }</div></td>
												</tr>
												<tr>
													<td>기안일시: </td>
													<td><div id="draft_date" class="${status.count }">${approvalongoing.draft_date }</div></td>
												</tr>
												<tr>
													<td>결재상태: </td>
													<td><div id="approval_status" class="${status.count }">${approvalongoing.approval_status }/${approvalongoing.final_approval }</div></td>
												</tr>
											</table>
										</div>
									</c:forEach>
									<input id="draft_no_record" name="draft_no" hidden></input>	
								</form>	
						</div>
						
						<hr style="border: 0px; background-color: #29627e; height: 4px;">
						<div id="approvalmake">
							<div>내가 기안을 올린 문서 중 결재 중인 리스트</div>
									<c:forEach items="${approvalmake }" var="approvalmake" varStatus="status">
										<div>
											<table id="emptable2">
												<tr>
													<th rowspan="5"><div id="emplistno2" class="${status.count }">&nbsp ${status.count } &nbsp&nbsp&nbsp</div></th>
													<td>기안번호: </td>
													<td><div id="draft_no2" class="${status.count }">${approvalmake.draft_no }</div></td>
												</tr>
												<tr>
													<td>제목: </td>
													<td><div id="draft_title2" class="${status.count }">${approvalmake.draft_title }</div></td>
												</tr>
												<tr>
													<td>기안일시: </td>
													<td><div id="draft_date2" class="${status.count }">${approvalmake.draft_date }</div></td>
												</tr>
												<tr>
													<td>결재상태: </td>
													<td><div id="approval_status2" class="${status.count }">${approvalmake.approval_status }/${approvalmake.final_approval }</div></td>
												</tr>
											</table>
										</div>
									</c:forEach>	
						</div>
						
						<hr style="border: 0px; background-color: #29627e; height: 4px;">
						<div id="approvalreject">
							<div>반려된 문서 리스트</div>
									<c:forEach items="${approvalreject }" var="approvalreject" varStatus="status">
										<div>
											<table id="emptable3">
												<tr>
													<th rowspan="6"><div id="emplistno3" class="${status.count }">&nbsp ${status.count } &nbsp&nbsp&nbsp</div></th>
													<td>기안번호: </td>
													<td><div id="draft_no3" class="${status.count }">${approvalreject.draft_no }</div></td>
												</tr>
												<tr>
													<td>제목: </td>
													<td><div id="draft_title3" class="${status.count }">${approvalreject.draft_title }</div></td>
												</tr>
												<tr>
													<td>기안일시: </td>
													<td><div id="draft_date3" class="${status.count }">${approvalreject.draft_date }</div></td>
												</tr>
												<tr>
													<td>결재상태: </td>
													<td><div id="approval_status3" class="${status.count }">${approvalreject.approval_status }/${approvalongoing.final_approval }</div></td>
												</tr>
												<tr>
													<td>반려사유: </td>
													<td><div id="reject_reason" class="${status.count }">${approvalreject.reject_reason }</div></td>
												</tr>
											</table>
										</div>
									</c:forEach>	
						</div>
						
						<hr style="border: 0px; background-color: #29627e; height: 4px;">
						<div id="approvalfinish">
							<div>결재 완료된 문서 리스트</div>
								<c:forEach items="${approvalfinish }" var="approvalfinish" varStatus="status">
										<div>
											<table id="emptable4">
												<tr>
													<th rowspan="4"><div id="emplistno4" class="${status.count }">&nbsp ${status.count } &nbsp&nbsp&nbsp</div></th>
													<td>기안번호: </td>
													<td><div id="draft_no4" class="${status.count }">${approvalfinish.draft_no }</div></td>
												</tr>
												<tr>
													<td>제목: </td>
													<td><div id="draft_title4" class="${status.count }">${approvalfinish.draft_title }</div></td>
												</tr>
												<tr>
													<td>기안일시: </td>
													<td><div id="draft_date4" class="${status.count }">${approvalfinish.draft_date }</div></td>
												</tr>
											</table>
										</div>
									</c:forEach>	
						</div>
						
					
					</div> <!-- page-body 태그 -->
					
					
					
			</div>
		</div>
	</div>
<script>
$(document).on("click",".emptable",function(){
	$(".emptable").css({"background-color": ""});
	$(this).css({"background-color": "rgba(247, 180, 84, 0.3)"});
	var draft_no = $(this).find('#draft_no').text();
	console.log(draft_no);
	document.querySelector("#draft_no_record").value = draft_no;
});
$(document).on("click","#ongoingsubmitbtn",function(){
	var draft_no = document.querySelector("#draft_no_record").value;
	console.log(draft_no);
	if(draft_no == ''){
		alert("문건을 선택해주세요");
	}
	if(draft_no !== ''){
		document.formprocess.submit();
	}
});
</script>	
</body>
</html>