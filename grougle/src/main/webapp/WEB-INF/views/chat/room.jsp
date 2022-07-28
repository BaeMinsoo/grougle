<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>grougle</title>

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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/chat/chatlist.css">
  
<!-- js -->
<script src="<%=request.getContextPath() %>/resources/vendors/scripts/core.js"></script>
<%-- <script src="<%=request.getContextPath() %>/resources/vendors/scripts/script.min.js"></script> --%>
<script src="<%=request.getContextPath() %>/resources/vendors/scripts/process.js"></script>
<script src="<%=request.getContextPath() %>/resources/vendors/scripts/layout-settings.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/chat-sidebar.js"></script>
<script
	src="<%=request.getContextPath() %>/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="<%=request.getContextPath() %>/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath() %>/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
<script
	src="<%=request.getContextPath() %>/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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

</head>
<body>
<div>
<div class="ks-page-content">
	<div class="ks-page-content-body">
		<div class="ks-messenger">
			<div class="ks-messages ks-messenger__messages">
				<div class="ks-header">
					<div class="ks-description">
						<div class="ks-name"><!-- 채팅방 이름 불러오기 -->Chat name: ${chatMember[0].RM_NAME}</div>
						<c:forEach items="${chatMember}" var="item">
							<div style="float:left; margin-right:5px;" class="ks-amount">${item.EMP_ID}</div>
						</c:forEach>
					</div>
					<div style="claer:both;" class="ks-controls">
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="<%=request.getContextPath() %>/resources/css/chat/gear_icon.svg">
                            </button>
                            <div class="dropdown-menu dropdown-menu-right ks-simple" aria-labelledby="dropdownMenuButton">
                                <!-- <a class="dropdown-item" href="#"> -->
                                <button class="dropdown-item btn_add_member">
                                    <span class="la la-user-plus ks-icon"></span>
                                    <span class="ks-text">Add members</span>
                                </button>
                                <button class="dropdown-item btn_modal" href="#">
			                        <span class="la la-trash-o ks-icon"></span>
			                        <span class="ks-text">Delete</span>
			                    </button>
                            </div>
						</div>
					</div>
				</div>
				<!-- 채팅내용 -->
				<div class="ks-body ks-scrollable jspScrollable"
					data-auto-height="" data-reduce-height=".ks-footer"	data-fix-height="32"
					style="height: 480px; overflow: hidden; padding: 0px; width: 100%;" tabindex="0">
					<div class="jspContainer" style="width: 100%; height: 501px;">
						<div class="jspPane" style="padding: 0px; top: 0px; width: 99%;">
							<div class="well" id="chatdata" style="height: 700px; overflow: auto;">
								<!-- User Session Info Hidden -->
								<input type="hidden" value='${loginSsInfo.emp_id}'
									id="sessionuserid">
								<c:forEach items="${chatMessages }" var="chatmsg" varStatus="status">
									<c:choose>
										<c:when test="${chatmsg.ch_writer eq loginSsInfo.emp_id}">
											<c:if test="${status.index != 0}">
												<c:if test="${chatMessages[status.index-1].ch_writer eq chatMessages[status.index].ch_writer}">
													<div class="s_sender_chat">${chatmsg.ch_msg}</div>
												</c:if>
												<c:if test="${chatMessages[status.index-1].ch_writer ne chatMessages[status.index].ch_writer}">
													<div class="s_sender">${chatmsg.ch_writer}</div>
													<div class="s_sender_chat">${chatmsg.ch_msg}</div>
												</c:if>
											</c:if>
											<c:if test="${status.index == 0 }">
												<div class="s_sender">${chatmsg.ch_writer}</div>
												<div class="s_sender_chat">${chatmsg.ch_msg}</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${status.index != 0}">
												<c:if test="${chatMessages[status.index-1].ch_writer eq chatMessages[status.index].ch_writer}">
													<div class="s_receive_chat">${chatmsg.ch_msg}</div>
												</c:if>
												<c:if test="${chatMessages[status.index-1].ch_writer ne chatMessages[status.index].ch_writer}">
													<div class="s_receive">${chatmsg.ch_writer}</div>
													<div class="s_receive_chat">${chatmsg.ch_msg}</div>
												</c:if>
											</c:if>
											<c:if test="${status.index == 0 }">
												<div class="s_receive">${chatmsg.ch_writer}</div>
												<div class="s_receive_chat">${chatmsg.ch_msg}</div>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<!-- 입력창 -->
				<div class="ks-footer">
					<div class="ks-controls" style="margin-top: 10px;display: contents; justify-content: center;">
						<div style="width: 100%">
						<input style="width:89%; height:50px; display: inline-block;" type="text" id="message" placeholder="내용을 입력해주세요" /> 
						<input style="width:9%; height:50px; margin-left: 10px" type="button" id="sendBtn" class="btn btn-primary" value="Send" />
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
</div>
</div>
<!-- <div class="modal ks-messenger"> 
	<div class="modal_content ks-discussions">
		<div id="createRoom">
			<input style="width: 100%; border: none; border-bottom: 1px solid lightgrey;" 
			type="text" id="w_room_name" name="room_name" placeholder="RoomName..." required="required">
		</div>
		<div id="serach">
			<input style="width: 100%; border: none; text-align: center; border-bottom: 1px solid lightgrey" 
			type="text" id="myInput" onkeyup="myFunction()" placeholder="Search...">
		</div>
		<div>
			친구 리스트에서 체크하는 사람 이름 추가될 div박스
			<div style="font-size: 1.2em; font-weight: bold; text-align: center; margin: 10px;" 
						class="s_select_part_tt">선택한 사원 수 : <span id="s_select_part_cnt"></span></div>
			<div style="text-align: center;
					    height: 100px;
					    overflow: auto;
					    border: 1px solid lightgray;
					    padding: 20px;
					    width: 100%;" 
					    id="s_select_part" class="s_scroll">
				<div style="margin-top: 17px;" id="s_invite_list">선택한 사원 목록</div>
			</div>
		</div>
		<div class="ks-body s_scroll" style="height: 65%; overflow: auto; border-bottom: 1px solid lightgrey; padding: 0px; width: 100%;">
	       	<ul id="myUL" class="ks-items">
	       		
	       	</ul>
        </div>
		<div class="btn_create_close">
			<button class="btn_create">Add</button>
			<button class=btn_close>닫기</button>
		</div>
	</div>
</div> -->
<script>
/* $(".btn_add_member").click(room_add_member);
function room_add_member() {
	console.log(this);
	var $thisEle = $(this);
	var rm_id = '${chatMember[0].RM_ID}'
	$.ajax({
  		url : "./room?rm_id="+rm_id,
  		type : "get",
  		success : function(result) {
  			console.log("result : " + result);
  			var html = '';
  			$.each(JSON.parse(result), function(i, item) {
  				html += '<li class="ks-item">';
		        html += '<label class="container">';
	            html += '<span class="ks-avatar">';
                html += '<img src="https://bootdey.com/img/Content/avatar/avatar3.png" width="36" height="36">';
	            html += '</span>';
	            html += '<div class="ks-body">';
	            html += '<div class="ks-name" id="ename">' + item.EMP_NAME + '</div>';
	            html += '<span class="ks-name">' + item.EMP_ID + '</span>';
	            html += '</div>';
	            html += '<div class="form-check">';
	            html += '<input class="form-check-input" name="' + item.EMP_NAME + '" type="checkbox">';
	            html += '<span class="checkmark"></span>';
	            html += '</div>';
		        html += '</label>';
		  		html += '</li>';
  			})
  			$(".modal .ks-items").html(html);
  			openModal($thisEle);
  			$("input[type='checkbox']").change(function() {
  				var ename = $(this).parent().siblings(".ks-body").children("#ename").text(); // emp_name 가져오기
  				console.log("enmae~~~ :" + ename);
  				// 위에서 체크박스 name을 사원의 이름으로 넣어주어 해당 checkbox의 name이 ename인 것이 체크되어 있다면
  				if($("input:checkbox[name=" + ename + "]").is(':checked')) { // 체크박스 체크
  					// 초대할 친구를 선택해주세요. 문구는 보이지 않도록 설정
  					$("#s_invite_list").css('display', 'none');
  					// 대화상대 선택박스에 div박스에 해당 사원 이름과 닫기버튼 추가
  					// 이 때 닫기버튼에 remove(this) 함수를 넣어주어 닫기버튼 클릭 시 remove함수 실행하여 해당 div박스 제거 --- <button type="button" class="btn-close close close1" onclick="remove(this)" aria-label="Close"></button>
  					$("#s_select_part").append('<div class="s_invite_p" >' + ename + '</div>');
  					// 대화상대선택 옆 띄울 숫자 변경
  					cplength();
  				} else { // 체크박스 해제 시
  					// 체크박스 선택 시 대화상대 선택박스에 추가된 div의 class만큼 반복문 실행
  					for(var i = 0; i < $(".s_invite_p").length; i++){
  						// 해당 div박스의 text가 체크박스에서 선택한 ename과 같으면
  						if($(".s_invite_p").eq(i).text() == ename) {
  							// 해당 div박스 삭제
  							$(".s_invite_p").eq(i).remove();
  							// 반복문 탈출
  							break;
  						}
  					}
  					// 대화상대선택 옆 띄울 숫자 변경
  					cplength();
  				}
  				// 대화상태 선택이 많아져서 스크롤바 생겼을 시 추가될 때마다 스크롤 제일 하단으로 내리기
  				var offset = $("#s_select_part").children().last().offset();
  				$("#s_select_part").animate({scrollTop : 90000},0);
  			})
  			// 대화상대선택 옆 띄울 숫자
  			function cplength() {
  					// 대화상대선택에 아무도 선택되지 않았다면
  					if($(".s_invite_p").length == 0) {
  						// 대화상대 선택 숫자 안띄움
  						$("#s_select_part_cnt").text("");
  					} else { // 있다면
  						// 선택된 div개수 만큼 띄움
  						$("#s_select_part_cnt").text($(".s_invite_p").length);
  					}
  				}
  			//대화상대 X 버튼 눌렀을 때 제거
  			function remove(e) {
  				// 버튼의 부모인 div의 text로 이름을 name의 변수에 담아줌
  				var ename = $(e).parent("div").text();
  				// 그 name을 가진 checkbox의 name이 체크되어 있으면 해제해줌
  				$("input:checkbox[name=" + ename + "]").prop("checked", false);
  				// div박스 삭제
  				$(e).parent().remove();
  				// 대화상대선택 옆 띄울 숫자 변경
  				cplength();
  			}
			$(".btn_create").click(function() {
  				
  				// 배열 선언
  				var arr = [];
  				// 선택된 사원만큼 반복문 
  				for(var i=0; i < $(".s_invite_p").length; i++) {
  					arr.push($(".s_invite_p").eq(i).text());
  				}
  				// 사원 이름과 방 제목
  				var obj = {"emp_names" : arr, "rm_name" : $("#w_room_name").val()};
  				console.log(obj);
  				// 대화상대 선택 안했을 시
  				if($(".s_invite_p").length == 0) {
  					alert('대화상대를 선택해주세요');
  					return;
  				}
  				
  				// 방 제목 미입력 시
  				if($("#w_room_name").val() == "") {
  					alert('방 제목을 입력해주세요');
  				} else {
  					$.ajax({
  						url : "./chat/createroom"
  						, type : "post"
  						, data : obj
  						, success: function(result) {
  							console.log("result : " + result);
  							$(".modal").hide();
  							
  							
  						}
  					});
  				}
  			});
  		}
	})
}
//openModal
function openModal(thisEle) {
	console.log(thisEle);
	console.log($(thisEle).next());// $(".modal")
	$(".modal.ks-messenger").css("display","flex");
}
// closeModal
function closeModal(thisEle) {
	console.log(thisEle);
	console.log($(thisEle).parents(".modal"));// $(".modal")
	$(".modal").hide();
}
//close 버튼 누르면 펀딩 모달창 close
$(".btn_close").click(function() {
	console.log(this);
	closeModal(this);
}); */

		$(document).ready(
				function() {
					var rm_name = '${chatMember[0].RM_NAME}'
					var rm_id = '${chatMember[0].RM_ID}'
					var ch_time = '${chatMember[0].CH_TIME}'
					var emp_no = '${chatMember[0].EMP_NO}'
					var username = '${loginSsInfo.emp_id}';
					console.log("방제목,방번호,시간,사원번호,사용자" 
							+ rm_name + ", " + rm_id + ", " + ch_time + ", " + emp_no + ", "  +username);
					
					var sockJs = new SockJS("/grougle/chat");
					//1. SockJS를 내부에 들고있는 stomp를 내어줌
					var stomp = Stomp.over(sockJs);
					console.log('여기는?');
					//2. connection이 맺어지면 실행
					stomp.connect({}, function() {
						console.log("STOMP Connection");
						//4. subscribe(path, callback)으로 메세지를 받을 수 있음
						stomp.subscribe("/sub/chat/message/" + rm_id, function(chat) {
							console.log(chat);
							var content = JSON.parse(chat.body);
							var writer = content.ch_writer;
							var message = content.ch_msg;
							//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
							if (username == writer) { // 보낸 사람의 경우
								// 채팅 여러개 보내면 이름 안뜨게 하기
								if ($("#chatdata").children().last().hasClass("s_sender_chat")) {
									$("#chatdata").append('<div class="s_sender_chat">'	+ message + '</div>');
								} else { // 하나면 이름 매번 뜨기
									$("#chatdata").append('<div class="s_sender">' + writer	+ '</div>');
									$("#chatdata").append('<div class="s_sender_chat">'	+ message + '</div>');
								}
							} else { // 받는 사람의 경우
								if ($("#chatdata").children().last().hasClass("s_receive_chat")) {
									$("#chatdata").append('<div class="s_receive_chat">' + message + '</div>');
								} else {
									$("#chatdata").append('<div class="s_receive">' + writer + '</div>');
									$("#chatdata").append('<div class="s_receive_chat">' + message + '</div>');
								}
							}
							
							// 채팅 여러개 쌓여서 스크롤 바 생길 때 자동으로 가장 하단으로 가기
							var offset = $("#chatdata").children().last().offset();
							console.log(offset);
							$("#chatdata").animate({
								scrollTop : 90000
							}, 0);
						});
						//3. send(path, header, message)로 메세지를 보낼 수 있음
						//stomp.send('/pub/chat/enter', {}, JSON.stringify({ch_msgid: username}))
					});
					$("#sendBtn").on("click", function(e){
    					send();
    				});
					//엔터키 이벤트 등록
					$("#message").keyup(function() {
						if (window.event.keyCode == 13) {
							send();
						}
					})
					function send() {
						var msg = document.getElementById("message");
						console.log(username + ":" + msg.value +" ^^rm_id :" + rm_id);
						stomp.send('/pub/chat/message', {}, JSON.stringify({
							rm_id : rm_id,
							rm_name : rm_name,
							emp_no : emp_no,
							ch_msg : msg.value,
							ch_writer : username
						}));
						msg.value = '';
					}
				});
	</script>
	
	
	<!-- <script>
		$(document).ready(
				function() {
					var rm_name = '${chatMember[0].RM_NAME}'
					var rm_id = '${chatMember[0].RM_ID}'
					var emp_no = '${chatMember[0].EMP_NO}'
					var username = '${emp_id}';
					
					console.log(rm_name + ", " + rm_id + ", " + emp_no + ", " + username);
					
					
					var sockJs = new SockJS("/grougle/chat");
					//1. SockJS를 내부에 들고있는 stomp를 내어줌
					var stomp = Stomp.over(sockJs);
					console.log('여기는?');
					//2. connection이 맺어지면 실행
					stomp.connect({}, function(frame) {
						console.log("STOMP Connection");
						console.log(frame);
						//4. subscribe(path, callback)으로 메세지를 받을 수 있음
						stomp.subscribe("/sub/chat/message/" + rm_id, function(chat) {
							console.log(chat.body);
							
							var content = JSON.parse(chat.body);
							var writer = content.emp_id;
							var message = content.ch_msg;
							var sdate = content.ch_time;
							console.log('++empid: ' + writer);
							//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
							if (username == writer) { // 보낸 사람의 경우
								// 채팅 여러개 보내면 이름 안뜨게 하기
								if ($("#chatdata").children().last().hasClass("s_sender_chat")) {
									$("#chatdata").append('<div class="s_sender_chat">'	+ message + '</div>');
									$("#chatdata").append('<div class="s_sender">' + sdate	+ '</div>');
								} else { // 하나면 이름 매번 뜨기
									$("#chatdata").append('<div class="s_sender">' + writer	+ '</div>');
									$("#chatdata").append('<div class="s_sender_chat">'	+ message + '</div>');
									$("#chatdata").append('<div class="s_sender">' + sdate	+ '</div>');
								}
							} else { // 받는 사람의 경우
								if ($("#chatdata").children().last().hasClass("s_receive_chat")) {
									$("#chatdata").append('<div class="s_receive_chat">' + message + '</div>');
									$("#chatdata").append('<div class="s_receive">' + sdate	+ '</div>');
								} else {
									$("#chatdata").append('<div class="s_receive">' + writer + '</div>');
									$("#chatdata").append('<div class="s_receive_chat">' + message + '</div>');
									$("#chatdata").append('<div class="s_receive">' + sdate	+ '</div>');
								}
							}
							
							// 채팅 여러개 쌓여서 스크롤 바 생길 때 자동으로 가장 하단으로 가기
							var offset = $("#chatdata").children().last().offset();
							console.log(offset);
							$("#chatdata").animate({scrollTop : 90000 }, 0);
						});
						//3. send(path, header, message)로 메세지를 보낼 수 있음
						//stomp.send('/pub/chat/enter', {}, JSON.stringify({rm_id: rm_id, emp_no: emp_no}))
					});
					
					$("#sendBtn").on("click", function(e){
    					send();
    				});
					//엔터키 이벤트 등록
					$("#message").keyup(function() {
						if (window.event.keyCode == 13) {
							send();
						}
					})

					function send() {
							var msg = document.getElementById("message");
							
							console.log(username + ":" + msg.value);
							stomp.send('/pub/chat/message/'+ rm_id, {}, JSON.stringify({
								rm_id : rm_id,
								ch_msg: msg.value,
								emp_no: emp_no
							}));
							msg.value = '';
					   }
					
				});
	</script> -->
	<!-- <script>
		$(document).ready(
				function() {
					
					var rm_name = '${chatMember[0].RM_NAME}'
					var rm_id = '${chatMember[0].RM_ID}'
					var emp_no = '${chatMember[0].EMP_NO}'
					var username = '${loginSsInfo.emp_id}';

					console.log(rm_name + ", " + rm_id + ", " +username);

					var sockJs = new SockJS("/grougle/chat");
					//1. SockJS를 내부에 들고있는 stomp를 내어줌
					var stomp = Stomp.over(sockJs);
					console.log('여기는?');

					//2. connection이 맺어지면 실행
					stomp.connect({}, function() {
						console.log("STOMP Connection");
						//4. subscribe(path, callback)으로 메세지를 받을 수 있음
						stomp.subscribe("/sub/chat/message/" + rm_id, function(chat) {
							console.log(chat);
							var content = JSON.parse(chat.body);

							var writer = content.emp_no;
							var message = content.ch_msg;
							var sdate = content.ch_time;
							console.log('++empno: ' + emp_no);

							//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
							if (username == writer) { // 보낸 사람의 경우
								// 채팅 여러개 보내면 이름 안뜨게 하기
								if ($("#chatdata").children().last().hasClass("s_sender_chat")) {
									$("#chatdata").append('<div class="s_sender_chat">'	+ message + '</div>');
									//$("#chatdata").append('<div class="s_sender">' + sdate	+ '</div>');
								} else { // 하나면 이름 매번 뜨기
									$("#chatdata").append('<div class="s_sender">' + writer	+ '</div>');
									$("#chatdata").append('<div class="s_sender_chat">'	+ message + '</div>');
									//$("#chatdata").append('<div class="s_sender">' + sdate	+ '</div>');
								}
							} else { // 받는 사람의 경우
								if ($("#chatdata").children().last().hasClass("s_receive_chat")) {
									$("#chatdata").append('<div class="s_receive_chat">' + message + '</div>');
									//$("#chatdata").append('<div class="s_sender">' + sdate	+ '</div>');
								} else {
									$("#chatdata").append('<div class="s_receive">' + writer + '</div>');
									$("#chatdata").append('<div class="s_receive_chat">' + message + '</div>');
									//$("#chatdata").append('<div class="s_sender">' + sdate	+ '</div>');
								}
							}
							
							// 채팅 여러개 쌓여서 스크롤 바 생길 때 자동으로 가장 하단으로 가기
							var offset = $("#chatdata").children().last().offset();
							console.log(offset);
							$("#chatdata").animate({
								scrollTop : 90000
							}, 0);
						});

						//3. send(path, header, message)로 메세지를 보낼 수 있음
						//stomp.send('/pub/chat/enter', {}, JSON.stringify({ch_msgid: username}))
					});

					$("#sendBtn").on("click", function(e){
    					send();
    				});
					//엔터키 이벤트 등록
					$("#message").keyup(function() {
						if (window.event.keyCode == 13) {
							send();
						}
					})

					function send() {
							var msg = document.getElementById("message");
							
							console.log(username + ":" + msg.value);
							stomp.send('/pub/chat/message/'+ rm_id, {}, JSON.stringify({
								rm_id : rm_id,
								ch_msg: msg.value,
								emp_no: emp_no
							}));
							msg.value = '';
					   }
					
				});
	</script> -->

</body>
</html>
