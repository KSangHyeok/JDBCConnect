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
<link rel="stylesheet" href="resources/css/FAQContent.css">
<title>FAQConetent</title>
</head>

<body>
	<jsp:include page="header.jsp" />
	<h1 align="center">FAQ</h1>
	<div id=title_tbl> <!-- title_tbl의 높이를 수정해봐요 오홍.... -->
		<table id=tb_title>
			<tr>
				<td class=title>
					<input type=hidden value="${post.post_code }" name=post_code>
					${post.title}
				</td>
				<td class=date>${post.created}</td>
			</tr>
		</table>	
		<div class="divTableBody">
	        <div class="divTablecontent"><p>${post.content}</p></div>
	  	</div>
		<div id="bt_list">
			<input type=button value="LIST" id="backtolist">
		</div>
		<c:if test="${u_type==1}"><!-- 1=직원 -->
			<div id="btn_group">
				<input type=button value="글수정" id="btn_FAQ">
				<input type=button value="게시물 삭제" id="btnDelete">
			</div>
		</c:if>			
	</div>
<jsp:include page="footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#backtolist',function(){
	document.location='/hotel/flist';
	return false;
})
.on('click','#btn_FAQ',function(){
	document.location='/hotel/admin_fwrite?post_code='+$('input[name=post_code]').val();
	//1. 글쓰기 ->write: 그냥 페이지 띄우기 2. 글수정 ->write : 페이지 띄우며 기존에 있던 값 불러오기
	return false;					   //그러면 fwrite?post_code=+$('input[name=post_code]'.val()); 이거해서 나오는걸 또 만들면 될라나??
})
.on('click','#btnDelete',function(){
	if(!confirm("정말로 해당 게시물을 삭제하시겠습니까?")) {
        return false;
     }
// 	alert('해당 게시물을 삭제하시겠습니까?')
	document.location="/hotel/deletefaq?post_code="+$('input[name=post_code]').val(); 
			return false;
}) //.val() 이게 에러난다;; 패스배리어블로 나대서???
	
</script>
</html>