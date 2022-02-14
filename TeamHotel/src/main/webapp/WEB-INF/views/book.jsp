<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<title>예약</title>

</head>


<style>
	ul{	list-style:none; }
	li{
/* 		list-style : none; */
		border:0;
		float:left;
	}
	a{color:#333;}
	body{color:#333;}
	*{padding:0;margin:0;}
	#div_1{
      height:15%;
      float:left;
      margin-lefr:2%;
      width:100%;
      background-color:#051e3e;
   }
   .info{
      font-size:9pt;
      color:#ffffff;
      text-align:center;
   }
	#div_body{
		height:100vh;
	}
	.div_img{
	width:500px; height:500px; float: left; width: 33%;overflow:hidden; 
/*  	position: absolute; top:100; left: 100;  */
	
	}
 	.img{ 
/*   	position: absolute; top:100; left: 100;   */
 	width: 100%;
 	height: 100%; 
 	background-size: cover  
 	}
	
</style>
<body>
<jsp:include page="header.jsp" />
<div id=div_body>
<h1 align=center>방이름</h1> <!-- ${name} -->

<div class="div_img">
<img src="https://new.stjohns.co.kr/uploads/room/2021/07/b62fd722965492931762e00fddfbb073.png" class="img-fluid" alt="이미지삽입">
</div>
<form action="/hotel/bookcheck" id="frmbook">
<div style="width:500px; height:500px; float: left; width: 33%;">
<table>
<tr><td>roomcode : <input type=text id=roomcode name=roomcode align=left></td></tr>

<tr><td>날짜 : <input type=date id=start_dt name=start_dt>~<input type=date id=end_dt name=end_dt></td></tr>
<div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">인원</span>
  </div>
  <input type="text" type=number id=howmany name=howmany class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
     
</div>
<div class="input-group input-group-sm mb-3">
     <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">가격</span>
  </div>
  <input type="text" type=number id=howmuch name=howmuch class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
</div>

<div class="input-group input-group-sm mb-3">
     <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">예약자</span>
  </div>
  <input type="text" type=text id=booker name=booker class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
</div>

<div class="input-group input-group-sm mb-3">
     <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">예약자번호</span>
  </div>
  <input type="text" type=text id=mobile name=mobile class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
</div>

<tr><td>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">  
  <input class="btn btn-primary" type="submit" id=btnGo value="예약">
</div>
</td></tr>
	</table>
</div>
</form>

</div>
<jsp:include page="footer.jsp" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.on('submit',function(){
	alert(($('#howmany').val()));
})
</script>
</html>