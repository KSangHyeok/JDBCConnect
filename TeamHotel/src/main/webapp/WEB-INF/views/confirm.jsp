<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인</title>
</head>
<style>

</style>
<body>
<h1>예약확인란</h1><hr>
<table>
</table>
<tr><td>
예약자 : ${booker}
전화번호 : ${mobile} 
기간 : ${start_dt} ~ ${end_dt}
인원 : ${howmany}
가격 : ${howmuch}
</td></tr>
</body>
</html>