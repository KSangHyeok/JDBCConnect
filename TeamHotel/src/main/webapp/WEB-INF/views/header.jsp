<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

   <c:if test="${u_type==null }">   
       <nav class="navbar navbar-expand-lg navbar-light bg-light" style="height:100px; margin-bottom:-75px;">
  <div class="container-fluid">
    <a class="navbar-brand" href="/hotel/" style="font-weight:bolder; font-size:35px;">NCS7 Hotel</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/hotel/login">Log-in</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/hotel/register">Register</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/hotel/book">Reservation</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/hotel/flist">FAQ</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Roominfo
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/hotel/superior">Superior</a></li>
            <li><a class="dropdown-item" href="/hotel/gorgeous">Gorgeous</a></li>
            <li><a class="dropdown-item" href="/hotel/suite">Suite</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
</c:if>
 
    <c:if test="${u_type==1 }">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="height:100px; margin-bottom:-75px;">
  <div class="container-fluid">
    <a class="navbar-brand" href="/hotel/" style="font-weight:bolder; font-size:35px;">NCS7 Hotel</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/hotel/logout">Log-out</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/hotel/account_delete">Account withdrawal</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/hotel/serva">Guestcontrol</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/hotel/flist">FAQ</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            RoomControl
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/hotel/typecontrol">TypeControl</a></li>
            <li><a class="dropdown-item" href="/hotel/roomcontrol">RoomControl</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
</c:if>              

    
    <c:if test="${u_type==2 }">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="height:100px; margin-bottom:-75px;">
  <div class="container-fluid">
    <a class="navbar-brand" href="/hotel/" style="font-weight:bolder; font-size:35px;">NCS7 Hotel</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/hotel/logout">Log-out</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/hotel/account_delete">Account withdrawal</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/hotel/book">Reservation</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/hotel/flist">FAQ</a>
        </li>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Roominfo
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/hotel/superior">Superior</a></li>
            <li><a class="dropdown-item" href="/hotel/gorgeous">Gorgeous</a></li>
            <li><a class="dropdown-item" href="/hotel/suite">Suite</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
    </c:if>
<br><br>
<hr>