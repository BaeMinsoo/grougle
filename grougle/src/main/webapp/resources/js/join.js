var isCheckId = 0;
	function duplicationId () {
		var inputId = $("#emp_id").val();
		$.ajax({
			async: false,
			type: "post",
			url: "idcheck",
			data: emp_id,
			success: function (data) {
				if(data == "S") {
					alert("사용가능한 아이디입니다.");
					
					$("#divInputEmpid").addClass("has-success")
					$("#divInputEmpid").removeClass("has-error")
					
					$("#signUpUserPwd").focus();
					isCheckId = 1;
				} else {
					alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
					
					$("#divInputEmpid").addClass("has-error")
					$("#divInputEmpid").removeClass("has-success")
					
					$("#emp_id").focus();
				}
			},
			error: function(req, status, errThrown) {
				alert("network error occur");
			}
		});
	}
	
	function DosignUp() {
		
		var inputId = $("#signUpUserId").val();
		var inputPwd = $("#signUpUserPwd").val();
		var inputPwdCfm = $("#signUpUserPwdCfm").val();
		var inputCpnName = $("#signUpUserCompanyName").val();
		var inputCpnTelNo = $("#signUpUserTelNo").val();
		var inputCpnEmail = $("#signUpUserEmail").val();
		var inputCpnNo = $("#signUpUserCompanyNo").val();
		var inputCpnAddr1 = $("#signUpUserPostNo").val();
		var inputCpnAddr2 = $("#signUpUserCompanyAddress").val();
		var inputCpnAddr3 = $("#signUpUserCompanyAddressDetail").val();
		
		if(inputId.length == 0) { alert("아이디를 입력해 주세요."); $("#signUpUserId").focus(); return; }
		if(isCheckId == 0) { alert("아이디 중복 체크를 해주세요."); $("#signUpUserId").focus(); return; }
		
		if(inputPwd.length == 0) { alert("비밀번호를 입력해 주세요."); $("#signUpUserPwd").focus(); return; }
		if(inputPwd != inputPwdCfm) { alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); $("#signUpUserPwd").focus(); return; }
		
		if(inputCpnName.length == 0) { alert("회사명을 입력해 주세요."); $("#signUpUserCompanyName").focus(); return; }
		
		if(inputCpnTelNo.length == 0) { alert("전화번호를 입력해 주세요."); $("#signUpUserTelNo").focus(); return; }
		
		if(inputCpnEmail.length == 0) { alert("이메일을 입력해 주세요."); $("#signUpUserEmail").focus(); return; }
		
		if(inputCpnNo.length == 0) { alert("사업자번호를 입력해 주세요."); $("#signUpUserCompanyNo").focus(); return; }
		
		if(inputCpnAddr1.length == 0 || inputCpnAddr2.length == 0 || inputCpnAddr3.length == 0) { 
			alert("주소를 입력해 주세요."); $("#signUpUserCompanyAddressDetail").focus();  return;
		}
		if(confirm("회원가입을 하시겠습니까?")) {
			alert("가입!");
			
			location.href= "...do";
			
			
		}
	}
	
	function CheckCompanyNo() {
		
	}
   
	$("#postcode_btn")
          .click(
                function sample4_execDaumPostcode() {
                   new daum.Postcode(
                         {
                            oncomplete : function(data) {
                               
                               var roadAddr = data.roadAddress;
                               var extraRoadAddr = ''; 

                              
                               if (data.bname !== ''
                                     && /[동|로|가]$/g
                                           .test(data.bname)) {
                                  extraRoadAddr += data.bname;
                               }
                               
                               if (data.buildingName !== ''
                                     && data.apartment === 'Y') {
                                  extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                        + data.buildingName
                                        : data.buildingName);
                               }
                              
                               if (extraRoadAddr !== '') {
                                  extraRoadAddr = ' ('
                                        + extraRoadAddr + ')';
                               }

                              
                               document.getElementById("postcode").value = data.zonecode;
                               document
                                     .getElementById("roadAddress").value = roadAddr;

                               var guideTextBox = document
                                     .getElementById("guide");                                                      
                            } 
                         }).open();
                });             