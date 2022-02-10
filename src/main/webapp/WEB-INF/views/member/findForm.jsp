<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** FindForm **</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	
	<script src="resources/myLib/find.js"></script>
</head>
<body>
<div class="container text-center" style="background: beige; width: 25%; border: 1; border-radius: 2em;">
  <div class="area_inputs wow fadeIn">
    <div class="text-center font-weight-bold "><br>
	  <h3>ID / PW 찾기</h3>
	</div>
	  
	<!-- ID/PW 선택 -->
	<div style="margin-bottom: 10px;"
		class="custom-control custom-radio custom-control-inline">
	  <input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
	    <label class="custom-control-label font-weight-bold" for="search_1">아이디 찾기</label>
	  &nbsp;
	  <input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
	    <label class="custom-control-label font-weight-bold" for="search_2">비밀번호 찾기</label>
	</div>
	  
	<!-- ID 찾기 -->
	<div id="searchI">
	  <div class="form-group text-start">
	    <label class="font-weight-bold" for="inputName">이름</label>
		<div>
		  <input type="text" class="form-control" id="inputName" name="inputName" placeholder="ex) 이름">
		</div>
	  </div>
	  <div class="form-group text-start">
		<label class="font-weight-bold" for="inputMail_1">이메일</label>
		<div>
		  <input type="text" class="form-control" id="inputMail_1" name="inputMail_1" placeholder="ex) abcde@naver.com">
		</div>
	  </div>
	  <!-- 버튼 -->
	  <div class="form-group">
		<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-secondary btn-block">확인</button>
		<a class="btn btn-secondary btn-block"	href="loginf">취소</a><br>
	  </div>
	</div>
	  
	<!-- PW 찾기 -->
	<div id="searchP" style=" display: none;">
	  <div class="form-group text-start">
	    <label class="font-weight-bold" for="inputId">아이디</label>
		<div>
		  <input type="text" class="form-control" id="inputId" name="inputId" placeholder="ex) hjjjjjjjjj9" value="${findId}">
		</div>
	  </div>
	  <div class="form-group text-start">
		<label class="font-weight-bold " for="inputMail_2">이메일</label>
		<div>
		  <input type="email" class="form-control" id="inputMail_2"	name="inputMail_2" placeholder="ex) abcde@naver.com">
		</div>
	  </div>
	  <!-- 버튼 -->
	  <div class="form-group" style="margin-top : 10px;">
		<button id="searchBtn2" type="button" onclick="pwSearch_click()" class="btn secondary btn-block">확인</button>
		<a class="btn btn-secondary btn-block"	href="loginf">취소</a><br>
	  </div>
		
	</div>
  </div>
</div>

<div style="background: AliceBlue; display: none;" id="resultArea1" >
  <c:if test="${not empty id}">
	<h4 id="name_value"></h4>
	<span>=> ${id}</span><br>
	<a href="loginform" class="btn btn-primary btn-block" >로그인 하기</a>
  </c:if>
  <div>
	<h4 id="message">${message}</h4><br>
  </div>
</div>

<div style="background: snow; display: none;" id="resultArea2" >
  <c:if test="${not empty findPw}">
	<h4 id="id_value"></h4>
<%-- 	<span>=> ${findPw}</span><br> --%>
	<a href="sendMail?id=${id}&mail=${mail}" id="tmpPasswordCheck">임시 비밀번호 확인하기</a>
  </c:if>
  <div>
	<h4 id="message">${message}</h4><br>
  </div>
</div>

<hr>
<a href="home">[Home]</a>

</body>
</html>