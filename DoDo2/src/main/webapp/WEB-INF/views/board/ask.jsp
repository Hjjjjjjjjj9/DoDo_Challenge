<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<style>
     table {text-align: center; margin-left: auto; margin-right: auto;}
     caption {font-size: 20px;}
	</style>
</head>

<br>
<div>
  <table class="table caption-top" style="font-size: 10pt;">
    <caption>1:1문의</caption>
    <thead>
      <tr>
        <th scope="col"> </th>
        <th scope="col">제목</th>
        <th scope="col">작성자</th>
        <th scope="col">날짜</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach begin="1" end="10">
      <tr>
        <td scope="row">1</td>
        <td>사이트 서버 점검 안내</td>
        <td>관리자</td>
        <td>2022/01/02</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <div class="text-end"><input type="button" value="글 쓰기"></div>
</div>

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
<br>
</body>
</html>