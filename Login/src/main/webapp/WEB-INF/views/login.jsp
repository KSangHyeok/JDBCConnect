<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
<td>아이디<input type=text id=userid name=userid value=""></td>
</tr>
<tr>
<td>비밀번호<input type=password id=passcode name=passcode value=""></td>
</tr>
<tr>
<td><input type=button id=btnLogin value="로그인"><input type=button id=btnCan value="취소"></td>
</tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.on('click','#btnLogin',function(){
	$.post("/Login/login_check",{},function(txt){
		console.log(txt);
		console.log(txt[0]['userid']);
		for(let i=0;i<txt.length;i++){
		if($('#userid').val()==txt[i]['userid'] && $('#passcode').val()==txt[i]['passcode']){
			$.post('/Login/updateLogin',{userid:$('#userid').val()},function(txt){
				console.log(txt);
				if(txt=="ok"){
			         document.location='/Login/';
			      } else {
			         alert('실패띠');
			      }
			},'text');
			return false;
		}else{
			alert("아이디 또는 비밀번호가 틀립니다");
			break;
		}
		}		
	},'json');
})
.on('click','#btnCan',function(){
	document.location='/Login/';
})
</script>
</html>