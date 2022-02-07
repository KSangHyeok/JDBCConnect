<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적</title>
</head>
<body>
<table>
<select id=selt style='width:300px;' size=5>
<option>CB2020003 홍길동 010-2565-6113 4</option>
</select>
	<tr><td>아이디 : <input type=text id=sid name=sid value="CB2020003"></td></tr>
	<tr><td>이름 : <input type=text id=sname name=sname value="홍길동"></td>	</tr>
	<tr><td>전화번호 : <input type=text id=sname name=sname value="010-2565-6113"></td>	</tr>
	<tr><td>학년 : <input type=text id=sname name=sname value="4"></td>	</tr>	
	<tr><td><input type=button id=btn value="추가">
			<input type=button id=bt value="삭제">
			<input type=Reset id=re value="비우기"></td></tr>
</table>
<table>
<select id=sel style='width:300px;' size=5>
<option>CB2020003 중간 2022-02-07 수학 100</option>
</select>
	<tr><td>id : <input type=text id=sid name=sid value="CB2020003"></td></tr>
	<tr><td>시험명 : <input type=text id=sname name=sname value="중간"></td>	</tr>
	<tr><td>시험날짜 : <input type=text id=sname name=sname value="2022-02-07"></td>	</tr>
	<tr><td>과목명 : <input type=text id=sname name=sname value="수학"></td>	</tr>
	<tr><td>점수 : <input type=text id=sname name=sname value="100"></td>	</tr>
	<tr><td><input type=button id=btn value="추가">
			<input type=button id=bt value="삭제">
			<input type=Reset id=re value="비우기"></td></tr>
</table>
</body>
</html>