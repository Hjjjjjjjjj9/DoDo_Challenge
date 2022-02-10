<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
-->
<title>myPage</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" 
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
  
</head>
<body>
<!-- svg path -->
<svg xmlns="http://www.w3.org/2000/svg" style="display:none;">
  <symbol id="people-circle" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
  </symbol>
</svg>

<%@ include file="/WEB-INF/views/header.jsp" %>
<br>
<div class="row" > 
  <div class="col-2" ></div>
  <div class="col-8">
  
  <div>
    <div class="row row-col-2">
      <div class="col-3">
        <div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
        <br>
        <svg class="d-flex justify-content-center"><use xlink:href="#people-circle"/></svg>
        <br>
        <div class="fs-5 text-center">${loginName} 님 반갑습니다!</div>
        <div class="fs-6 text-center">point : ${loginPoint}</div>
        <br><hr><br>
        <ul class="nav nav-pills flex-column mb-auto">
          <li>
            <h4 class="text-center">나의 기록</h4>
          </li>
          <br>
          <li class="nav-item">
            <a href="#" class="nav-link active" aria-current="page" id="plist"> <!-- "active"class when selected(highlighted) -->
              챌린지 달성률
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link link-dark" id="plist">
              진행중인 챌린지
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link link-dark" id="plist">
              완료한 챌린지
            </a>
          </li>
          <br><br>
          <li>
            <h4 class="text-center">회원정보</h4>
          </li>
          <br>
          <li class="nav-item">
            <a class="nav-link link-dark" id="mupdatef">
              회원정보 수정
            </a>
          </li>
          <li class="nav-item">
            <a href="mdelete" class="nav-link link-dark">
              회원탈퇴
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link link-dark">
              개인정보 이용내역
            </a>
          </li>
        </ul>
        <br><hr><br>
        </div>
      </div>
    <div class="col" id="contentarea"></div>
  </div>
</div>
  
  </div>
  <div class="col-2" ></div>
</div>

<div class="row container-fluid" style="height: 10rem; position: absolute;">
  <%@ include file="/WEB-INF/views/footer.jsp" %></div>

<script>

$('#plist').click(function() {
	$.ajax({
		type:"Get",
		url:"plist",
		success:function(resultPage) {
			$('#contentarea').html(resultPage);	
		},
		error:function() {
			alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
		}
	}); //ajax
});

$('#mupdatef').click(function() {
	$.ajax({
		type:"Get",
		url:"mUpdatef",
		success:function(resultPage) {
			$('#contentarea').html(resultPage);	
		},
		error:function() {
			alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
		}
	}); //ajax
});
</script>
  
</body>
</html>