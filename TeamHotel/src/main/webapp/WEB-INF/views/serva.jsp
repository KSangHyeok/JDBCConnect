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
	객실종류<input type=text id=type_code name=type_code></td></tr><tr><td>
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
	객실명<input type=text id=room_name name=room_name></td></tr><tr><td>
	객실종류<input type=text id=type_codee name=type_codee></td></tr><tr><td>
	숙박인원<select id=howmanyy name=howmanyy>
	<option value=1>1인</option>
	<option value=2>2인</option>
	<option value=3>3인</option>
	<option value=4>4인</option>
</select></td></tr><tr><td>
	대표자명<input type=text id=booker name=booker></td></tr><tr><td>
	모바일<input type=text id=mobile name=mobile></td></tr><tr><td>
	숙박비<input type=text id=howmuch name=howmuch></td></tr><tr><td>
		<button id=btnOk>예약확정</button>
		<button id=btnCan>예약취소</button>
		<button id=btnReset>비우기</button>
	</td></tr>
	</table>
	</td><td>
	<table><tr><td>
	예약된 객실목록</td></tr><tr><td>
	<select id=selRoomok style='width:200px;' size=10>
	</select></td></tr>
	</table>
	</td></tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
</script>
</html>