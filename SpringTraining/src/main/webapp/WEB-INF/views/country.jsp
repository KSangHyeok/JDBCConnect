<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>con</title>
</head>
<style>
table{border-cllapse:collapse}
th,td{border:1px solid black;}
</style>
<body>
<table>
<thead>
	<tr><th>id</th><th>code</th><th>name</th>
		<th>region</th></tr>
</thead>
<tbody>
<c:forEach items="${con}" var="c">
	<tr>
		<td>${c.country_id}</td>
		<td>${c.country_iso_code}</td>
		<td>${c.country_name}</td>
		<td>${c.country_region}</td>
			</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>