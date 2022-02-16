<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/A1.css">
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="resources/css/FAQWrite.css">
<title>FAQWrite</title>
</head>
<body> 
<jsp:include page="header.jsp" />
	<h1 align="center">FAQ</h1>
	<form action="/hotel/FAQWrite" method=post> <!-- -->
		<div id=faqwrite>
			<div id=div_title>
				<input type=hidden name="post_code" value="${board.post_code }">
				<input type=text name="title" id=title size=65 placeholder="제목을 입력해주십시오." value="${board.title }" ><br>
			</div><br><br>
			<div id=div_content>
				<textarea name="content" placeholder="내용은 4000자 이하로 작성해주십시오." rows=20 cols=80  >${board.content }</textarea>
			</div>
			<br><br><br>
			<div id="btn_group">
			<div id=div_button>
				<input type=submit value="작성완료" id="complete">
				<input type=button value="LIST" id="backtolist">
			</div>
			</div>
		</div>
	</form>
	
	<jsp:include page="footer.jsp" />
</body>

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#backtolist',function(){
	if(!confirm("FAQ List로 돌아가시겠습니까?")) {
        return false;}
	document.location='/hotel/flist';
	return false;
})
// $('textarea').autoResize();	

</script>
</html>