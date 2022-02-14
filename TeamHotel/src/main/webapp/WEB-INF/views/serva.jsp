<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
</head>
<style>
table {border-collapse:collapse;
		border:1px solid black;
		height:300px;
		weight:300px;		
		}
/* th,td {border:1px solid black; */
/* 		color:black; */
/* 		font-weight:bold; */
/* 		font-size:20px;} */
input {	color:black;
		font-weight:bold;
		font-size:10px;
		}

ul{	list-style:none; }
	li{
/* 		list-style : none; */
		border:0;
		float:left;
	}
	a{color:#333;}
	body{color:#333; height:1500px;}
	*{padding:0;margin:0;}
	#div_1{
		height:10vh;
		float:left;
		margin-lefr:2%;
		width:100%;
	}
	.info{
		font-size:9pt;
		color:grey;
		text-align:center;
	}
	div{heright:1500px;}
</style>


<body>
<header>
<jsp:include page="header.jsp" />
</header>
<table>
	<tr><td>
	<table><tr><td>
	예약기간<input type=date id=start_dt name=start_dt>~<input type=date id=end_dt name=end_dt></td></tr><tr><td>
	객실종류<select id=type_code name=type_code >		
		</select>
		</td></tr><tr><td></td></tr><tr><td>
	숙박인원<select id=howmany name=howmany>

	<option value=1>1인</option>
	<option value=2>2인</option>
	<option value=3>3인</option>
	<option value=4>4인</option>
	<option value=5>5인</option>
	<option value=6>6인</option>
	<option value=7>7인</option>
	<option value=8>8인</option>
	<option value=9>9인</option>
</select> </td></tr><tr><td>
			<input type=button id=btns value="찾기"></td></tr><tr><td>
	<select id=selRoom style='width:200px;' size=10>
	</select>
	</td></tr>
	</table>
	</td><td>
	<table><tr><td>	
	예약번호<input type=text id=book_id name=book_id readonly></td></tr><tr><td>	
	객실종류<select id=type_codee name=type_codee>	
	</td></tr><tr><td>
	
		객실명<select type=text id=room_name name=room_name>		
		</select></td></tr><tr><td>
		숙박기간<input type=date id=start_dtt name=start_dtt>~<input type=date id=end_dtt name=end_dtt>
		</select>
		</td></tr><tr><td>
	
	숙박인원<select id=howmanyy name=howmanyy>
	<option value=1>1인</option>
	<option value=2>2인</option>
	<option value=3>3인</option>
	<option value=4>4인</option>
	<option value=5>5인</option>
	<option value=6>6인</option>
	<option value=7>7인</option>
	<option value=8>8인</option>
	<option value=9>9인</option>
</select></td></tr><tr><td>
	대표자명<input type=text id=booker name=booker></td></tr><tr><td>
	모바일<input type=text id=mobile name=mobile></td></tr><tr><td>
	숙박비<input type=number id=howmuch name=howmuch></td></tr><tr><td>
		<button id=btnOk>예약확정</button>
		<button id=btnCan>예약취소</button>
		<button id=btnReset>비우기</button>
	</td></tr>
	</table>
	</td><td>
	<table><tr><td>
	예약된 객실목록</td></tr><tr><td>
	<select id=selBook style='width:200px;' size=10>
	</select></td></tr>
	</table>
	</td></tr>
</table>
<footer>
<jsp:include page="footer.jsp" />
</footer>
</body>



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
		datatype:"json",
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