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
          <a href="cdetail?seq=${list.seq}">${list.title}</a>
        </div>
      </div>
    </c:forEach>
  </div>

</body>
</html>