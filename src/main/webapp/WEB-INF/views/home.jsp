<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoDo_Home</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/myLib/mainPage.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>

<div>
<br>
<div class="row container-fluid">
  <div class="col-2"></div>
  <div class="col-1">
    <img src="resources/image/title.PNG" class="img-thumbnail" onClick="window.location.reload()">
  </div>
  <div class="col-1">
  	<c:if test="${not empty loginID}">
  	  <button type="button" class="btn btn-secondary btn-sm" style="margin-top: 5px">참여중</button><br>
  	  <span class="badge rounded-pill bg-light text-dark text-start" style="margin-top: 8px">${nickName}님 <br>환영합니다</span>
  	</c:if>
  </div>
  <div class="col-4">
    <div class="input-group flex-nowrap text-center">
      <span class="input-group-text" id="addon-wrapping">1️⃣</span>
      <input type="text" class="form-control" placeholder="${serverTime}" aria-label="Username" aria-describedby="addon-wrapping">
    </div> 
    <c:if test="${not empty message}">
        <span>${message}</span>
    </c:if>
  </div>
  <div class="col-2 text-end">
    <a href="asklist">고객지원</a>
    <div class="vr"></div>
    <c:if test="${empty loginID}">
      <a id="join">회원가입</a><br>
      <span id="login">로그인</span>
    </c:if>
    <c:if test="${not empty loginID}">
      <a href="mypage">마이페이지</a><br>
      <a href="update">정보수정</a><br>
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
      <span class="nav-link active" id="recom" style="text-align: center;">전체 목록</span></li>
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

<div class="row" > 
  <div class="col-2" ></div>
  <div id="mainArea" class="col-8" >
<!-- 챌린지 -->  
<%-- <%@ include file="challenge/cList.jsp" %> --%>
<%-- <%@ include file="challenge/cDetail.jsp" %> --%>
<%-- <%@ include file="challenge/cinsertForm.jsp" %> --%>

<!-- 마이페이지 -->
<%-- <%@ include file="myPage/myPage.jsp" %> --%>

<!-- 공지사항 -->
<%-- <%@ include file="board/notice.jsp" %> --%>
<%-- <%@ include file="board/nDetail.jsp" %> --%>
<%-- <%@ include file="board/nInput.jsp" %> --%>

<!-- 문의 -->
<%-- <%@ include file="board/ask.jsp" %> --%>
<%-- <%@ include file="board/askDetail.jsp" %> --%>
<%-- <%@ include file="board/askInput.jsp" %> --%>


  </div>
  <div class="col-2" ></div>
</div>

<div class="row container-fluid" style="height: 10rem; position: absolute; background: WhiteSmoke; ">
  <%@ include file="footer.jsp" %>
</div>

</body>
</html>
