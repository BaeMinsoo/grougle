function chk(contextPath){
 var req = document.form.clauseAll.checked;
 var num = 0;
 if(req == true){
  num = 1;
 }
 if(num == 1){
  location.href=contextPath+'/employee/join';
 }else{
  alert("모든 약관에 동의하셔야 합니다.");
 }
}
function nochk(){
 alert("모든 약관에 동의하시지 않으면 Grougle에 가입하실 수 없습니다");
}
$(function(){
	$("#clauseAll").click(function() {
		if($("#clauseAll").is(":checked")) $("input[name=req]").prop("checked", true);
		else $("input[name=req]").prop("checked", false);
	});
	
	$("input[name=req]").click(function() {
		var total = $("input[name=req]").length;
		var checked = $("input[name=req]:checked").length;
	
		if(total != checked) $("#clauseAll").prop("checked", false);
		else $("#clauseAll").prop("checked", true); 
	});	
});
 