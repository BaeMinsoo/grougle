<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- ref:https://www.bootdey.com/snippets/view/Whatsapp-web-chat-template#html -->
<body>
	<div class="container app">
		<div class="row app-one full">
			<div class="col-sm-4 side full">
				<div class="side-one full">
					<div class="row heading">
						<div class="col-sm-3 col-xs-3 heading-avatar">
							<div class="heading-avatar-icon">
								<img src="https://bootdey.com/img/Content/avatar/avatar1.png">
							</div>
						</div>
						<div class="col-sm-1 col-xs-1  heading-dot  pull-right">
							<i class="fa fa-ellipsis-v fa-2x  pull-right" aria-hidden="true"></i>
						</div>
						<div class="col-sm-2 col-xs-2 heading-compose  pull-right">
							<i class="fa fa-comments fa-2x  pull-right" aria-hidden="true"></i>
						</div>
					</div>

					<div class="row searchBox">
						<div class="col-sm-12 searchBox-inner">
							<div class="form-group has-feedback">
								<input id="searchText" type="text" class="form-control"
									name="searchText" placeholder="Search"> <span
									class="glyphicon glyphicon-search form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="row sideBar">
						<div class="row sideBar-body">
							<div class="col-sm-3 col-xs-3 sideBar-avatar">
								<div class="avatar-icon">
									<img src="https://bootdey.com/img/Content/avatar/avatar1.png">
								</div>
							</div>
							<div class="col-sm-9 col-xs-9 sideBar-main">
								<div class="row">
									<div class="col-sm-8 col-xs-8 sideBar-name">
										<span class="name-meta">John Doe </span>
									</div>
									<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
										<span class="time-meta pull-right">18:18 </span>
									</div>
								</div>
							</div>
						</div>

						<div class="row sideBar-body">
							<div class="col-sm-3 col-xs-3 sideBar-avatar">
								<div class="avatar-icon">
									<img src="https://bootdey.com/img/Content/avatar/avatar2.png">
								</div>
							</div>
							<div class="col-sm-9 col-xs-9 sideBar-main">
								<div class="row">
									<div class="col-sm-8 col-xs-8 sideBar-name">
										<span class="name-meta">John Doe </span>
									</div>
									<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
										<span class="time-meta pull-right">18:18 </span>
									</div>
								</div>
							</div>
						</div>
						<div class="row sideBar-body">
							<div class="col-sm-3 col-xs-3 sideBar-avatar">
								<div class="avatar-icon">
									<img src="https://bootdey.com/img/Content/avatar/avatar3.png">
								</div>
							</div>
							<div class="col-sm-9 col-xs-9 sideBar-main">
								<div class="row">
									<div class="col-sm-8 col-xs-8 sideBar-name">
										<span class="name-meta">John Doe </span>
									</div>
									<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
										<span class="time-meta pull-right">18:18 </span>
									</div>
								</div>
							</div>
						</div>
						<div class="row sideBar-body">
							<div class="col-sm-3 col-xs-3 sideBar-avatar">
								<div class="avatar-icon">
									<img src="https://bootdey.com/img/Content/avatar/avatar4.png">
								</div>
							</div>
							<div class="col-sm-9 col-xs-9 sideBar-main">
								<div class="row">
									<div class="col-sm-8 col-xs-8 sideBar-name">
										<span class="name-meta">John Doe </span>
									</div>
									<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
										<span class="time-meta pull-right">18:18 </span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
$(function(){
    $(".heading-compose").click(function() {
      $(".side-two").css({
        "left": "0"
      });
    });

    $(".newMessage-back").click(function() {
      $(".side-two").css({
        "left": "-100%"
      });
    });
})
</script>
</body>
