<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 주소 daum 우편번호 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css//.css">
<!-- JavaScript -->
<%-- <script src="<%=request.getContextPath()%>/resources/js/.js"></script> --%>
<%-- <script src=" ${pageContext.request.contextPath}/resources/js/.js"></script> --%>
</head>
<body>
	<!--private int emp_no;
		private int dept_no;
		private int position_no;
		private String emp_id;
		private String emp_pwd;
		private String emp_original_filename;
		private String emp_renamel_filename;
		private String emp_name;
		private String emp_gender;
		private String emp_birth;
		private String emp_email;
		private String emp_tel;
		private String emp_postcode;
		private String emp_address;
		private String emp_detail_address;
		private Timestamp emp_write_date;
		private Timestamp emp_update_date;
		private Timestamp emp_out_date; -->

	<ul class="_step">
		<li><strong>1</strong> <span>약관동의</span></li>
		<li class="on"><strong>2</strong> <span>사원정보</span></li>
		<li><strong>3</strong> <span>신청완료</span></li>
	</ul>

	<form id="do" action="<%=request.getContextPath()%>/employee/joindo"
		method="post">
		<table>
			<tr>
				<th>사원번호</th>
				<td><input type="text" name="emp_no" required="required"></td>
			</tr>
			<tr>
				<th>부서선택</th>
				<td><select name="dept_no">
						<option value="1">운영팀</option>
						<option value="2">개발팀</option>
						<option value="3">경영팀</option>
				</select></td>
			</tr>
			<tr>
				<th>직급선택</th>
				<td><select name="position_no">
						<option value="5">부장</option>
						<option value="4">차장</option>
						<option value="3">과장</option>
						<option value="2">대리</option>
						<option value="1">사원</option>
				</select></td>
			</tr>
			<tr id="divInputEmpid">
				<th>아이디</th>
				<td><input type="text" name="emp_id" id="emp_id"
					required="required"> <input type="button" id="emp_idck"
					class="btn btn-default" style="width: 30%;" value="중복확인"
					onclick="chenkEmpId();" /></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" id="emp_pwd" name="emp_pwd"></td>
			</tr>

			<tr>
				<th>패스워드 확인</th>
				<td><input type="password" id="emp_pwdck" name="emp_pwd_check">
					<span id="emp_pwd_check" style="display: none;"></span></td>
			</tr>

			<tr>
				<th>사진등록</th>
				<td><input type="hidden" role="uploadcare-uploader"
					name="emp_original_filename" /></td>
			</tr>

			<tr>
				<th>이름</th>
				<td><input type="text" name="emp_name" id="emp_name"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><select name="emp_gender">
						<option value="D">선택안함</option>
						<option value="M">남성</option>
						<option value="F">여성</option>
				</select>
				<td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" value="1990-01-01" name="emp_birth"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="emp_email" id="emp_email"
					placeholder="이메일 인증 후 로그인이 가능합니다."> <span
					id="emp_check_email"
					style="display: none; font-size: .8em; padding-left: 10px; color: red;">유효성
						검사 뜰 자리</span> <span id="empEmailcheck" class="w3-text-red"></span></td>

			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="emp_tel" id="emp_tel"> <span
					id="emp_check_tel"
					style="display: none; font-size: .8em; padding-left: 10px; color: red;">유효성
						검사 뜰 자리</span></td>
			</tr>

			<tr>
				<th><label for="addr">주소</label></th>
				<td class="table-light" colspan="3">
					<!-- 우편번호 -->
					<div>
						<input type="text" class="form-control" name="emp_postcode"
							id="postcode" value="" placeholder="우편번호" />
						<!-- 주소찾기 btn -->
						<input type="button"
							style="width: 80px; display: inline-block; color: white; font-size: 0.7rem; background-color: cornflowerblue;"
							class="form-control" id="postcode_btn" value="주소 찾기"> <br>
					</div> <!-- 주소 --> <input type="text" class="form-control"
					id="roadAddress" name="emp_address" value="" placeholder="주소" /> <span
					id="guide" style="color: #999; display: none"></span> <!-- 상세주소 -->
					<input type="text" class="form-control" id="jibunAddress"
					name="emp_detail_address" value="" placeholder="상세주소" />
				</td>
			</tr>
		</table>
		<button type="button" onclick="fnSubmit(); return false;">회원가입</button>
		<button type="button"
			onclick="location.href='<%=request.getContextPath()%>/employee/login'">취소</button>
	</form>

	<script type="text/javascript">

	/* 아이디 중복확인 체크 */
		$("#emp_idck").click(function() {
			var id = $("#emp_id").val();
			if (id == "") {
				alert("아이디를 입력해 주십시오");
			} else {
				chenkEmpId(emp_id);
			}
		})

		var isCheckId = 0;
		function chenkEmpId() {
			var emp_id = $("#emp_id").val();
			console.log("아이디 중복확인: " + emp_id);

			$.ajax({
				async : false,
				type : "POST",
				url : "idcheck",
				data : {
					emp_id : emp_id
				},
				success : function(data) {
					if (data == "S") {
						alert("사용가능한 아이디입니다.");

						$("#divInputEmpid").addClass("has-success")
						$("#divInputEmpid").removeClass("has-error")

						$("#emp_pwd").focus();
						isCheckId = 1;						
					} else {
						alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");

						$("#divInputEmpid").addClass("has-error")
						$("#divInputEmpid").removeClass("has-success")

						$("#emp_id").focus();
					}
				},
			});
		}	
			
			
		
		/* 다음 우편번호 주소 API */
		$("#postcode_btn")
				.click(
						function sample4_execDaumPostcode() {
							new daum.Postcode(
									{
										oncomplete : function(data) {

											var roadAddr = data.roadAddress;
											var extraRoadAddr = '';

											if (data.bname !== ''
													&& /[동|로|가]$/g
															.test(data.bname)) {
												extraRoadAddr += data.bname;
											}

											if (data.buildingName !== ''
													&& data.apartment === 'Y') {
												extraRoadAddr += (extraRoadAddr !== '' ? ', '
														+ data.buildingName
														: data.buildingName);
											}

											if (extraRoadAddr !== '') {
												extraRoadAddr = ' ('
														+ extraRoadAddr + ')';
											}

											document.getElementById("postcode").value = data.zonecode;
											document
													.getElementById("roadAddress").value = roadAddr;

											var guideTextBox = document
													.getElementById("guide");
										}
									}).open();
						});

		/* 비밀번호 일치 여부 체크 */
		$("#emp_pwdck").keyup(function() {

			var firstPwd = $("#emp_pwd").val();
			var secondPwd = $("#emp_pwdck").val();

			if (firstPwd == "" || secondPwd == "") {
				console.log("빈문자열");
				$("#emp_pwd_check").css('display', 'inline-block');
				$("#emp_pwd_check").text('');
				H
			} else if (firstPwd != secondPwd) {
				console.log("firstPwd : " + firstPwd);
				console.log("secondPwd : " + secondPwd);
				console.log("비밀번호가 일치하지 않습니다.");
				$("#emp_pwd_check").css('display', 'inline-block');
				$("#emp_pwd_check").text('비밀번호가 일치하지 않습니다.');
				$("#emp_pwd_check").css('color', 'red');
			} else {
				console.log("firstPwd : " + firstPwd);
				console.log("secondPwd : " + secondPwd);
				console.log("비밀번호가 일치합니다.");
				$("#emp_pwd_check").css('display', 'inline-block');
				$("#emp_pwd_check").text('비밀번호가 일치합니다.');
				$("#emp_pwd_check").css('color', 'green');
			}
		});

		/* 이메일 유효성 검사 */
		$("#emp_email")
				.keyup(
						function() {

							// var regEmail = /^[0-9a-zA-Z]([-.]?[0-9a-zA-Z])@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]).[a-zA-Z]{2,3}$/i; //이메일 양식
							var regEmail = /^[a-z0-9.-_]+@([a-z0-9-]+.)+[a-z]{2,6}.[a-zA-Z]{3}$/i; // 이메일 양식
							var email = $("#emp_email").val().trim();
							if (email == "") {
								console.log("빈문자열");
								$("#emp_check_email").css('display',
										'inline-block');
								$("#emp_check_email").text('');

							} else if (!regEmail.test(email)) {
								console.log("유효성체크 하나요?");
								$("#emp_check_email").css('display',
										'inline-block');
								$("#emp_check_email")
										.text(
												'grougle@emailAddress.com 형태로 작성 해주십시오.');
								$("#emp_check_email").css('font-size', '0.8em');
								$("#emp_check_email").css('color', 'red');
							} else {
								$("#emp_check_email").css('display',
										'inline-block');
								$("#emp_check_email").text('');
								$("#emp_check_email").css('font-size', '1.2em');
								$("#emp_check_email").css('color', 'green');
							}

						});

		/*  전화번호 유효성 검사 */
		$("#emp_tel")
				.keyup(
						function() {

							var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; //휴대폰 번호
							var phone = $("#emp_tel").val().trim();
							if (phone == "") {
								$("#emp_check_tel").css('display',
										'inline-block');
								$("#emp_check_tel").text('');

							} else if (!regPhone.test(phone)) {
								// alert("휴대폰 번호 양식(01#-####-####)에 맞게 입력해주시길 바랍니다.");
								$("#emp_check_tel").css('display',
										'inline-block');
								$("#emp_check_tel")
										.text(
												'휴대폰 번호 양식(01#-####-####)에 맞게 입력해주시길 바랍니다.');
								$("#emp_check_tel").css('font-size', '0.8em');
								$("#emp_check_tel").css('color', 'red');

								// $("#k_tel").focus();
								// return false;
							} else {
								console.log("else 탔아???");
								$("#emp_check_tel").css('display',
										'inline-block');
								$("#emp_check_tel").text('');
								$("#emp_check_tel").css('font-size', '1.2em');
								$("#emp_check_tel").css('color', 'green');
							}
						});
	</script>


	<script>
		$(document).ready(function() {

		});

		function fnSubmit() {

			var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			// var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/; 전화번호용

			if ($("#emp_id").val() == null || $("#emp_id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#emp_id").focus();

				return false;
			}

			if ($("#emp_idck").val() != "S") {
				console.log("회원가입 버튼:"empIdcheck)
				alert("아이디 중복체크를 눌러주세요.");
				$("#emp_idck").focus();

				return false;
			}

			if ($("#emp_pwd").val() == null || $("#emp_pwd").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#emp_pwd").focus();

				return false;
			}

			if ($("#emp_pwdck").val() == null || $("#emp_pwdck").val() == "") {
				alert("비밀번호 확인을 입력해주세요.");
				$("#emp_pwdck").focus();

				return false;
			}

			if ($("#emp_name").val() == null || $("#emp_name").val() == "") {
				alert("이름을 입력해주세요.");
				$("#emp_name").focus();

				return false;
			}

			if ($("#emp_mail").val() == null || $("#emp_mail").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#emp_mail").focus();

				return false;
			}

			if (confirm("회원가입하시겠습니까?")) {
				$("#joindo").submit();
				return false;
			}
		}
		
		/* $("#emp_email").keyup(function(){
		$.ajax({
			url : "empEmailcheck",
			type : "POST",
			data : {
				email : $("#emp_email").val()
			},
			success : function(result) {
				if (result == 1) {
					$("#empEmailcheck").html("중복된 이메일이 있습니다.");
				} else {
					$("#empEmailcheck").html("");
				}
			},
		})
	});
}) */
		
		
	</script>



	<script>
		UPLOADCARE_PUBLIC_KEY = "3aa32830c381251bd485"
		UPLOADCARE_TABS = "file camera url facebook gdrive gphotos"
	</script>

</body>
</html>