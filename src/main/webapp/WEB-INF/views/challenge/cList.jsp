<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge List</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/myLib/mainPage.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script>
$(function () {
	$('#searchButton1').click(function() {
		$.ajax({
			type:"GET",
			url:'checkTitle',
			success:function(resultPage) {
				$('#mainArea').html(resultPage);	
			},
			error:function() {
				alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
			}
		});
	}); 
	
	$('#searchButton2').click(function() {
		$.ajax({
			type:"GET",
			url:'checkCategory',
			success:function(resultPage) {
				$('#mainArea').html(resultPage);	
			},
			error:function() {
				alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
			}
		});
	}); 
	
	$('#searchButton3').click(function() {
		$.ajax({
			type:"GET",
			url:'checkState',
			success:function(resultPage) {
				$('#mainArea').html(resultPage);	
			},
			error:function() {
				alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
			}
		});
	}); 
}); //ready
</script>
</head>
<body>

<!-- 키워드 검색 -->
<br>
<nav class="navbar navbar-light">
  <div class="container-fluid">
    <form class="d-flex" action="checkTitle" method="get">
      <button class="btn btn-outline-success" type="submit" id="searchButton1">🔍</button>
      <input class="form-control me-2" type="text" name="check" placeholder="검색어를 입력하세요" aria-label="Search">
    </form>
  </div>
</nav>

<!-- 진행 상황 검색 -->
<br>
<form action="checkState" method="get">
  &nbsp;&nbsp;&nbsp;
  <select name="check">
    <option value="" selected>--</option>
    <option value="recruit">모집중</option>
    <option value="doing">진행중</option>
    <option value="done">완료</option>
  </select>
  <input type="submit" value="조회" id="searchButton3" >&nbsp;
</form>

<!-- 카테고리별 검색 -->
<div class="row">
  <div class="col-7">
    <form action="checkCategory" method="get">
		<b>&nbsp;&nbsp;&nbsp;
		카테고리 : </b>
		<input type="checkbox" name="check" id="s" value="A">
			<label for="s"> 공부&nbsp;</label>
		<input type="checkbox" name="check" id="e" value="B">
			<label for="e"> 운동&nbsp;</label>
		<input type="checkbox" name="check" id="l" value="C">
			<label for="l"> 생활&nbsp;</label>
		<input type="checkbox" name="check" id="h" value="D">
			<label for="h"> 취미&nbsp;&nbsp;</label>
		<input type="submit" value="검색" id="searchButton2" >&nbsp;
		<input type="reset" value="취소">
	</form>
  </div>
</div>

<c:if test="${not empty message}">
=> ${message}<br>
</c:if>

<!-- 글목록 -->
<hr>
  <div class="row justify-content-center row-cols-4">
    <c:forEach var="list" items="${banana}">
      <div class="card" style=" height: 15rem; margin: 20px;">
        <img src="${list.thumbnail}" class="card-img-top" height="150px">
	    <div class="card-body">
          <p class="card-text">
          <c:if test="${not empty loginID}">
          <a href="cdetail?seq=${list.seq}">${list.title}</a>
          </c:if>
          <c:if test="${empty loginID}">
          <a href="loginform">${list.title}</a>
          </c:if>
		  <br>카테고리 : 
			<c:if test="${list.category == 'A'}">공부</c:if>
			<c:if test="${list.category == 'B'}">운동</c:if>
			<c:if test="${list.category == 'C'}">생활</c:if>
			<c:if test="${list.category == 'D'}">취미</c:if>
 		  <br> 작성자 : ${list.id}</p>
        </div>
      </div>
    </c:forEach>
  </div>

<hr>
<c:if test="${not empty loginID}">
  <a href="cinsertf">챌린지 등록</a><br>
</c:if>

<!-- 페이지 번호  -->
<hr>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

<hr>
<a href="home">[Home]</a>

</body>
</html>