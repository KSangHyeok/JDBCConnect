<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>input</title>
</head>
<body>


<form method="GET" action="/exercise/calc">
<input type=text id="q" name="q">
<input type=text id="w" name="w">
<select id="op" name="op" size=4>
<option value="+">+</option>
<option value="-">-</option>
<option value="*">*</option>
<option value="/">/</option>
</select>
<input type=submit value="send">
</form>
<c:if test="${e!=null}"><h1>Result=${e}</h1></c:if>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
// $(document)
// .on("submit",function(){
// 	if($('#q').val()=='' || $('#w').val()==''){
// 		alert("값이 주어지지않았습니다");
// 		return false;
// 	}
// })
</script>
</html>