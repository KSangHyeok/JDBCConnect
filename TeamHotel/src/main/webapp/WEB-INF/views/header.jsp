<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h1 align=center><a href="/hotel/">NCS7 HOTEL</a></h1>   <!-- homepage -->
	<c:if test="${u_type==null }">	
		<div>
			<nav>
				<ul>
					<li><a href="/hotel/login">로그인</a> /</li>
		            <li><a href="/hotel/register"> 회원가입</a> /</li>
		            <li><a href="/hotel/book"> 예약하기</a> /</li>
		            <li><a href="/hotel/roominfo"> 객실정보</a> /</li>
		            <li><a href="/hotel/FAQ"> FAQ</a></li>
		    	</ul>
		    </nav>
		</div>
	 </c:if>
	 <c:if test="${u_type==1 }">
	 	<div>
			<nav>
				<ul>
					<li><a href="/hotel/logout">로그아웃</a> /</li>
		            <li><a href="/hotel/account_delete">회원탈퇴</a> /</li>
		 	 		<li><a href="/hotel/serva">예약자관리</a> /</li>
		            <li><a href="/hotel/controltype">객실타입관리</a> /</li>
		            <li><a href="/hotel/controlroom">객실관리</a> /</li>
		            <li><a href="/hotel/FAQ">FAQ</a></li>
				</ul>
			</nav>
		</div>
	 </c:if>              
	 <c:if test="${u_type==2 }">
	 	<div>
			<nav>
				<ul>
					<li><a href="/hotel/logout">로그아웃</a> /</li>
		            <li><a href="/hotel/account_delete">회원탈퇴</a> /</li>
		 	 		<li><a href="/hotel/book">예약하기</a> /</li>
		            <li><a href="/hotel/roominfo">객실정보</a> /</li>
		            <li><a href="/hotel/FAQ">FAQ</a></li>
				</ul>
			</nav>
		</div>
	 </c:if>
<br><br>
<hr>