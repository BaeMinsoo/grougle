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
                                <a class="dropdown-item" href="#">
                                    <span class="la la-user-plus ks-icon"></span>
                                    <span class="ks-text">Add members</span>
                                </a>
                                <a class="dropdown-item" href="#">
                                    <span class="la la-trash-o ks-icon"></span>
                                    <span class="ks-text">Delete</span>
                                </a>
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
<script>
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
