<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<thead>
	<tr><th>부서아이디</th><th>부서명</th><th>상위부서명</th>
		<th>부서장이름</th></tr>
</thead>
<tbody>
<c:forEach items="${de}" var="d">
	<tr>
		<td>${d.id}</td>
		<td>${d.pname}</td>
		<td>${d.ppname}</td>
		<td>${d.name}</td>		
	</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>