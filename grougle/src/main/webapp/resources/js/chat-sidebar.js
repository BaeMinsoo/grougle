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
