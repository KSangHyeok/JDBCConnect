<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 관리</title>
</head>
<body>
<table>
<tr>
	<td>
		<select id=selRoom style='width:200px;' size=10>
<%-- 	<c:forEach var="room" items="${room}"> --%>
<%--          <option value=${room.code}>${room.roomname} ${room.name} ${room.howmany} ${room.howmuch}</option> --%>
<%-- 	</c:forEach> --%>
		</select>	
		
	</td>
	<td>
<!-- 		<form id=frmRoom action="/exercise/addRoom"> -->
		<input type=text id=code name=code readonly>		
			<table>
			<tr><td align=right>객실명:</td>
				<td><input type=text name=name></td>
			</tr>
			<tr><td align=right>타입:</td>
				<td>
				<select id=selType name=selType>
					<option value=''>--</option>
<%-- 				<c:forEach items="${types }" var="roomtype"> --%>
<%-- 					<option value=${roomtype.typecode}>${roomtype.name}</option> --%>
<%-- 				</c:forEach> --%>
				</select>
				</td>
			</tr>
			<tr><td align=right>숙박가능인원:</td>
				<td><input type=number name=howmany></td>
			</tr>
			<tr><td align=right>숙박비:</td>
				<td><input type=text name=howmuch></td>
			</tr>
			<tr><td colspan=2 align=center>
				<input type=submit value='추가'>
				<input type=button value="삭제" id=Droom>
				<input type=Reset value="비우기" id=reset></td>
			</tr>
			</table>					
<!-- 		</form> -->
	</td>
</tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.ready(function(){
	$.ajax({url:"/exercise/roomlist",
			data:{},
			method:"GET",
			datatype:"json",
			success:function(txt){
				console.log(txt);
		for(i=0; i<txt.length; i++){
			let str='<option value='+txt[i]['code']+'>'+txt[i]['roomname']+','+txt[i]['name']+','+txt[i]['howmany']+','+txt[i]['howmuch']+'</option>';
			console.log(str);
			$('#selRoom').append(str);
			}
		}	
	});
	$.ajax({url:"/exercise/typelist",
		data:{},
		method:"GET",
		datatype:"json",
		success:function(txt){
			console.log(txt);
	for(i=0; i<txt.length; i++){
		let str='<option value='+txt[i]['typecode']+'>'+txt[i]['name']+'</option>';
		console.log(str);
		$('#selType').append(str);
		}
	}	
});
})
.on('click','#Droom',function(){
	document.location="/exercise/deleteRoom?code="+$('#code').val();
	return false;
})
.on('click','#selRoom option',function(){
	console.log($(this).val()+','+$(this).text());
	$('#code').val($(this).val());		
	console.log($('#code').val());
	let str=$(this).text();
	let ar=str.split(',');
	$('input[name=name]').val($.trim(ar[0]));	
	$('input[name=howmany]').val($.trim(ar[2]));
	$('input[name=howmuch]').val($.trim(ar[3]));
	let roomtype=$.trim(ar[1]);
	$('#roomtype').val('');
	roomtype=roomtype.replace(',','');
	console.log('roomtype['+roomtype+']');
// 	$("#roomtype option:contains("+roomtype+")").attr("selected","selected");
	$('#selType option').each(function(){
		if($(this).text()==roomtype){
			$(this).prop('selected','selected');
			return false;
		}
	});
	return false;
})

</script>
</html>