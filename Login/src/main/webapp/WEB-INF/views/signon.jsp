<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <table align=center class="mbs_table">
        <tr>
            <td align=left>실명</td>
            <td><input type=text id=name name=name></td>
            <td align=left>성별</td>
            <td><input type=radio id=male name=gender value=male>남성
                <input type=radio id=female name=gender value=female>여성</td>
        </tr>
        <tr>
            <td align=left>아이디</td>
            <td><input type=text id=userid name=userid></td>
        </tr>
         <tr>
            <td align=left>비밀번호</td>
            <td><input type=password id=passcode name=passcode size=20></td>
            <td align=left>비밀번호 확인</td>
            <td><input type=password id=passcode1 name=passcode1 size=20></td>
        </tr>       
		<tr>
            <td align=left>관심분야</td>
            <td align=left >
            	<input type=checkbox value=정치 id=politics name=interest>정치&nbsp;
                <input type=checkbox value=경제 id=economics name=interest>경제&nbsp;
                <input type=checkbox value=사회 id=society name=interest>사회&nbsp;
                <input type=checkbox value=문화 id=culture name=interest>문화&nbsp;<br>
				<input type=checkbox value=역사 id=history name=interest>역사&nbsp;
				<input type=checkbox value=연예 id=entertainment name=interest>연예&nbsp;
                <input type=checkbox value=스포츠 id=sport name=interest>스포츠&nbsp;
                <input type=checkbox value=예술 id=art name=interest>예술&nbsp; 
            </td>
        </tr>
        <tr>
            <td colspan=2>
                <input type=button id=btnGo value='가입완료'> &nbsp;&nbsp;
                <input type=button id=btnCan value='취소'>
                
            </td>
        </tr>
    </table>

</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.on('click','#btnGo',function(){
	if($('#passcode').val()!=$('#passcode1').val()){
		alert('비번이 다릅니다.');
		return false;
	}
	let str="";
	$.post("/Login/name_check",{},function(txt){
	$('input[name=interest]:checked').each(function(){
         str+=$(this).val()+' ';
      });
		console.log(str);
		for(let i=0;i<txt.length;i++){
			console.log($('#userid').val());
			console.log(txt[i]['userid']);			
			if($('#userid').val()==txt[i]['userid']){
				alert('중복된아이디가 있습니다');			
				break;
			}else{
				let oparam={name:$('#name').val(),gender:$("input[name='gender']:checked").val(),userid:$('#userid').val(),passcode:$('#passcode').val(),interest:str}
				$.post("/Login/signon_check",oparam,function(txt1){
					if(txt1=="ok"){
						document.location='/Login/login';
					}else{
						alert('실패띠');
					}
				},'text');	
				return false;
			}
		}
	},'json');
})
.on('click','#btnCan',function(){
	document.location='/Login/'
})
</script>
</html>