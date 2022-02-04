<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<script src="resources/myLib/axTest01.js"></script>

<script>
//1) 개별적 오류 확인을 위한 switch 변수 (전역)	
  var iCheck=false; //id
  var pCheck=false; //password
  var nCheck=false; //name
  var mCheck=false; //mail
  var kCheck=false; //nick
  var rCheck=false; //rid
  var fCheck=false; //prefer

// 2) 개별적 오류점검위한 focusout 이벤트 핸들러 : JQuery
  $(function() {
	  $('#id').focus();
	  $('#id').keydown(function(e){
		  // enter 누르면 다음 으로 이동
			if (e.which==13) {
				e.preventDefault(); 
				$('#idDup').focus()
			}
	  }).focusout(function() {
		 	iCheck=idCheck();
	  }); //id_focusout
	  
	  $('#password').focusout(function(){
			pCheck=pwCheck();		  
	  }); //password_focusout
	  
	  $('#name').focusout(function(){
			nCheck=nmCheck();		  
	  }); //name_focusout
	  
	  $('#mail').focusout(function(){
			mCheck=miCheck();		  
	  }); //mail_focusout
	  
	  $('#nick').focusout(function(){
			kCheck=ncCheck();		  
	  }); //nick_focusout
	  
	  $('#rid').focusout(function(){
			rCheck=rdCheck();		  
	  }); //rid_focusout
	  
	  $('#prefer').focusout(function(){
			fCheck=pfCheck();		  
	  }); //prefer_focusout
  }); //ready


// 3) submit 여부를 판단 & 실행 : JS 의 function
  function inCheck(){
	// 모든 항목에 오류 없음을 확인 : switch 변수
	if (iCheck==false) {
		$('#iMessage').html('아이디를 확인하세요');
	}
	if (pCheck==false) {
		$('#pMessage').html('비밀번호를 확인하세요');
	}	
	if (nCheck==false) {
		$('#nMessage').html('이름을 확인하세요');
	}	
	if (mCheck==false) {
		$('#mMessage').html('이메일을 확인하세요');
	}
	if (kCheck==false) {
		$('#kMessage').html('닉네임을 확인하세요');
	}
	if (rCheck==false) {
		$('#rMessage').html('추천인 아이디를 입력하세요');
	}	
	if (fCheck==false) {
		$('#fMessage').html('관심카테고리를 선택하세요 ');
	}	
	// 모든 오류 확인완료 
	// => 없으면 submit : return true , 
	//    있으면 submit 을 취소 : return false 
	if ( iCheck && pCheck && nCheck &&
		 mCheck && kCheck && rCheck && fCheck ) {
		// => submit : 404
		if (confirm("정말 가입하시겠습니까?")==false) {   
		 	  alert('가입이 취소되었습니다');
		 	  return false;
		}else return true; // submit 진행 -> server의 join  
	} else return false; 
  } //inCheck

   //** ID 중복 확인하기
  function idDupCheck() {
	// id 의 입력값 무결성 점검 확인
	if (iCheck==false) {
		iCheck=idCheck();
	}else { 
		// id 중복확인
		// => id를 서버로 보내 중복확인, 결과 처리 
		// => window.open(url,'','')
		//    url 요청을 서버로 전달(request) 하고, 그결과(response)를 Open 해줌
		var url="idcheck?id="+$('#id').val(); 
		window.open(url,'_blank',
				'toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=400,height=300');
	}  
  } //idDupCheck 
  
</script>

</head>
<body>
<h2 style="text-align: center; margin-top:1.5em; margin-bottom:1.5em;">JOIN</h2>
<hr>
<form action="join" method="post" enctype="multipart/form-data" id="myForm">
<table style=" border-radius:9px; height:8em; width:30em; margin-top:4em; margin-bottom:8em; margin-left:36em; margin-right:auto;">
	<tr height="40"><td>아이디</td>
		<td><input type="text" name="id" id="id" size="20">&nbsp;&nbsp;
			<input style="border-radius:3px; height:2em; width: 7em; background-color: Lavender; color:Black; align-self:center;" type="button" value="ID중복확인" id="idDup" onclick="idDupCheck()"><br>
			<span id="iMessage" class="eMessage"></span></td></tr>
	<tr height="40"><td>비밀번호</td>
		<td><input type="password" name="password" id="password" size="20"><br>
			<span id="pMessage" class="eMessage"></span></td>
    </tr>	
	<tr height="40"><td>이름</td>
		<td><input type="text" name="name" id="name" size="20"><br>
			<span id="nMessage" class="eMessage"></span></td>
    </tr>
	<tr height="40"><td>Mail</td>
		<td><input type="text" name="mail" id="mail"><br>
			<span id="mMessage" class="eMessage"></span></td>
	</tr>
	<tr height="40"><td>닉네임</td>
		<td><input type="text" name="nick" id="nick"><br>
			<span id="kMessage" class="eMessage"></span></td>
	</tr>
	<tr height="40"><td>추천인ID</td>
		<td><input type="text" name="rid" id="rid" size="20"><br>
		<span id="rMessage" class="eMessage"></span></td>
	</tr>		
	<tr height="40"><td>포인트</td>
		<td><input type="text" name="point" id="point" value="3000" size="20" readonly="readonly"></td>
	</tr>
	<tr height="40" ><td>관심 카테고리</td>
	<td><select name="prefer" id="prefer">
				<option value="A" selected>운동</option>
				<option value="B" >공부</option>
				<option value="C" >생활</option>
				<option value="D" >취미</option>
			</select></td>
	</tr>
	<tr height="40"><td></td>
		<td><input style="border-radius:3px; height:3em; width: 7em; background-color: MediumPurple; color:white; align-self:center;" type="submit" value="가입하기" onclick="return inCheck()" id="submit" disabled>&nbsp;&nbsp;
			<!-- <input type="reset" value="취소">&nbsp;&nbsp; -->
			<!-- <span id="axjoin" class="textLink">AxJoin</span> -->
		</td>
	</tr>			
</table>
</form>
<c:if test="${not empty message}">
<br>=> ${message}<br><br> 
</c:if>
<div class="row container-fluid" style="height: 10rem; position: absolute; background: snow; ">
  <%@ include file="../footer.jsp" %>
</div>
<!-- <a href="home">[Home]</a> -->
</body>
</html>