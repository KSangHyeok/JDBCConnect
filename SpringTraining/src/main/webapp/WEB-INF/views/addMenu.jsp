<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴추가</title>
</head>
<body>
<!-- <form action="/exercise/addMenu" id="frmAddMenu"> -->
<input type=hidden id=code name=code><br>
메누명 : <input type=text name=menu_name id=menu_name><br>
가격<input type=number name=price id=price><br>
<input type=button value="추가" id=btnAdd>
<input type=button value="삭제" id=btnDelete>
<input type=button value="비우기" id=btnEmpty>
<!-- </form> -->
<table>
<tr>
<td>
<select id=selMenu style='width:200px;' size=10>
<%-- 	<c:forEach var="menu" items="${menu}"> --%>
<%--          <option value=${menu.code}>${menu.name} ${menu.price}</option> --%>
<%-- 	</c:forEach> --%>
		</select>	
		</td></tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.ready(function(){
	loadMenu();
})
.on('click','#btnAdd',function(){
	$.ajax({
		url:"/exercise/addMenu",
		data:{code:$('#code').val(),menu_name:$('#menu_name').val(),price:$('#price').val()},
		method:'GET',
		datatype:'json',
		beforeSend:function(){},
		success:function(data){
			loadMenu();
		}
	});
	return false;
})
// .on('submit','#frmAddMenu',function(){
// 	if($('input[name=menu_name]').val()=='' || $('input[name=price]').val()==''){
// 		alert('두 값이 입력되어야 합니다.');
// 		return false;
// 	}
// 	return true;
// })
.on('click','#selMenu option',function(){
	console.log($(this).val()+','+$(this).text());
	$('#code').val($(this).val());	
	let str=$(this).text();
	let ar=str.split(' ');	
	$('input[name=menu_name]').val(ar[0]);
	$('input[name=price]').val(ar[1]);
	return false;
})
// .on('click','#btnDelete',function(){
// 	document.location="/exercise/deleteMenu?code="+$('#code').val();
// 	return false;
// })
.on('click','#btnEmpty',function(){
	$('#code,#menu_name,#price').val('');
})
function loadMenu(){
	$('#code,#menu_name,#price').val('');
	$.ajax({url:"/exercise/menulist",
		data:{},
		method:"GET",
		datatype:"json",
		success:function(txt){
			$('#selMenu').empty();
			console.log(txt);
	for(i=0; i<txt.length; i++){
		let str='<option value='+txt[i]['code']+'>'+txt[i]['name']+' '+txt[i]['price']+'</option>';
		console.log(str);
		$('#selMenu').append(str);
		}
	}	
});
}
</script>
</html>