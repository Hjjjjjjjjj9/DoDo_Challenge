<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge List</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<!-- 검색 -->
<br>
<nav class="navbar navbar-light">
  <div class="container-fluid">
    <form class="d-flex">
      <button class="btn btn-outline-success" type="submit">🔍</button>
      <input class="form-control me-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
    </form>
  </div>
</nav>

<!-- 카테고리 버튼 -->
<div class="row">
  <div class="col-5">
    <span>&nbsp;&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-secondary">운동</button>
	<button type="button" class="btn btn-secondary">공부</button>
	<button type="button" class="btn btn-dark">생활</button>
	<button type="button" class="btn btn-secondary">취미</button>
  </div>
</div>

<!-- 글 목록 -->
<br>
<div class="row justify-content-center row-cols-5">
  <div class="card" style=" height: 15rem;" >
    <img src="resources/image/water.jpg" class="card-img-top" height="150px">
    <div class="card-body">
      <p class="card-text">물 많이 마시고 싶은 사람 모여라~~</p>
    </div>
  </div>
  &nbsp;&nbsp; 
  <div class="card" style=" height: 15rem;">
    <img src="resources/image/morning.jpg" class="card-img-top" height="150px">
    <div class="card-body">
      <p class="card-text">미라클 모닝 함께하실 분....</p>
    </div>
  </div>
  &nbsp;&nbsp;
  <div class="card" style=" height: 15rem; ">
    <img src="resources/image/jump.jpg" class="card-img-top" height="150px">
    <div class="card-body">
      <p class="card-text">하루에 줄넘기 1000개 도전해봐요!</p>
    </div>
  </div>
  &nbsp;&nbsp;
  <div class="card" style=" height: 15rem;">
    <img src="resources/image/word.jpg" class="card-img-top" height="150px">
    <div class="card-body">
      <p class="card-text">단어 30개 외우기 가능?!</p>
    </div>
  </div>
</div>

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

</body>
</html>