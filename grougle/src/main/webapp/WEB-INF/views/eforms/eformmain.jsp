<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 양식</title>
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
	/* 오른쪽 양식 버튼 위치부 css */
	.formslistdivupper {
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
	/* 오른쪽 직원정보 css */
	.formslistdiv {
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
	#everyforms {
		font-weight: bolder; 
	}
	/* 최상단 회사명 hover css */
	#everyforms:hover {
		background-color: rgba(231, 244, 249);
		cursor: pointer;
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
	
	
/* 조직도 검색 css */
	/* 조직도 검색 타이틀 */
	#searchforms {
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
	#showallforms {
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
	#makenewformbtn {
		border: 1px solid transparent;
		display: inline;
		width: 15%;
	    padding: 10px 5px;
	    font-weight: bold;
	    transition: 0.25s;
	    background-color: rgb(100,150,255, 0.3);
	    color: #1e6b7b;
	    margin-bottom: 3%;
	    margin-left: 15%;
	    border-radius: 20px;
	}
	#showformcontentbtn, #editformbtn, #gotoeapprovalbtn {
		border: 1px solid transparent;
		display: inline;
		width: 15%;
	    padding: 10px 5px;
	    font-weight: bold;
	    transition: 0.25s;
	    background-color: aliceblue;
	    color: #1e6b7b;
	    margin-bottom: 3%;
	    margin-right: 3%;
	    border-radius: 20px;
	}
	/* 열기 펼치기 버튼 hover css */
	#showallbtn:hover, #closeallbtn:hover, #showformcontentbtn:hover, #editformbtn:hover, #gotoeapprovalbtn:hover, #makenewformbtn:hover {
		border: 1px solid #fb9300;
	}
	
	
/* 모달창 부서 추가-수정-삭제 css */
	/* 제목 css */
	#editformcategorytitle {
		margin-top:1.5%;
		margin-bottom:1.5%;
		font-weight: bold;
	}
	/* 버튼 css */
	#addcategorybtn, #changecategorytbtn, #deletecategorybtn {
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
	#addcategorybtn:hover, #changecategorytbtn:hover, #deletecategorybtn:hover {
		border: 1px solid #fb9300;
	}


/* 직원정보 css */
	/* 부서총원 count 정보 */
	.formscount {
	    width: 100%;
	    font-weight: bold;
	}
	/* 부서원정보 안내문 */
	.formslisttitle {
	    width: 100%;
	    margin-top: 2.5%;
	    margin-bottom: 1%;
	    font-weight: bold;
	}
	#formlisttable {
		border: 2px double #29627e;
		width: 300px;
		margin-right: 1%;
		margin-bottom: 1%;
	}
	#formlisttable:hover {
		border: 2px double #fb9300;
		cursor: pointer;
	}
/*
	#formlisttable:focus {
		border: 2px double #29627e;
		background-color: rgba(247, 180, 84, 0.3);
	}
*/
	#forms_title {
		font-weight: bold;
	}
	
	
/* 모달창 css */
	/* 모달 화면 위치 */
	.modal1, .modal2, .modal3, .modal4 {
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
	.bg1, .bg2, .bg3, .bg4 {
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.6);
	}
	/* 모달 내부 css */
	.modalBox1, .modalBox2, .modalBox3, .modalBox4 {
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
	    margin-top: 50%;
	    padding: 10px 5px;
	    border: 1px solid transparent;
	    transition: 0.25s;
	    background-color: aliceblue;
	    color: #1e6b7b;
	    font-weight: bold;
	}
	.modalBox4 .closeBtn4 {
	    position: fixed;
	    width: 10%;
	    margin-left: 23%;
	    margin-top: 500px;
	    padding: 10px 5px;
	    border: 1px solid transparent;
	    transition: 0.25s;
	    background-color: aliceblue;
	    color: #1e6b7b;
	    font-weight: bold;
	}
	/* 모달 화면 버튼 hover css */
	.modalBox1 .closeBtn1:hover, .modalBox2 .closeBtn2:hover, .modalBox3 .closeBtn3:hover, .modalBox4 .closeBtn4:hover {
		border: 1px solid #fb9300;
	}
/* 숨김처리 css */
	.hidden1, .hidden2, .hidden3, .hidden4 {
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
	#categorycreatesubmitbtn, #categorynameeditbtn, #categoryplaceeditbtn, #categorytnamecheckbtn, #categorydeletebtn, #formdeletebtn {
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
	#selectfirst, #categorytnamecheckbtn2, #selectsecond, #selectthird, #selectfourth, #selectfifth {
		width: 120px;
		height: 40px;
	    border: 1px solid transparent;
	    transition: 0.25s;
	    background-color: aliceblue;
	    color: #1e6b7b;
	    font-weight: bold;
	}
	#selectfirst:hover, #categorytnamecheckbtn2:hover, #selectsecond:hover, #selectthird:hover, #selectfourth:hover, #selectfifth:hover {
		border: 1px solid #fb9300;
	}
	#categorycreatesubmitbtn:hover, #categorynameeditbtn:hover, #categoryplaceeditbtn:hover, #categorytnamecheckbtn:hover, #categorydeletebtn:hover, #formdeletebtn:hover {
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
								<h4>전자결재 양식</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">홈</a></li>
									<li class="breadcrumb-item"><a href="index.html">전자결재</a></li>
									<li class="breadcrumb-item active" aria-current="page">전자결재 양식</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				
					<div class="page-body">
						<div class="treediv">
								<div id="showallforms"><button id="showallbtn">펼치기</button><button id="closeallbtn">접기</button></div>
								<div id="searchforms">양식 검색</div>
								<input id="search-input" class="search-input" placeholder="양식 검색"/>
								<div id="everyforms">모든 양식</div>
								<div id="jstree1"></div>
								<div id="editformcategorytitle">양식분류 추가/수정/삭제</div>
								<div id="editformbtndiv">
									<button id="addcategorybtn" class="openBtn1">추가</button>
									<button id="changecategorytbtn" class="openBtn2">수정</button>
									<button id="deletecategorybtn" class="openBtn3">삭제</button>
								</div>
							</div>
							<div class="formslistdivupper">
								
								<button id="showformcontentbtn" class="openBtn4">양식 미리보기</button>
								<button id="editformbtn">양식 수정</button>
								<button id="gotoeapprovalbtn">기안하기</button>
								<button id="makenewformbtn">양식 만들기</button>
								<input id="hiddenformfocusinfoformtitle" hidden>
								<input id="hiddenformfocusinfoformcategornname" hidden>
								<input id="hiddenformfocusinfoformcreator" hidden>
								
								<div class="formslistdiv">
								<c:choose>
									<c:when test="${empty eformlist}">
										<div>생성된 양식이 없습니다.</div>
									</c:when>
									<c:when test="${!empty eformlist}">
										<div class="formscount">양식의 갯수: 총 ${fn:length(eformlist)}개</div>
										<div class="formslisttitle">양식 리스트(제목순)</div>
										<c:forEach items="${eformlist }" var="formlist" varStatus="status">
											<table id="formlisttable" tabindex="1">
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
													<td>생성일자: </td>
													<td><div id="create_date" class="${status.count }">${formlist.create_date }</div></td>
												</tr>
											</table>
										</c:forEach>
									</c:when>
								</c:choose>
								</div>
								
							</div>												
					</div>
			</div>
			
			
			<div class="modal1 hidden1">
					  <div class="bg1"></div>
					  <div class="modalBox1">
					  <div id="modalttitle">분류 추가</div>
					  	<div id="jstreeshow">
					  		<div id="searchcategorydiv">분류검색</div>
								<input id="search-input2" class="search-input2" placeholder="분류명 입력"/>
					  		<div style="margin-top: 5%;">양식분류</div>
					  		<div id="jstree2"></div>
					  	</div>
					  	<div id="datainput">
					  		<form id="categorynewnameform" method="post" action="<%=request.getContextPath() %>/eform/addcategory">
					  			<div>1. 신규 분류 입력</div>
					  			<input type="text" id="form_name1" name="category_name" placeholder="신규 분류 입력" required>
					  			<input type="text" id="categoryname_check_yn" required hidden>
					  			<button type="button" id="categorytnamecheckbtn">중복확인</button>
					  			<br>
					  			<div>2. 상위 분류 입력</div>
					  			<div>(분류창에서 선택하여 입력)</div>
					  			<div>(최상위 분류일 경우 공란으로 둘 것)</div>
					  			<div>(분류가 아닌 양식 선택 시 소속된 분류로 자동 선택)</div>
					  			<input type="text" id="upper_category_name" name="upper_category_name" placeholder="상위 분류 선택" readonly="readonly">
					  			<input type="text" id="upper_category_no" name="upper_category_no" hidden>
					  			<button type="button" id="resetbtn" onclick="reset()">초기화</button>
					  			<button type="submit" id="categorycreatesubmitbtn">분류 생성</button>
					  		</form>
					  	</div>
					    <button class="closeBtn1">창 닫기</button>
					  </div>
					</div>
					
					
					<div class="modal2 hidden2">
					  <div class="bg2"></div>
					  <div class="modalBox2">
					  <div id="modalttitle">분류 명칭 수정 & 분류/양식 소속 변경</div>
					  	<div id="jstreeshow">
					  		<div id="searchcategorydiv">분류검색</div>
							<input id="search-input3" class="search-input3" placeholder="분류명 입력"/>
					  		<div style="margin-top: 5%;">양식분류</div>
					  		<div id="jstree3"></div>
					  	</div>
					  	<div id="datainput">
					  			<form id="categorynameform" method="post" action="<%=request.getContextPath() %>/eform/updatecategoryname">
						  			<div>1. 수정 전 분류 명칭 입력 (양식 선택 불가)</div>
						  			<input type="text" id="category_name2" name="category_name" placeholder="분류/양식 입력" required readonly="readonly">
						  			<input type="text" id="hiddencategoryno2" name="category_no" required hidden>
						  			<button id="selectfirst">분류창에서 입력</button>
						  			<div style="margin-top: 2%;">2. 수정 후 분류 명칭 입력</div>
						  			<input type="text" id="category_name_new" name="category_name_new" placeholder="분류/양식 명칭 입력" required>
						  			<input type="text" id="categoryname_check_yn2" required hidden>
						  			<button type="button" id="categorytnamecheckbtn2">중복확인</button>
						  			<button type="submit" id="categorynameeditbtn">명칭 수정</button>
					  			</form>
					  		<hr style="border: 0px; background-color: #29627e; height: 4px;">
					  			<form id="categoryplaceform" name="categoryplaceform" method="post" action="<%=request.getContextPath() %>/eform/updatecategoryplace">
						  			<div style="margin-top: 2%;">1. 소속을 바꿀 분류/양식 입력</div>
						  			<input type="text" id="category_name3" name="category_name" placeholder="분류명 입력" readonly="readonly" required/>
						  			<input type="text" id="hiddencategoryno3" name="category_no" required hidden>
						  			<button id="selectsecond">분류창에서 입력</button>
						  			<div style="margin-top: 2%;">2. 상위 분류 선택</div>
						  			<div>(분류만 선택 가능, 1번과 동일한 분류 선택 불가)</div>
						  			<div>(최상위 분류일 경우 공란, 하위 분류 및 양식 일괄 이동)</div>
						  			<input type="text" id="upper_category_name2" name="upper_category_name" placeholder="상위 분류 선택" readonly="readonly" required/>
						  			<input type="text" id="upper_category_no2" name="upper_category_no" hidden required/>
						  			<input type="text" id="preventautosub" hidden required/>
						  			<button id="selectthird">분류창에서 입력</button>
						  			<button type="button" id="categoryplaceeditbtn">소속 수정</button>
						  		</form>
					  	</div>
					    <button class="closeBtn2">창 닫기</button>
					  </div>
					</div>
					
					
					<div class="modal3 hidden3">
					  <div class="bg3"></div>
					  <div class="modalBox3">
					  <div id="modalttitle">분류/양식 삭제</div>
					  	<div id="jstreeshow">
					  		<div id="searchcategorydiv">분류/양식 검색</div>
							<input id="search-input4" class="search-input4" placeholder="분류/양식명 입력"/>
					  		<div style="margin-top: 5%;">양식분류</div>
					  		<div id="jstree4"></div>
					  	</div>
					  	<div id="datainput">
					  			<form id="categorydelete" name="categorydeletefrm" method="post" action="<%=request.getContextPath() %>/eform/deletecategory">
						  			<div>삭제할 분류 선택</div>
						  			<div>(분류만 삭제 가능)</div>
						  			<div>(하위 분류가 있을 시 분류 수정/삭제 후 삭제 가능)</div>
						  			<div>(주의! 삭제할 분류에 양식이 있을 시, 양식 일괄 삭제)</div>
						  			<input type="text" id="category_name4" name="category_name" placeholder="삭제할 분류명" required readonly="readonly">
						  			<input type="text" id="hiddencategoryno" name="category_no" required hidden>
						  			<input type="text" id="preventautosub2" required hidden>
						  			<button id="selectfourth">분류창에서 입력</button>
						  			<button type="button" id="categorydeletebtn">분류 삭제</button>
					  			</form>
					  			<hr style="border: 0px; background-color: #29627e; height: 4px;">
					  			<form id="formdelete" name="formdeletefrm" method="post" action="<%=request.getContextPath() %>/eform/deleteform">
						  			<div>삭제할 양식 선택</div>
						  			<div>(양식만 삭제 가능)</div>
						  			<input type="text" id="form_title" name="forms_title" placeholder="삭제할 양식명" required readonly="readonly">
						  			<input type="text" id="hiddenupperformno" name="category_no" required hidden>
						  			<input type="text" id="preventautosub3" required hidden>
						  			<button id="selectfifth">분류창에서 입력</button>
						  			<button type="button" id="formdeletebtn">양식 삭제</button>
					  			</form>
					  	</div>
					    <button class="closeBtn3">창 닫기</button>
					  </div>
					</div>
					
					
					<div id="previewdiv" class="modal4 hidden4">
					  <div class="bg4"></div>
					  <div class="modalBox4">
					  <div id="modalttitle"></div>
					  	<div id="formshowdiv">
					  		
					  	</div>
					    <button class="closeBtn4">창 닫기</button>
					  </div>
					</div>
			
			
			
		</div>
	</div>

<script>
//ajax의 형식으로 트리 구조 정립 - 앞으로 계속 ajax로 사용을 더 할 거라 ajax로 구현
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
			$("#jstree1").jstree({            
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
			//jstree2 구현부         
			$("#jstree2").jstree({            
				core: {                
					data: forms             
					},            
					types: {                
						'default': {                    
							'icon': 'jstree-folder'               
						}            
					},           
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
			//jstree3 구현부         
			$("#jstree3").jstree({            
				core: {                
					data: forms                
					},            
					types: {                
						'default': {                    
							'icon': 'jstree-folder'               
						}            
					},           
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
				//jstree4 구현부         
				$("#jstree4").jstree({            
					core: {                
						data: forms               
						},            
						types: {                
							'default': {                    
								'icon': 'jstree-folder'               
							}            
						},           
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


//양식 focus 된 것에 대한 이벤트 적용 중 (css에서 focus 이벤트 준 것 주석처리하여 막은 후 적용했음)
$(document).on("click","table",function(){
	$("table").css({"background-color": ""});
	$(this).css({"background-color": "rgba(247, 180, 84, 0.3)"});
	var forms_title = $(this).find('#forms_title').text();
	var category_name = $(this).find('#category_name').text();
	var emp_name = $(this).find('#emp_name').text();
	console.log(forms_title);
	console.log(category_name);
	console.log(emp_name);
	document.querySelector("#hiddenformfocusinfoformtitle").value = forms_title;
	document.querySelector("#hiddenformfocusinfoformcategornname").value = category_name;
	document.querySelector("#hiddenformfocusinfoformcreator").value = emp_name;
});

//양식 미리보기
$(document).on("click","#showformcontentbtn",function(){
	var forms_title = document.querySelector("#hiddenformfocusinfoformtitle").value;
	var category_name = document.querySelector("#hiddenformfocusinfoformcategornname").value;
	var emp_name = document.querySelector("#hiddenformfocusinfoformcreator").value;
	if(forms_title == ''){
		$("#previewdiv").removeClass("modal4");
		alert("양식을 선택해 주세요");
	}
	if(forms_title !== ''){
		$("#previewdiv").addClass("modal4");
		console.log("ajax 진입");
		$.ajax({    
			url: "<%=request.getContextPath() %>/eform/preview", 
		    type: 'get',
		    data: {'forms_title': forms_title
		    	, 'emp_name': emp_name
		    	, 'category_name': category_name},
		    dataType : 'text', 
		    success: function(data){ 
		    	console.log("ajax 성공진입");
		    	$("#formshowdiv").empty();
		    	$('#formshowdiv').html(data);
			},
		    error:function (data) {
		    	console.log("ajax 에러진입");
		    	alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
		    }
			});
	}
});

//양식 수정
$(document).on("click","#editformbtn",function(){
	var forms_title = document.querySelector("#hiddenformfocusinfoformtitle").value;
	var category_name = document.querySelector("#hiddenformfocusinfoformcategornname").value;
	var emp_name = document.querySelector("#hiddenformfocusinfoformcreator").value;
	if(forms_title == ''){
		alert("양식을 선택해 주세요");
	}
	if(forms_title !== ''){
		var newForm = $('<form></form>');
		//set attribute (form) 
		newForm.attr("name","formedit");
		newForm.attr("method","get");
		newForm.attr("action","<%=request.getContextPath() %>/eform/editformspage");
		// create element & set attribute (input) 
		newForm.append($('<input/>', {name: 'forms_title', value:forms_title }));
		newForm.append($('<input/>', {name: 'category_name', value:category_name }));
		newForm.append($('<input/>', {name: 'emp_name', value:emp_name }));
		// append form (to body) 
		newForm.appendTo('body');
		// submit form
		newForm.submit();
	}
});

//기안하기
$(document).on("click","#gotoeapprovalbtn",function(){
	var forms_title = document.querySelector("#hiddenformfocusinfoformtitle").value;
	var category_name = document.querySelector("#hiddenformfocusinfoformcategornname").value;
	if(forms_title == ''){
		alert("양식을 선택해 주세요");
	}
	if(forms_title !== ''){
		var newForm2 = $('<form></form>');
		//set attribute (form) 
		newForm2.attr("name","approvalstart");
		newForm2.attr("method","get");
		newForm2.attr("action","<%=request.getContextPath() %>/eapproval/makeapprovalpage");
		// create element & set attribute (input) 
		newForm2.append($('<input/>', {name: 'forms_title', value:forms_title }));
		newForm2.append($('<input/>', {name: 'category_name', value:category_name }));
		// append form (to body) 
		newForm2.appendTo('body');
		// submit form
		newForm2.submit();
	}
});

//양식생성
$(document).on("click","#makenewformbtn",function(){
		var newForm3 = $('<form></form>');
		//set attribute (form) 
		newForm3.attr("name","formmake");
		newForm3.attr("method","get");
		newForm3.attr("action","<%=request.getContextPath() %>/eform/makeformspage");
		// create element & set attribute (input) 
		// append form (to body) 
		newForm3.appendTo('body');
		// submit form
		newForm3.submit();
});


$(document).ready(function(){
	//jstree 로드
	getJsontree();
	

	//검색엔진 활성화
	$(".search-input").keyup(function () {
        var searchString = $(this).val();
        if(searchString === "리스트" || searchString === "리스" || searchString === "스트" || searchString === "리" || searchString === "스" || searchString === "트" || searchString === "]" || searchString === "["){
        	searchString = ''
        }
        $('#jstree1').jstree('search', searchString);
    });
	//검색엔진 활성화2
	$(".search-input2").keyup(function () {
        var searchString = $(this).val();
        if(searchString === "리스트" || searchString === "리스" || searchString === "스트" || searchString === "리" || searchString === "스" || searchString === "트" || searchString === "]" || searchString === "["){
        	searchString = ''
        }
        $('#jstree2').jstree('search', searchString);
    });
	//검색엔진 활성화3
	$(".search-input3").keyup(function () {
        var searchString = $(this).val();
        if(searchString === "리스트" || searchString === "리스" || searchString === "스트" || searchString === "리" || searchString === "스" || searchString === "트" || searchString === "]" || searchString === "["){
        	searchString = ''
        }
        $('#jstree3').jstree('search', searchString);
    });
	//검색엔진 활성화4
	$(".search-input4").keyup(function () {
        var searchString = $(this).val();
        if(searchString === "리스트" || searchString === "리스" || searchString === "스트" || searchString === "리" || searchString === "스" || searchString === "트" || searchString === "]" || searchString === "["){
        	searchString = ''
        }
        $('#jstree4').jstree('search', searchString);
    });
	
	 
//메인조직도화면 - 양식 호출부
	//선택된 분류에 대한 양식들 호출(jsp 호출)
	$("#jstree1").bind('select_node.jstree', function(event, data){ 
		var category_no = data.instance.get_node(data.selected).id;        	//category_no 가져오기      
		var parent = data.instance.get_node(data.selected).parent;    	//상위분류 가져오기    
		var category_name = data.instance.get_node(data.selected).text;    	//category_name 가져오기    
		console.log(category_no);
		console.log(parent);
		console.log(category_name);
		if(category_no < 500){
			function selectedcategoryformlist() {
				console.log("ajax 진입");
				$.ajax({    
					url: "<%=request.getContextPath() %>/eform/detaillist", 
				    type: 'get',
				    data: {'category_no': category_no},
				    dataType : 'text', 
				    success: function(data){ 
				    	console.log("ajax 성공진입");
				    	$(".formslistdiv").empty();
				    	$('.formslistdiv').html(data);
					},
				    error:function (data) {
				    	console.log("ajax 에러진입");
				    	alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
				    }
					})}; 
			selectedcategoryformlist();
		}
		if(category_no >= 500 && category_name !='[리스트]'){
			function selectedcategoryformlist2() {
				console.log("ajax 진입");
				$.ajax({    
					url: "<%=request.getContextPath() %>/eform/detaillist2", 
				    type: 'get',
				    data: {'category_name': category_name},
				    dataType : 'text', 
				    success: function(data){ 
				    	console.log("ajax 성공진입");
				    	$(".formslistdiv").empty();
				    	$('.formslistdiv').html(data);
					},
				    error:function (data) {
				    	console.log("ajax 에러진입");
				    	alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
				    }
					})}; 
			selectedcategoryformlist2();
		}
		if(category_no >= 500 && category_name =='[리스트]'){
			function selectedcategoryformlist3() {
				console.log("ajax 진입");
				$.ajax({    
					url: "<%=request.getContextPath() %>/eform/detaillist3", 
				    type: 'get',
				    data: {'parent': parent},
				    dataType : 'text', 
				    success: function(data){ 
				    	console.log("ajax 성공진입");
				    	$(".formslistdiv").empty();
				    	$('.formslistdiv').html(data);
					},
				    error:function (data) {
				    	console.log("ajax 에러진입");
				    	alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
				    }
					})}; 
			selectedcategoryformlist3();
		}
	}) 


	//전체 양식 호출(jsp 호출)
	$("#everyforms").click(function(event, data){ 
		function selectedcategoryformlist3() {
			console.log("ajax 진입");
			$.ajax({    
				url: "<%=request.getContextPath() %>/eform/detaillistall", 
			    type: 'get',
			    dataType : 'text', 
			    success: function(data){ 
			    	console.log("ajax 성공진입");  
			    	$(".formslistdiv").empty();
			    	$('.formslistdiv').html(data);
				},
			    error:function (data) {
			    	console.log("ajax 에러진입");
			    	alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
			    }
				})}; 
			selectedcategoryformlist3();
	}) 
	
	
//추가, 수정, 삭제 조직도화면
	//추가 - 선택된 분류에 대한 자동입력 부분
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
				document.querySelector("#upper_category_name").value = category_name;
				document.querySelector("#upper_category_no").value = category_no;
			};
			if(category_no >= 500){
				document.querySelector("#upper_category_name").value = parentNode;
				document.querySelector("#upper_category_no").value = parent;
			};
	}) 
	//추가 - 분류 중복확인
	$("#categorytnamecheckbtn").on("click",function(){
		var category_name = document.querySelector("#form_name1").value;
		console.log(category_name);
		if(category_name != '')
		$.ajax({    
			url: "<%=request.getContextPath() %>/eform/checkcategoryname", 
		    type: 'get',
		    data: {'category_name': category_name},
		    dataType : 'json',
		    success: function(data){ 
		    	console.log("ajax 성공진입");    
		    	if (data == 0) {
		    		 alert("사용가능한 분류명입니다.\n해당 분류명으로 고정되었습니다.\n변경을 희망하시면 페이지를 새로고침 후 다시 진행해주시기 바랍니다.");
	                    //결과값을 받아와서 중복이 아니라면 중복체그 확인 여부에 y를 입력
	                    $("#categoryname_check_yn").val('y');
	                    $("#form_name1").prop('readonly', true);
                } else {
                	alert("분류명이 이미 존재하거나 사용할 수 없는 형식입니다. 다른 분류명을 입력해주세요.");
                }
			},
		    error:function (data) {
		    	alert("에러가 발생하였습니다. 새로 시도하여 주시기 바라며, 문제가 지속될 시 관리자에게 문의하여 주시기 바랍니다.");
		    }
	})})
	//추가 - 중복확인 체크 후 submit하는 함수
	$("#categorycreatesubmitbtn").on("click",function(){
		var condition1 = document.querySelector("#categoryname_check_yn").value;
		if(condition1 == ''){
			alert("중복확인을 해주시기 바랍니다.");
			return false;
		}
		if(condition1 !== ''){
			document.categorynewnameform.submit();;
		}
	})
	//수정 - 선택된 분류/양식에 대한 자동입력 부분
	$("#jstree3").bind('select_node.jstree', function(event, data){ 
			var category_no = data.instance.get_node(data.selected).id;           
			var type = data.instance.get_node(data.selected).type;   
			var parent = data.instance.get_node(data.selected).parent;      
			var category_name = data.instance.get_node(data.selected).text;     
			console.log(category_no);
			console.log(parent);
			console.log(category_name);
				$("#selectfirst").on("click",function(){
					if(category_no < 500){
						document.querySelector("#category_name2").value = category_name;
						document.querySelector("#hiddencategoryno2").value = category_no;
					};
				})
				$("#selectsecond").on("click",function(){
					document.querySelector("#category_name3").value = category_name;
					document.querySelector("#hiddencategoryno3").value = category_no;
					if(document.querySelector("#category_name3").value=="[리스트]"){
						document.querySelector("#category_name3").value='';
						document.querySelector("#hiddencategoryno3").value='';
					}
				})
				$("#selectthird").on("click",function(){
					if(category_no < 500){
						document.querySelector("#upper_category_name2").value = category_name;
						document.querySelector("#upper_category_no2").value = category_no;
						var condition1 = document.querySelector("#category_name3").value;
						var condition2 = document.querySelector("#upper_category_name2").value;
						if( condition1==condition2  && condition1!==''){
							document.querySelector("#upper_category_name2").value='';
							document.querySelector("#upper_category_no2").value='';
						}
					}
				})
	})
	//수정 - 수정 명칭 중복확인
	$("#categorytnamecheckbtn2").on("click",function(){
		var category_name = document.querySelector("#category_name_new").value;
		var category_no = document.querySelector("#hiddencategoryno2").value;
		if(category_name != '' && category_no < 500){
		$.ajax({    
			url: "<%=request.getContextPath() %>/eform/checkcategoryname2", 
		    type: 'get',
		    data: {'category_name': category_name
		    },
		    dataType : 'json',
		    success: function(data){ 
		    	console.log("ajax 성공진입");    
		    	if (data == 0) {
		    		 alert("해당 명칭으로 고정되었습니다.\n변경을 희망하시면 페이지를 새로고침 후 다시 진행해주시기 바랍니다.");
	                    //결과값을 받아와서 중복이 아니라면 중복체그 확인 여부에 y를 입력
	                    $("#categoryname_check_yn2").val('y');
	                    $("#category_name_new").prop('readonly', true);
                } else {
                	alert("이미 존재하는 명칭이거나 사용할 수 없는 형식입니다. 다른 명칭을 입력해주세요.");
                }
			},
		    error:function (data) {
		    	alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
		    }
		})}
		if(category_name != '' && category_no >= 500){
			alert("양식의 제목은 양식 수정에서 진행하여 주시기 바랍니다.")
		}
	})
	//수정 - 소속 관련 체크 후 submit하는 함수
	$("#categoryplaceeditbtn").on("click",function(){
		var condition1 = document.querySelector("#category_name3").value;
		var condition2 = document.querySelector("#upper_category_name2").value;
		if(condition1 == ''){
			alert("소속을 바꿀 부서명을 제대로 입력해주시기 바랍니다.");
		}
		if(condition2 !== '' && condition1 !== ''){
			var answer;
			answer = confirm("진행하시겠습니까?");
			if(answer){
				var category_no1 = document.querySelector("#hiddencategoryno3").value;
				var category_no2 = document.querySelector("#upper_category_no2").value;
				if(category_no1<500){
					$.ajax({    
						url: "<%=request.getContextPath() %>/eform/categoryupdowncheck", 
					    type: 'get',
					    data: {'category_no1': category_no1
					    	,'category_no2': category_no2
					    	},
					    dataType : 'json',
					    success: function(data){ 
					    	console.log("ajax 성공진입");    
					    	if (data > 0) {
					    		 alert("직속 분류 간의 직접적인 소속 변경은 불가합니다.\n분류 추가/수정/삭제 등을 사용하여 직속 분류의 관계를 정리한 후 다시 시도해 주시기 바랍니다.");
			                } else {
			                	document.categoryplaceform.submit();
			                }
						},
					    error:function (data) {
					    	alert("에러가 발생하였습니다. 다시 한번 시도하여 주시고 문제가 지속될 시 관리자에게 문의하여 주시기 바랍니다.");
					    }
					})
				}
				if(category_no1>=500){
					$.ajax({    
						url: "<%=request.getContextPath() %>/eform/formplacechange", 
					    type: 'get',
					    data: {'category_name': condition1
					    	,'new_upper_category_no': category_no2
					    	},
					    dataType : 'json',
					    success: function(data){ 
					    	console.log("ajax 성공진입");    
					    	if (data > 0) {
					    		window.location.reload();
			                } else {
			                	alert("일시적인 에러가 발생하였습니다. 다시 시도해 주시기 바랍니다. 문제가 지속될 시 관리자에게 문의하여 주시기 바랍니다.");
			                }
						},
					    error:function (data) {
					    	alert("에러가 발생하였습니다. 다시 한번 시도하여 주시고 문제가 지속될 시 관리자에게 문의하여 주시기 바랍니다.");
					    }
					})
				}
			}
		}
		if(condition2 == '' && condition1 !== ''){
			var category_no10 = document.querySelector("#hiddencategoryno3").value;
			if(category_no10<500){
			var answer2;
			answer2 = confirm("진행하시겠습니까?");
			if(answer2){
				document.categoryplaceform.submit();
			}}
		}
	})
	//삭제 - 선택된 분류와 양식에 대한 자동입력 부분
	$("#jstree4").bind('select_node.jstree', function(event, data){ 
			var category_no = data.instance.get_node(data.selected).id;        //id 가져오기    
			var type = data.instance.get_node(data.selected).type;    //type 가져오기    
			var parent = data.instance.get_node(data.selected).parent;    //paht 가져오기    
			var category_name = data.instance.get_node(data.selected).text;    //paht 가져오기    
			console.log(category_no);
			console.log(parent);
			console.log(category_name);
			$("#selectfourth").on("click",function(){
				document.querySelector("#category_name4").value = category_name;
				document.querySelector("#hiddencategoryno").value = category_no;
				if(document.querySelector("#hiddencategoryno").value >= 500){
					document.querySelector("#category_name4").value = '';
					document.querySelector("#hiddencategoryno").value = '';
				}
			})
			$("#selectfifth").on("click",function(){
				if(category_no >= 500){
					if(category_name !== '[리스트]'){
						document.querySelector("#form_title").value = category_name;
						document.querySelector("#hiddenupperformno").value = parent;
					}
				}
			})
	})
	//분류삭제 - 체크 후 submit하는 함수 
	$("#categorydeletebtn").on("click",function(){
		var category_name = document.querySelector("#category_name4").value;
		var category_no = document.querySelector("#hiddencategoryno").value;
		if(category_no == ''){
			alert("삭제할 분류를 제대로 입력해주시기 바랍니다.");
		}
		if(category_no !== ''){
			$.ajax({    
				url: "<%=request.getContextPath() %>/eform/checkdowncategory", 
			    type: 'get',
			    data: {'category_no': category_no},
			    dataType : 'json',
			    success: function(data){ 
			    	console.log("ajax 성공진입");    
			    	if (data > 0) {
			    		 alert("하위 분류가 있을 경우 삭제가 불가합니다.\n하위 분류를 모두 삭제 혹은 수정하여 주시고 다시 시도해 주시기 바랍니다.");
	                } else {
	                	var answer3;
	        			answer3 = confirm("삭제하시겠습니까?");
	        			if(answer3){
	        				document.categorydeletefrm.submit();
	                }
				}},
			    error:function (data) {
			    	alert("에러가 발생하였습니다. 관리자에게 문의하여 주시기 바랍니다.");
			    }
			})
		}
	})
	//양식삭제 - 체크 후 submit하는 함수 
	$("#formdeletebtn").on("click",function(){
		var forms_title = document.querySelector("#form_title").value;
		var category_no = document.querySelector("#hiddenupperformno").value;
		if(category_no == ''){
			alert("삭제할 양식을 제대로 입력해주시기 바랍니다.");
		}
		if(category_no !== ''){
           	var answer4;
   			answer4 = confirm("삭제하시겠습니까?");
   			if(answer4){
   				document.formdeletefrm.submit();
           }
		}
			  
	})
});


//부서추가, 수정, 삭제 조직도화면 - 버튼으로 reset하기
function reset(){
	$("#upper_category_name").val('');
}
$('#resetbtn').click(function(){
	reset();
});



//메인화면 - 조직도 펼치기, 접기 기능
$('#showallbtn').click(function(){
	$('#jstree1').jstree("open_all");
});
//조직도 접기 기능
$('#closeallbtn').click(function(){
	$('#jstree1').jstree("close_all");
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
const open4 = () => {
	document.querySelector(".modal4").classList.remove("hidden4");
}
const close4 = () => {
	document.querySelector(".modal4").classList.add("hidden4");
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
document.querySelector(".openBtn4").addEventListener("click", open4);
document.querySelector(".closeBtn4").addEventListener("click", close4);
document.querySelector(".bg4").addEventListener("click", close4);
</script>	
	
</body>
</html>