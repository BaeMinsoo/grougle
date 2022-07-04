<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>
	<h1>Chatting Page (id: ${empId})</h1>
	<br>
	<div>
		<div>
			<input type="text" id="message"/>
    		<input type="button" id="sendBtn" value="전송"/>
    	</div>
    	<br>
    	<div class="well" id="chatdata">
    		<!-- User Session Info Hidden -->
    		<input type="hidden" value='${empId}' id="sessionuserid">
    	</div>
	</div>

<script>
  $(document).ready(function(){

    var username = $('#sessionuserid').val();;

    console.log(username);

    var sockJs = new SockJS("/grougle/chat");
    //1. SockJS를 내부에 들고있는 stomp를 내어줌
    var stomp = Stomp.over(sockJs);
    console.log('여기는?');
	
	    //2. connection이 맺어지면 실행
	  	stomp.connect({}, function (){
    	console.log("STOMP Connection");
      //4. subscribe(path, callback)으로 메세지를 받을 수 있음
      	stomp.subscribe("/sub/chat/message/", function (chat) {
        var content = JSON.parse(chat.body);

        var writer = content.ch_msgid;
        var message = content.ch_msg;
        
      //나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
    	if(username == writer){
    		var printHTML = "<div class='well'>";
    		printHTML += "<div class='alert alert-info'>";
    		printHTML += "<strong>["+writer+"] -> "+message+"</strong>";
    		printHTML += "</div>";
    		printHTML += "</div>";
    		
    		$("#chatdata").append(printHTML);
    	} else{
    		var printHTML = "<div class='well'>";
    		printHTML += "<div class='alert alert-warning'>";
    		printHTML += "<strong>["+writer+"] -> "+message+"</strong>";
    		printHTML += "</div>";
    		printHTML += "</div>";
    		
    		$("#chatdata").append(printHTML);
    	}
      });

      //3. send(path, header, message)로 메세지를 보낼 수 있음
      stomp.send('/pub/chat/enter', {}, JSON.stringify({msg_id: username}))
    });

    $("#sendBtn").on("click", function(e){
      var msg = document.getElementById("message");

      console.log(username + ":" + msg.value);
      stomp.send('/pub/chat/message', {}, JSON.stringify({ch_msg: msg.value, ch_msgid: username}));
      msg.value = '';
    });
  });
  
//엔터키 이벤트 등록
  function enterkey(){
  	if (window.event.keyCode == 13) {
      	// 엔터키가 눌렸을 때
      	console.log('enter message...');
      	sendMessage();
  	}
  }
</script>
	
<!-- <script type="text/javascript">
$(function(){
	//websocket을 지정한 URL로 연결
	sock= new SockJS("<c:url value="/echo"/>");
	
	//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
	sock.onmessage = onMessage;
	//websocket 과 연결을 끊고 싶을때 실행하는 메소드
	sock.onclose = onClose;
});
	
$("#sendBtn").click(function(){
	console.log('send message...');
       sendMessage();
   });	        
	
	
function sendMessage(){      
	//websocket으로 메시지를 보내겠다.
  	sock.send($("#message").val());     
}
            
//evt 파라미터는 websocket이 보내준 데이터다.
function onMessage(evt){  //변수 안에 function자체를 넣음.
	var data = evt.data;
	var sessionid = null;
	var message = null;
	
	//문자열을 splite//
	var strArray = data.split('|');
	
	for(var i=0; i<strArray.length; i++){
		console.log('str['+i+']: ' + strArray[i]);
	}
	
	//current session id//
	var currentuser_session = $('#sessionuserid').val();
	console.log('current session id: ' + currentuser_session);
	
	sessionid = strArray[0]; //현재 메세지를 보낸 사람의 세션 등록//
	message = strArray[1]; //현재 메세지를 저장//
	
	//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
	if(sessionid == currentuser_session){
		var printHTML = "<div class='well'>";
		printHTML += "<div class='alert alert-info'>";
		printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
		printHTML += "</div>";
		printHTML += "</div>";
		
		$("#chatdata").append(printHTML);
	} else{
		var printHTML = "<div class='well'>";
		printHTML += "<div class='alert alert-warning'>";
		printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
		printHTML += "</div>";
		printHTML += "</div>";
		
		$("#chatdata").append(printHTML);
	}
	
	console.log('chatting data: ' + data);
	
  	/* sock.close(); */
  	
}
function onClose(evt){
	$("#data").append("연결 끊김");
}    
</script> -->
</body>

