<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조직도</title>
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

<style>
/* 화면구획 나누는 css */
	/* 왼쪽 조직도 css */
	.page-body {
		width: 100%;
	    margin-top: -3.5%;
	  	display: flex;
	    color: #29627e;
	    
	}
	.treediv {
	    width: 22%;
	    height: auto;
	    padding-left: .5rem;
	    margin-left: .5rem;
	    margin-top: 3%;
	    float: left;
	    box-shadow: inset 5px 0 5px -5px #29627e;
	    font-style: italic;
	    color: #29627e;
	}
	/* 오른쪽 직원정보 css */
	.employeediv {
	    width: 78%;
	    height: fit-content;
	    padding-right: .5rem;
	    margin-right: .5rem;
	    margin-top: 3%;
	    float: right;
	    color: #29627e;
	    display: flex;
	    flex-wrap: wrap;
	}
	
	
/* 조직도 css */
	/* 최상단 회사명 css */
	#companyname {
		font-weight: bolder; 
	}
	/* 최상단 회사명 hover css */
	#companyname:hover {
		background-color: rgba(231, 244, 249);
		cursor: pointer;
	}
	/* jstree 아이콘 제거 */
	.jstree li > a > .jstree-icon {  
		display:none !important; 
	} 
	/* jstree 글자 css */
	.jstree li > a{  
		font-weight: bold; 
	} 
	
	
/* 조직도 검색 css */
	/* 조직도 검색 타이틀 */
	#searchdept {
		margin-top:3%;
		font-weight: bold;
	}
	/* 조직도 검색 input 박스 */
	#search-input {
		width: 75%;
		margin-bottom: 5%;
	}
	
	
/* 조직도 열기 펼치기 css */
	/* 열기 펼치기 구역 css */
	#showalldept {
		margin-top:5%;
	}
	/* 열기 펼치기 버튼 css */
	#showallbtn, #closeallbtn {
		border: 1px solid transparent;
		display: inline;
		width: 40%;
	    padding: 10px 5px;
	    font-weight: bold;
	    transition: 0.25s;
	    background-color: aliceblue;
	    color: #1e6b7b;
	    margin-bottom: 3%;
	    margin-left: 3%;
	}
	/* 열기 펼치기 버튼 hover css */
	#showallbtn:hover, #closeallbtn:hover {
		border: 1px solid #fb9300;
	}
	
	
/* 모달창 부서 추가-수정-삭제 css */
	/* 제목 css */
	#editdepttitle {
		margin-top:1.5%;
		margin-bottom:1.5%;
		font-weight: bold;
	}
	/* 버튼 css */
	#adddeptbtn, #changedeptbtn, #deletedeptbtn {
		border: 1px solid transparent;
		display: block;
		width: 40%;
	    padding: 10px 5px;
	    font-weight: bold;
	    transition: 0.25s;
	    background-color: aliceblue;
	    color: #1e6b7b;
	    margin-bottom: 3%;
	    margin-left: 3%;
	}
	/* 버튼 hover css */
	#adddeptbtn:hover, #changedeptbtn:hover, #deletedeptbtn:hover {
		border: 1px solid #fb9300;
	}


/* 직원정보 css */
	/* 부서총원 count 정보 */
	.deptempcount {
	    width: 100%;
	    font-weight: bold;
	}
	/* 부서원정보 안내문 */
	.deptempguide {
	    width: 100%;
	    margin-top: 2.5%;
	    margin-bottom: 1%;
	    font-weight: bold;
	}
	#emptable {
		border: 2px double #29627e;
		width: 300px;
		margin-right: 1%;
		margin-bottom: 1%;
	}
	
	
/* 모달창 css */
	/* 모달 화면 위치 */
	.modal1, .modal2, .modal3 {
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
	.bg1, .bg2, .bg3 {
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.6);
	}
	/* 모달 내부 css */
	.modalBox1, .modalBox2, .modalBox3 {
	    position: absolute;
	    background-color: #fff;
	    width: 900px;
	    height: 550px;
	    padding: 15px;
	 }
	 /* 모달 화면 버튼 css */
	.modalBox1 .closeBtn1, .modalBox2 .closeBtn2, .modalBox3 .closeBtn3 {
	    position: absolute;
	    width: 80px;
	    margin-left: 22%; 
	    margin-top: 47%;
	    padding: 10px 5px;
	    border: 1px solid transparent;
	    transition: 0.25s;
	    background-color: aliceblue;
	    color: #1e6b7b;
	    font-weight: bold;
	}
	/* 모달 화면 버튼 hover css */
	.modalBox1 .closeBtn1:hover, .modalBox2 .closeBtn2:hover, .modalBox3 .closeBtn3:hover {
		border: 1px solid #fb9300;
	}
/* 숨김처리 css */
	.hidden1, .hidden2, .hidden3 {
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
	    height: fit-content;
	    padding-right: .5rem;
	    margin-right: .5rem;
	    float: right;
	    color: #29627e;
	    font-weight: bold;
	}
	/* 초기화 버튼 css */
	#resetbtn, #resetbtn3 {
	   	width: 60px;
	    border: 1px solid transparent;
	    transition: 0.25s;
	    background-color: aliceblue;
	    color: #1e6b7b;
	    font-weight: bold;
	}
	#resetbtn:hover, #resetbtn3:hover {
	   	border: 1px solid #fb9300;
	}
	/* 부서 생성 버튼 css */
	#deptcreatesubmitbtn, #deptnameeditbtn, #deptplaceeditbtn, #deptnamecheckbtn, #deptdeletebtn {
		display: block;
		margin-top: 2%;
		width: 100px;
		height: 40px;
	    border: 1px solid transparent;
	    transition: 0.25s;
	    background-color: aliceblue;
	    color: #1e6b7b;
	    font-weight: bold;
	}
	#selectfirst, #deptnamecheckbtn2, #selectsecond, #selectthird, #selectfourth {
		width: 120px;
		height: 40px;
	    border: 1px solid transparent;
	    transition: 0.25s;
	    background-color: aliceblue;
	    color: #1e6b7b;
	    font-weight: bold;
	}
	#selectfirst:hover, #deptnamecheckbtn2:hover, #selectsecond:hover, #selectthird:hover, #selectfourth:hover {
		border: 1px solid #fb9300;
	}
	#deptcreatesubmitbtn:hover, #deptnameeditbtn:hover, #deptplaceeditbtn:hover, #deptnamecheckbtn:hover, #deptdeletebtn:hover {
		border: 1px solid #fb9300;
	}
	/* 모달 내부 jstree css */
	#jstree2, #jstree3, #jstree4 {
		height: 300px;
		overflow: auto;
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
								<h4>조직도</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">조직도</a></li>
									<li class="breadcrumb-item active" aria-current="page">Grougle 조직도</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
					<div class="page-body">
							<div class="treediv">
								<div id="showalldept"><button id="showallbtn">펼치기</button><button id="closeallbtn">접기</button></div>
								<div id="searchdept">부서검색</div>
								<input id="search-input" class="search-input" placeholder="부서명 입력"/>
								<div id="companyname">Grougle</div>
								<div id="jstree"></div>
								<div id="editdepttitle">부서 추가/수정/삭제</div>
								<div id="editdeptdiv">
									<button id="adddeptbtn" class="openBtn1" onclick="deptaddevent()">추가</button>
									<button id="changedeptbtn" class="openBtn2" onclick="depteditevent()">수정</button>
									<button id="deletedeptbtn" class="openBtn3" onclick="deptdeleteevent()">삭제</button>
								</div>
							</div>
							<div class="employeediv">
								<c:choose>
									<c:when test="${empty companytreeEmployeelist}">
										<div>생성된 조직도가 없습니다. 관리자에게 문의해주시기 바랍니다.</div>
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
							</div>
					</div>
				</div>
					<div class="modal1 hidden1">
					  <div class="bg1"></div>
					  <div class="modalBox1">
					  <div id="editdepttitle">부서 추가</div>
					  	<div id="jstreeshow">
					  		<div id="searchdept">부서검색</div>
								<input id="search-input2" class="search-input2" placeholder="부서명 입력"/>
					  		<div style="margin-top: 5%;">Grougle</div>
					  		<div id="jstree2"></div>
					  	</div>
					  	<div id="datainput">
					  		<form id="deptnewnameform" method="post" action="<%=request.getContextPath() %>/companytree/insertdept">
					  			<div>1. 신규 부서명 입력</div>
					  			<input type="text" id="dept_name1" name="dept_name" placeholder="신규 부서명 입력" required>
					  			<input type="text" id="dept_check_yn" required hidden>
					  			<button type="button" id="deptnamecheckbtn">중복확인</button>
					  			<br>
					  			<div>2. 상위 부서명 입력</div>
					  			<div>(조직도에서 선택하여 입력)</div>
					  			<div>(최상위 부서일 경우 공란)</div>
					  			<input type="text" id="upper_dept_name_input" name="upper_dept_name_input" placeholder="상위 부서 선택" readonly="readonly">
					  			<input type="text" id="upper_dept_no" name="upper_dept_no" hidden>
					  			<button type="button" id="resetbtn" onclick="reset()">초기화</button>
					  			<button type="submit" id="deptcreatesubmitbtn">부서생성</button>
					  		</form>
					  	</div>
					    <button class="closeBtn1">창 닫기</button>
					  </div>
					</div>
					
					
					<div class="modal2 hidden2">
					  <div class="bg2"></div>
					  <div class="modalBox2">
					  <div id="editdepttitle">부서명 수정 & 부서 소속 변경</div>
					  	<div id="jstreeshow">
					  		<div id="searchdept">부서검색</div>
							<input id="search-input3" class="search-input3" placeholder="부서명 입력"/>
					  		<div style="margin-top: 5%;">Grougle</div>
					  		<div id="jstree3"></div>
					  	</div>
					  	<div id="datainput">
					  			<form id="deptnameform" method="post" action="<%=request.getContextPath() %>/companytree/updatedeptname">
						  			<div>1. 수정 전 부서명 입력</div>
						  			<input type="text" id="dept_name2" name="dept_name" placeholder="부서명 입력" required readonly="readonly">
						  			<button id="selectfirst">조직도에서 입력</button>
						  			<div style="margin-top: 2%;">2. 수정 후 부서명 입력</div>
						  			<input type="text" id="dept_name_new" name="dept_name_new" placeholder="부서명 입력" required>
						  			<input type="text" id="dept_check_yn2" required hidden>
						  			<button type="button" id="deptnamecheckbtn2">중복확인</button>
						  			<button type="submit" id="deptnameeditbtn">부서명 수정</button>
					  			</form>
					  		<hr style="border: 0px; background-color: #29627e; height: 4px;">
					  			<form id="deptplaceform" name="deptplaceform" method="post" action="<%=request.getContextPath() %>/companytree/updatedeptplace">
						  			<div style="margin-top: 2%;">1. 소속을 바꿀 부서명 입력</div>
						  			<input type="text" id="dept_name3" name="dept_name" placeholder="부서명 입력" readonly="readonly" required/>
						  			<input type="text" id="dept_name3_deptno" hidden required/>
						  			<button id="selectsecond">조직도에서 입력</button>
						  			<div style="margin-top: 2%;">2. 상위 부서 선택</div>
						  			<div>(주의! 최상위 부서일 경우 공란, 하위 부서는 일괄 이동)</div>
						  			<div>(1번 항목의 소속을 바꿀 부서는 선택 불가)</div>
						  			<input type="text" id="upper_dept_name_input2" name="upper_dept_name" placeholder="상위 부서 선택" readonly="readonly" required/>
						  			<input type="text" id="upper_dept_no2" name="upper_dept_no" hidden required/>
						  			<input type="text" id="preventautosub" hidden required/>
						  			<button id="selectthird">조직도에서 입력</button>
						  			<button type="button" id="deptplaceeditbtn">소속 수정</button>
						  		</form>
					  	</div>
					    <button class="closeBtn2">창 닫기</button>
					  </div>
					</div>
					
					
					<div class="modal3 hidden3">
					  <div class="bg3"></div>
					  <div class="modalBox3">
					  <div id="editdepttitle">부서 삭제</div>
					  	<div id="jstreeshow">
					  		<div id="searchdept">부서검색</div>
							<input id="search-input4" class="search-input4" placeholder="부서명 입력"/>
					  		<div style="margin-top: 5%;">Grougle</div>
					  		<div id="jstree4"></div>
					  	</div>
					  	<div id="datainput">
					  			<form id="deptdelete" name="deptdeletefrm" method="post" action="<%=request.getContextPath() %>/companytree/deletedept">
						  			<div>삭제할 부서명 입력</div>
						  			<div>(하위 부서 있을 시 삭제 불가)</div>
						  			<input type="text" id="dept_name4" name="dept_name" placeholder="삭제할 부서명 입력" required readonly="readonly">
						  			<input type="text" id="hiddendeptno" name="dept_no" required hidden>
						  			<input type="text" id="preventautosub2" required hidden>
						  			<button id="selectfourth">조직도에서 입력</button>
						  			<button type="button" id="deptdeletebtn">부서 삭제</button>
					  			</form>
					  	</div>
					    <button class="closeBtn3">창 닫기</button>
					  </div>
					</div>
		</div>
	</div>


<script>
//ajax의 형식으로 트리 구조 정립 - 앞으로 계속 ajax로 사용을 더 할 거라 ajax로 구현
function getJsontree() {
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
			$("#jstree").jstree({            
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
			//jstree2 구현부         
			$("#jstree2").jstree({            
				core: {                
					data: company             
					},            
					types: {                
						'default': {                    
							'icon': 'jstree-folder'               
						}            
					},           
					plugins: ['wholerow', 'types', 'search', 'themes', 'sort'],
					 "search": {
		                    "case_sensitive": false,
		                    "show_only_matches": true
		                }
				})        
				.bind('loaded.jstree', function(event, data){
					$(this).jstree(true).set_icon(node.id, "이미지파일경로");   
				})
			//jstree3 구현부         
			$("#jstree3").jstree({            
				core: {                
					data: company                
					},            
					types: {                
						'default': {                    
							'icon': 'jstree-folder'               
						}            
					},           
					plugins: ['wholerow', 'types', 'search', 'themes', 'sort'],
					 "search": {
		                    "case_sensitive": false,
		                    "show_only_matches": true
		                }
				})        
				.bind('loaded.jstree', function(event, data){
					$(this).jstree(true).set_icon(node.id, "이미지파일경로"); 
				})    
				//jstree4 구현부         
				$("#jstree4").jstree({            
					core: {                
						data: company               
						},            
						types: {                
							'default': {                    
								'icon': 'jstree-folder'               
							}            
						},           
						plugins: ['wholerow', 'types', 'search', 'themes', 'sort'],
						 "search": {
			                    "case_sensitive": false,
			                    "show_only_matches": true
			                }
					})        
					.bind('loaded.jstree', function(event, data){
						$(this).jstree(true).set_icon(node.id, "이미지파일경로"); 
					})               
	},
    error:function (data) {
        alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
    }
});
}


//로딩 완료시 트리 불러오고 검색엔진 활성화
$(document).ready(function(){
	//jstree 로드
	getJsontree();
	
	//검색엔진 활성화
	$(".search-input").keyup(function () {
        var searchString = $(this).val();
        $('#jstree').jstree('search', searchString);
    });
	//검색엔진 활성화2
	$(".search-input2").keyup(function () {
        var searchString = $(this).val();
        $('#jstree2').jstree('search', searchString);
    });
	//검색엔진 활성화3
	$(".search-input3").keyup(function () {
        var searchString = $(this).val();
        $('#jstree3').jstree('search', searchString);
    });
	//검색엔진 활성화4
	$(".search-input4").keyup(function () {
        var searchString = $(this).val();
        $('#jstree4').jstree('search', searchString);
    });
	
	
//노드 선택 이벤트 - 선택 시 실행할 이벤트 입력하면 됨  
//메인조직도화면 - 직원정보 호출부
	//선택된 부서에 대한 부서원 호출(jsp 호출)
	$("#jstree").bind('select_node.jstree', function(event, data){ 
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
					url: "<%=request.getContextPath() %>/companytree/emplistajax", 
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
	//전체에 대한 부서원 호출(jsp 호출)
	$("#companyname").click(function(event, data){ 
			function ajaxcompanyemplist() {
				console.log("ajax 진입");
				$.ajax({    
					url: "<%=request.getContextPath() %>/companytree/empalllistajax", 
				    type: 'get',
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
			ajaxcompanyemplist();
	}) 
//부서추가, 수정, 삭제 조직도화면 - 부서 선택 이벤트
	//부서추가 - 선택된 부서에 대한 자동입력 부분
	$("#jstree2").bind('select_node.jstree', function(event, data){ 
			var dept_no = data.instance.get_node(data.selected).id;        //id 가져오기    
			var type = data.instance.get_node(data.selected).type;    //type 가져오기    
			var parent = data.instance.get_node(data.selected).parent;    //paht 가져오기    
			var dept_name = data.instance.get_node(data.selected).text;    //paht 가져오기    
			console.log(dept_no);
			console.log(parent);
			console.log(dept_name);
			document.querySelector("#upper_dept_name_input").value = dept_name;
			document.querySelector("#upper_dept_no").value = dept_no;
	}) 
	//부서추가 - 부서명 중복확인
	$("#deptnamecheckbtn").on("click",function(){
		var dept_name = document.querySelector("#dept_name1").value;
		console.log(dept_name);
		if(dept_name != '')
		$.ajax({    
			url: "<%=request.getContextPath() %>/companytree/deptcheckajax", 
		    type: 'get',
		    data: {'dept_name': dept_name},
		    dataType : 'json',
		    success: function(data){ 
		    	console.log("ajax 성공진입");    
		    	if (data == 0) {
		    		 alert("사용가능한 부서명입니다.\n해당 부서명으로 고정되었습니다.\n변경을 희망하시면 페이지를 새로고침 후 다시 진행해주시기 바랍니다.");
	                    //결과값을 받아와서 중복이 아니라면 중복체그 확인 여부에 y를 입력
	                    $("#dept_check_yn").val('y');
	                    $("#dept_name1").prop('readonly', true);
                } else {
                	alert("부서명이 이미 존재하거나 사용할 수 없는 형식입니다. 다른 부서명을 입력해주세요.");
                }
			},
		    error:function (data) {
		    	alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
		    }
	})})
	//부서추가 - 중복확인 체크 후 submit하는 함수
	$("#deptcreatesubmitbtn").on("click",function(){
		var condition1 = document.querySelector("#dept_check_yn").value;
		if(condition1 == ''){
			alert("부서명에 대한 중복확인을 해주시기 바랍니다.");
			return false;
		}
		if(condition1 !== ''){
			document.deptnewnameform.submit();;
		}
	})
	//부서수정 - 선택된 부서에 대한 자동입력 부분
	$("#jstree3").bind('select_node.jstree', function(event, data){ 
			var dept_no = data.instance.get_node(data.selected).id;        //id 가져오기    
			var type = data.instance.get_node(data.selected).type;    //type 가져오기    
			var parent = data.instance.get_node(data.selected).parent;    //paht 가져오기    
			var dept_name = data.instance.get_node(data.selected).text;    //paht 가져오기    
			console.log(dept_no);
			console.log(parent);
			console.log(dept_name);
			$("#selectfirst").on("click",function(){
				document.querySelector("#dept_name2").value = dept_name;
			})
			$("#selectsecond").on("click",function(){
				document.querySelector("#dept_name3").value = dept_name;
				document.querySelector("#dept_name3_deptno").value = dept_no;
			})
			$("#selectthird").on("click",function(){
				document.querySelector("#upper_dept_name_input2").value = dept_name;
				document.querySelector("#upper_dept_no2").value = dept_no;
				var condition1 = document.querySelector("#dept_name3").value;
				var condition2 = document.querySelector("#upper_dept_name_input2").value;
				if( condition1==condition2  && condition1!==''){
					document.querySelector("#upper_dept_name_input2").value='';
					document.querySelector("#upper_dept_no2").value='';
				}
			})
	})
	//부서수정 - 부서명 중복확인
	$("#deptnamecheckbtn2").on("click",function(){
		var dept_name = document.querySelector("#dept_name_new").value;
		console.log(dept_name);
		if(dept_name != '')
		$.ajax({    
			url: "<%=request.getContextPath() %>/companytree/deptcheckajax", 
		    type: 'get',
		    data: {'dept_name': dept_name},
		    dataType : 'json',
		    success: function(data){ 
		    	console.log("ajax 성공진입");    
		    	if (data == 0) {
		    		 alert("사용가능한 부서명입니다.\n해당 부서명으로 고정되었습니다.\n변경을 희망하시면 페이지를 새로고침 후 다시 진행해주시기 바랍니다.");
	                    //결과값을 받아와서 중복이 아니라면 중복체그 확인 여부에 y를 입력
	                    $("#dept_check_yn2").val('y');
	                    $("#dept_name_new").prop('readonly', true);
                } else {
                	alert("부서명이 이미 존재하거나 사용할 수 없는 형식입니다. 다른 부서명을 입력해주세요.");
                }
			},
		    error:function (data) {
		    	alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
		    }
	})})
	//부서수정 - 부서 소속 관련 체크 후 submit하는 함수
	$("#deptplaceeditbtn").on("click",function(){
		var condition1 = document.querySelector("#dept_name3").value;
		var condition2 = document.querySelector("#upper_dept_name_input2").value;
		if(condition1 == ''){
			alert("소속을 바꿀 부서명을 제대로 입력해주시기 바랍니다.");
		}
		if(condition2 !== '' && condition1 !== ''){
			var answer;
			answer = confirm("진행하시겠습니까?");
				if(answer){
					var dept_no1 = document.querySelector("#dept_name3_deptno").value;
					var dept_no2 = document.querySelector("#upper_dept_no2").value;
						$.ajax({    
							url: "<%=request.getContextPath() %>/companytree/deptupdowncheck", 
						    type: 'get',
						    data: {'dept_no1': dept_no1
						    	,'dept_no2': dept_no2
						    	},
						    dataType : 'json',
						    success: function(data){ 
						    	console.log("ajax 성공진입");    
						    	if (data > 0) {
						    		 alert("직속 부서 간의 직접적인 소속 변경은 불가합니다.\n부서 추가/수정/삭제 등을 사용하여 직속 부서의 관계를 정리한 후 다시 시도해 주시기 바랍니다.");
				                } else {
				                	document.deptplaceform.submit();
				                }
							},
						    error:function (data) {
						    	alert("에러가 발생하였습니다. 다시 한번 시도하여 주시고 문제가 지속될 시 관리자에게 문의하여 주시기 바랍니다.");
						    }
						})
				}
		}
		if(condition2 == '' && condition1 !== ''){
			var answer2;
			answer2 = confirm("진행하시겠습니까?");
			if(answer2){
				document.deptplaceform.submit();
			}
		}
	})
	//부서삭제 - 선택된 부서에 대한 자동입력 부분
	$("#jstree4").bind('select_node.jstree', function(event, data){ 
			var dept_no = data.instance.get_node(data.selected).id;        //id 가져오기    
			var type = data.instance.get_node(data.selected).type;    //type 가져오기    
			var parent = data.instance.get_node(data.selected).parent;    //paht 가져오기    
			var dept_name = data.instance.get_node(data.selected).text;    //paht 가져오기    
			console.log(dept_no);
			console.log(parent);
			console.log(dept_name);
			$("#selectfourth").on("click",function(){
				document.querySelector("#dept_name4").value = dept_name;
				document.querySelector("#hiddendeptno").value = dept_no;
			})
	})
	//부서삭제 - 체크 후 submit하는 함수
	$("#deptdeletebtn").on("click",function(){
		var dept_name = document.querySelector("#dept_name4").value;
		var dept_no = document.querySelector("#hiddendeptno").value;
		if(dept_no == ''){
			alert("삭제할 부서명을 제대로 입력해주시기 바랍니다.");
		}
		if(dept_no !== ''){
			$.ajax({    
				url: "<%=request.getContextPath() %>/companytree/deptcheckajax2", 
			    type: 'get',
			    data: {'dept_no': dept_no},
			    dataType : 'json',
			    success: function(data){ 
			    	console.log("ajax 성공진입");    
			    	if (data > 0) {
			    		 alert("하위 부서가 있을 경우 삭제가 불가합니다.\n하위 부서를 모두 삭제 혹은 수정하여 주시고 다시 시도해 주시기 바랍니다.");
	                } else {
	                	var answer3;
	        			answer3 = confirm("삭제하시겠습니까?");
	        			if(answer3){
	        				document.deptdeletefrm.submit();
	                }
				}},
			    error:function (data) {
			    	alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
			    }
			})
			
		}
		})
		
});


//부서추가, 수정, 삭제 조직도화면 - 버튼으로 reset하기
function reset(){
	$("#upper_dept_name_input").val('');
}
$('#resetbtn').click(function(){
	reset();
});
function reset3(){
	$("#").val('');
}
$('#resetbtn3').click(function(){
	reset();
});


//메인화면 - 조직도 펼치기, 접기 기능
$('#showallbtn').click(function(){
	$('#jstree').jstree("open_all");
});
//조직도 접기 기능
$('#closeallbtn').click(function(){
	$('#jstree').jstree("close_all");
});


//모달창 관련 상태변경 기능부
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
const open3 = () => {
	document.querySelector(".modal3").classList.remove("hidden3");
	$('#jstree4').jstree("open_all");
}
const close3 = () => {
	document.querySelector(".modal3").classList.add("hidden3");
}
//모달창 버튼 열리고 닫히는 이벤트 리스너
document.querySelector(".openBtn1").addEventListener("click", open1);
document.querySelector(".closeBtn1").addEventListener("click", close1);
document.querySelector(".bg1").addEventListener("click", close1);
document.querySelector(".openBtn2").addEventListener("click", open2);
document.querySelector(".closeBtn2").addEventListener("click", close2);
document.querySelector(".bg2").addEventListener("click", close2);
document.querySelector(".openBtn3").addEventListener("click", open3);
document.querySelector(".closeBtn3").addEventListener("click", close3);
document.querySelector(".bg3").addEventListener("click", close3);

</script>						
</body>
</html>