<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css' />
</head>
<body>
	<form action="<%=request.getContextPath()%>/board/write" method="post">
	<input type="hidden" name="refnum" value="${refnum }">
		<div class="form-group">
			<label for="exampleFormControlInput1">제목</label> <input type="text"
				class="form-control" id="exampleFormControlInput1" name="wb_title"
				placeholder="제목을 작성해주세요.">
		</div>


		<div>
			첨부파일:<input type="hidden" role="uploadcare-uploader" name="WB_ORIGINAL_FILENAME" />
		</div>
		
		<div class="form-group">
			<label for="exampleFormControlTextarea1" >내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				name="wb_content" rows="10" placeholder="내용을 작성해주세요."></textarea>
		</div>
		<input type="submit" id="insert" class="btn btn-info">
		<button type="button"
			onclick="location.href='<%=request.getContextPath()%>/board/list'"
			class="btn btn-secondary">목록으로</button>
	</form>
<script>
		UPLOADCARE_PUBLIC_KEY = "3aa32830c381251bd485"
		UPLOADCARE_TABS = "file camera url facebook gdrive gphotos"
</script>

<script>

	function form_submit() {	
	document.id.action="link_page.html";	
	document.id.submit();	
	}

</script>

</body>
</html>
