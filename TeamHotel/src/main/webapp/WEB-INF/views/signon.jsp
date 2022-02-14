<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	#btnSubmit,#btnCancle,#check_id{
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
	<h2 align=center>회원가입</h2>
	<form method="POST" action="/hotel/sign_check" id=frmsign>
	<div id="div_A">
<!-- 		<input type=hidden id=user_type name=user_type value="2"> -->
		<table>
			<tr>
				<td align=center>이름</td>
				<td><input type=text name=name id=name size=20></td>
			</tr>
			<tr>
				<td align=center>아이디</td>
				<td style="width:300px;"><input type=text name=userid id=userid size=20>&nbsp;
					<input type=button name=check_id id=check_id value='중복확인'>
				</td>
			</tr>		
			<tr>
				<td align=center>비밀번호</td>
				<td><input type=password name=passcode id=passcode size=20></td>
			</tr>
			<tr>					
				<td align=center>비밀번호 확인</td>
				<td><input type=password name=passcode1 id=passcode1 size=20></td>
			</tr>
			<tr>
				<td align=center>휴대폰번호</td>
				<td><input type=text name=mobile id=mobile size=20></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<input type=submit id=btnSubmit value="가입완료">
					<input type=button id=btnCancle value="취소">
				</td>
			</tr>
		</table>
	</div>
	</form>
	<jsp:include page="footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#btnCancle',function(){
	document.location='/hotel/';
	return false;
})
.on('click','#check_id',function(){
	$('#userid').val($.trim($('#userid').val()));
	if($('#userid').val()=='') {
		alert('아이디를 입력하세요.');
		return false;
	}
    $.post("/hotel/id_check",{userid:$('#userid').val()},function(txt){
    	console.log(txt);
    	if(txt=='fail'){
    		alert('존재하는 아이디입니다.');
    		return false;
    	} else {
    		alert('사용가능한 아이디입니다.');
    		return false;
    	}
    },'text');
    return false;
})
.on('submit','#frmsign',function(){
	$('#name').val($.trim($('#name').val()));
	$('#userid').val($.trim($('#userid').val()));
	$('#passcode').val($.trim($('#passcode').val()));
	$('#passcode1').val($.trim($('#passcode1').val()));
	$('#mobile').val($.trim($('#mobile').val()));
	if($('#name').val()=='') {
		alert('이름을 입력하세요.');
		return false;
	}
	if($('#userid').val()=='') {
		alert('아이디를 입력하세요.');
		return false;
	}
	if($('#passcode').val()=='') {
		alert('비밀번호를 입력하세요.');
		return false;
	}
	if($('#passcode1').val()=='') {
		alert('비밀번호확인을 입력하세요.');
		return false;
	}
	if($('#passcode1').val()!=$('#passcode').val()) {
		alert('비밀번호와 비밀번호확인이 같지 않습니다.');
		return false;
	}
	if($('#mobile').val()==""){
		alert("전화번호를 입력하세요.");
		return false;
	}
	return true;
})
</script>
</html>