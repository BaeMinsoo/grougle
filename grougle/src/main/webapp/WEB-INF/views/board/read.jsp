<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글읽기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

	<div>
		<button type="button"
			onclick="location.href='<%=request.getContextPath()%>/'">홈</button>
	</div>
	<c:choose>
		<c:when test="${empty board }">
			<script>
		alert("해당글이없습니다. 글목록으로 이동합니다.");
		location.href="<%=request.getContextPath()%>/board/list";
	</script>
		</c:when>
		<c:otherwise>

			<c:if test="${board.wb_writer eq loginSsInfo.emp_id}">
				<div>
					<form id="frmNum">
						<input type="hidden" name="wb_no" value="${board.wb_no }">
						<button type="button" class="btn_update">수정</button>
						<button type="button" class="btn_delete">삭제</button>
					</form>
					<script>
		$(".btn_update").click(function(){
			if($(this).hasClass("update")){
				frmNum.action="<%=request.getContextPath()%>/board/update";
			}else {
				frmNum.action="<%=request.getContextPath()%>/board/delete";
			}
			frmNum.method="post";
			frmNum.submit();
		});
		
		$(".btn_delete").click(function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/board/delete"
				,type:"post"
				,data:{wb_no: "${board.wb_no }"}
				,success: function(result){
					console.log(result);
					if(result){
						alert(result);
					}
					location.href="<%=request.getContextPath()%>
						/board/list";
														},
														error : function(
																errcode) {
															console
																	.log(errcode);
														}
													});
										});
					</script>
				</div>
			</c:if>

			<div>
				<table border="1">
					<tr>
						<td>No.</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
						
						
						<td>level</td>
						<td>ref</td>
						<td>rref</td>
						<td>seq</td>
						
						
						
						
						
					</tr>
					<tr>
					
						<td>${board.wb_no }</td>
						<td>${board.wb_title }</td>
						<td>${board.wb_writer }</td>
						<td>${board.wb_date }</td>
						<td>${board.wb_readcount }</td>
						
						<td>${board.wb_level }</td>
						<td>${board.wb_ref }</td>
						<td>${board.wb_reply_ref }</td>
						<td>${board.wb_reply_seq }</td>
						
						
						
						
						
					</tr>
				</table>
				<div>내용: ${board.wb_content }</div>

				<div>
					<button type="button"
						onclick="location.href='<%=request.getContextPath()%>/board/write?refnum=${board.wb_no }'">답글쓰기</button>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>
