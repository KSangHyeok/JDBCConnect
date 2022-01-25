<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<table>
<tr>
<td><%	
	String userid=(String)session.getAttribute("userid"); 
	if(userid==null){
		out.print("<a href='login'>로그인</a>&nbsp;&nbsp;<a href='signon'>회원가입</a>");
	}else{				
		out.print(userid+"<a href='/Login/logout_check'>로그아웃</a>");
	}
	%></td></tr>
</table>
<!-- String userid=session.getAttribute(userid); -->
<%-- <c:if test="userid"> --%>
<!-- <a href='login'>로그인</a>&nbsp;&nbsp;<a href='signon'>회원가입</a> -->
<%-- </c:if> --%>
<%-- <c:if test="userid"> --%>
<%-- ${userid}&nbsp;&nbsp;<a href='logout'>로그아웃</a> --%>
<%-- </c:if> --%>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>

</script>
</html>
