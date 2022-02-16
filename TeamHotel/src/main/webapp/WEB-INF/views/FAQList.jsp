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
<link rel="stylesheet" href="resources/css/FAQList.css">
<title>FAQ List</title>
</head>
<style>
	
</style>

<body>

<jsp:include page="header.jsp" />
	<h1>FAQ</h1>
	<input type="hidden" name="pageNum" value="${paging.cri.pageNum }">
	<input type="hidden" name="amount" value="${paging.cri.amount }">
	<c:if test="${u_type==1}"><!-- 1=직원 -->
		<div id="writefaq">
		<input type=button value="글쓰기" id="btn_FAQ"> 
		</div>
	</c:if>
	<div id="div_table">
		<table id="tbl_FAQList">
			<thead>
				<tr>
					<th class="td_first">No.</th>
					<th class="th_second">제목</th>
					<th class="td_third">등록일</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<div class="pageInfo_wrap">
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">
				<c:if test="${paging.prev }">
					<li class="pageInfo_btn_previous"><a href="${paging.startPage-1}">이전</a></li>
				</c:if>
				<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
					<li class="pageInfo_btn"><a id="page" href="${num }">${num }</a></li>
				</c:forEach>
				<c:if test="${paging.next }">
					<li class="pageInfo_btn_next"><a href="${paging.endPage+1}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
<jsp:include page="footer.jsp" />
</body>
<input type=hidden id=hd name=hd value="">

<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
	$.ajax({
		url:'/hotel/ftitle',
		data:{pageNum:$('input[name=pageNum]').val(),amount:$('input[name=amount]').val()},
		datatype:'json',
		method:'get',
		beforeSend:function(){
			$('#tbl_FAQList tbody').empty();
		},
		success:function(txt){
			console.log(txt);
			for(i=0; i<txt.length; i++){				
				let str='<tr><td class="td_first">'+txt[i]['post_code']+
						'</td><td class="td_second">'+'<a href="/hotel/fcontent?post_code='+txt[i]['post_code']+'">'
						+txt[i]['title']+'</a></td><td class="td_third">'
						+txt[i]['created']+'</td></tr>';
				console.log(str);
				$('#tbl_FAQList tbody').append(str);
			}
		}
	});
	return false;
})
.on('click','#btn_FAQ',function(){
	document.location="/hotel/fwrite"
	return false;
})
.on('click','#page',function(){
	$('input[name=pageNum]').val($(this).attr("href"));
	$.ajax({
		url:'/hotel/ftitle',
		data:{pageNum:$('input[name=pageNum]').val(),amount:$('input[name=amount]').val()},
		datatype:'json',
		method:'get',
		beforeSend:function(){
			$('#tbl_FAQList tbody').empty();
		},
		success:function(txt){
			console.log(txt);
			for(i=0; i<txt.length; i++){				
				let str='<tr><td class="td_first">'+txt[i]['post_code']+
						'</td><td class="td_second">'+'<a href="/hotel/fcontent?post_code='+txt[i]['post_code']+'">'
						+txt[i]['title']+'</a></td><td class="td_third">'
						+txt[i]['created']+'</td></tr>';
				console.log(str);
				$('#tbl_FAQList tbody').append(str);
			}
		}
	});
	return false;
})
</script>
</html>