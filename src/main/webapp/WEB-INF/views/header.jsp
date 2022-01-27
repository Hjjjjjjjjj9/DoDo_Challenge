<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/myLib/mainPage.js"></script>
</head>

<body>
<div style="background-color: snow;">
<br>
<div class="row container-fluid">
  <div class="col-2"></div>
  <div class="col-1">
    <img src="resources/image/title.PNG" class="img-thumbnail">
  </div>
  <div class="col-1">
  	<c:if test="${not empty loginID}">
  	  <button type="button" class="btn btn-secondary btn-sm">참여중</button><br>
  	  <span class="badge rounded-pill bg-light text-dark">${nickName}님 환영합니다</span>
  	</c:if>
  </div>
  <div class="col-4">
    <div class="input-group flex-nowrap text-center">
      <span class="input-group-text" id="addon-wrapping">1️⃣</span>
<%--       <input type="text" class="form-control" placeholder="${serverTime}" aria-label="Username" aria-describedby="addon-wrapping"> --%>
      <input type="text" class="form-control" placeholder="${serverTime}" aria-label="Username" aria-describedby="addon-wrapping">
    </div> 
  </div>
  <div class="col-2 text-end">
    <a>고객지원</a>&nbsp;
    <span>|</span>&nbsp;
    <c:if test="${empty loginID}">
      <a href="joinf">회원가입</a><br>
      <a href="loginf">로그인</a>
    </c:if>
    <c:if test="${not empty loginID}">
      <a href="mypage">마이페이지</a><br>
      <a href="logout">로그아웃</a>
    </c:if>
  </div>
  <div class="col-2"></div>
</div>

<!-- 메뉴 바 -->
<br style="background: snow;">
<div class="row">
  <ul class="nav nav-tabs">
    <li class="nav-item col-2">
      <a class="nav-link disabled" style="text-align: center;"> </a></li>
    <li class="nav-item col-1">
      <span class="nav-link" id="recom" style="text-align: center;">전체 목록</span></li>
    <li class="nav-item col-1">
      <span class="nav-link textLink" id="recruit" style="text-align: center;">모 집</span></li>
    <li class="nav-item col-1">
      <span class="nav-link" id="doing" style="text-align: center;">진 행</span></li>
    <li class="nav-item col-1">
      <span class="nav-link" id="done" style="text-align: center;">완 료</span></li>
    <li class="nav-item col-3">
      <a class="nav-link disabled" style="text-align: center;"> </a></li>
    <li class="nav-item col-1">
      <span class="nav-link textLink" id="notice" style="text-align: center;">공지사항</span></li>
    <li class="nav-item col-2">
      <a class="nav-link disabled" style="text-align: center;"> </a></li>
  </ul>
</div>
</div>
</body>
</html>