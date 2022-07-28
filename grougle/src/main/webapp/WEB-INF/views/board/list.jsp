<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>게시판</title>
	<!-- 헤더&사이드바 -->
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
</head>
<body>
	<!-- 헤더&사이드바 -->
	<%@ include file="../header/header.jsp"%>
	<%@ include file="../sidebar/rightsidebar.jsp"%>
	<%@ include file="../sidebar/leftsidebar.jsp"%>
	
	<div class="container">
		<header>
			<h1>게시판</h1>
		</header>

		<div>
			<%@ include file="../header/header.jsp"%>
			<%@include file="nav.jsp"%>
		</div>

		<section id="container">
			<form role="form" method="get">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
					</thead>

					<c:forEach items="${boardlist}" var="board">
						<tr>
							<td><c:out value="${board.wb_no}" /></td>
							<td><a
								href="<%=request.getContextPath()%>/board/read?wb_no=${board.wb_no}"><c:out
										value="${board.wb_title}" /></a></td>
							<td><c:out value="${board.wb_writer}" /></td>
							<td><fmt:formatDate value="${board.wb_date}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${board.wb_count}" /></td>
						</tr>
					</c:forEach>

				</table>

				<script>
					$(function() {
						$('#searchBtn').click(
								function() {
									self.location = "list"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ encodeURIComponent($(
													'#keywordInput').val());
								});
					});
				</script>

				<div class="col-md-offset-3">

					<p>
						<c:if test="${startPage > 1 }">
							<a href="list?page=${startPage-1 }"><span>이전</span></a>&nbsp;&nbsp;&nbsp;
							</c:if>
						<c:forEach begin="${startPage}" end="${endPage}" var="i">
							<a href="list?page=${i }"><span>${i }</span></a>&nbsp;&nbsp;&nbsp;
							</c:forEach>
						<c:if test="${endPage < pageCnt}">
							<a href="list?page=${endPage+1 }"><span>다음</span></a>&nbsp;&nbsp;&nbsp;
							</c:if>
					</p>

				</div>
			</form>
		</section>
	</div>
</body>
</html>