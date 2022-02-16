<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
</head>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script> -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <link href="${path}/resources/css/Homeinfo.css" rel="stylesheet" >
<style>
table {border-collapse:collapse;border:1px solid black;height:300px; weight:300px;}

.div_body{height:545px;}
.div_body1{ width:442px; margin-left:10px;}
.div_body2{width:442px; margin-left:465px; margin-top:-477px; }
.div_body3{margin-left:930px; margin-top:-476px; width:350px;}
</style>
<jsp:include page="header.jsp" />
<body>

<div class="div_body">
<h1 style="text-align:center; font-weight:bold; font-size:40px; letter-spacing:6px;">예약관리</h1>
   <h2 style="text-align:center; font-weight:bold; color:#ccc; margin-bottom:30px; font-size:22px; letter-spacing:4px;">Manage Control</h2>
   <div class="div_body1"  >
      <div class="input-group mb-3" style="font-size:25px;">
        <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">예약기간</span>
        <input type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
              id=start_dt name=start_dt> ~
        <input type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
              id=end_dt name=end_dt>
        </div>
        <div>   
           <select class="form-select" aria-label="Default select example" id=type_code name=type_code size=1 style="margin-bottom:15px; padding:5px 5px 5px 12px;">
           <option value="" selected>객실종류를 입력해주세요</option>
         </select>
        </div>
      <div>
         <select class="form-select" aria-label="Default select example" id=howmany name=howmany size=1 style="margin-bottom:15px; padding:5px 5px 5px 12px;">
           <option value="" selected>숙박인원을 입력해주세요</option>
              <option value=1>1명</option>
            <option value=2>2명</option>
            <option value=3>3명</option>
            <option value=4>4명</option>
            <option value=5>5명</option>
            <option value=6>6명</option>
            <option value=7>7명</option>
            <option value=8>8명</option>
            <option value=9>9명</option>
         </select>
      </div>
      <div>
      <button type="button" class="btn btn-secondary" id=btns style="margin-bottom:15px;">예약 가능한 방 찾기</button>
      </div>
      <div>
      <select class="form-select" aria-label="Default select example" id=selRoom name=selRoom size=11 style="margin-bottom:15px; padding:5px 5px 5px 12px;">
      </select>
      </div>
      
      <div class="div_body2">
         <div class="input-group mb-3" style="font-size:25px;">
        <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">예약번호</span>
        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
              id=book_id name=book_id readonly>
           </div>
           <div>   
              <select class="form-select" aria-label="Default select example" id=type_codee name=type_codee size=1 style="margin-bottom:15px; padding:5px 5px 5px 12px;">
                 <option value="" selected>객실종류입니다</option>
            </select>
           </div>
           <div>   
              <select class="form-select" aria-label="Default select example" id=room_name name=room_name size=1 style="margin-bottom:15px; padding:5px 5px 5px 12px;">
                 <option value="" selected>객실명입니다</option>
            </select>
           </div>
           <div class="input-group mb-3" style="font-size:25px;">
           <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">숙박기간</span>
           <input type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                 id=start_dtt name=start_dtt> ~
           <input type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                 id=end_dtt name=end_dtt>
           </div>
           <div>
         <select class="form-select" aria-label="Default select example" id=howmanyy name=howmanyy size=1 style="margin-bottom:15px; padding:5px 5px 5px 12px;">
              <option value="" selected>숙박인원을 입력해주세요</option>
                 <option value=1>1명</option>
               <option value=2>2명</option>
               <option value=3>3명</option>
               <option value=4>4명</option>
               <option value=5>5명</option>
               <option value=6>6명</option>
               <option value=7>7명</option>
               <option value=8>8명</option>
               <option value=9>9명</option>
            </select>
         </div>
           <div class="input-group mb-3" style="font-size:25px;">
           <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">대표자명</span>
           <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                 id=booker name=booker >
           </div>
           <div class="input-group mb-3" style="font-size:25px;">
           <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">연락처</span>
           <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                 id=mobile name=mobile >
           </div>
           <div class="input-group mb-3" style="font-size:25px;">
           <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">숙박비</span>
           <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                 id=howmuch name=howmuch readonly >
           </div>
           <div >
            <button type="button" class="btn btn-secondary" id=btnOk style="margin-bottom:15px;">예약확정</button>
            <button type="button" class="btn btn-secondary" id=btnCan style="margin-bottom:15px; margin-left:10px;">예약취소</button>
            <button type="button" class="btn btn-secondary" id=btnReset style="margin-bottom:15px; margin-left:10px;">비우기</button>
         </div>
      </div>
      
      <div class="div_body3">
         <select class="form-select" aria-label="Default select example" id=selBook name=selBook size=19 style="margin-bottom:15px; padding:5px 5px 5px 12px; width:330px;">
            
         </select>
      </div>
      
      
   </div>
   
</div>
</body>
<jsp:include page="footer.jsp" />


<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.ready(function(){
   $.ajax({url:"/hotel/typelist",
      data:{},
      method:"GET",
      datatype:"json",
      success:function(txt){
         
   for(i=0; i<txt.length; i++){
      let str='<option value='+txt[i]['code']+'>'+txt[i]['name']+'</option>';
      
      $('#type_code,#type_codee').append(str);
      }
   }   
});
   booklist();
   
})
.on('click','#btns',function(){
   if($('#start_dt').val()=='' || $('#end_dt').val()==''){
      alert('예약기간을 설정하세요');
      return false;
   }
   $('#selRoom').empty();
   $.ajax({url:"/hotel/roomlist",
      data:{type_code:$('#type_code').val(),
           start_dt:$('#start_dt').val(),
           end_dt:$('#end_dt').val(),
           howmany:$('#howmany').val()},
      method:"GET",
      datatype:"json",
      success:function(txt){
         
   for(i=0; i<txt.length; i++){
      let str='<option value='+txt[i]['type']+'>'+txt[i]['name']+' '+txt[i]['room_code']+' '+txt[i]['howmany']+' '+txt[i]['howmuch']+'</option>';
      
      $('#selRoom').append(str);
      }
   }   
});
})
.on('change','#type_codee',function(){
   $('#room_name').empty();
   $.ajax({url:"/hotel/roomname",
      data:{type:$(this).val()},
      method:"GET",
      datatype:"json",
      success:function(txt){
         
   for(i=0; i<txt.length; i++){
      let str='<option value='+txt[i]['code']+'>'+txt[i]['name']+'</option>';
      
      $('#room_name').append(str);
      }
   }   
});
})
.on('click','#selRoom option',function(){
   clean();
   $('#type_codee').val($(this).val());
   
   $('#start_dtt').val($('#start_dt').val());
   $('#end_dtt').val($('#end_dt').val());
   $('#howmanyy').val($('#howmany').val());
   let str=$(this).text();
   let ar=str.split(' ');
   $.ajax({url:"/hotel/roomname",
      data:{type:$(this).val()},
      method:"GET",
      datatype:"json",
      success:function(txt){
         
   for(i=0; i<txt.length; i++){
      let str='<option value='+txt[i]['code']+'>'+txt[i]['name']+'</option>';
      
      $('#room_name').append(str);
      }
   $('#room_name').val(ar[1]);
   //date 차익계산
   start=$('#start_dtt').val();
   sd=start.replaceAll("-","");
   end=$('#end_dtt').val();
   ed=end.replaceAll("-","");   
   day=betweenDay(sd,ed);
   console.log(ar[3]);
   console.log(day);
   $('#howmuch').val(ar[3]*day);
   }
});      
   return false;
})
.on('click','#btnOk',function(){
   if($('#booker').val()=='' || $('mobile').val()==''){
      alert('대표자명 or 모바일을 적으세요');
      return false;
   }
   $.ajax({url:"/hotel/roomok",
      data:{start_dt:$('#start_dtt').val(),
            end_dt:$('#end_dtt').val(),
            type_code:$('#type_code').val(),
            room_code:$('#room_name').val(),
            howmany:$('#howmanyy').val(),
            booker:$('#booker').val(),
            mobile:$('#mobile').val(),
            howmuch:$('#howmuch').val()},      
      method:"POST",
      datatype:"text",
      beforeSend:function(){},
      success:function(txt){
         console.log(txt);
            alert("예약완료");
            booklist();      
      }
      
});
   return false;
})
.on('click','#selBook option',function(){
   clean();
   $('#book_id').val($(this).val());
   let str=$(this).text();
   let str1=str.replace('~',' ');
   let ar=str1.split(' ');
   console.log(ar);
   $('#booker').val(ar[1]);
   $('#start_dtt').val(ar[2]);
   $('#end_dtt').val(ar[3]);
}) 
.on('click','#btnCan',function(){
   if($('#book_id').val()==''){
      alert('취소할 객실을 클릭하세요');
   }else{
      $.ajax({url:"/hotel/roomcan",
         data:{book_id:$('#book_id').val()},      
         method:"POST",
         datatype:"text",
         beforeSend:function(){},
         success:function(txt){            
               alert("예약취소완료");
               booklist();      
         }
         
   });
   }
})
.on('click','#btnReset',function(){
   clean();
})

function betweenDay(firstDate, secondDate)
        {             
            var firstDateObj = new Date(firstDate.substring(0, 4), firstDate.substring(4, 6) - 1, firstDate.substring(6, 8));
            var secondDateObj = new Date(secondDate.substring(0, 4), secondDate.substring(4, 6) - 1, secondDate.substring(6, 8));
            var betweenTime = Math.abs(secondDateObj.getTime() - firstDateObj.getTime());
            return Math.floor(betweenTime / (1000 * 60 * 60 * 24));
        }
function booklist(){
   $('#selBook').empty();
   $.ajax({url:"/hotel/booklist",
      data:{},
      method:"GET",
      dataType:"json",
      success:function(txt){
         
   for(i=0; i<txt.length; i++){
      let str='<option value='+txt[i]['book_id']+'>'+txt[i]['name']+' '+txt[i]['booker']+' '+
            txt[i]['start_dt']+'~'+txt[i]['end_dt']+'</option>';
      
      $('#selBook').append(str);
      }
   }   
});
}
function clean(){
   $('#book_id,#start_dtt,#end_dtt,#type_codee,#room_name,#hownamyy,#booker,#mobile,#howmuch').val('');
}
</script>
</html>