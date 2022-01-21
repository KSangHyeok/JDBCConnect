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
         <option value="${menu.code}">${menu.name} ${menu.price}</option>
</c:forEach>
		</select></td></tr>
		<tr><td>메뉴명&nbsp;<input type=text id=menuname name=menuname readonly size=10 style='width:161px'>
			<input type=hidden id=code name=code>
		</td></tr>
		<tr><td>수량&nbsp;<input type=number id=qty name=qty min=1></td></tr>
		<tr><td>금액&nbsp;<input type=number id=price name=price readonly>
						<input type=hidden id=net name=net></td></tr>
		<tr><td><button id=btnAdd>추가</button>&nbsp;<button id=btnReset>비우기</button></td></tr>
		</table>
	</td>
	<td>
	<td style='border:1px solid black;'>
		<table>
		<tr style='height:24px;'><td align=center>주문내역</td></tr>
		<tr><td><select id=selOrder style='width:230px; height:192px' size=10></select></td></tr>
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
		<tr><td>price&nbsp;<input type=number id=d_price name=d_price stype='width:100px' step='100'></td></tr>
		<tr><td align=right><button id=btnDone>완료</button>&nbsp;<button id=btnEmpty>비우기</button></td></tr>
		</table>
	</td>
</tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.on('click','#btnOrder',function(){
	if($('#mobile').val()==''){
		if(confirm('모바일번호를 입력하시겠습니까?')) return false;
		$('#mobile').val('-');
	}
	$('#selOrder option').each(function(){
		let str='<option>'+$('#mobile').val()+' '+$(this).text()+'</option>';
		$('#selSales').append(str);
	});
	// AJAX 호출로 Database에 주문내역 저장 by calling$.post();
	return false;
})
.on('click','#btnCancel',function(){
	if(!confirm('모든 주문을 취소할까요?')) return false;
		$('#selOrder').empty();
		$('#total,#mobile').val('');
	
	return false;
})
.on('click','#btnAdd',function(){
	let str='<option value='+$('#code').val()+'>'+$('#menuname').val()+' x'+$('#qty').val()+' '+$('#price').val()+'</option>';
	$('#selOrder').append(str);
	$('#code,#menuname,#price,#net,#qty').val('');
	getSum();
})
.on('keydown','#d_code,#d_name,#d_price',function(event,ui){
	if(event.keyCode==13){
		$('#btnDone').trigger('click');
		return false;
	}		
})
.on('keydown','#qty',function(event,ui){
	if(event.keyCode==13){
		$('#btnAdd').trigger('click');
		return false;
	}		
})
.on('change','#qty',function(){
	let qty=parseInt($(this).val());
	let net=parseInt($('#net').val());
	$('#price').val(qty*net);
	return false;
})
.on('click','#selMenu option',function(){
	$('#code').val($(this).val());
	let txt=$(this).text();
	let ar=txt.split(' ');
	$('#menuname').val($.trim(ar[0]));
	$('#price,#net').val($.trim(ar[1]));
	$('#qty').val(1);
	return false;
})
.on('click','#btnDone',function(){
   if($('#d_code').val()==''){  //  insert or nothing
      if($('#d_name').val()!='' && $('#d_price').val()!=''){
         operation="insertMenu";
      } else {
         alert("메뉴명 또는 가격이 입력되지 않았습니다.");
         return false;
      }
   } else { // delete or update
      if($('#d_name').val()!='' && $('#d_price').val()!=''){
         operation="updateMenu";
      } else {
         operation="deleteMenu";
      }
   }
   let oParam={code:$('#d_code').val(),name:$('#d_name').val(),price:$('#d_price').val()}
   $.post('/cafe/'+operation,oParam,function(txt){
      if(txt=="ok"){     	  
         loadMenu('selMenu1');
         $('#d_code,#d_name,#d_price').val('');
      } else {
         alert(operation+' was failed.');
      }
   },'text');
   return false;
})
.on('click','#btnEmpty',function(){
	$('#d_code,#d_name,#d_price').val('');
// 	$('input[id^="d_"]').val('');
	return false;
})
.on('click','#selMenu1 option',function(){
	$('#d_code').val($(this).val());
	let txt=$(this).text();
	let ar=txt.split(' ');
	$('#d_name').val($.trim(ar[0]));
	$('#d_price').val($.trim(ar[1]));
	return false;
})
.on('click','#btnMenu',function(){
	$('#dlgMenu').dialog({
		modal:true,
		width:500,
		open:function(){
			loadMenu('selMenu1');			
		},
		close:function(){
			$('#selMenu1').empty();
			$('#selMenu').empty();
			loadMenu('selMenu');
		}
	});
	return false;
})

;
function loadMenu(selTarget){	//중복되는 코드-> 한묶음-> 호출(코드 본체 대치)
	$('#'+selTarget).empty();
	$.post('/cafe/list',{},function(txt){				
		console.log(txt);
		for(i=0;i<txt.length; i++){
			let mo=txt[i];			
			let str='<option value='+mo['code']+'>'+mo['name']+' '+mo['price']+'</option>'
			$('#'+selTarget).append(str);
		}
	},'json');
}
function getSum(){
	let total=0;
	$('#selOrder option').each(function(){
		let str=$(this).text();
		let ar=str.split(' ');
		total+=parseInt(ar[2]);
	});
	$('#total').val(total);
}

</script>
</html>
