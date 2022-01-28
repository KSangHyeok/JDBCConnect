<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴추가</title>
</head>
<body>
<form action="/exercise/addMenu" id="frmAddMenu">
메누명 : <input type=text name=menu_name><br>
가격<input type=number name=price><br>
<input type=submit value="추가">
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.on('submit','#frmAddMenu',function(){
	if($('input[name=menu_name]').val()=='' || $('input[name=price]').val()==''){
		alert('두 값이 입력되어야 합니다.');
		return false;
	}
	return true;
})
</script>
</html>