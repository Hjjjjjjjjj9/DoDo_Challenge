<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>

<body>
<div style="background-color: snow;">
<br>
<div class="row container-fluid">
  <div class="col-2"></div>
  <div class="col-1">
    <a href="home"><img src="resources/image/title.PNG" class="img-thumbnail"></a>
  </div>
  <div class="col-1">
    <button type="button" class="btn btn-secondary btn-sm">참여중</button><br>
  	<span class="badge rounded-pill bg-light text-dark">닉네임</span>
  </div>
  <div class="col-4">
    <div class="input-group flex-nowrap text-center">
      <span class="input-group-text" id="addon-wrapping">1️⃣</span>
      <input type="text" class="form-control" placeholder="${serverTime}" aria-label="Username" aria-describedby="addon-wrapping">
    </div> 
  </div>
  <div class="col-2 text-end">
    <a>고객지원</a>&nbsp;
    <span>|</span>&nbsp;
    <c:if test="${empty loginID}">
    <a href="loginform">로그인</a>
    </c:if>
    <c:if test="${not empty loginID}">
    <a href="logout">로그아웃</a>&nbsp;&nbsp;
    <span>|</span>&nbsp;
    <a href="myPage">${loginName}님 어서오세요</a>
    </c:if>
  </div>
  <div class="col-2"></div>
</div>

<!-- 메뉴 바 -->
<br style="background: snow;">
<div class="row">
  <ul class="nav nav-tabs">
    <li class="nav-item col-2">
      <a class="nav-link disabled" style="text-align: center;"> </a>
    </li>
    <li class="nav-item col-1">
      <a class="nav-link active" aria-current="page" href="#" id="recom" style="text-align: center;">추 천</a>
    </li>
    <li class="nav-item col-1">
      <a class="nav-link" href="#" id="recruit" style="text-align: center;">모 집</a>
    </li>
    <li class="nav-item col-1">
      <a class="nav-link" href="#" id="doing" style="text-align: center;">진 행</a>
    </li>
    <li class="nav-item col-1">
      <a class="nav-link" href="#" id="done" style="text-align: center;">완 료</a>
    </li>
    <li class="nav-item col-3">
      <a class="nav-link disabled" style="text-align: center;"> </a>
    </li>
    <li class="nav-item col-1">
      <a class="nav-link" href="#" id="notice" style="text-align: center;">공지사항</a>
    </li>
    <li class="nav-item col-2">
      <a class="nav-link disabled" style="text-align: center;"> </a>
    </li>
  </ul>
</div>
</div>
</body>
</html>