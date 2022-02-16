<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <link href="${path}/resources/css/book.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<title>예약</title>

</head>

<jsp:include page="header.jsp" />
<body>
<div class=body>
<h1 style="text-align:center; font-weight:bold; font-size:40px; letter-spacing:6px;">객실예약</h1>
   <h2 style="text-align:center; font-weight:bold; color:#ccc; margin-bottom:30px; font-size:22px; letter-spacing:4px;">Reservation</h2>

	<div class=body_2>
		<div class=body_2in>
		<p>			
  			<label>예약 기간
  			<input type="date" id=start_dt name=start_dt class=ip_dt>
  			</label>
  			<label>~
  			<input type="date" id=end_dt name=end_dt class=ip_dt>
  			</label>	
  		  	<label>객실 뷰
  			<select id=seltype name=seltype class=select>
  			</select>
  			</label>
  		  			
  			<input type=number id=howmany name=howmany class=ip_dt placeholder="인원 수">  
  		</p>
  		<p>
  			<button type=button class=btnGo id=btnGo name=btnGo >Search</button>
  		</p>
		</div>
	</div>
	<table class="table" style="font-size:25px;">
  <thead>
    <tr>
      <th scope="col">타입</th>
      <th scope="col">객실명</th>
      <th scope="col">숙박료</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody id=div3>
  
  </tbody>
  </table>
</div>

  <div id=dlginfo title='예약정보입력'>
  <table >
  	<input type=hidden id=room_code name=room_code>  
  	<div class="input-group mb-3" style="font-size:25px;">
        <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">예약기간</span>
        <input type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
              id=dlg_start name=dlg_start> ~
        <input type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
              id=dlg_end name=dlg_end>
        </div>	
  	<div class="input-group mb-3" style="font-size:25px;">
           <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">인원수</span>
           <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                 id=howmanyy name=howmanyy readonly>
           </div>
  	<div class="input-group mb-3" style="font-size:25px;">
           <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">숙박료</span>
           <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                 id=howmuch name=howmuch readonly>
           </div>
  	<div class="input-group mb-3" style="font-size:25px;">
           <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">예약자명</span>
           <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                 id=booker name=booker >
           </div>
  	<div class="input-group mb-3" style="font-size:25px;">
           <span class="input-group-text" id="inputGroup-sizing-default" style="width:109px;">연락처</span>
           <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                 id=mobile name=mobile >
           </div>
        <div>
  	<button type="submit" class="btn btn-secondary" id=btnAdd style="margin-bottom:15px;">예약하기</button>
  	</div>
  	
  </table>
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
		let str='<option value='+txt[i]['code']+' class=selectop>'+txt[i]['name']+'</option>';		
		$('#seltype').append(str);
		}
	}	
});
})
.on('click','#btnGo',function(){
	
	
	if($('#start_dt').val()=='' || $('#end_dt').val()==''){
		alert('예약기간을 설정하세요');
		return false;
	}
	if($('howmany').val()){
		alert('인원수를 정하세요');
	}	
	$.ajax({url:"/hotel/roombook",
		data:{type_code:$('#seltype').val(),
			  start_dt:$('#start_dt').val(),
			  end_dt:$('#end_dt').val(),
			  howmany:$('#howmany').val()},
		method:"GET",
		dataType:"json",
		beforSend:function(){
			
		},
		success:function(txt){
			console.log(txt.length);	
			console.log(txt);	
			if(txt.length !=0){
				for(let i=0;i<txt.length;i++){	
				let div3= "<tr><th scope='row'>"+txt[i]['type_name']+"</th><td>"+txt[i]['name']+"</td><td>"+txt[i]['howmuch']+"</td><td>"+"<input type=button id="+txt[i]['room_code']+" name=btno value='객실예약'>"+"</td></tr>"
				$('#div3').append(div3);
				}
			}
			

		}
});
})
.on('click','input[type=button]',function(){
	let str=$(this).attr('id');
	console.log(str);
	$('#dlginfo').dialog({
		width:600,height:600,
		open:function(){
			$('#room_code').val(str);
			$('#dlg_start').val($('#start_dt').val());
			$('#dlg_end').val($('#end_dt').val());
			$('#howmanyy').val($('#howmany').val());
			console.log($('#room_code').val())
			$.ajax({url:"/hotel/codemuch",
				data:{room_code:$('#room_code').val()
					  },
				method:"GET",
				dataType:"json",
				
				success:function(txt){	
					for(let i=0;i<txt.length;i++){	
					howmuch=txt[i]['howmuch'];
					console.log(txt);
					$('#howmuch').val(howmuch);
					}
				}				
		});
			return false;
		},
		close:function(){
			return false;
		}
	})
})
.on('click','#btnAdd',function(){
	if($('#booker').val()=='' || $('#mobile').val()==''){
		alert('예약자명 or 모바일을 적어주세요.');
		
		return false;
	}else{
		alert($('#dlg_start').val()+$('#dlg_end').val());
		$.ajax({url:"/hotel/ok",
			data:{room_code:$('#room_code').val(),
				mobile:$('#mobile').val(),
				start_dt:$('#dlg_start').val(),
				end_dt:$('#dlg_end').val(),
				howmany:$('#howmanyy').val(),
				howmuch:$('#howmuch').val(),
				booker:$('#booker').val()
				  },
			method:"GET",
			dataType:"text",
			
			success:function(txt){	
				document.location="/hotel/";
				}
						
	});
	}
	
})
// $('#dlgMenu').dialog({
// 		width:730,
// 	open:function(){		
//         $('#selMenu1').empty();
//         $.get('menuname',{},function(txt){		
//     		let rec=txt.split(';');
//     		for(i=0; i<rec.length; i++){
//     			let field=rec[i].split(',');
//     			let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
//     			$('#selMenu1').append(html);	
//     		}	   
//     	},'text');
// 		return false;
//     },
//     close:function(){       
//         $('#selMenu').empty();
//         $.get('menuname',{},function(txt){		
//     		let rec=txt.split(';');
//     		for(i=0; i<rec.length; i++){
//     			let field=rec[i].split(',');
//     			let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
//     			$('#selMenu').append(html);	
//     		}	   
//     	},'text');
// 		return false;
//     }
// 	})
</script>
</html>