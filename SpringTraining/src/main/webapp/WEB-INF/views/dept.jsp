<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서</title>
</head>
<style>
table { border-collapse:collapse}
th,td {border:1px solid black;}
</style>
<body>
<h1>부서</h1>
부서명 : <select id=selD>
<c:forEach items="${jobs}" var="job">
	<option value="${job.department_id}">${job.department_name}</option>
</c:forEach>
</select><br><br>
<table id=tblJob>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.on('change','#selD',function(){
	let eid=$('#selD').val();
	$.ajax({
		url:"/exercise/ee",
		data:{eid:eid},
		method:"GET",
		datetype:'json',
		beforeSend:function(){
			$('#tblJob').empty();
		},
		success:function(data){
			for(i=0;i<data.length;i++){
				let str='<tr><td>'+data[i]['eid']+'</td><td>'+
						data[i]['ename']+'</td><td>'+
						data[i]['mobile']+'</td><td>'+
						data[i]['salary']+'</td></tr>';
				$('#tblJob').append(str);
			}
		}		
	});
})
</script>
</html>