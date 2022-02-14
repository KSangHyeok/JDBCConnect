<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
	#btnSubmit,#btnCancle{
		width:55pt;
		height:30pt;
		font-size:12pt;
		border: 1px solid #A68DAD;
		background-color:#A68DAD;
		border-radius:7px;
		font-weight: bold;
	}
</style>
<body>
	<jsp:include page="header.jsp" />
	<br>
	<h2 align=center>회원탈퇴</h2>
	<form method="POST" action="/hotel/delete_account" id="frmAccount" onsubmit="check()">
	<div id=div_A>
		<table>
			<tr>
				<td>아이디</td>
				<td><input type=text name=userid id=userid size=20 value="${userid }">&nbsp;
				</td>
			</tr>	
			<tr>
				<td>비밀번호</td>
				<td><input type=password name=passcode id=passcode size=20></td>
			</tr>
			<tr>
				<td colspan=2 align=center style="height:100px">
					<input type=submit id=btnSubmit value="회원탈퇴">
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
let recheck=true;
$(document)
.on('click','#btnCancle',function(){
	document.location='/hotel/';
	return false;
})
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
</script>
</html>