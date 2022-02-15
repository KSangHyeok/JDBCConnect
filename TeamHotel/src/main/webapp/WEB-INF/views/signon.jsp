<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/Homeinfo.css" rel="stylesheet" >
<link href="${path}/resources/css/Signon.css" rel="stylesheet" >
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="div_outLine">
	<h1 align=center class="p_title">NCS7 회원가입</h1><br>
	<h4 align=center>NCS7 MEMBERSHIP REGISTRATION</h4><br><br>
	<form method="POST" action="/hotel/sign_check" id=frmsign>
		<div id="div_in">
			<table>
				<tr>
					<td class=tb_info>아이디</td>
					<td class=tb_val>
						<input type=text name=userid id=userid placeholder="아이디를 입력해주세요">
						<input type=button name=check_id id=check_id value='중복확인'>
					</td>
				</tr>
				<tr>
					<td class=tb_info>비밀번호</td>
					<td class=tb_val><input type=password name=passcode id=passcode placeholder="비밀번호를 입력해주세요"></td>
				</tr>
				<tr>
					<td class=tb_info>비밀번호 재확인</td>
					<td class=tb_val><input type=password name=passcode1 id=passcode1 placeholder="비밀번호를 재입력해주세요"></td>
				</tr>
				<tr>
					<td class=tb_info>고객명</td>
					<td class=tb_val><input type=text name=name id=name placeholder="이름을 입력해주세요"></td>
				</tr>
				<tr>
					<td class=tb_info>휴대전화</td>
					<td class=tb_val><input type=text name=mobile id=mobile placeholder="입력 시 하이픈(-) 생략"></td>
				</tr>
				<tr>
					<td colspan=2>
				</tr>
				<tr>
					<td class=tb_info><input type=button id=btnCancle value="취소">	</td>
					<td class=tb_val><input type=submit id=btnSubmit value="회원가입"></td>
				</tr>
			</table>
		</div>
	</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript" src="${path}/resources/js/signon.js"></script>
</html>