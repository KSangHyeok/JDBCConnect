<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
</head>
<body>
<h1 align=center>방이름</h1><hr> <!-- ${name} -->
<table style="float:left;width:45%; height:500px;">
<tr><td>
<div style="width:500px; height:500px; background-color:#CF0">이미지파일</div>
</td></tr>
</table>

<table style="float:right;width:45%; height:500px;;">
<form action="/hotel/bookcheck" id="frmbook">
<tr><td>
roomcode : <input type=text id=roomcode name=roomcode align=left>
</td></tr><tr><td>
날짜 : <input type=date id=start_dt name=start_dt>~<input type=date id=end_dt name=end_dt>
</td></tr><tr><td>
<!-- 인원 : <input type=number id=howmany name=howmany max=4 align=left> 최대4인 -->
인원 : <select id=howmany name=howmany>
	<option value=1>1인</option>
	<option value=2>2인</option>
	<option value=3>3인</option>
	<option value=4>4인</option>
</select>
</td></tr><tr><td>
가격 : <input type=text id=howmuch name=howmuch align=left>
</td></tr><tr><td>
예약자 : <input type=text id=booker name=booker align=left>
</td></tr><tr><td>
예약자 번호 : <input type=text id=mobile name=mobile align=left>
</td></tr>
<tr><td><input type=submit id=btnGo value="예약하기"></td></tr>
</form>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.on('submit',function(){
	alert(($('#howmany').val()));
})
</script>
</html>