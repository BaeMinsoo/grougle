<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css"
	type="text/css" />
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css' />
</head>
<body>
	<form action="<%=request.getContextPath()%>/board/write" method="post">
		<div class="form-group">
			<label for="exampleFormControlInput1">제목</label> <input type="text"
				class="form-control" id="exampleFormControlInput1" name="wb_title"
				placeholder="제목을 작성해주세요.">
		</div>
		
		<div class="form-group">
			<label for="exampleFormControlInput1">제목</label> 
			<input type="button"
				class="form-control" id="exampleFormControlInput1" name="wb_type" value="N">
		</div>
		
		<!-- 포스팅 - 이미지/동영상 dropzone 영역 -->
		<div class="dropzone">	
		<ul class="list-unstyled mb-0" id="dropzone-preview">
			<li class="mt-2" id="dropzone-preview-list">
				<!-- This is used as the file preview template -->
				<div class="border rounded-3">
					<div class="d-flex align-items-center p-2">
						<div class="flex-shrink-0 me-3">
							<div class="width-8 h-auto rounded-3">
								<img data-dz-thumbnail="data-dz-thumbnail"
									class="w-full h-auto rounded-3 block" src="#"
									alt="Dropzone-Image" style="width: 120px;" />
							</div>
						</div>
						<div class="flex-grow-1">
							<div class="pt-1">
								<h6 class="font-semibold mb-1" data-dz-name="wb_original_filename">&nbsp;</h6>
								<p class="text-sm text-muted fw-normal"
									data-dz-size="data-dz-size"></p>
								<strong class="error text-danger"
									data-dz-errormessage="data-dz-errormessage"></strong>
							</div>
						</div>
						<div class="shrink-0 ms-3">
							<button data-dz-remove="data-dz-remove"
								class="btn btn-sm btn-danger">Delete</button>
						</div>
					</div>
				</div>
			</li>
		</ul>
	</div>
		
		<div class="form-group">
			<label for="exampleFormControlTextarea1">내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				name="wb_content" rows="10"></textarea>
		</div>
		<button type="submit" class="btn btn-info">등록하기</button>
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/list'" class="btn btn-secondary">목록으로</button>
	</form>
	
	<script>
		Dropzone.autoDiscover = false;
		var dropzonePreviewNode = document
				.querySelector('#dropzone-preview-list');
		dropzonePreviewNode.id = '';
		var previewTemplate = dropzonePreviewNode.parentNode.innerHTML;
		dropzonePreviewNode.parentNode.removeChild(dropzonePreviewNode);

		const dropzone = new Dropzone(".dropzone", {
			url : "https://httpbin.org/post", // 파일을 업로드할 서버 주소 url. 
			method : "post", // 기본 post로 request 감. put으로도 할수있음

			previewTemplate : previewTemplate, // 만일 기본 테마를 사용하지않고 커스텀 업로드 테마를 사용하고 싶다면
			previewsContainer : '#dropzone-preview', // 드롭존 영역을 .dropzone이 아닌 다른 엘리먼트에서 하고싶을때
		});
	</script>
</body>
</html>
