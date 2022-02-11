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
/* body {background-image:url(https://cdn.pixabay.com/photo/2018/02/11/09/37/matrix-full-3145364_960_720.jpg); */
/* 		background-repeat:no-repeat; */
/* 		background-position:center; */
/*  		background-size:cover; */
/*  		height:100vh; */
/* 		} */

</style>
<body>
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
</select> </td></tr><tr><td>
			<input type=button id=btns value="찾기"></td></tr><tr><td>
	<select id=selRoom style='width:200px;' size=10>
	</select>
	</td></tr>
	</table>
	</td><td>
	<table><tr><td>	
	예약번호<input type=text id=book_id name=book_id readonly></td></tr><tr><td>
	숙박기간<input type=date id=start_dtt name=start_dtt>~<input type=date id=end_dtt name=end_dtt></td></tr><tr><td>
	
		객실종류<select id=type_codee name=type_codee>			
		</select></td></tr><tr><td>
		객실명<select type=text id=room_name name=room_name>
		</select>
		</td></tr><tr><td>
	
	숙박인원<select id=howmanyy name=howmanyy>
	<option value=1>1인</option>
	<option value=2>2인</option>
	<option value=3>3인</option>
	<option value=4>4인</option>
</select></td></tr><tr><td>
	대표자명<input type=text id=booker name=booker></td></tr><tr><td>
	모바일<input type=text id=mobile name=mobile></td></tr><tr><td>
	숙박비<input type=number id=howmuch name=howmuch readonly></td></tr><tr><td>
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
	$.ajax({url:"/hotel/booklist",
		data:{},
		method:"GET",
		datatype:"json",
		success:function(txt){
			
	for(i=0; i<txt.length; i++){
		let str='<option value='+txt[i]['book_id']+'>'+txt[i]['name']+' '+'</option>';
		
		$('#selBook').append(str);
		}
	}	
});
	
})
.on('click','#btns',function(){
	$('#selRoom').empty();
	$.ajax({url:"/hotel/roomlist",
		data:{type_code:$('#type_code').val(),
			  start_dt:$('#start_dt').val(),
			  end_dt:$('#end_dt').val()},
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
	$('#room_name').empty();
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
// .on('click','#start_dtt,#end_dtt',function(){
	
// })
function betweenDay(firstDate, secondDate)
        {             
            var firstDateObj = new Date(firstDate.substring(0, 4), firstDate.substring(4, 6) - 1, firstDate.substring(6, 8));
            var secondDateObj = new Date(secondDate.substring(0, 4), secondDate.substring(4, 6) - 1, secondDate.substring(6, 8));
            var betweenTime = Math.abs(secondDateObj.getTime() - firstDateObj.getTime());
            return Math.floor(betweenTime / (1000 * 60 * 60 * 24));
        }
</script>
</html>