<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매니저</title>
</head>
<style>
table { border-collapse:collapse}
th,td {border:1px solid black;}
</style>
<body>
<h1>매니저</h1>
매니저 : <select id=selD>
<c:forEach items="${jobs}" var="job">
	<option value="${job.employee_id}">${job.emp_name}</option>
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
	let did=$('#selD').val();
	$.ajax({
		url:"/exercise/dd",
		data:{eid:did},
		method:"GET",
		datetype:'json',
		beforeSend:function(){
			$('#tblJob').empty();
		},
		success:function(data){
			for(i=0;i<data.length;i++){
				let str='<tr><td>'+data[i]['eid']+'</td></tr>';
				$('#tblJob').append(str);
			}
		}		
	});
})
</script>
</html>