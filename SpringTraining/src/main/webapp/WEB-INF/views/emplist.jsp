<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table{border-collapse:collapse;}
td{border:1px solid blue;}
</style>
<body>
<input type=text id=txtKeyword>
<button id=btnShow>직원명단조회</button><br>
<table id=tblEmp>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.on('click','#btnShow',function(){
	console.log('1');
	$.ajax({url:"/exercise/empList",
		data:{kw:$('#txtKeyword').val()},
		method:"GET",
		datatype:"json",
		success:function(txt){
			console.log(txt);
	for(i=0; i<txt.length; i++){
		let str='<tr><td>'+txt[i]['id']+'</td><td>'+txt[i]['name']+'</td><td>'+txt[i]['number']+'</td><td>'+txt[i]['date']+'</td><td>'+txt[i]['mid']+'</td></tr>';
		console.log(str);
		$('#tblEmp').append(str);
		}
	}	
});
})
</script>
</html>