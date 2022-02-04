<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너Do나Do : 회원리스트</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/joinFormCheck.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
    .container.custom-container {
      padding: 0 9rem;
    }
</style>
</head>
<body>

<div class="custom-container container">
<br><br>
<h3>회원 목록</h3>
<br><br>
<table class="table table-hover">
    <thead>
    <tr>
        <th>#</th>
        <th>아이디</th>
        <th>이름</th>
        <th>닉네임</th>
        <th>포인트</th>
        <th>신고알림</th>        
    </tr>
    </thead>
    <tbody>
    <tr>
        <th>1</th>
        <td>apple</td>
        <td>김**</td>
        <td>애플</td>
        <td>1300</td>
        <td><button type="button" class="btn btn-primary btn-sm position-relative">내역<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">3</span> </button></td>
    </tr>
    <tr>
        <th>2</th>
        <td>banana</td>
        <td>최**</td>
        <td>반하나</td>
        <td>1900</td>
        <td><button type="button" class="btn btn-primary btn-sm position-relative">내역</button></td>
    </tr>
    <tr>
        <th>3</th>
        <td>lemon</td>
        <td>김**</td>
        <td>레몬</td>
        <td>2300</td>
        <td><button type="button" class="btn btn-primary btn-sm position-relative">내역<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">2</span> </button></td>
    </tr>
    <tr>
        <th>4</th>
        <td>orange</td>
        <td>이**</td>
        <td>오렌지</td>
        <td>1200</td>
        <td><button type="button" class="btn btn-primary btn-sm position-relative">내역<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">1</span> </button></td>
    </tr>
    
    
    </tbody>


</table>

<a href="logout">로그아웃</a>

</div>







<div class="row container-fluid" style="height: 10rem; position: absolute;">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
  </div>
</body>
</html>