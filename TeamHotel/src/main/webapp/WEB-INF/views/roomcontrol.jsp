<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roomControl</title>
</head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <link href="${path}/resources/css/Roominfo.css" rel="stylesheet" >
 <link href="${path}/resources/css/Homeinfo.css" rel="stylesheet" >
<jsp:include page="header.jsp" />
<body>
<form id=frmRoom action="/hotel/addRoom">
<div style="width:470px; position:relative; margin:auto; margin-top:40px;">
		<h1 style="text-align:center; font-weight:bold; font-size:40px; letter-spacing:6px;">객실관리</h1>
		<h2 style="text-align:center; font-weight:bold; color:#ccc; margin-bottom:30px; font-size:22px; letter-spacing:4px;">Room Control</h2>
	<div class="input-group mb-3">
	  <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">Roomcode</span>
	  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
	  		id=room_code name=room_code readonly placeholder='객실코드를 입력해주세요'>
	</div>
	<div class="input-group mb-3">
	  <span class="input-group-text" id="inputGroup-sizing-default">Roomname</span>
	  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
	  		id=name name=name placeholder='객실명을 입력해주세요'>
	</div>
	
		<select class="form-select" aria-label="Default select example" id=selType name=seltype size=1 style="margin-bottom:15px; padding:5px 5px 5px 12px;">
		</select>
	
	<div class="input-group mb-3">
	  <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">Howmany</span>
	  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
	  		id=howmany name=howmany placeholder='숙박인원을 입력해주세요'>
	</div>
	<div class="input-group mb-3">
	  <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">Howmuch</span>
	  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
	  		id=howmuch name=howmuch placeholder='숙박료를 입력해주세요'>
	</div>
		<div style="float:right; margin-bottom:15px;">
					<input type="submit" class="btn btn-secondary" value="Add">
					<button type="button" class="btn btn-secondary" id=btnDelete >Delete</button>
					<button type="reset" class="btn btn-secondary" >Reset</button>
		</div>
		<div class="selectfont">	
		<select class="form-select" multiple aria-label="multiple select example" id=selRoom  size=10
				style="margin-bottom:15px; padding:5px 5px 5px 5px;">
		</select>
		</div>
</div>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
	$.ajax({
		url:"/hotel/roomadd1",
		data:{},
		method:"GET",
		dataType:"json",
		success:function(txt){
			for(i=0; i<txt.length; i++){
				console.log(txt);
				let str='<option value='+txt[i]['room_code']+' style="padding:5px 5px 5px 5px;">'+
						txt[i]['name'].padEnd(15,"\u00A0")+','+
						txt[i]['type'].padEnd(8,"\u00A0")+','+
						txt[i]['howmany']+'명,'+
						txt[i]['howmuch']+'원'+'</option>';
						$('#selRoom').append(str);
			}
		}
	})

	$.ajax({
		url:"/hotel/typeadd1",
		data:{},
		method:"GET",
		dataType:"json",
		success:function(txt){
			for(i=0; i<txt.length; i++){
				let str='<option value='+txt[i]['type_code']+'>'+
						txt[i]['type_name']+'</option>';
						console.log(txt[i]['type_code']);
						$('#selType').append(str);
			}
		}
	})
	
})
.on('click','#btnDelete',function(){
	let url="/hotel/delRoom?room_code="+$('#room_code').val();
	document.location=url;
})
.on('click','#selRoom option',function(){
	console.log($(this).val()+','+$(this).text());
	$('#room_code').val($(this).val());
	let str=$(this).text();
	let ar=str.split(',');
	console.log(ar);
	$('input[name=name]').val($.trim(ar[0]));
// 	$('input[name=type]').val($.trim(ar[1]));
	$('input[name=howmany]').val($.trim(ar[2]));
	$('input[name=howmuch]').val($.trim(ar[3]));
	let seltype=$.trim(ar[1]);	//double이라는 문자열
	$('#selType').val('');
	$('#selType option').each(function(){
		if($(this).text()==seltype){
			$(this).prop('selected','selected');
			return false;
		}
	})
	return false;
})
.on('click','#frmRoom',function(){
	let won=$('#howmany').val();
	let peo=$('#howmuch').val();
	replace(won,"");
	replace(peo,"");
})



</script>
</html>
<jsp:include page="footer.jsp" />