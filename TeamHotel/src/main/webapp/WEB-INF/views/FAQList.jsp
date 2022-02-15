<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ List</title>
</head>
<style>
		table{border-collapse:collapse;}
		td,th{border:1px solid black;}
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
- <a href="/hotel/">홈</a> / FAQ
<br><br><br>
<h1>FAQ</h1>
<c:if test="${u_type==1}"><!-- 1=직원 -->
	<input type=button value="글쓰기" id="btn_FAQ"> <!-- 맞게 고치면 될거에여. 지금은 확인용도라서 -->
</c:if>
	<hr>
	<table id="tbl_FAQList">
		<thead>
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
		
	</table>
	<div>
		<ul>
			<li>
				<a href="/hotel/p">이전</a>
			</li>
			<li>
				<a href="/hotel/n">다음</a>
			</li>
		</ul>
		</div>
	
</body>


<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
	
	$.ajax({
		url:'/hotel/ftitle',
		datatype:'json',
		method:'get',
		beforeSend:function(){
// 			$('#tbl_FAQList').empty();
		},
		success:function(txt){
			console.log(txt);
			for(i=0; i<txt.length; i++){
				
				let str='<tr><td>'+txt[i]['post_code']+'</td><td>'+'<a href="/hotel/fcontent?post_code='+txt[i]['post_code']+'">'
								  +txt[i]['title']+'</a></td><td>'
								  +txt[i]['created']+'</td></tr>';
				console.log(str);
				
				
				$('#tbl_FAQList tbody').append(str);
			}
		}
	});
	return false;
})
.on('click','#btn_FAQ',function(){
	document.location="/hotel/fwrite"
	return false;
})
</script>
</html>