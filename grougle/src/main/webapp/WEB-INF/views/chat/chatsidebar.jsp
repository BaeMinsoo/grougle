<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal ks-messenger"> 
	<div class="modal_content ks-discussions">
		<div id="createRoom">
			<input style="width: 100%; border: none; border-bottom: 1px solid lightgrey;" 
			type="text" id="w_room_name" name="room_name" placeholder="RoomName..." required="required">
		</div>
		<div id="serach">
			<input style="width: 100%; border: none; text-align: center; border-bottom: 1px solid lightgrey" 
			type="text" id="myInput" onkeyup="myFunction()" placeholder="Search...">
		</div>
		<div>
			<!-- 친구 리스트에서 체크하는 사람 이름 추가될 div박스 -->
			<div style="font-size: 1.2em;
					    font-weight: bold;
					    text-align: center;
				    	margin: 10px;" 
						class="s_select_part_tt">선택한 사원 수 : <span id="s_select_part_cnt"></span></div>
			<div style="text-align: center;
					    height: 100px;
					    overflow: auto;
					    border: 1px solid lightgray;
					    padding: 20px;
					    width: 100%;" 
					    id="s_select_part" class="s_scroll">
				<div style="margin-top: 17px;" id="s_invite_list">선택한 사원 목록</div>
			</div>
		</div>
		<div class="ks-body s_scroll" style="height: 65%; overflow: auto; border-bottom: 1px solid lightgrey; padding: 0px; width: 100%;">
	       	<ul id="myUL" class="ks-items">
	       		
	       	</ul>
        </div>
		<div class="btn_create_close">
			<button class="btn_create">Create</button>
			<button class=btn_close>닫기</button>
		</div>
	</div>
</div>
<div id="chatNav" class="chat-sidebar">
	<div class="sidebar-title">
		<div style="float:left;" class="ks-controls">
			<div class="dropdown">
				<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="<%=request.getContextPath() %>/resources/css/chat/gear_icon.svg">
                </button>
                <div class="dropdown-menu dropdown-menu-right ks-simple" aria-labelledby="dropdownMenuButton">
                    <button class="dropdown-item btn_create_room">
                        <span class="la la-user-plus ks-icon"></span>
                        <span class="ks-text">Create Room</span>
                    </button>
                    <button class="dropdown-item btn_modal" href="#">
                        <span class="la la-trash-o ks-icon"></span>
                        <span class="ks-text">Delete</span>
                    </button>
                </div>
			</div>
		</div>
		<div style="clear:both;" class="header-search">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		</div>

		<div class="sidebar-btn-group">
			<button class="tablink" onclick="openPage('EMP', this, '#6495ed')"
				id="defaultOpen">EMP</button>
			<button class="tablink"
				onclick="openPage('PROJECT', this, '#6495ed')">PROJECT</button>
		</div>
	</div>

	<div class="customscroll">
		<div id="EMP" class="tabcontent">
			<jsp:include page="/WEB-INF/views/chat/emplist.jsp" flush="false" />
		</div>
		<div id="PROJECT" class="tabcontent">
			<jsp:include page="/WEB-INF/views/chat/chatlist.jsp" flush="false" />
		</div>
	</div>
</div>
<script>
$(".btn_create_room").click(createroom_emplist);
function createroom_emplist() {
	console.log(this);
	var $thisEle = $(this);
	$.ajax({
  		url : "./chat/chatsidebar",
  		type : "get",
  		success : function(result) {
  			console.log("result : " + result);
  			var html = '';
  			$.each(JSON.parse(result), function(i, item) {
  				html += '<li class="ks-item">';
		        html += '<label class="container">';
	            html += '<span class="ks-avatar">';
                html += '<img src="https://bootdey.com/img/Content/avatar/avatar3.png" width="36" height="36">';
	            html += '</span>';
	            html += '<div class="ks-body">';
	            html += '<div class="ks-name" id="ename">' + item.EMP_NAME + '</div>';
	            html += '<span class="ks-name">' + item.EMP_ID + '</span>';
	            html += '</div>';
	            html += '<div class="form-check">';
	            html += '<input class="form-check-input" name="' + item.EMP_NAME + '" type="checkbox">';
	            html += '<span class="checkmark"></span>';
	            html += '</div>';
		        html += '</label>';
		  		html += '</li>';
  			})
  			$(".modal .ks-items").html(html);
  			openModal($thisEle);
  			$("input[type='checkbox']").change(function() {
  				var ename = $(this).parent().siblings(".ks-body").children("#ename").text(); // emp_name 가져오기
  				console.log("enmae~~~ :" + ename);
  				// 위에서 체크박스 name을 사원의 이름으로 넣어주어 해당 checkbox의 name이 ename인 것이 체크되어 있다면
  				if($("input:checkbox[name=" + ename + "]").is(':checked')) { // 체크박스 체크
  					// 초대할 친구를 선택해주세요. 문구는 보이지 않도록 설정
  					$("#s_invite_list").css('display', 'none');
  					// 대화상대 선택박스에 div박스에 해당 사원 이름과 닫기버튼 추가
  					// 이 때 닫기버튼에 remove(this) 함수를 넣어주어 닫기버튼 클릭 시 remove함수 실행하여 해당 div박스 제거 --- <button type="button" class="btn-close close close1" onclick="remove(this)" aria-label="Close"></button>
  					$("#s_select_part").append('<div class="s_invite_p" >' + ename + '</div>');
  					// 대화상대선택 옆 띄울 숫자 변경
  					cplength();
  				} else { // 체크박스 해제 시
  					// 체크박스 선택 시 대화상대 선택박스에 추가된 div의 class만큼 반복문 실행
  					for(var i = 0; i < $(".s_invite_p").length; i++){
  						// 해당 div박스의 text가 체크박스에서 선택한 ename과 같으면
  						if($(".s_invite_p").eq(i).text() == ename) {
  							// 해당 div박스 삭제
  							$(".s_invite_p").eq(i).remove();
  							// 반복문 탈출
  							break;
  						}
  					}
  					// 대화상대선택 옆 띄울 숫자 변경
  					cplength();
  				}
  				// 대화상태 선택이 많아져서 스크롤바 생겼을 시 추가될 때마다 스크롤 제일 하단으로 내리기
  				var offset = $("#s_select_part").children().last().offset();
  				$("#s_select_part").animate({scrollTop : 90000},0);
  			})
  			// 대화상대선택 옆 띄울 숫자
  			function cplength() {
  					// 대화상대선택에 아무도 선택되지 않았다면
  					if($(".s_invite_p").length == 0) {
  						// 대화상대 선택 숫자 안띄움
  						$("#s_select_part_cnt").text("");
  					} else { // 있다면
  						// 선택된 div개수 만큼 띄움
  						$("#s_select_part_cnt").text($(".s_invite_p").length);
  					}
  				}
  			//대화상대 X 버튼 눌렀을 때 제거
  			function remove(e) {
  				// 버튼의 부모인 div의 text로 이름을 name의 변수에 담아줌
  				var ename = $(e).parent("div").text();
  				// 그 name을 가진 checkbox의 name이 체크되어 있으면 해제해줌
  				$("input:checkbox[name=" + ename + "]").prop("checked", false);
  				// div박스 삭제
  				$(e).parent().remove();
  				// 대화상대선택 옆 띄울 숫자 변경
  				cplength();
  			}
			$(".btn_create").click(function() {
  				
  				// 배열 선언
  				var arr = [];
  				// 선택된 사원만큼 반복문 
  				for(var i=0; i < $(".s_invite_p").length; i++) {
  					arr.push($(".s_invite_p").eq(i).text());
  				}
  				// 사원 이름과 방 제목
  				var obj = {"emp_names" : arr, "rm_name" : $("#w_room_name").val()};
  				console.log(obj);
  				// 대화상대 선택 안했을 시
  				if($(".s_invite_p").length == 0) {
  					alert('대화상대를 선택해주세요');
  					return;
  				}
  				
  				// 방 제목 미입력 시
  				if($("#w_room_name").val() == "") {
  					alert('방 제목을 입력해주세요');
  				} else {
  					$.ajax({
  						url : "./chat/createroom"
  						, type : "post"
  						, data : obj
  						, success: function(result) {
  							console.log("result : " + result);
  							$(".modal").hide();
  							
  							
  						}
  					});
  				}
  			});
  		}
	})
}





//openModal
function openModal(thisEle) {
	console.log(thisEle);
	console.log($(thisEle).next());// $(".modal")
	$(".modal.ks-messenger").css("display","flex");
}
// closeModal
function closeModal(thisEle) {
	console.log(thisEle);
	console.log($(thisEle).parents(".modal"));// $(".modal")
	$(".modal").hide();
}
//close 버튼 누르면 펀딩 모달창 close
$(".btn_close").click(function() {
	console.log(this);
	closeModal(this);
});
// 검색(https://www.w3schools.com/howto/howto_js_filter_lists.asp)
function myFunction() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("label")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}
// Get the element with id="defaultOpen" and click on it
$(function(){
     document.getElementById("defaultOpen").click();
});
</script>