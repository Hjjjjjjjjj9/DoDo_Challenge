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
<!-- header -->
<div>
<!-- 상단 바 -->
  <br>
  <div class="row container-fluid">
    <div class="col-2"></div>
    <div class="col-1">
      <img onClick="location.href='home'" src="resources/image/title.PNG" class="img-thumbnail">
    </div>
    <div class="col-1">
  	  <c:if test="${not empty loginID}">
  	    <button type="button" class="btn btn-secondary btn-sm" style="margin-top: 5px" 
  	    	onclick="location.href='plist?loginID=${loginID}';">참여중</button><br>
  	    <span class="badge rounded-pill bg-light text-dark text-start" style="margin-top: 8px">${nickName}님 <br>환영합니다</span>
  	  </c:if>
    </div>
    <div class="col-4">
      <iframe style="height: 3em; width: 32em;" name="frameTest"  width="600px" height="600px" src="http://localhost:8080/dodo/ranklist" scrolling="auto" frameborder="0"></iframe>
      <c:if test="${not empty message}">
        <span>${message}</span>
      </c:if>
    </div>
    <div class="col-2 text-end">
      <c:if test="${empty loginID}">
        <a onclick="changeView(11)">고객지원</a>
        <div class="vr"></div>
        <a onclick="changeView(2)">회원가입</a><br>
        <a onclick="changeView(3)">로그인</a>
      </c:if>
      <c:if test="${not empty loginID}">
        <a onclick="changeView(1)">고객지원</a>
        <div class="vr"></div>
        <a onclick="changeView(4)">마이페이지</a><br>
        <a onclick="changeView(5)">로그아웃</a>
      </c:if>
    </div>
    <div class="col-2"></div>
  </div><br>

<!-- 메뉴 바
  <br style="background: snow;">
  <div class="row">
    <ul class="nav nav-tabs">
      <li class="nav-item col-2">
        <a class="nav-link disabled" style="text-align: center;"> </a></li>
      <li class="nav-item col-1">
        <span class="nav-link" onclick="changeView(6)" id="recom" style="text-align: center;">전체 목록</span></li>
      <li class="nav-item col-1">
        <span class="nav-link" onclick="changeView(7)" id="recruit" style="text-align: center;">모 집</span></li>
      <li class="nav-item col-1">
        <span class="nav-link" onclick="changeView(8)"id="doing"  style="text-align: center;">진 행</span></li>
      <li class="nav-item col-1">
        <span class="nav-link" onclick="changeView(9)"id="done" style="text-align: center;">완 료</span></li>
      <li class="nav-item col-3">
        <a class="nav-link disabled" style="text-align: center;"> </a></li>
      <li class="nav-item col-1">
        <span class="nav-link" onclick="changeView(10)" id="notice" style="text-align: center;">공지사항</span></li>
      <li class="nav-item col-2">
        <a class="nav-link disabled" style="text-align: center;"> </a></li>
    </ul>
  </div>
 -->
<!-- header 끝 -->

</body>
</html>