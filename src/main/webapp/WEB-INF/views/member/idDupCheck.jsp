<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** ID 중복 확인 **</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/joinFormCheck.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" 
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script>
//** 사용자가 입력한 id 를 사용가능하도록 해주고, 현재(this)창은 close
// => this 창의 id 를 부모창의 id 로
// => 부모창의 ID중복확인 버튼은 disable & submit 은 enable
// => 부모창의 id 는 수정불가 (readonly) , password 에 focus
// => 현재(this)창은 close   
  function idOK() {
	opener.$('#id').val('${newID}');
	opener.document.getElementById('idDup').disabled='disabled';
	opener.$('#ifIdDupChecked').val('idChecked');
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
</style>
</head>
<body>
<div id="wrap">
    <br><br>
	<h3>ID 중복 확인</h3>
	<form action="idcheck" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	User ID : 
	<input type="text" id="id" name="id">&nbsp;
	<button type="submit" class="btn btn-secondary btn-sm" onclick="return idCheck()">ID중복확인</button><br>

	</form>
	<br><br><hr><br>
	<div id="msgBlock">
		<c:if test="${canUseId == 'T'}">
			${newID} 는 사용가능한 ID입니다.
			<button type="button" class="btn btn-success btn-sm" onclick="idOK()">ID사용</button>
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