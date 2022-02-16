<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="${path}/resources/css/Homeinfo.css" rel="stylesheet" >
<link href="${path}/resources/css/Roominfo.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>

<head>
<meta charset="UTF-8">
<title>Superior</title>

</head>
<jsp:include page="header.jsp" />
<h1><a href="/hotel/" style="color:#ccc; font-weight:bold; font-size:31px;">NCS7 HOTEL</a></h1>
<div class="page-title">
<h2 style="font-weight:bold; font-size:29.5px; margin-top:15px; letter-spacing:10px;">스위트</h2>
<h3 style="font-weight:bold; letter-spacing:17px; color:#ccc; font-size:18px; margin-left:17px;">Suite</h3>
<h3 style="text-align:left; font-weight:bold; font-size:19px; "><a href="/hotel/roominfo ">Prev</a></h3>
</div> 
<hr>
<body style="text-align:center;">
	<div class="roomTab" style="margin-left:-280px;">
		<ul>
			<li class="on"><a href="/hotel/suite/JUS">Junior-Suite</a></li>
			<li><a href="/hotel/suite/ROS">Royal-Suite</a></li>
			<li><a href="/hotel/suite/GBS">Grandbelu-Suite</a></li>
		</ul>
	</div>
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" style="margin-top:100px; margin-bottom:45px;">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
    
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://new.stjohns.co.kr/uploads/room/2020/11/244a81a3f3341bc06cef8fe29cab8e15.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Suite</h5>
        <p>Junior-Suite / Royal-Suite / Grandbelu-Suite</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://new.stjohns.co.kr/uploads/room/2021/10/749cf8be65fcd1eff5e5a4220aa0f84b.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Junior-Suite </h5>
        <p>Sofa for 4people / Gown / King,Queen-size Bed / Amenity</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://new.stjohns.co.kr/uploads/room/2020/12/cb18557bc5ee6b7c43dd6ce891f43040.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Royal-Suite</h5>
        <p>Sofa for 4people / King size Bed / Ocean-View / Amenity</p>
      </div>
    </div>
<div class="carousel-item">
      <img src="https://new.stjohns.co.kr/uploads/room/2020/12/41171f0c297edbc42eb16a36a4cc8d7f.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Grandbelu-Suite</h5>
        <p>Free Wi-Fi / King Double-size Bed / Full-Ocean-View / Amenity</p>
      </div>
    </div>

  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<hr>
 	<button type="button" class="btnBook" onclick="location.href='/hotel/book'">B O O K I N G</button>
</body>
<jsp:include page="footer.jsp" />
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>

<script>
	$(document).on('click','.roomTab ul li',function(){
		$('.roomTab ul li').removeClass('on');
		$(this).toggleClass('on');
	});
</script>
</html>