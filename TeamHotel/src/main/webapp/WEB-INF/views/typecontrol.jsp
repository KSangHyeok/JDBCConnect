<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>typeControl</title>
</head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <link href="${path}/resources/css/Homeinfo.css" rel="stylesheet" >
<jsp:include page="header.jsp" />
<body>
<form id=frmRoom action="/hotel/addType" style="height:524px;">
<div style="width:470px; position:relative; margin:auto; margin-top:100px;">
	<h1 style="text-align:center; font-weight:bold; font-size:40px; letter-spacing:6px;">객실타입관리</h1>
	<h2 style="text-align:center; font-weight:bold; color:#ccc; margin-bottom:30px; font-size:22px; letter-spacing:4px;">Roomtype Control</h2>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="inputGroup-sizing-default" style="width:150px;">Roomtype-Code</span>
		  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
		  id=type_code name=type_code readonly>
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="inputGroup-sizing-default" style="width:150px;">Roomtype-Name</span>
		  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
		  id=name name=name>
		</div>
			<div style="float:right;">
				<input type="submit" class="btn btn-secondary" value="Add">
				<button type="button" class="btn btn-secondary" id=btnUpdate>Update</button>
				<button type="button" class="btn btn-secondary" id=btnDelete>Delete</button>
				<button type="reset" class="btn btn-secondary">Reset</button>
			</div>
			<div>
				<select class="form-select" multiple aria-label="multiple select example" id=selType name=selType size=5
				style="margin-top:70px; padding:5px 5px 5px 5px;">
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
		url:"/hotel/typeadd1",
		data:{},
		method:"GET",
		datatype:"json",
		success:function(txt){
			for(i=0; i<txt.length; i++){
				let str='<option value='+txt[i]['type_code']+'>'+
						txt[i]['type_name']+'</option>';
						$('#selType').append(str);
			}
		}
	})
	
})
.on('click','#btnDelete',function(){
	let url="/hotel/delType?type_code="+$('#type_code').val();
	document.location=url;
})
.on('click','#btnUpdate',function(){
	let url="/hotel/updType?type_code="+$('#type_code').val()+"&name="+$('#name').val();
	document.location=url;
})
.on('click','#selType option',function(){
	console.log($(this).val()+','+$(this).text());
	let str=$(this).text();
	let ar=str.split(',');
	$('#type_code').val($(this).val());
	$('input[name=name]').val($.trim(ar[0]));
	
	return false;
})
</script>
</html>
<jsp:include page="footer.jsp" />