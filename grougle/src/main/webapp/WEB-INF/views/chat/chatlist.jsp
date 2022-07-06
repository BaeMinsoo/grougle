<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- ref:https://www.bootdey.com/snippets/view/bs4-chat-messenger#html -->
<body>
${loginSsInfo.emp_id}
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
                <div class="ks-body ks-scrollable jspScrollable" data-auto-height="" style="height: 700px; overflow-y: auto; padding: 0px; width: 400px;" tabindex="0">
                	<div class="jspContainer" style="width: 339px; height: 550px;">
                        <div class="jspPane" style="padding: 0px; top: 0px; width: 339px;">
                        	<ul class="ks-items">
                                <li class="ks-item ks-active">
                                    <a href="#">
                                        <span class="ks-group-amount">3</span>
                                        <div class="ks-body">
                                            <div class="ks-name">
                                                Group Chat
                                                <span class="ks-datetime">just now</span>
                                            </div>
                                            <div class="ks-message">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" width="18" height="18" class="rounded-circle"> The weird future of movie theater food
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="ks-item">
                                    <a class="dropdown-toggle no-arrow" href="javascript:;" onclick="openChatRoom()">
                                        <span class="ks-avatar">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar3.png" width="36" height="36">
                                        </span>
                                        <div class="ks-body">
                                            <div class="ks-name">
                                                Zidane
                                                <span class="ks-datetime">just now</span>
                                            </div>
                                            <div class="ks-message">Why didn't he come and talk to me himse...</div>
                                        </div>
                                    </a>
                                </li>
                                <li class="ks-item">
                                    <a href="#">
                                        <span class="ks-avatar">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar4.png" width="36" height="36">
                                            <span class="badge badge-pill badge-danger ks-badge ks-notify">7</span>
                                        </span>
                                        <div class="ks-body">
                                            <div class="ks-name">
                                                Eric George
                                                <span class="ks-datetime">just now</span>
                                            </div>
                                            <div class="ks-message">Why didn't he come and talk to me himse...</div>
                                        </div>
                                    </a>
                                </li>
                        	</ul>
                        </div>
                    </div>
                </div>
        	</div>
        </div>
    </div>
</div>
</div>
<script>
function openChatRoom() {
	  window.open("${pageContext.request.contextPath}/chat/room","","width=320,height=400");
	}
</script>
<!-- <script type="text/javascript">
$(document).ready(function(){
    $('.jspContainer').jScrollPane();
});
</script> -->
</body>
