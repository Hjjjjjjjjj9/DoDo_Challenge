<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">	
	
	<style>
     table {text-align: center; margin-left: auto; margin-right: auto;}
     td { font-size: 10pt; width:}
     th {font-size: 10pt; }
     caption {font-size: 20px;}
	</style>
</head>
<body>
<br>
<!-- 공지사항 -->
<div>
<table class="table caption-top">
  <caption>Notice</caption>
  <thead>
    <tr>
      <th> </th>
      <th>제목</th>
      <th>날짜</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="list" items="${banana}">
      <tr>
        <th>${list.seq}</th>
        <td>${list.title}</td>
        <td>${list.regdate}</td>
      </tr>
    </c:forEach>
  </tbody>
</table>
</div>

<span>${message}</span><br>
<a href="home">HOME</a>

<!-- 공지사항 페이지 번호 -->
<br>
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
</body>
</html>