let flag=true;
$(document)
.on('submit','#frmlogin',function(){
	console.log(flag);
	if(flag==false) return false;
	return true;
})
;
function check(){
	flag=true;
	$('#userid').val($.trim($('#userid').val()));
	$('#passcode').val($.trim($('#passcode').val()));
	if($('#userid').val()=='') {
		flag=false;
		alert('아이디를 입력하세요.');
		return false;
	}
	if($('#passcode').val()=='') {
		flag=false;
		alert('비밀번호를 입력하세요.');
		return false;
	}
	$.ajax({
		url:"/hotel/user_check",
		data:{userid:$('#userid').val(),passcode:$('#passcode').val()},
		dataType:'text',
		method:'post',
		async:false,
		success:function(txt){
			console.log(txt);
 	    	if(txt=='fail'){
 	    		flag=false;
 	    		console.log(flag);
 	    		alert('정보가 일치하지 않습니다.');		 	    		
 	    	}
		}
	});
}