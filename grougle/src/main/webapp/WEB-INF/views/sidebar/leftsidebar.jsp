<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="left-side-bar">
		<div class="brand-logo">
			<a href="<%=request.getContextPath() %>/">
				<img src="<%=request.getContextPath() %>/resources/grougle/dark-grougle.svg" alt="" class="dark-logo">
				<img src="<%=request.getContextPath() %>/resources/grougle/light-grougle.svg" alt="" class="light-logo">
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-house-1"></span><span class="mtext">Home</span>
						</a>
						<ul class="submenu">
							<li><a href="index.html">Dashboard style 1</a></li>
							<li><a href="index2.html">Dashboard style 2</a></li>
							<li><a href="index3.html">Dashboard style 3</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-edit2"></span><span class="mtext">주소록</span>
						</a>
						<ul class="submenu">
							<li><a href="form-basic.html">Form Basic</a></li>
							<li><a href="advanced-components.html">Advanced Components</a></li>
							<li><a href="form-wizard.html">Form Wizard</a></li>
							<li><a href="html5-editor.html">HTML5 Editor</a></li>
							<li><a href="form-pickers.html">Form Pickers</a></li>
							<li><a href="image-cropper.html">Image Cropper</a></li>
							<li><a href="image-dropzone.html">Image Dropzone</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-library"></span><span class="mtext">게시판</span>
						</a>
						<ul class="submenu">
							<li><a href="basic-table.html">Basic Tables</a></li>
							<li><a href="datatable.html">DataTables</a></li>
						</ul>
					</li>
					<li>
						<a onclick="location.href='<%=request.getContextPath()%>/calendar/calendar'" class="dropdown-toggle no-arrow" style="cursor: pointer;">
							<span class="micon dw dw-calendar1"></span><span class="mtext">일정관리</span>
						</a>
					</li>
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-apartment"></span><span class= "mtext">거래처</span>
						</a>
						<ul class="submenu">
							<li><a href="ui-buttons.html">Buttons</a></li>
							<li><a href="ui-cards.html">Cards</a></li>
							<li><a href="ui-cards-hover.html">Cards Hover</a></li>
							<li><a href="ui-modals.html">Modals</a></li>
							<li><a href="ui-tabs.html">Tabs</a></li>
							<li><a href="ui-tooltip-popover.html">Tooltip &amp; Popover</a></li>
							<li><a href="ui-sweet-alert.html">Sweet Alert</a></li>
							<li><a href="ui-notification.html">Notification</a></li>
							<li><a href="ui-timeline.html">Timeline</a></li>
							<li><a href="ui-progressbar.html">Progressbar</a></li>
							<li><a href="ui-typography.html">Typography</a></li>
							<li><a href="ui-list-group.html">List group</a></li>
							<li><a href="ui-range-slider.html">Range slider</a></li>
							<li><a href="ui-carousel.html">Carousel</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-right-arrow1"></span><span class="mtext">근태관리</span>
						</a>
						<ul class="submenu">
							<li><a onclick="location.href='<%=request.getContextPath()%>/attendance'">근태</a></li>
							<li><a href="login.html">연차</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-browser2"></span><span class="mtext">메일</span>
						</a>
						<ul class="submenu">
							<li><a href="400.html">400</a></li>
							<li><a href="403.html">403</a></li>
							<li><a href="404.html">404</a></li>
							<li><a href="500.html">500</a></li>
							<li><a href="503.html">503</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-diagram"></span><span class="mtext">전자결재</span>
						</a>
						<ul class="submenu">
							<li><a href="400.html">400</a></li>
							<li><a href="403.html">403</a></li>
							<li><a href="404.html">404</a></li>
							<li><a href="500.html">500</a></li>
							<li><a href="503.html">503</a></li>
						</ul>
					</li>

					<li>
						<a  class="dropdown-toggle no-arrow" href="<%=request.getContextPath() %>/companytree/list">
							<span class="micon dw dw-list3"></span><span class="mtext">조직도</span>
						</a>
					</li>
					<li>
						<a  class="dropdown-toggle no-arrow" href="<%=request.getContextPath() %>/eform/main">
							<span class="micon dw dw-list3"></span><span class="mtext">기안/결재양식</span>
						</a>
					</li>
					
					<li>
						<a  class="dropdown-toggle no-arrow" href="<%=request.getContextPath() %>/eapproval/approvalingpage">
							<span class="micon dw dw-list3"></span><span class="mtext">전자결재</span>
						</a>
					</li>
					
					<li>
						<a class="dropdown-toggle no-arrow" href="javascript:;" 
							onclick="openNav()">
							<span class="micon dw dw-chat3"></span><span class="mtext">메신저</span>
						</a>
					</li>
					
				</ul>
			</div>
		</div>
	</div>