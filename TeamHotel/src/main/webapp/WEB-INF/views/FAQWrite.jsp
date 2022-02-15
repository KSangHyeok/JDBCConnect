<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<style>
		table{border-collapse:collapse;}
		td,th{border:1px solid black;}
	</style>
	
	
<body> 


	<form action="/hotel/FAQWrite" method=post> <!-- -->
		<input type=hidden name="post_code" value="${board.post_code }">
		<input type=text name="title" placeholder="제목" value="${board.title }"><br>
		<textarea name="content" placeholder="내용 4000자 이하" rows=50 cols=100>${board.content }</textarea>
		<br><br><br>
		<input type=submit value="작성완료">
		<input type=button value="LIST" id="backtolist">
	</form>
	
	
</body>

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#backtolist',function(){
	document.location='/hotel/flist';
	return false;
})
	

</script>
</html>