<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- ref:https://www.bootdey.com/snippets/view/bs4-chat-messenger#html -->
<body>
<div class="container">
<div class="ks-page-content">
    <div class="ks-page-content-body">
        <div class="ks-messenger">
        	<div class="ks-discussions">
        		<div class="ks-search">
                    <div class="input-icon icon-right icon icon-lg icon-color-primary">
                        <input id="input-group-icon-text" type="text" class="form-control" placeholder="Search">
                        <span class="icon-addon">
                <span class="la la-search"></span>
                        </span>
                    </div>
                </div>
                <div class="ks-body s_scroll" style="height: 80%; overflow: auto; padding: 0px; width: 100%;">
	              	<ul class="ks-items">
	              		
	              	</ul>
        		</div>
       		</div>
        </div>
    </div>
</div>
</div>
<script>
/* 채팅창 열기(새로운 윈도우창) */
function openChatRoom(rm_id) {
	  window.open("${pageContext.request.contextPath}/chat/room?rm_id="+rm_id,"","width=800,height=600");
	}
</script>
<!-- <script type="text/javascript">
$(document).ready(function(){
    $('.jspContainer').jScrollPane();
});
</script> -->
</body>
