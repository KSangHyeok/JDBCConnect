<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <link href="${path}/resources/css/book.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>

<title>예약</title>

</head>

<jsp:include page="header.jsp" />
<body>
<div class=body>
	<div class=body_1>
		<div class=body_1in>
		<h1 style="font-size:48px; font-weight:bold;">예약하기</h1>
		</div>
	</div>
	<div class=body_2>
		<div class=body_2in>
		<p>			
  			<label>예약 기간
  			<input type="date" id=start_dt name=start_dt class=ip_dt>
  			</label>
  			<label>~
  			<input type="date" id=end_dt name=end_dt class=ip_dt>
  			</label>	
  		  	<label>객실 뷰
  			<select id=seltype name=seltype class=select>
  			</select>
  			</label>
  		  			
  			<input type=text id=howmany name=howmany class=ip_dt placeholder="인원 수">  
  		</p>
  		<p>
  			<input type=button class=btnGo id=btnGo name=btnGo value="검색">
  		</p>
		</div>
	</div>
	<div class=body_3>
		<div class=body_3in>
		
		</div>
		
	</div>
</div>
</body>
<jsp:include page="footer.jsp" />

<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.ready(function(){
	$.ajax({url:"/hotel/typelist",
		data:{},
		method:"GET",
		datatype:"json",
		success:function(txt){
			
	for(i=0; i<txt.length; i++){
		let str='<option value='+txt[i]['code']+'class=selectop>'+txt[i]['name']+'</option>';		
		$('#seltype').append(str);
		}
	}	
});
})
.on('click','#btnGo',function(){
	if($('#start_dt').val()=='' || $('#end_dt').val()==''){
		alert('예약기간을 설정하세요');
		return false;
	}
	if($('howmany').val()){
		alert('인원수를 정하세요');
	}
	console.log("1");
	$.ajax({url:"/hotel/roomlist",
		data:{type_code:$('#seltype').val(),
			  start_dt:$('#start_dt').val(),
			  end_dt:$('#end_dt').val(),
			  howmany:$('#howmany').val()},
		method:"GET",
		datatype:"json",
		success:function(txt){
			console.log(txt);
// 	for(i=0; i<txt.length; i++){
// 		let str='<option value='+txt[i]['type']+'>'+txt[i]['name']+' '+txt[i]['room_code']+' '+txt[i]['howmany']+' '+txt[i]['howmuch']+'</option>';
		
// 		$('#selRoom').append(str);
// 		}
	}	
});
})
</script>
</html>