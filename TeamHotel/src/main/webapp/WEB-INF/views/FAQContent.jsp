<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQConetent</title>
</head>
<style>
li{list-style : none;}
 a{color:#333;}
 body{color:#333;}
 *{padding:0;margin:0;}
 </style>
<header>
	<c:if test="${u_type==null }">	
		<div>
			<nav>
				<ul>
					<li><a href="/hotel/login">로그인</a></li>
		            <li><a href="/hotel/register">회원가입</a></li>
		            <li><a href="/hotel/reservation">예약하기</a></li>
		            <li><a href="/hotel/roominfo">객실정보</a></li>
		            <li><a href="/hotel/flist">FAQ</a></li>
		    	</ul>
		    </nav>
		</div>
	 </c:if>
	 <c:if test="${u_type==1 }">
	 	<div>
			<nav>
				<ul>
					<li><a href="/hotel/logout">로그아웃</a></li>
		            <li><a href="/hotel/account_delete">회원탈퇴</a></li>
		 	 		<li><a href="/hotel/guestcontrol">예약자관리</a></li>
		            <li><a href="/hotel/typecontrol">객실타입관리</a></li>
		            <li><a href="/hotel/roomcontrol">객실관리</a></li>
		            <li><a href="/hotel/flist">FAQ</a></li>
				</ul>
			</nav>
		</div>
	 </c:if>              
	 <c:if test="${u_type==2 }">
	 	<div>
			<nav>
				<ul>
					<li><a href="/hotel/logout">로그아웃</a></li>
		            <li><a href="/hotel/account_delete">회원탈퇴</a></li>
		 	 		<li><a href="/hotel/reservation">예약하기</a></li>
		            <li><a href="/hotel/roominfo">객실정보</a></li>
		            <li><a href="/hotel/flist">FAQ</a></li>
				</ul>
			</nav>
		</div>
	 </c:if>
</header>
<body>
	<hr>
	<table>
		<tr>
			<td>
				<input type=hidden value="${post.post_code }" name=post_code>
				제목:${post.title}
			</td>
		</tr>
		</table>
	<table>
		<tr>
			<td style="text-align=right">작성일:${post.created}</td>
		</tr>
	</table>
	<hr>
	<table>
		<tr>
			<td>내용:${post.content}</td>
		</tr>
	</table>
	<c:if test="${u_type==1}"><!-- 1=직원 -->
		<input type=button value="글수정" id="btn_FAQ">
		<input type=button value="게시물 삭제" id="btnDelete">
	</c:if>
	<input type=button value="LIST" id="backtolist">
	<hr>

</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#backtolist',function(){
	document.location='/hotel/flist';
	return false;
})
.on('click','#btn_FAQ',function(){
	document.location='/hotel/admin_fwrite?post_code='+$('input[name=post_code]').val();
	//1. 글쓰기 ->write: 그냥 페이지 띄우기 2. 글수정 ->write : 페이지 띄우며 기존에 있던 값 불러오기
	return false;					   //그러면 fwrite?post_code=+$('input[name=post_code]'.val()); 이거해서 나오는걸 또 만들면 될라나??
})
.on('click','#btnDelete',function(){
	document.location="/hotel/deletefaq?post_code="+$('input[name=post_code]').val(); 
			return false;
}) //.val() 이게 에러난다;; 패스배리어블로 나대서???
	
</script>
</html>