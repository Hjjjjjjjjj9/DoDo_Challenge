<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>myPage</title>
<!-- bootstrap css-->
<link href="/resources/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<!-- svg path -->
<svg xmlns="http://www.w3.org/2000/svg" style="display:none;">
  <symbol id="people-circle" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
  </symbol>
</svg>
<div class="container">
  <div class="row">
    <div class="col-3">
      <div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
        <br>
        <svg class="d-flex justify-content-center width="40" height="40""><use xlink:href="#people-circle"/></svg>
        <br>
        <div class="fs-5 text-center">??? 님 반갑습니다!</div>
        <div class="fs-6 text-center">point : ???</div>
        <br><hr><br>
        <ul class="nav nav-pills flex-column mb-auto">
          <li>
            <h4 class="text-center">나의 기록</h4>
          </li>
          <br>
          <li class="nav-item">
            <a href="#" class="nav-link active" aria-current="page"> <!-- "active"class when selected(highlighted) -->
              챌린지 달성률
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link link-dark">
              진행중인 챌린지
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link link-dark">
              완료한 챌린지
            </a>
          </li>
          <br><br>
          <li>
            <h4 class="text-center">회원정보</h4>
          </li>
          <br>
          <li class="nav-item">
            <a href="#" class="nav-link link-dark">
              회원정보 수정
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link link-dark">
              회원탈퇴
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link link-dark">
              개인정보 이용내역
            </a>
          </li>
        </ul>
        <br>
        <hr>
        <br>
      </div>
    </div>
    <div class="col-9">
      <%@include file="/WEB-INF/views/myPage/myPageCList.jsp" %>
    </div>
  </div>
</div>



<!-- bootstrap jQeory, js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<scrypt type="text/javascript" src="/resource/js/bootstrap.js"></scrypt>
</body>
</html>