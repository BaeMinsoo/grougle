<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양식수정</title>
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
								<h4>양식 수정</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">홈</a></li>
									<li class="breadcrumb-item"><a href="index.html">결재양식</a></li>
									<li class="breadcrumb-item active" aria-current="page">양식 수정</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				
				
				
				
				
				<form id="formedit" name="formedit" method="post" action="<%=request.getContextPath() %>/eform/updateform">
					<div class="page-body">
						<%-- <%@ include file="./formsheader.jsp"%> --%> <!-- 이거 살리고 formsheader 내용 빼주기 -->
						<div class="formsheader">
							<input class="forms_title" name="forms_title" placeholder="양식 제목 입력" value="${draftInfo.forms_title }" required>
							<input class="forms_no" name="forms_no" value="${draftInfo.forms_no }" required>
							<button class="makeapprovallinebtn openBtn2">결재선 지정</button>
							<input class="drafter_name" name="emp_name" placeholder="직원명" value="${loginSsInfo.emp_name }" required readonly="readonly">
							<input class="dept_name" name="dept_name" placeholder="부서명" value="${loginSsInfo.dept_name }" readonly="readonly">
							<input class="position_name" name="position_name" placeholder="직급명" value="${loginSsInfo.position_name }" readonly="readonly">
							<input class="drafter_id" name="creator" placeholder="사원번호" value="${loginSsInfo.emp_no }" required readonly="readonly">
							<input class="dept_no" name="dept_no" placeholder="부서번호" value="${loginSsInfo.dept_no }" readonly="readonly">
							<input class="position_no" name="position_no" placeholder="직급번호" value="${loginSsInfo.position_no }" readonly="readonly">
							<table id="formlisttable">
								<c:choose>
									<c:when test="${empty approvallinelist}">
										<tr>
											<th rowspan="3">결재</th>
											<td>1차결재</td>
											<td>2차결재</td>
											<td>3차결재</td>
											<td>4차결재</td>
											<td>5차결재</td>
										</tr>
										<tr>
											<td><input class="first_approvaal_name approvaal_name" name="draft_first" placeholder="1차결재자 성명" readonly="readonly"></td>
											<td><input class="second_approvaal_name approvaal_name" name="draft_second" placeholder="2차결재자 성명" readonly="readonly"></td>
											<td><input class="third_approvaal_name approvaal_name" name="draft_third" placeholder="3차결재자 성명" readonly="readonly"></td>
											<td><input class="fourth_approvaal_name approvaal_name" name="draft_fourth" placeholder="4차결재자 성명" readonly="readonly"></td>
											<td><input class="fifth_approvaal_name approvaal_name" name="draft_fifth" placeholder="5차결재자 성명" readonly="readonly"></td>
										</tr>
										<tr>
											<td><input class="first_draft_yn draft_yn" name="first_approval_yn" placeholder="서명란" readonly="readonly"></td>
											<td><input class="second_draft_yn draft_yn" name="second_approval_yn" placeholder="서명란" readonly="readonly"></td>
											<td><input class="third_draft_yn draft_yn" name="third_approval_yn" placeholder="서명란" readonly="readonly"></td>
											<td><input class="fourth_draft_yn draft_yn" name="fourth_approval_yn" placeholder="서명란" readonly="readonly"></td>
											<td><input class="fifth_draft_yn draft_yn" name="fifth_approval_yn" placeholder="서명란" readonly="readonly"></td>
										</tr>
									</c:when>
									<c:when test="${!empty approvallinelist}">
											<tr>
												<th rowspan="3">결재</th>
											<c:forEach items="${approvallinelist }" var="linelist2" varStatus="status">
													<td>${status.count }차결재</td>
											</c:forEach>
												</tr>
												<tr>
											<c:if test="${not empty approvallinelist.draft_first_name}">
													<td><input class="approvaal_name" name="draft_count" value="${approvallinelist.draft_first_name }${approvallinelist.draft_first_position }" readonly="readonly"></td>
											 </c:if>
											 <c:if test="${not empty approvallinelist.draft_second_name}">
													<td><input class="approvaal_name" name="draft_count" value="${approvallinelist.draft_second_name }${approvallinelist.draft_second_position }" readonly="readonly"></td>
											 </c:if>
											 <c:if test="${not empty approvallinelist.draft_third_name}">
													<td><input class="approvaal_name" name="draft_count" value="${approvallinelist.draft_third_name }${approvallinelist.draft_third_position }" readonly="readonly"></td>
											 </c:if>
											 <c:if test="${not empty approvallinelist.draft_fourth_name}">
													<td><input class="approvaal_name" name="draft_count" value="${approvallinelist.draft_fourth_name }${approvallinelist.draft_fourth_position }" readonly="readonly"></td>
											 </c:if>
											 <c:if test="${not empty approvallinelist.draft_fifth_name}">
													<td><input class="approvaal_name" name="draft_count" value="${approvallinelist.draft_fifth_name }${approvallinelist.draft_fifth_position }" readonly="readonly"></td>
											 </c:if>
												</tr>
												<tr>
											<c:if test="${not empty approvallinelist.draft_first_yn}">
													<td><input class="draft_yn" name="approval_yn" value="${approvallinelist.draft_first_yn }" readonly="readonly"></td>
											</c:if>
											<c:if test="${not empty approvallinelist.draft_second_yn}">
													<td><input class="draft_yn" name="approval_yn" value="${approvallinelist.draft_second_yn }" readonly="readonly"></td>
											</c:if>
											<c:if test="${not empty approvallinelist.draft_third_yn}">
													<td><input class="draft_yn" name="approval_yn" value="${approvallinelist.draft_third_yn }" readonly="readonly"></td>
											</c:if>
											<c:if test="${not empty approvallinelist.draft_fourth_yn}">
													<td><input class="draft_yn" name="approval_yn" value="${approvallinelist.draft_fourth_yn }" readonly="readonly"></td>
											</c:if>
											<c:if test="${not empty approvallinelist.draft_fifth_yn}">
													<td><input class="draft_yn" name="approval_yn" value="${approvallinelist.draft_fifth_yn }" readonly="readonly"></td>
											</c:if>
												</tr>
									</c:when>
								</c:choose>
							</table>
						</div><!-- formsheader div -->
						
						
						
						
						
						
						<div class="formsbody">
							<textarea class="summernote" name="forms_content"></textarea>
						</div> <!-- formsbody div -->
				
				
				
				
				
				
						
					</div> <!-- page-body div -->
					
					
					
					
					
					
					
					
					
					<div class="modal2 hidden2">
					  <div class="bg2"></div>
					  <div class="modalBox2">
					  <div id="editdepttitle">결재선 지정</div>
					  	<div id="jstreeshow">
					  		<div id="searchdept">부서검색</div>
							<input id="search-input3" class="search-input3" placeholder="부서명 입력"/>
					  		<div style="margin-top: 5%;">Grougle</div>
					  		<div id="jstree3"></div>
					  	</div>
					  	<div id="datainput">
					  			<div class="employeediv">
								<c:choose>
									<c:when test="${empty companytreeEmployeelist}">
										<div>부서를 선택하세요.</div>
									</c:when>
									<c:when test="${!empty companytreeEmployeelist}">
										<div class="deptempguide">직원 정보(직급순)</div>
										<c:forEach items="${companytreeEmployeelist }" var="companytreeEmployee" varStatus="status">
											<table id="emptable" class="emptable" tabindex="1">
												<tr>
													<th rowspan="2"><div id="emplistno" class="${status.count }">&nbsp ${status.count }</div></th>
													<td><div id="approval" class="${status.count }">${companytreeEmployee.emp_name }&nbsp&nbsp${companytreeEmployee.position_name }</div></td>
													<td ><div id="emp_name" class="${status.count }" hidden>${companytreeEmployee.emp_name }</div></td>
													<td ><div id="email_address" class="${status.count }" hidden>${companytreeEmployee.emp_email }</div></td>
													<td ><div id="position_level" class="${status.count }" hidden>${companytreeEmployee.position_level }</div></td>
													<td ><div id="position_name" class="${status.count }" hidden>${companytreeEmployee.position_name }</div></td>
												</tr>
											</table>
										</c:forEach>
									</c:when>
								</c:choose>
							</div>
					  		<hr style="border: 0px; background-color: #29627e; height: 4px;">
					  			<input id="emp_name_record" hidden></input>
								<input id="email_address_record" hidden></input>
								<input id="position_level_record" hidden></input>
								<input id="position_name_record" hidden></input>
						  			<div style="margin-top: 2%;">결재자 선택(직급에 따라 선택해주시기 바랍니다)</div>
						  			<div style="margin-top: 1%;">(초기화 선택시 높은 차수의 선택자까지 함께 초기화됩니다)</div>
						  			<div style="margin-top: 1%;">1차 결재자 선택</div>
						  			<input type="text" id="first_approval_input_name" name="first_approval_name" placeholder="1차 결재자" readonly="readonly" />
						  			<input type="text" id="first_approval_input_position_name" name="first_approval_input_position_name" hidden />
						  			<input type="text" id="first_approval_input_email" name="first_approval_input_email" hidden />
						  			<button id="select1">조직도에서 입력</button>
						  			<button id="resetbtn1">초기화</button>
						  			<div style="margin-top: 1%;">2차 결재자 선택</div>
						  			<input type="text" id="second_approval_input_name" name="second_approval_name" placeholder="2차 결재자" readonly="readonly" />
						  			<input type="text" id="second_approval_input_position_name" name="second_approval_input_position_name" hidden />
						  			<input type="text" id="second_approval_input_email" name="second_approval_input_email" hidden />
						  			<button id="select2">조직도에서 입력</button>
						  			<button id="resetbtn2">초기화</button>
						  			<div style="margin-top: 1%;">3차 결재자 선택</div>
						  			<input type="text" id="third_approval_input_name" name="third_approval_name" placeholder="3차 결재자" readonly="readonly" />
						  			<input type="text" id="third_approval_input_position_name" name="third_approval_input_position_name" hidden />
						  			<input type="text" id="third_approval_input_email" name="third_approval_input_email" hidden />
						  			<button id="select3">조직도에서 입력</button>
						  			<button id="resetbtn3">초기화</button>
						  			<div style="margin-top: 1%;">4차 결재자 선택</div>
						  			<input type="text" id="fourth_approval_input_name" name="fourth_approval_name" placeholder="4차 결재자" readonly="readonly" />
						  			<input type="text" id="fourth_approval_input_position_name" name="fourth_approval_input_position_name" hidden />
						  			<input type="text" id="fourth_approval_input_email" name="fourth_approval_input_email" hidden />
						  			<button id="select4">조직도에서 입력</button>
						  			<button id="resetbtn4">초기화</button>
						  			<div style="margin-top: 1%;">5차 결재자 선택</div>
						  			<input type="text" id="fifth_approval_input_name" name="fifth_approval_name" placeholder="5차 결재자" readonly="readonly" />
						  			<input type="text" id="fifth_approval_input_position_name" name="fifth_approval_input_position_name" hidden />
						  			<input type="text" id="fifth_approval_input_email" name="fifth_approval_input_email" hidden />
						  			<button id="select5">조직도에서 입력</button>
						  			<button id="resetbtn5">초기화</button>
						  			
					  	</div>
					    <button class="closeBtn2">창 닫기</button>
					  </div>
					</div>
					<input type="text" id="category_name2" name="category_name" value="${draftInfo.category_name }" required hidden>
					<input type="text" id="category_no2" name="category_no" value="${draftInfo.category_no }" required hidden>
					<button id="submitbtn" type="button">양식수정</button>
			</form>
					
					
			</div>
		</div>
	</div>
<script>
$("#submitbtn").on("click",function(){
	document.formedit.submit();
});

function getJsontree() {
	$.ajax({    
		url: "<%=request.getContextPath() %>/eform/formtreeajax",
	    type: 'get',
	    contentType : 'application/json;charset=UTF-8',
	    dataType : 'json', // ajax 통신으로 받는 타입 
	    success: function(data){        
			var forms = new Array();        
			$.each(data, function(idx, item){            
				forms[idx] = {id:item.category_no, parent:item.upper_category_no, text:item.category_name};
			});
			//jstree 구현부         
			$("#jstree2").jstree({            
				core: {                
					data: forms    //데이터 연결            
					},            
					types: {                
						'default': {                    
							'icon': 'jstree-folder'               
						}            
					},
					//사용하는 플로그인 종류            
					plugins: ['wholerow', 'search', 'sort'],
					 "search": {
		                    "case_sensitive": false,
		                    "show_only_matches": true
		                }
				})        
				.bind('loaded.jstree', function(event, data){
				//트리 로딩 롼료 이벤트 
					 //$(this).jstree("open_all");
					//아이콘 변경
					$(this).jstree(true).set_icon(node.id, "이미지파일경로"); 
				})          
		},
	    error:function (data) {
	        alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
	    }
	});
}
function getJsontree2() {
	$.ajax({    
		url: "<%=request.getContextPath() %>/companytree/listajax",
	    type: 'get',
	    contentType : 'application/json;charset=UTF-8',
	    dataType : 'json', // ajax 통신으로 받는 타입 
	    success: function(data){        
			var company = new Array();        
			$.each(data, function(idx, item){            
				company[idx] = {id:item.dept_no, parent:item.upper_dept_no, text:item.dept_name};
			});
			//jstree 구현부         
			$("#jstree3").jstree({            
				core: {                
					data: company    //데이터 연결            
					},            
					types: {                
						'default': {                    
							'icon': 'jstree-folder'               
						}            
					},
					//사용하는 플로그인 종류            
					plugins: ['wholerow', 'types', 'search', 'themes', 'sort'],
					 "search": {
		                    "case_sensitive": false,
		                    "show_only_matches": true
		                }
				})        
				.bind('loaded.jstree', function(event, data){
				//트리 로딩 롼료 이벤트 
					//아이콘 변경, 다만 조직도에 아이콘 없는 게 좋을 듯 하다
					$(this).jstree(true).set_icon(node.id, "이미지파일경로"); 
				})
	    },
	    error:function (data) {
	        alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
	    }
	});
}

const open1 = () => {
	document.querySelector(".modal1").classList.remove("hidden1");
	$('#jstree2').jstree("open_all");
}
const close1 = () => {
	document.querySelector(".modal1").classList.add("hidden1");
}
const open2 = () => {
	document.querySelector(".modal2").classList.remove("hidden2");
	$('#jstree3').jstree("open_all");
}
const close2 = () => {
	document.querySelector(".modal2").classList.add("hidden2");
}
document.querySelector(".openBtn1").addEventListener("click", open1);
document.querySelector(".closeBtn1").addEventListener("click", close1);
document.querySelector(".bg1").addEventListener("click", close1);
document.querySelector(".openBtn2").addEventListener("click", open2);
document.querySelector(".closeBtn2").addEventListener("click", close2);
document.querySelector(".bg2").addEventListener("click", close2);

//분류 지정 - 선택된 분류에 대한 자동입력 부분
$("#jstree2").bind('select_node.jstree', function(event, data){ 
		var category_no = data.instance.get_node(data.selected).id;        //id 가져오기    
		var type = data.instance.get_node(data.selected).type;    //type 가져오기    
		var parent = data.instance.get_node(data.selected).parent;    //parent_id 가져오기    
		var parentNode = data.instance.get_node(data.node.parent).text;    //parent 이름 가져오기    
		var category_name = data.instance.get_node(data.selected).text;    //category_name 가져오기    
		console.log(category_no);
		console.log(parent);
		console.log(category_name);
		console.log(parentNode);
		if(category_no < 500){
			document.querySelector("#category_name").value = category_name;
			document.querySelector("#category_no").value = category_no;
			document.querySelector("#category_name2").value = category_name;
			document.querySelector("#category_no2").value = category_no;
		};
		if(category_no >= 500){
			document.querySelector("#category_name").value = parentNode;
			document.querySelector("#category_no").value = parent;
			document.querySelector("#category_name2").value = parentNode;
			document.querySelector("#category_no2").value = parent;
		};
}) 
$("#jstree3").bind('select_node.jstree', function(event, data){ 
	var dept_no = data.instance.get_node(data.selected).id;        	//dept_no 가져오기    
	var type = data.instance.get_node(data.selected).type;    		//type 가져오기    
	var parent = data.instance.get_node(data.selected).parent;    	//상위부서 가져오기    
	var dept_name = data.instance.get_node(data.selected).text;    	//dept_name 가져오기    
	console.log(dept_no);
	console.log(parent);
	console.log(dept_name);
	
	function ajaxdeptemplist() {
		console.log("ajax 진입");
		$.ajax({    
			url: "<%=request.getContextPath() %>/companytree/emplistajaxforformmake", 
		    type: 'get',
		    data: {'dept_name': dept_name},
		    dataType : 'text', 
		    success: function(data){ 
		    	console.log("ajax 성공진입");
		    	$(".employeediv").empty();
		    	$('.employeediv').html(data);
			},
		    error:function (data) {
		    	console.log("ajax 에러진입");
		    	alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
		    }
			})}; 
	ajaxdeptemplist();
}) 



//양식 focus 된 것에 대한 이벤트 적용 중 (css에서 focus 이벤트 준 것 주석처리하여 막은 후 적용했음)
$(document).on("click","#emptable",function(){
	$(".emptable").css({"background-color": ""});
	$(this).css({"background-color": "rgba(247, 180, 84, 0.3)"});
	var emp_name = $(this).find('#emp_name').text();
	var email_address = $(this).find('#email_address').text();
	var position_level = $(this).find('#position_level').text();
	var position_name = $(this).find('#position_name').text();
	console.log(emp_name);
	console.log(email_address);
	console.log(position_level);
	console.log(position_name);
	document.querySelector("#emp_name_record").value = emp_name;
	document.querySelector("#email_address_record").value = email_address;
	document.querySelector("#position_level_record").value = position_level;
	document.querySelector("#position_name_record").value = position_name;
});


$("#select1").on("click",function(){
	var condition1 = document.querySelector("#emp_name_record").value;
	var condition2 = document.querySelector("#email_address_record").value;
	var condition3 = document.querySelector("#position_level_record").value;
	var condition4 = document.querySelector("#position_name_record").value;
	var first_value = document.querySelector("#first_approval_input_name").value;
	var second_value = document.querySelector("#second_approval_input_name").value;
	var third_value = document.querySelector("#third_approval_input_name").value;
	var fourth_value = document.querySelector("#fourth_approval_input_name").value;
	var fifth_value = document.querySelector("#fifth_approval_input_name").value;
	var first_l_value = document.querySelector("#first_approval_input_position_name").value;
	var second_l_value = document.querySelector("#second_approval_input_position_name").value;
	var third_l_value = document.querySelector("#third_approval_input_position_name").value;
	var fourth_l_value = document.querySelector("#fourth_approval_input_position_name").value;
	var fifth_l_value = document.querySelector("#fifth_approval_input_position_name").value;
	console.log(condition1);
	console.log(condition2);
	console.log(condition3);
	console.log(condition4);
	if(second_value == '' && third_value == '' && fourth_value == '' && fifth_value == ''){
		if(condition1 == '' || condition2 == '' || condition3 == '' || condition4 == ''){
			alert("결재자를 선택해주세요.");
			return false;
		}
		if(condition1 !== '' && condition2 !== '' && condition3 !== '' && condition4 !== ''){
			if(condition1 !== second_value && condition1 !== third_value && condition1 !== fourth_value && condition1 !== fifth_value){
				document.querySelector("#first_approval_input_name").value = condition1;
				document.querySelector(".first_approvaal_name").value = condition1 + '  ' +condition4;
				document.querySelector("#first_approval_input_position_name").value = condition3;
				document.querySelector("#first_approval_input_email").value = condition2;
			}
			else{
				alert("결재자는 중복되어 선택할 수 없습니다.");
				return false;
			}
		}
	}
	if(second_value !== ''){
		if(condition3 > second_l_value){
			document.querySelector("#first_approval_input_name").value = condition1;
			document.querySelector(".first_approvaal_name").value = condition1 + '  ' +condition4;
			document.querySelector("#first_approval_input_position_name").value = condition3;
			document.querySelector("#first_approval_input_email").value = condition2;
		}
		if(condition3 <= second_l_value){
			alert("2차 결재자의 직급이 더 낮거나 같습니다. 제대로 결재선을 선택해주세요.");
			return false;
		}
	}
})
$("#select2").on("click",function(){
	var condition1 = document.querySelector("#emp_name_record").value;
	var condition2 = document.querySelector("#email_address_record").value;
	var condition3 = document.querySelector("#position_level_record").value;
	var condition4 = document.querySelector("#position_name_record").value;
	var first_value = document.querySelector("#first_approval_input_name").value;
	var second_value = document.querySelector("#second_approval_input_name").value;
	var third_value = document.querySelector("#third_approval_input_name").value;
	var fourth_value = document.querySelector("#fourth_approval_input_name").value;
	var fifth_value = document.querySelector("#fifth_approval_input_name").value;
	var first_l_value = document.querySelector("#first_approval_input_position_name").value;
	var second_l_value = document.querySelector("#second_approval_input_position_name").value;
	var third_l_value = document.querySelector("#third_approval_input_position_name").value;
	var fourth_l_value = document.querySelector("#fourth_approval_input_position_name").value;
	var fifth_l_value = document.querySelector("#fifth_approval_input_position_name").value;
	console.log(condition1);
	console.log(condition2);
	console.log(condition3);
	console.log(condition4);
	if(first_value !== '' && third_value == '' && fourth_value == '' && fifth_value == ''){
		if(condition1 == '' || condition2 == '' || condition3 == '' || condition4 == ''){
			alert("결재자를 선택해주세요.");
			return false;
		}
		if(condition1 !== '' && condition2 !== '' && condition3 !== '' && condition4 !== ''){
			if(condition1 !== first_value && condition1 !== third_value && condition1 !== fourth_value && condition1 !== fifth_value){
				if(condition3 < first_l_value){
					document.querySelector("#second_approval_input_name").value = condition1;
					document.querySelector(".second_approvaal_name").value = condition1 + '  ' +condition4;
					document.querySelector("#second_approval_input_position_name").value = condition3;
					document.querySelector("#second_approval_input_email").value = condition2;
				}
				if(condition3 >= first_l_value){
					alert("2차 결재자의 직급이 1차 결재자보다 더 낮거나 같습니다. 제대로 결재선을 선택해주세요.");
					return false;
				}
			}
			else{
				alert("결재자는 중복되어 선택할 수 없습니다.");
				return false;
			}
		}
	}
	if(first_value == ''){
		alert("1차 결재자를 먼저 선택해주세요.");
		return false;
	}
})
$("#select3").on("click",function(){
	var condition1 = document.querySelector("#emp_name_record").value;
	var condition2 = document.querySelector("#email_address_record").value;
	var condition3 = document.querySelector("#position_level_record").value;
	var condition4 = document.querySelector("#position_name_record").value;
	var first_value = document.querySelector("#first_approval_input_name").value;
	var second_value = document.querySelector("#second_approval_input_name").value;
	var third_value = document.querySelector("#third_approval_input_name").value;
	var fourth_value = document.querySelector("#fourth_approval_input_name").value;
	var fifth_value = document.querySelector("#fifth_approval_input_name").value;
	var first_l_value = document.querySelector("#first_approval_input_position_name").value;
	var second_l_value = document.querySelector("#second_approval_input_position_name").value;
	var third_l_value = document.querySelector("#third_approval_input_position_name").value;
	var fourth_l_value = document.querySelector("#fourth_approval_input_position_name").value;
	var fifth_l_value = document.querySelector("#fifth_approval_input_position_name").value;
	console.log(condition1);
	console.log(condition2);
	console.log(condition3);
	console.log(condition4);
	if(first_value !== '' && second_value !== '' && fourth_value == '' && fifth_value == ''){
		if(condition1 == '' || condition2 == '' || condition3 == '' || condition4 == ''){
			alert("결재자를 선택해주세요.");
			return false;
		}
		if(condition1 !== '' && condition2 !== '' && condition3 !== '' && condition4 !== ''){
			if(condition1 !== first_value && condition1 !== second_value && condition1 !== fourth_value && condition1 !== fifth_value){
				if(condition3 < first_l_value && condition3 < second_l_value){
					document.querySelector("#third_approval_input_name").value = condition1;
					document.querySelector(".third_approvaal_name").value = condition1 + '  ' +condition4;
					document.querySelector("#third_approval_input_position_name").value = condition3;
					document.querySelector("#third_approval_input_email").value = condition2;
				}
				if(condition3 >= first_l_value || condition3 >= second_l_value){
					alert("3차 결재자의 직급이 1차,2차 결재자보다 더 낮거나 같습니다. 제대로 결재선을 선택해주세요.");
					return false;
				}
			}
			else{
				alert("결재자는 중복되어 선택할 수 없습니다.");
				return false;
			}
		}
	}
	if(first_value == '' || second_value == ''){
		alert("1차 2차 결재자를 먼저 선택해주세요.");
		return false;
	}
})
$("#select4").on("click",function(){
	var condition1 = document.querySelector("#emp_name_record").value;
	var condition2 = document.querySelector("#email_address_record").value;
	var condition3 = document.querySelector("#position_level_record").value;
	var condition4 = document.querySelector("#position_name_record").value;
	var first_value = document.querySelector("#first_approval_input_name").value;
	var second_value = document.querySelector("#second_approval_input_name").value;
	var third_value = document.querySelector("#third_approval_input_name").value;
	var fourth_value = document.querySelector("#fourth_approval_input_name").value;
	var fifth_value = document.querySelector("#fifth_approval_input_name").value;
	var first_l_value = document.querySelector("#first_approval_input_position_name").value;
	var second_l_value = document.querySelector("#second_approval_input_position_name").value;
	var third_l_value = document.querySelector("#third_approval_input_position_name").value;
	var fourth_l_value = document.querySelector("#fourth_approval_input_position_name").value;
	var fifth_l_value = document.querySelector("#fifth_approval_input_position_name").value;
	console.log(condition1);
	console.log(condition2);
	console.log(condition3);
	console.log(condition4);
	if(first_value !== '' && second_value !== '' && third_value !== '' && fifth_value == ''){
		if(condition1 == '' || condition2 == '' || condition3 == '' || condition4 == ''){
			alert("결재자를 선택해주세요.");
			return false;
		}
		if(condition1 !== '' && condition2 !== '' && condition3 !== '' && condition4 !== ''){
			if(condition1 !== first_value && condition1 !== second_value && condition1 !== third_value && condition1 !== fifth_value){
				if(condition3 < first_l_value && condition3 < second_l_value && condition3 < third_l_value){
					document.querySelector("#fourth_approval_input_name").value = condition1;
					document.querySelector(".fourth_approvaal_name").value = condition1 + '  ' +condition4;
					document.querySelector("#fourth_approval_input_position_name").value = condition3;
					document.querySelector("#fourth_approval_input_email").value = condition2;
				}
				if(condition3 >= first_l_value || condition3 >= second_l_value || condition3 >= third_l_value){
					alert("4차 결재자의 직급이 1차,2차,3차 결재자보다 더 낮거나 같습니다. 제대로 결재선을 선택해주세요.");
					return false;
				}
			}
			else{
				alert("결재자는 중복되어 선택할 수 없습니다.");
				return false;
			}
		}
	}
	if(first_value == '' || second_value == '' || third_value == ''){
		alert("1차 2차 3차 결재자를 먼저 선택해주세요.");
		return false;
	}
})
$("#select5").on("click",function(){
	var condition1 = document.querySelector("#emp_name_record").value;
	var condition2 = document.querySelector("#email_address_record").value;
	var condition3 = document.querySelector("#position_level_record").value;
	var condition4 = document.querySelector("#position_name_record").value;
	var first_value = document.querySelector("#first_approval_input_name").value;
	var second_value = document.querySelector("#second_approval_input_name").value;
	var third_value = document.querySelector("#third_approval_input_name").value;
	var fourth_value = document.querySelector("#fourth_approval_input_name").value;
	var fifth_value = document.querySelector("#fifth_approval_input_name").value;
	var first_l_value = document.querySelector("#first_approval_input_position_name").value;
	var second_l_value = document.querySelector("#second_approval_input_position_name").value;
	var third_l_value = document.querySelector("#third_approval_input_position_name").value;
	var fourth_l_value = document.querySelector("#fourth_approval_input_position_name").value;
	var fifth_l_value = document.querySelector("#fifth_approval_input_position_name").value;
	console.log(condition1);
	console.log(condition2);
	console.log(condition3);
	console.log(condition4);
	if(first_value !== '' && second_value !== '' && third_value !== '' && fourth_value !== ''){
		if(condition1 == '' || condition2 == '' || condition3 == '' || condition4 == ''){
			alert("결재자를 선택해주세요.");
			return false;
		}
		if(condition1 !== '' && condition2 !== '' && condition3 !== '' && condition4 !== ''){
			if(condition1 !== first_value && condition1 !== second_value && condition1 !== third_value && condition1 !== fourth_value){
				if(condition3 < first_l_value && condition3 < second_l_value && condition3 < third_l_value && condition3 < fourth_l_value){
					document.querySelector("#fifth_approval_input_name").value = condition1;
					document.querySelector(".fifth_approvaal_name").value = condition1 + '  ' +condition4;
					document.querySelector("#fifth_approval_input_position_name").value = condition3;
					document.querySelector("#fifth_approval_input_email").value = condition2;
				}
				if(condition3 >= first_l_value || condition3 >= second_l_value || condition3 >= third_l_value || condition3 >= fourth_l_value){
					alert("5차 결재자의 직급이 1차,2차,3차,4차 결재자보다 더 낮거나 같습니다. 제대로 결재선을 선택해주세요.");
					return false;
				}
			}
			else{
				alert("결재자는 중복되어 선택할 수 없습니다.");
				return false;
			}
		}
	}
	if(first_value == '' || second_value == '' || third_value == '' || fourth_value == ''){
		alert("1차 2차 3차 4차 결재자를 먼저 선택해주세요.");
		return false;
	}
})
$('#resetbtn1').click(function(){
	document.querySelector("#first_approval_input_name").value = '';
	document.querySelector("#first_approval_input_position_name").value = '';
	document.querySelector("#first_approval_input_email").value = '';
	document.querySelector(".first_approvaal_name").value = '';
	document.querySelector("#second_approval_input_name").value = '';
	document.querySelector("#second_approval_input_position_name").value = '';
	document.querySelector("#second_approval_input_email").value = '';
	document.querySelector(".second_approvaal_name").value = '';
	document.querySelector("#third_approval_input_name").value = '';
	document.querySelector("#third_approval_input_position_name").value = '';
	document.querySelector("#third_approval_input_email").value = '';
	document.querySelector(".third_approvaal_name").value = '';
	document.querySelector("#fourth_approval_input_name").value = '';
	document.querySelector("#fourth_approval_input_position_name").value = '';
	document.querySelector("#fourth_approval_input_email").value = '';
	document.querySelector(".fourth_approvaal_name").value = '';
	document.querySelector("#fifth_approval_input_name").value = '';
	document.querySelector("#fifth_approval_input_position_name").value = '';
	document.querySelector("#fifth_approval_input_email").value = '';
	document.querySelector(".fifth_approvaal_name").value = '';
});
$('#resetbtn2').click(function(){
	document.querySelector("#second_approval_input_name").value = '';
	document.querySelector("#second_approval_input_position_name").value = '';
	document.querySelector("#second_approval_input_email").value = '';
	document.querySelector(".second_approvaal_name").value = '';
	document.querySelector("#third_approval_input_name").value = '';
	document.querySelector("#third_approval_input_position_name").value = '';
	document.querySelector("#third_approval_input_email").value = '';
	document.querySelector(".third_approvaal_name").value = '';
	document.querySelector("#fourth_approval_input_name").value = '';
	document.querySelector("#fourth_approval_input_position_name").value = '';
	document.querySelector("#fourth_approval_input_email").value = '';
	document.querySelector(".fourth_approvaal_name").value = '';
	document.querySelector("#fifth_approval_input_name").value = '';
	document.querySelector("#fifth_approval_input_position_name").value = '';
	document.querySelector("#fifth_approval_input_email").value = '';
	document.querySelector(".fifth_approvaal_name").value = '';
});
$('#resetbtn3').click(function(){
	document.querySelector("#third_approval_input_name").value = '';
	document.querySelector("#third_approval_input_position_name").value = '';
	document.querySelector("#third_approval_input_email").value = '';
	document.querySelector(".third_approvaal_name").value = '';
	document.querySelector("#fourth_approval_input_name").value = '';
	document.querySelector("#fourth_approval_input_position_name").value = '';
	document.querySelector("#fourth_approval_input_email").value = '';
	document.querySelector(".fourth_approvaal_name").value = '';
	document.querySelector("#fifth_approval_input_name").value = '';
	document.querySelector("#fifth_approval_input_position_name").value = '';
	document.querySelector("#fifth_approval_input_email").value = '';
	document.querySelector(".fifth_approvaal_name").value = '';
});
$('#resetbtn4').click(function(){
	document.querySelector("#fourth_approval_input_name").value = '';
	document.querySelector("#fourth_approval_input_position_name").value = '';
	document.querySelector("#fourth_approval_input_email").value = '';
	document.querySelector(".fourth_approvaal_name").value = '';
	document.querySelector("#fifth_approval_input_name").value = '';
	document.querySelector("#fifth_approval_input_position_name").value = '';
	document.querySelector("#fifth_approval_input_email").value = '';
	document.querySelector(".fifth_approvaal_name").value = '';
});
$('#resetbtn5').click(function(){
	document.querySelector("#fifth_approval_input_name").value = '';
	document.querySelector("#fifth_approval_input_position_name").value = '';
	document.querySelector("#fifth_approval_input_email").value = '';
	document.querySelector(".fifth_approvaal_name").value = '';
});

</script>

<script>
$(document).ready(function() {
	$('.summernote').summernote({
		  height: 150,
		  lang: "ko-KR",
		  placeholder: '자유양식 작성'
	});
	$('.summernote').summernote('code', '${draftInfo.forms_content}');
	
	getJsontree();
	getJsontree2();
	
	$(".search-input2").keyup(function () {
        var searchString = $(this).val();
        if(searchString === "리스트" || searchString === "리스" || searchString === "스트" || searchString === "리" || searchString === "스" || searchString === "트" || searchString === "]" || searchString === "["){
        	searchString = ''
        }
        $('#jstree2').jstree('search', searchString);
    });
})
</script>

</body>
</html>