<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>typeControl</title>
</head>
<body>
<h1><a href="/hotel/">NCS7 HOTEL</a></h1>
<form id=frmRoom action="/hotel/addType">
객실타입코드 : <input type=text id=type_code name=type_code readonly><br>
객실타입명 : <input type=text id=name name=name><br><br>
<input type=submit value='추가'>
<input type=button value='수정' id=btnUpdate>
<input type=button value="삭제" id=btnDelete>
<input type=reset value="비우기">
</form>
<br>
<select id=selType name=selType size=10>

</select>

</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
   $.ajax({
      url:"/hotel/typeadd1",
      data:{},
      method:"GET",
      datatype:"json",
      success:function(txt){
         for(i=0; i<txt.length; i++){
            let str='<option value='+txt[i]['type_code']+'>'+
                  txt[i]['type_name']+'</option>';
                  $('#selType').append(str);
         }
      }
   })
   
})
.on('click','#btnDelete',function(){
   let url="/hotel/delType?type_code="+$('#type_code').val();
   document.location=url;
})
.on('click','#btnUpdate',function(){
   let url="/hotel/updType?type_code="+$('#type_code').val()+"&name="+$('#name').val();
   document.location=url;
})
.on('click','#selType option',function(){
   console.log($(this).val()+','+$(this).text());
   let str=$(this).text();
   let ar=str.split(',');
   $('#type_code').val($(this).val());
   $('input[name=name]').val($.trim(ar[0]));
   
   return false;
})
</script>
</html>