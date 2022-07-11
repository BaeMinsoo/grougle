//Layout settings visible
	function openNav() {
	  document.getElementById("chatNav").style.width = "420px";
	  document.getElementById("main").style.marginRight = "420px";
	}

	function closeNav() {
	  document.getElementById("chatNav").style.width = "0";
	  document.getElementById("main").style.marginRight= "0";
	}

// header settings
	function openPage(pageName,elmnt,color) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablink");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].style.backgroundColor = "";
	  }
	  document.getElementById(pageName).style.display = "block";
	  elmnt.style.backgroundColor = color;
	  
// chatlist loading
	  if(pageName == 'PROJECT') {
	  	$.ajax({
	  		url : "./chat/chatlist",
	  		type : "get",
	  		success : function(result) {
	  			console.log("result : " + result);
	  			var html = '';
	  			$.each(JSON.parse(result), function(i, item) {
	  				html += '<li class="ks-item">';
			        html += '<a class="dropdown-toggle no-arrow" href="javascript:;" onclick="openChatRoom('+item.RM_ID+')">';
		            html += '<span class="ks-avatar">';
	                html += '<img src="https://bootdey.com/img/Content/avatar/avatar3.png" width="36" height="36">';
		            html += '</span>';
		            html += '<div class="ks-body">';
		            html += '<div class="ks-name">' + item.RM_NAME + '</div>'    
		            html += '</div>';
			        html += '</a>';
			  		html += '</li>';
	  				
	  			})
	  			$(".ks-items").html(html);
	  		}
  		})
	  }
	}

	