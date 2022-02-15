let recheck=true;
$(document)
.on('submit','#frmAccount',function(){
	console.log("아작스실행후"+recheck);
	if(recheck==false) return false;
	return true;
})
;
function check(){
	recheck=true;
	$('input[name=userid]').val($.trim($('input[name=userid]').val()));
	$('input[name=passcode]').val($.trim($('input[name=passcode]').val()));
	if($('input[name=userid]').val()=='') {
		recheck=false;
		alert('아이디를 입력하세요.');
		return false;
	}
	if($('input[name=passcode]').val()=='') {
		recheck=false;
		alert('비밀번호를 입력하세요.');
		return false;
	}
	$.ajax({
		url:"/hotel/passcode_check",
		data:{userid:$('#userid').val(),passcode:$('#passcode').val()},
		datatype:"text",
		method:"post",
		async:false,
		success:function(data){
			console.log(data);
			if(!confirm("정말로 탈퇴하시겠습니까?")) {
				recheck=false;
				return false;
			}
			if(data=="fail"){
				recheck=false;
				alert("비밀번호가 틀립니다.");
			}
		}
	});
	return false;
}