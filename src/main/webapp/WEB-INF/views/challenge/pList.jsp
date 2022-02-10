<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Participate List</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/myLib/mainPage.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>
<body>

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