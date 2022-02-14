<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<style>
	ul{	list-style:none; }
	li{
/* 		list-style : none; */
		border:0;
		float:left;
	}
	a{color:#333;}
	body{color:#333;}
	*{padding:0;margin:0;}
	#div_1{
		height:10vh;
		float:left;
		margin-lefr:2%;
		width:100%;
	}
	.info{
		font-size:9pt;
		color:grey;
		text-align:center;
	}
	*{padding:0;margin:0;}
	#div_A{
		width:100%;
		height:70vh;
		align:center;		
	}
	table{
		position:relative;
		top:10vh;
		margin-left:auto;
		margin-right:auto;
		border-collapse:collapse;
	}
	td {
		width:150px;
		height:50px;
/* 		border:1px solid black; */
	}
	#btnSubmit,#btnCancle{
		width:55pt;
		height:30pt;
		font-size:12pt;
		border: 1px solid #A68DAD;
		background-color:#A68DAD;
		border-radius:7px;
		font-weight: bold;
	}
	h2{
		font-size:25pt;
	}
</style>

<body>
	<jsp:include page="header.jsp" />
	<br>
	<h2 align=center>로그인</h2>
	<form method=post action="/hotel/login_check" id=frmlogin onsubmit="check()">
	<div id="div_A">
		<table>
			<tr>
				<td align=center>아이디</td>
				<td align=left>
					<input type=text name=userid id=userid size=20>
				</td>			
			</tr>
			<tr>
				<td align=center>비밀번호</td>
				<td align=left><input type=password name=passcode id=passcode size=20></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<input type=button id=btnCancle value='취소'>&nbsp;&nbsp;
					<input type=submit id=btnSubmit value='로그인'>
				</td>
			</tr>
			<tr>
				<td colspan=2 align=right style="height:20px;"><a href="/hotel/register">회원가입</a></td>
			</tr>
		</table>
	</div>
	</form>
	<jsp:include page="footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
let flag=true;
$(document)
.on('click','#btnCancle',function(){
	document.location='/hotel/';
	return false;
})
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
</script>
</html>