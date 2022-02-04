<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageCList</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
<div class="row row-col-3 justify-content-center">
  <div class="card col-3">
    <img src="resources/image/water.jpg" class="card-img-top" height="150rem">
    <div class="card-body">
      <div class="progress">
        <div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <p class="card-text"><br>물 많이 마시고 싶은 사람 모여라~~</p>
    </div>
  </div>
  &nbsp;&nbsp; 
  <div class="card col-3">
    <img src="resources/image/morning.jpg" class="card-img-top" height="150px">
    <div class="card-body">
      <div class="progress">
        <div class="progress-bar bg-danger" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <p class="card-text">미라클 모닝 함께하실 분....</p>
    </div>
  </div>
  &nbsp;&nbsp;
  <div class="card col-3">
    <img src="resources/image/jump.jpg" class="card-img-top" height="150px">
    <div class="card-body">
      <div class="progress">
        <div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <p class="card-text">하루에 줄넘기 1000개 도전해봐요!</p>
    </div>
  </div>
</div>

<div class="row row-col-3 justify-content-center">
  <div class="card col-3">
    <img src="resources/image/water.jpg" class="card-img-top" height="150rem">
    <div class="card-body">
      <div class="progress">
        <div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <p class="card-text"><br>물 많이 마시고 싶은 사람 모여라~~</p>
    </div>
  </div>
  &nbsp;&nbsp; 
  <div class="card col-3">
    <img src="resources/image/morning.jpg" class="card-img-top" height="150px">
    <div class="card-body">
      <div class="progress">
        <div class="progress-bar bg-danger" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <p class="card-text">미라클 모닝 함께하실 분....</p>
    </div>
  </div>
  &nbsp;&nbsp;
  <div class="card col-3">
    <img src="resources/image/jump.jpg" class="card-img-top" height="150px">
    <div class="card-body">
      <div class="progress">
        <div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <p class="card-text">하루에 줄넘기 1000개 도전해봐요!</p>
    </div>
  </div>
</div>


<!-- 페이지 번호  -->
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