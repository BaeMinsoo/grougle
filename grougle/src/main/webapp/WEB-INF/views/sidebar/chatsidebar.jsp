<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<div id="chatNav" class="chat-sidebar">
	<div class="sidebar-title">
		<div class="header-search">
			<form>
				<div class="form-group">
					<i class="dw dw-search2 search-icon"></i> <input type="text"
						class="form-control search-input" placeholder="Search Here">
				</div>
			</form>
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		</div>
		
		<div class="sidebar-btn-group">
			<button class="tablink" onclick="openPage('EMP', this, '#6495ed')" id="defaultOpen">EMP</button>
			<button class="tablink" onclick="openPage('PROJECT', this, '#6495ed')">PROJECT</button>
			<button class="tablink" onclick="openPage('CHAT', this, '#6495ed')">CHAT</button>
		</div>
	</div>
	<div class="customscroll">
		<div id="EMP" class="tabcontent">
			<%@ include file="../chat/chat.jsp"%>
		</div>
		<div id="PROJECT" class="tabcontent">
			<%@ include file="../chat/chat.jsp"%>
		</div>
		<div id="CHAT" class="tabcontent">
			<%@ include file="../chat/chat.jsp"%>
		</div>
	</div>
</div>

    <script>
        var webSocket;
        var nickname;
        document.getElementById("name").addEventListener("click", function(){
            nickname = document.getElementById("nickname").value;
            document.getElementById("nickname").style.display="none";
            document.getElementById("name").style.display="none";
            connect();
        })
        document.getElementById("send").addEventListener("click",function(){
            send();
        })
        function connect(){
            webSocket = new WebSocket("ws://localhost:8080/chat");
            webSocket.onopen = onOpen;
            webSocket.onclose = onClose;
            webSocket.onmessage = onMessage;
        }
        function disconnect(){
            webSocket.send(nickname + "님이 퇴장하셨습니다");
            webSocket.close();
        }
        function send(){
            msg = document.getElementById("message").value;
            webSocket.send(nickname + " : " + msg);
            document.getElementById("message").value = "";
        }
        function onOpen(){
            webSocket.send(nickname + "님이 입장하셨습니다.");
        }
        function onMessage(e){
            data = e.data;
            chatroom = document.getElementById("chatroom");
            chatroom.innerHTML = chatroom.innerHTML + "<br>" + data;
        }
        function onClose(){
 
        }
    </script>