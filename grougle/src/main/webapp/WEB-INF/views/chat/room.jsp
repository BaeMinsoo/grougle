<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<body>
	<div class="ks-messages ks-messenger__messages">
		<div class="ks-header">
			<div class="ks-description">
				<div class="ks-name">
					<!-- 채팅방 이름 불러오기 -->
					Chat name
				</div>
				<div class="ks-amount">
					<!-- 채팅방 인원 불러오기 -->
					id: ${loginSsInfo.emp_id}
				</div>
				<div class="ks-search">
                    <div class="input-icon icon-right icon icon-lg icon-color-primary">
                        <input id="input-group-icon-text" type="text" class="form-control" placeholder="Search">
                        <span class="icon-addon">
                <span class="la la-search"></span>
                        </span>
                    </div>
                </div>
			</div>
			<div class="ks-controls">
				<div class="dropdown">
					<button
						class="btn btn-primary-outline ks-light ks-no-text ks-no-arrow"
						type="button" id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<span class="la la-ellipsis-h ks-icon"></span>
					</button>
					<div class="dropdown-menu dropdown-menu-right ks-simple"
						aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#"> <span
							class="la la-user-plus ks-icon"></span> <span class="ks-text">
								<!-- 사원추가 --> Add members
						</span>
						</a> <a class="dropdown-item" href="#"> <span
							class="la la-trash-o ks-icon"></span> <span class="ks-text">
								<!-- 채팅방 나가기 --> Delete
						</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div>
			<input type="text" id="message" placeholder="내용을 입력해주세요" onkeyup="enterkey()" /> 
			<input type="button" id="sendBtn" class="btn btn-primary" value="전송" />
		</div>
		<br>
		<div class="well" id="chatdata">
			<!-- User Session Info Hidden -->
			<input type="hidden" value='${loginSsInfo.emp_id}' id="sessionuserid">
		</div>
	</div>

	<script>
		$(document).ready(
				function() {

					var username = '${loginSsInfo.emp_id}';

					console.log("여기여기+" + username);

					var sockJs = new SockJS("/grougle/chat");
					//1. SockJS를 내부에 들고있는 stomp를 내어줌
					var stomp = Stomp.over(sockJs);
					console.log('여기는?');

					//2. connection이 맺어지면 실행
					stomp.connect({}, function() {
						console.log("STOMP Connection");
						//4. subscribe(path, callback)으로 메세지를 받을 수 있음
						stomp.subscribe("/sub/chat/message/", function(chat) {
							console.log(chat);
							var content = JSON.parse(chat.body);

							var writer = content.ch_msgid;
							var message = content.ch_msg;

							//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
							if (username == writer) { // 보낸 사람의 경우
								// 채팅 여러개 보내면 이름 안뜨게 하기
								if ($("#chatdata").children().last().hasClass(
										"s_sender_chat")) {
									$("#chatdata").append(
											'<div class="s_sender_chat">'
													+ message + '</div>');
								} else { // 하나면 이름 매번 뜨기
									$("#chatdata").append(
											'<div class="s_sender">' + writer
													+ '</div>');
									$("#chatdata").append(
											'<div class="s_sender_chat">'
													+ message + '</div>');
								}
							} else { // 받는 사람의 경우
								if ($("#chatdata").children().last().hasClass(
										"s_receive_chat")) {
									$("#chatdata").append(
											'<div class="s_receive_chat">'
													+ message + '</div>');
								} else {
									$("#chatdata").append(
											'<div class="s_receive">' + writer
													+ '</div>');
									$("#chatdata").append(
											'<div class="s_receive_chat">'
													+ message + '</div>');
								}
							}
						});

						//3. send(path, header, message)로 메세지를 보낼 수 있음
						//stomp.send('/pub/chat/enter', {}, JSON.stringify({ch_msgid: username}))
					});

					// 채팅 여러개 쌓여서 스크롤 바 생길 때 자동으로 가장 하단으로 가기

					$("#message").keyup(function() {
						if (window.event.keyCode == 13) {
							send();
						}
					})

					function send() {
						var msg = document.getElementById("message");

						console.log(username + ":" + msg.value);
						stomp.send('/pub/chat/message', {}, JSON.stringify({
							ch_msg : msg.value,
							ch_msgid : username
						}));
						msg.value = '';
					}

					var offset = $("#chatdata").children().last().offset();
					console.log(offset);
					$("#chatdata").animate({
						scrollTop : 90000
					}, 0);
				});
	</script>

</body>

