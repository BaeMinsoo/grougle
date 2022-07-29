<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재</title>
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
<!-- jstree js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<!-- 서머노트 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/summernote/summernote-lite.css">
<script src="<%=request.getContextPath() %>/resources/js/summernote/summernote-lite.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/summernote/summernote-ko-KR.js"></script>

<style>
.page-body {
	background-color: #fff;
	border-radius: 10px;
	padding-top: 20px;
	padding-left: 15px;
	padding-right: 15px;
	padding-bottom: 20px;
	width: 100%;
	height: fit-content;
	display: block;
}

/* jstree 최상위 분류 아이콘 적용 */
	.jstree > ul > li > a > .jstree-icon {  
		display:inline-block !important;
	}
	/* jstree 최상위 분류 글자 css */
	.jstree > ul > li > a {  
		display:inline-block !important;
		font-weight: bold !important; 
		font-style: italic !important;
	    color: #29627e !important;
	}    
	/* jstree 문서(최하위 노드)아이콘 제거 */
	.jstree li > a:nth-last-child(1) > .jstree-icon {  
		display:none;
	}
	/* jstree 문서(최하위 노드) 글자 css */
	.jstree li > a:nth-last-child(1) {
		font-weight: normal; 
		font-style: normal;
		color: #E0B185;
	}
	/* jstree 분류 아이콘 적용(접혔을 때 최하위노드여도 아이콘 적용) */
	.jstree li[aria-expanded="false"] > a:nth-last-child(1) > .jstree-icon {  
		display:inline-block;
	}
	/* jstree 분류 글자 css (접혔을 때 최하위노드여도 적용) */
	.jstree li[aria-expanded="false"] > a:nth-last-child(1) {  
		display:inline-block;
		font-weight: bold; 
		font-style: italic;
	    color: #29627e;
	}    
	/* jstree 글자 css */
	.jstree li > a{  
		font-weight: bold; 
	} 
	
	/* 모달창 css */
	/* 모달 화면 위치 */
	.modal1, .modal2 {
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	/* 모달 화면 배경처리 */
	.bg1, .bg2 {
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.6);
	}
	/* 모달 내부 css */
	.modalBox1, .modalBox2 {
	    position: absolute;
	    background-color: #fff;
	    width: 900px;
	    height: 600px;
	    padding: 15px;
	 }
	 /* 모달 화면 버튼 css */
	.modalBox1 .closeBtn1, .modalBox2 .closeBtn2 {
	    position: absolute;
	    width: 80px;
	    margin-left: 22%; 
	    margin-top: 50%;
	    padding: 10px 5px;
	    border: 1px solid transparent;
	    transition: 0.25s;
	    background-color: aliceblue;
	    color: #1e6b7b;
	    font-weight: bold;
	}
	
	/* 모달 화면 버튼 hover css */
	.modalBox1 .closeBtn1:hover, .modalBox2 .closeBtn2:hover {
		border: 1px solid #fb9300;
	}
/* 숨김처리 css */
	.hidden1, .hidden2 {
		display: none;
    }
/* 모달창 내부 css */
	/* jstree 위치 */
	#jstreeshow {
	    width: 40%;
	    height: auto;
	    padding-left: .5rem;
	    margin-left: .5rem;
	    float: left;
	    font-style: italic;
	    color: #29627e;
	    font-weight: bold;
	}
	/* 정보입력란 위치 */
	#datainput {
	    width: 50%;
	    height: 400px;
	    overflow: auto;
	    padding-right: .5rem;
	    margin-right: .5rem;
	    float: right;
	    color: #29627e;
	    font-weight: bold;
	}
	/* 모달 내부 jstree css */
	#jstree2, #jstree3 {
		height: 300px;
		overflow: auto;
	}
/* 모달창 내부 css */
	/* 제목 css */
	#editdepttitle {
		margin-top:1.5%;
		margin-bottom:1.5%;
		font-weight: bold;
	}
	#datainput1 {
		width: 50%;
	    height: fit-content;
	    padding-right: .5rem;
	    margin-right: .5rem;
	    float: right;
	    color: #29627e;
	    font-weight: bold;
	    margin-top:20%;
	    margin-left:8%;
	}
	#emptable {
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
								<h4>결재</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">홈</a></li>
									<li class="breadcrumb-item"><a href="index.html">전자결재</a></li>
									<li class="breadcrumb-item active" aria-current="page">결재</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				
				
				
				
				
				<form id="approvaling" name="approvaling" method="post" action="<%=request.getContextPath() %>/eapproval/approvaling">
					<div class="page-body">
						<%-- <%@ include file="./formsheader.jsp"%> --%> <!-- 이거 살리고 formsheader 내용 빼주기 -->
						<div class="formsheader">
							<input class="forms_title" name="draft_title" placeholder="기안제목" value="${draftInfo.draft_title }" readonly="readonly" required>
							<input class="forms_no" name="draft_no" value="${draftInfo.draft_no }" readonly="readonly" required>
							<input class="drafter_id" name="drafter_id" placeholder="직원명" value="${draftInfo.drafter_id }" required readonly="readonly">
							<input class="dept_name" placeholder="부서명" value="${draftInfo.dept_name }" readonly="readonly">
							<input class="position_name" placeholder="직급명" value="${draftInfo.position_name }" readonly="readonly">
							<input class="drafter_name" placeholder="사원번호" value="${draftInfo.drafter_name }" required readonly="readonly">
							<input class="approval_status" placeholder="사원번호" name="approval_status" value="${draftInfo.approval_status }" readonly="readonly">
							<input class="final_approval" placeholder="사원번호" name="final_approval" value="${draftInfo.final_approval }" readonly="readonly">
							<input class="login_empname" name="login_empname" placeholder="로그인 한 사용자 이름" value="${loginSsInfo.emp_name }" readonly="readonly">
							<input class="login_empno" name="login_empno" placeholder="로그인 한 사번" value="${loginSsInfo.emp_no }" readonly="readonly">
							<table id="formlisttable">
								<c:choose>
									<c:when test="${empty draftInfo}">
										<div>결재선을 확인할 수 없습니다.</div>
										<div>다시 한번 시도하여 주시고 문제가 지속될 시 관리자에게 문의하시기 바랍니다.</div>
									</c:when>
									<c:when test="${!empty draftInfo}">
											<tr>
												<th rowspan="3">결재</th>
												<c:if test="${not empty draftInfo.draft_first_name}">
													<td>1차결재</td>
											 	</c:if>
											 	<c:if test="${not empty draftInfo.draft_second_name}">
													<td>2차결재</td>
											 	</c:if>
											 	<c:if test="${not empty draftInfo.draft_third_name}">
													<td>3차결재</td>
											 	</c:if>
											 	<c:if test="${not empty draftInfo.draft_fourth_name}">
													<td>4차결재</td>
											 	</c:if>
											 	<c:if test="${not empty draftInfo.draft_fifth_name}">
													<td>5차결재</td>
											 	</c:if>
												</tr>
												<tr>
											<c:if test="${not empty draftInfo.draft_first_name}">
													<td><input class="approvaal_name_first1" name="draft_first1" value="${draftInfo.draft_first_name }${draftInfo.draft_first_position_name }" readonly="readonly"></td>
											 </c:if>
											 <c:if test="${not empty draftInfo.draft_second_name}">
													<td><input class="approvaal_name_second2" name="draft_second2" value="${draftInfo.draft_second_name }${draftInfo.draft_second_position_name }" readonly="readonly"></td>
											 </c:if>
											 <c:if test="${not empty draftInfo.draft_third_name}">
													<td><input class="approvaal_name_third3" name="draft_third3" value="${draftInfo.draft_third_name }${draftInfo.draft_third_position_name }" readonly="readonly"></td>
											 </c:if>
											 <c:if test="${not empty draftInfo.draft_fourth_name}">
													<td><input class="approvaal_name_fourth4" name="draft_fourth4" value="${draftInfo.draft_fourth_name }${draftInfo.draft_fourth_position_name }" readonly="readonly"></td>
											 </c:if>
											 <c:if test="${not empty draftInfo.draft_fifth_name}">
													<td><input class="approvaal_name_fifth5" name="draft_fifth5" value="${draftInfo.draft_fifth_name }${draftInfo.draft_fifth_position_name }" readonly="readonly"></td>
											 </c:if>
											 <c:if test="${not empty draftInfo.draft_first_name}">
													<td hidden><input class="approvaal_name_first" name="draft_first" value="${draftInfo.draft_first }" readonly="readonly"></td>
											 </c:if>
											 <c:if test="${not empty draftInfo.draft_second_name}">
													<td hidden><input class="approvaal_name_second" name="draft_second" value="${draftInfo.draft_second }" readonly="readonly"></td>
											 </c:if>
											 <c:if test="${not empty draftInfo.draft_third_name}">
													<td hidden><input class="approvaal_name_third" name="draft_third" value="${draftInfo.draft_third }" readonly="readonly"></td>
											 </c:if>
											 <c:if test="${not empty draftInfo.draft_fourth_name}">
													<td hidden><input class="approvaal_name_fourth" name="draft_fourth" value="${draftInfo.draft_fourth }" readonly="readonly"></td>
											 </c:if>
											 <c:if test="${not empty draftInfo.draft_fifth_name}">
													<td hidden><input class="approvaal_name_fifth" name="draft_fifth" value="${draftInfo.draft_fifth }" readonly="readonly"></td>
											 </c:if>
												</tr>
												<tr>
											<c:if test="${not empty draftInfo.draft_first_name}">
												<c:if test="${not empty draftInfo.first_date}">
														<td><input class="draft_yn1" name="approval_yn" value="결재 완료" readonly="readonly"></td>
												</c:if>
												<c:if test="${empty draftInfo.first_date}">
														<td><input class="draft_yn1" name="approval_yn" readonly="readonly"></td>
												</c:if>
											</c:if>
											<c:if test="${not empty draftInfo.draft_second_name}">
												<c:if test="${not empty draftInfo.second_date}">
														<td><input class="draft_yn2" name="approval_yn" value="결재 완료" readonly="readonly"></td>
												</c:if>
												<c:if test="${empty draftInfo.second_date}">
														<td><input class="draft_yn2" name="approval_yn" readonly="readonly"></td>
												</c:if>
											</c:if>
											<c:if test="${not empty draftInfo.draft_third_name}">
												<c:if test="${not empty draftInfo.third_date}">
														<td><input class="draft_yn3" name="approval_yn" value="결재 완료" readonly="readonly"></td>
												</c:if>
												<c:if test="${empty draftInfo.third_date}">
														<td><input class="draft_yn3" name="approval_yn" readonly="readonly"></td>
												</c:if>
											</c:if>
											<c:if test="${not empty draftInfo.draft_fourth_name}">
												<c:if test="${not empty draftInfo.fourth_date}">
														<td><input class="draft_yn" name="approval_yn" value="결재 완료" readonly="readonly"></td>
												</c:if>
												<c:if test="${empty draftInfo.fourth_date}">
														<td><input class="draft_yn" name="approval_yn" readonly="readonly"></td>
												</c:if>
											</c:if>
											<c:if test="${not empty draftInfo.draft_fifth_name}">
												<c:if test="${not empty draftInfo.fifth_date}">
														<td><input class="draft_yn5" name="approval_yn" value="결재 완료" readonly="readonly"></td>
												</c:if>
												<c:if test="${empty draftInfo.fifth_date}">
														<td><input class="draft_yn5" name="approval_yn" readonly="readonly"></td>
												</c:if>
											</c:if>
												</tr>
									</c:when>
								</c:choose>
							</table>
						</div><!-- formsheader div -->
						<div class="formsbody">
							<div class="forms_content" name="draft_content" >${draftInfo.draft_content }</div>
						</div> <!-- formsbody div -->
					</div> <!-- page-body div -->
					</form>
					
					
					
					<div class="modal1 hidden1">
					  <div class="bg1"></div>
					  <div class="modalBox1">
					  <form id="rejecting" name="rejecting" method="post" action="<%=request.getContextPath() %>/eapproval/rejectapproval">
					  	<textarea id="reject_reason" name="reject_reason" placeholder="반려 의견을 작성해주세요"></textarea>
					  	<input class="login_empname_for_reject" name="reject_empname" placeholder="로그인 한 사용자 이름" value="${loginSsInfo.emp_name }" readonly="readonly">
						<input class="login_empno_for_reject" name="reject_empno" placeholder="로그인 한 사번" value="${loginSsInfo.emp_no }" readonly="readonly">
					  	<input class="draft_no" name="draft_no" value="${draftInfo.draft_no }" readonly="readonly" required>
					  </form>
					    <button class="rejectbtn">반려하기</button>
					    <button class="closeBtn1">창 닫기</button>
					  </div>
					</div>
					
					
					<button id="submitbtn" type="button">결재하기</button>
					<button id="gorejectbtn" class="openBtn1" type="button">반려하기</button>
			
					
					
			</div>
		</div>
	</div>
<script>
$("#submitbtn").on("click",function(){

	document.approvaling.submit();
});
$("#rejectbtn").on("click",function(){
	var condition1 = document.querySelector("#reject_reason").value;
	if(condition1 !== ''){
		document.rejecting.submit();
	}
	if(condition1 == ''){
		alert("반려사유를 작성하여 주시기 바랍니다.");
	}
	else{
		alert("예상치 못한 오류가 발생하였습니다. 다시 한번 시도하여 주시기 바랍니다.");
	}
});


const open1 = () => {
	document.querySelector(".modal1").classList.remove("hidden1");
}
const close1 = () => {
	document.querySelector(".modal1").classList.add("hidden1");
}

document.querySelector(".openBtn1").addEventListener("click", open1);
document.querySelector(".closeBtn1").addEventListener("click", close1);
document.querySelector(".bg1").addEventListener("click", close1);

</script>

</body>
</html>