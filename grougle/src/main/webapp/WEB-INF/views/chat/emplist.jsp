<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- ref:https://www.bootdey.com/snippets/view/Whatsapp-web-chat-template#html -->
<body>
<div class="container">
<div class="ks-page-content">
    <div class="ks-page-content-body">
        <div class="ks-messenger">
        	<div class="ks-discussions">
        		<div id="serach">
					<input style="width: 300px; border: none; text-align: center; border-bottom: 1px solid lightgrey" 
					type="text" id="myInput" onkeyup="myFunction()" placeholder="Search...">
				</div>
                <!-- 사원목록  -->
                <div class="ks-body s_scroll" style="height: 80%; overflow: auto; padding: 0px; width: 100%;">
	               	<ul id="myUL" class="emplist ks-items">
	               		
	               	</ul>
                </div>
                
                
        	</div>
        </div>
    </div>
</div>
</div>
<script>
//검색(https://www.w3schools.com/howto/howto_js_filter_lists.asp)
function myFunction() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}
/* 채팅창 열기(새로운 윈도우창) */
function openoboChatRoom(rm_id) {
	  window.open("${pageContext.request.contextPath}/chat/room?rm_id="+rm_id,"","width=800,height=600");
	}
</script>
</body>
