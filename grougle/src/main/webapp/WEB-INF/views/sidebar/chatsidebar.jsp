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
			<a href="<%=request.getContextPath()%>/chat/room"></a>
			<button class="tablink" onclick="openPage('EMP', this, '#6495ed')"
				id="defaultOpen">EMP</button>
			<button class="tablink"
				onclick="openPage('PROJECT', this, '#6495ed')">PROJECT</button>
			<button class="tablink" onclick="openPage('CHAT', this, '#6495ed')">CHAT</button>
		</div>
	</div>

	<div class="customscroll">
		<div id="EMP" class="tabcontent">
			<jsp:include page="/WEB-INF/views/chat/room.jsp" flush="false" />
		</div>
		<div id="PROJECT" class="tabcontent">
			<h3>News</h3>
			<p>Some news this fine day!</p>
		</div>
		<div id="CHAT" class="tabcontent">
			<h3>Contact</h3>
			<p>Get in touch, or swing by for a cup of coffee.</p>
		</div>
	</div>
</div>
<script>
// Get the element with id="defaultOpen" and click on it
$(function(){
     document.getElementById("defaultOpen").click();
});
</script>