<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/Homeinfo.css" rel="stylesheet" >
<link href="${path}/resources/css/Login.css" rel="stylesheet" >
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="div_outLine">
	<h2 align=center>로그인</h2><br>
	<form method=post action="/hotel/login_check" id=frmlogin onsubmit="check()">
		<div id="div_in">
			<div id="div_info">
				<input type=text name=userid id=userid size=30 placeholder="아이디를 입력해주세요">
			</div>
			<div id="div_info">
				<input type=password name=passcode id=passcode size=30 placeholder="비밀번호를 입력해주세요">
			</div>
			<div id="div_info">
				<input type=submit id=btnSubmit value='로그인'>
			</div>
			<div id="div_sign" align=right>
				<a href="/hotel/register">회원가입</a>
			</div>
		</div>
	</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript" src="${path}/resources/js/login.js"></script>
</html>