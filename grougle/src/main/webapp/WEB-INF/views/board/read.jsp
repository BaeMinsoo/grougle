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
</head>

<script type="text/javascript">
		
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 게시글 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", '<%=request.getContextPath()%>/board/update');
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 게시글 삭제
				$(".delete_btn").click(function(){
					$.ajax({
						url:"<%=request.getContextPath()%>/board/delete"
						,type:"post"
						,data:{wb_no: "${board.wb_no }"}
						,success: function(result){
							console.log(result);
							if(result){
								alert(result);
							}
							location.href="<%=request.getContextPath()%>/board/list";
													},
													error : function(
															errcode) {
														console.log(errcode);
													}
												});
									});
			
			// 댓글 목록						
			$(".replyWriteBtn").on("click", function(){
				var formObj = $("form[name='replyForm']");
				formObj.attr("action", "<%=request.getContextPath()%>/board/replyWrite");
				formObj.attr("method", "POST");
				formObj.submit();
				});
			})
			//게시글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "<%=request.getContextPath()%>/board/update?wb_no=${Board.wb_no}"
			});
			
			//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "<%=request.getContextPath()%>/board/replyDelete?wb_no=${BoardComment.wb_no}"
			});					
		
</script>

<body>
	<div class="container">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>

		<c:if test="${not empty loginSsInfo.emp_name }">
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="wb_no" name="wb_no" value="${board.wb_no}" />
				</form>

				<div class="form-group">
					<label for="wb_date" class="col-sm-2 control-label">작성일</label>
					<fmt:formatDate value="${board.wb_date}" pattern="yyyy-MM-dd" />
				</div>

				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label> <input
						type="text" id="wb_title" name="wb_title" class="form-control"
						value="${board.wb_title}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<textarea id="wb_content" name="wb_content" class="form-control"
						readonly="readonly">
					<c:if test="${empty board.WB_ORIGINAL_FILENAME }">
							<tr>
							<th class="table-primary s_ac_th">업체사진</th>
							<td class="table-light">
								<img width="300px;" style="border-radius: 15px;" src="https://media.discordapp.net/attachments/965916528350478386/971797973627437076/-removebg-preview_1.png">
							</td>
							</tr>
						</c:if>
						<c:if test="${not empty board.WB_ORIGINAL_FILENAME }">
							<tr>
								<th class="table-primary s_ac_th"></th>
								<td class="table-light">
									<img width="300px;" height="200px;" style="border-radius: 15px;" src="${board.WB_ORIGINAL_FILENAME }">
								</td>
							</tr>
						</c:if>	
						
						
					<c:out value="${board.wb_content}" /></textarea>
				</div>
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label> <input
						type="text" id="wb_writer" name="wb_writer" class="form-control"
						value="${board.wb_writer}" readonly="readonly" />
				</div>

				<hr>
				<%-- <span>파일 목록</span>
				<div class="form-group" style="border: 1px solid #dbdbdb;">
					<c:forEach var="file" items="${file}">
						<c:if test="${file.DEL_GB == 'N'}">
							<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
						</c:if>
					</c:forEach>
				</div> --%>
				<hr>

				<!-- 댓글부분 -->
				<div>
					<button type="button" class="update_btn btn btn-warning">수정</button>
					<button type="button" class="delete_btn btn btn-danger">삭제</button>
					<button type="button" class="list_btn btn btn-primary">목록</button>
				</div>


				<div id="reply">
					<ol class="replyList">
						<c:forEach items="${BoardComment}" var="replyList">
							<li>
								<p>
									작성자 : ${BoardComment.wbc_writer}<br /> 작성 날짜 :
									<fmt:formatDate value="${BoardComment.wbc_date}"
										pattern="yyyy-MM-dd" />
								</p>

								<p>${BoardComment.wbc_content}</p>
								<div>
									<button type="button" class="replyUpdateBtn btn btn-warning"
										data-rno="${BoardComment.wbc_no}">수정</button>
									<button type="button" class="replyDeleteBtn btn btn-danger"
										data-rno="${BoardComment.wbc_no}">삭제</button>
								</div>
							</li>
						</c:forEach>
					</ol>
				</div>


				<form name="replyForm" method="post" class="form-horizontal">
					<input type="hidden" id="wb_no" name="wb_no"
						value="${read.wb_no}" />

					<div class="form-group">
						<label for="wbc_writer" class="col-sm-2 control-label">댓글
							작성자</label>
						<div class="col-sm-10">
							<input type="text" id="wbc_writer" name="wbc_writer"
								class="form-control" />
						</div>
					</div>

					<div class="form-group">
						<label for="wbc_content" class="col-sm-2 control-label">댓글
							내용</label>
						<div class="col-sm-10">
							<input type="text" id="wbc_content" name="wbc_content"
								class="form-control" />
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" onclick="<%=request.getContextPath()%>/board/read?wb_no=${board.wb_no}" class="replyWriteBtn btn btn-success">작성</button>
						</div>
					</div>
				</form>
			</section>
		</c:if>
		<hr />
	</div>
</body>
</html>