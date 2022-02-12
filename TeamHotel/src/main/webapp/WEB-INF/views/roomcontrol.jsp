<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roomControl</title>
</head>
<body>
<h1><a href="/hotel/">NCS7 HOTEL</a></h1>
<form id=frmRoom action="/hotel/addRoom">
객실코드 : <input type=text id=room_code name=room_code placeholder='객실코드' readonly><br>
객실명 : <input type=text id=name name=name placeholder='객실명을 입력해주세요'><br>
객실타입 : <select id=selType name=seltype></select><br>
숙박인원 : <input type=text id=howmany name=howmany placeholder='숙박인원을 입력해주세요'><br>
숙박료 : <input type=text id=howmuch name=howmuch placeholder='숙박료를 입력해주세요'><br>
<input type=submit value='추가'>
<input type=button value="삭제" id=btnDelete>
<input type=reset value="비우기">
</form>
<select id=selRoom  size=10> 

</select>

</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
   $.ajax({
      url:"/hotel/roomadd1",
      data:{},
      method:"GET",
      datatype:"json",
      success:function(txt){
         for(i=0; i<txt.length; i++){
            console.log(txt);
            let str='<option value='+txt[i]['room_code']+'>'+
                  txt[i]['name']+','+
                  txt[i]['type']+','+
                  txt[i]['howmany']+','+
                  txt[i]['howmuch']+'</option>';
                  $('#selRoom').append(str);
         }
      }
   })

   $.ajax({
      url:"/hotel/typeadd1",
      data:{},
      method:"GET",
      datatype:"json",
      success:function(txt){
         for(i=0; i<txt.length; i++){
            let str='<option value='+txt[i]['type_code']+'>'+
                  txt[i]['type_name']+'</option>';
                  console.log(txt[i]['type_code']);
                  $('#selType').append(str);
         }
      }
   })
   
})
.on('click','#btnDelete',function(){
   let url="/hotel/delRoom?room_code="+$('#room_code').val();
   document.location=url;
})
.on('click','#selRoom option',function(){
   console.log($(this).val()+','+$(this).text());
   $('#room_code').val($(this).val());
   let str=$(this).text();
   let ar=str.split(',');
   console.log(ar);
   $('input[name=name]').val($.trim(ar[0]));
//    $('input[name=type]').val($.trim(ar[1]));
   $('input[name=howmany]').val($.trim(ar[2]));
   $('input[name=howmuch]').val($.trim(ar[3]));
   let seltype=$.trim(ar[1]);   //double이라는 문자열
   $('#selType').val('');
   $('#selType option').each(function(){
      if($(this).text()==seltype){
         $(this).prop('selected','selected');
         return false;
      }
   })
   return false;
})



</script>
</html>