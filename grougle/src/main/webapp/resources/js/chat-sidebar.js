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
	}

// chatwinopen(https://books.google.co.kr/books?id=fFNNEAAAQBAJ&pg=PA553&lpg=PA553&dq=jsp+%EC%B1%84%ED%8C%85+window.open&source=bl&ots=eXoG40MwiG&sig=ACfU3U0m-gi1KtDv4-vqaBlwred3jeW-RQ&hl=ko&sa=X&ved=2ahUKEwiG4JW5-uD4AhWapVYBHYR0CNcQ6AF6BAgnEAM#v=onepage&q=jsp%20%EC%B1%84%ED%8C%85%20window.open&f=false)
	function openChatRoom() {
	  window.open("<%=request.getContextPath() %>/chat/room","","width=320,height=400");
	}
