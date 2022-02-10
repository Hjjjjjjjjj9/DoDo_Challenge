<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** ID 중복 확인 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/joinFormCheck.js"></script>
<script>
//** 사용자가 입력한 id 를 사용가능하도록 해주고, 현재(this)창은 close
// => this 창의 id 를 부모창의 id 로
// => 부모창의 ID중복확인 버튼은 disable & submit 은 enable
// => 부모창의 id 는 수정불가 (readonly) , password 에 focus
// => 현재(this)창은 close   
  function idOK() {
	opener.$('#id').val('${newID}');
	opener.document.getElementById('idDup').disabled='disabled';
	
	opener.$('#id').prop('readonly',true);
	opener.$('#password').focus();
	
	window.close();
  } //idOK
</script>

<style>
	body {
		font-family: 맑은고딕;
		}
	#wrap {
		margin-left: 0;
		text-align: center;
		}
	h3 {
		color: #00008B; 
		}
</style>
</head>
<body>
<div id="wrap">
	<h3>ID 중복 확인</h3>
	<form action="idcheck" method="post">
	User ID : 
	<input type="text" id="id" name="id">&nbsp;
	<input type="submit" value="ID중복확인" onclick="return idCheck()"><br>

	</form>
	<br><br><hr><br>
	<div id="msgBlock">
		<c:if test="${canUseId == 'T'}">
			${newID} 는 사용가능 합니다 ~~
			<input type="button" value="idOK" onclick="idOK()">
		</c:if>
		<c:if test="${canUseId=='F'}">
			${newID} 는 이미 사용 중인 ID입니다.<br>
  		     <script>
  		     	$('#id').focus();
  		     	opener.document.getElementById('id').value='';
  		     </script>
		</c:if>
	</div>
</div>

</body>
</html>