let flag=true;
$(document)
.on('click','#btnCancle',function(){
	document.location="/hotel/"
	return false;
})
.on('click','#check_id',function(){
	$('#userid').val($.trim($('#userid').val()));
	if($('#userid').val()=='') {
		alert('아이디를 입력하세요.');
		return false;
	}
	$.ajax({
		url:"/hotel/id_check",
		data:{userid:$('#userid').val()},
		dataType:'text',
		method:'post',
		async:false,
		success:function(txt){
			console.log(txt);
	    	if(txt=='fail'){
	    		flag=false;
	    		alert('가입되어있는 아이디입니다.');
	    		return false;
	    	} else {
	    		alert('사용가능한 아이디입니다.');
	    		return false;
    		}
		}
	});
    return false;
})
.on('submit','#frmsign',function(){
	$('#name').val($.trim($('#name').val()));
	$('#passcode').val($.trim($('#passcode').val()));
	$('#passcode1').val($.trim($('#passcode1').val()));
	$('#mobile').val($.trim($('#mobile').val()));
	if($('#passcode').val()=='') {
		alert('비밀번호를 입력하세요.');
		return false;
	}
	if($('#passcode1').val()=='') {
		alert('비밀번호확인을 입력하세요.');
		return false;
	}
	if($('#passcode1').val()!=$('#passcode').val()) {
		alert('비밀번호가 같지 않습니다.');
		return false;
	}
	if($('#name').val()=='') {
		alert('이름을 입력하세요.');
		return false;
	}
	if($('#mobile').val()==""){
		alert("휴대전화를 입력하세요.");
		return false;
	}
	return true;
})
;