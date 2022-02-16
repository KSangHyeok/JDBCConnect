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
<h2 style="font-weight:bold; font-size:29.5px; margin-top:15px;">슈페리얼</h2>
<h3 style="font-weight:bold; letter-spacing:17px; color:#ccc; font-size:10px; margin-left:17px;">SUPERIOR</h3>
<h3 style="text-align:left; font-weight:bold; font-size:19px;"><a href="/hotel/roominfo">Prev</a></h3>
</div> 
<hr>
<body style="text-align:center;">
	<div class="roomTab">
		<ul>
			<li class="on"><a href="/hotel/superior/SDB">Superior Double</a></li>
			<li><a href="/hotel/superior/STW">Superior Twin</a></li>
			<li><a href="/hotel/superior/SFD">Superior Family Double</a></li>
			<li><a href="/hotel/superior/SFT">Superior Family Twin</a></li>
		</ul>
	</div>
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" style="margin-top:100px; margin-bottom:45px;">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://new.stjohns.co.kr/uploads/room/2021/07/b62fd722965492931762e00fddfbb073.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Superior</h5>
        <p>Double / Twin / Family-Double / Family-Twin</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://new.stjohns.co.kr/uploads/room/2021/07/0a0489a2dacb993e999da3445cc29304.JPG" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Superior Double </h5>
        <p>Free Wi-Fi / 43 inch LED TV / Hair Dryer / Amenity</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://new.stjohns.co.kr/uploads/room/2020/12/2496be41e69eda9e4c48edb08b5fcb5f.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Superior Twin</h5>
        <p>Free Wi-Fi / Twin size Bed / Hair Dryer / Amenity</p>
      </div>
    </div>
<div class="carousel-item">
      <img src="https://new.stjohns.co.kr/uploads/room/2020/12/fccf6f96480f042087f21dcfc60da8c3.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Superior Family Double</h5>
        <p>Free Wi-Fi / Double size Bed / Hair Dryer / Amenity</p>
      </div>
    </div>
<div class="carousel-item">
      <img src="https://new.stjohns.co.kr/uploads/room/2020/12/d38f03ce6a9b384a20eaf0eb23184e94.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Superior Family Twin</h5>
        <p>Free Wi-Fi / Twin size Bed / Hair Dryer / Amenity</p>
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