<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 정보</title>
</head>
<style>
table{border-cllapse:collapse}
th,td{border:1px solid black;}
</style>
<body>
<table>
<thead>
	<tr><th>사번</th><th>이름</th><th>이메일</th>
		<th>전화번호</th><th>입사일자</th><th>월급</th></tr>
</thead>
<tbody>
<c:forEach items="${alEmp}" var="emp">
	<tr>
		<td>${emp.employee_id}</td>
		<td>${emp.emp_name}</td>
		<td>${emp.email}</td>
		<td>${emp.phone_number}</td>
		<td>${emp.hire_date}</td>
		<td>${emp.salary}</td>
	</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>