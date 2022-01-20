<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
	<title>카페관리</title>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	
</head>
<body align=center>
<h1>
	주문관리
</h1>
<table style='border-collapse:collapse;' align=center>
<tr>
	<td style='border:1px solid black;'>
		<table>
		<tr style='height:24px;'><td align=center>메뉴목록<button id=btnMenu align=right>메뉴관리</button></td></tr>
		<tr><td><select id=selMenu style='width:230px' size=10>
<c:forEach var="menu" items="${ml}">
         <option value="${menu.code}">${menu.name},${menu.price}</option>
</c:forEach>
		</select></td></tr>
		<tr><td>메뉴명&nbsp;<input type=text id=menuname name=menuname readonly size=10 style='width:161px'></td></tr>
		<tr><td>수량&nbsp;<input type=number id=qty name=qty min=1></td></tr>
		<tr><td>금액&nbsp;<input type=number id=price name=price readonly></td></tr>
		<tr><td><button id=btnAdd>추가</button>&nbsp;<button id=btnReset>비우기</button></td></tr>
		</table>
	</td>
	<td>
	<td style='border:1px solid black;'>
		<table>
		<tr style='height:24px;'><td align=center>주문내역</td></tr>
		<tr><td><select id=selOrder style='width:230px' size=10></select></td></tr>
		<tr><td>총액&nbsp;<input type=number id=total name=total style='width:100px;'></td></tr>
		<tr><td>모바일&nbsp;<input type=text id=mobile name=mobile size=12></td></tr>
		<tr><td>&nbsp;</td></tr>
		<tr><td align=right><button id=btnOrder>주문완료</button>&nbsp;<button id=btnCancel>주문취소</button></td></tr>
		</table>
	</td>
	<td style='border:1px solid black;' valign=top>
		<table>
		<tr style='height:24px;'><td align=center>매출내역</td></tr>
		<tr><td><select id=selSales style='width:230px' size=17></select></td></tr>		
		</table>
	</td>
</tr>
</table>
<div style='display:none;' id='dlgMenu'>
<table>
<tr>
	<td>
		<select id="selMenu1" size=10 style='width:200px'>
		</select>
	</td>
	<td>
		<table>
		<tr><td>code&nbsp;<input type=text id=d_code name=d_code size=3></td></tr>
		<tr><td>name&nbsp;<input type=text id=d_name name=d_name size=10></td></tr>
		<tr><td>price&nbsp;<input type=text id=d_price name=d_pruce stype='width:100px'></td></tr>
		<tr><td align=right><button id=btnDone>완료</button>&nbsp;<button id=btnEmpty>리셋</button></td></tr>
		</table>
	</td>
</tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.on('click','#btnMenu',function(){
	$('#dlgMenu').dialog({
		width:500,
		open:function(){
			console.log('open initiated')
			$.post('/cafe/list',{},function(txt){
				console.log(txt);
				for(i=0;i<txt.length; i++){
					let mo=txt[i];
					let str='<option value='+mo['code']+'>'+mo['name']+' '+mo['price']+'원'+'</option>'
					$('#selMenu1').append(str);
				}
			},'json');
		},
		close:function(){}
	});
	return false;
})
;
</script>
</html>
