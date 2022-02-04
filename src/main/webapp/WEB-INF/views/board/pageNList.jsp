<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<style>
     table {text-align: center; margin-left: auto; margin-right: auto;}
     .td1 { font-size: 10pt; width:70%;}
     .td2 { font-size: 10pt; width:20%;}
     th {font-size: 10pt; width:10%;}
     a {text-decoration: none;}
	</style>
</head>
<body>
<br>
<br>
<div style="margin-left: 5em;">
  <h3>Notice</h3>
</div>
<hr style="width: 95%; margin-left: auto;margin-right: auto; margin-bottom: 2em;">

<div style="width: 95%; margin-left: auto; margin-right: auto;">
<table class="table caption-top">
  <thead>
   <tr height="40">
	 <th scope="col">글번호</th>
	 <th scope="col">제목</th>
	 <th scope="col">날짜</th>
   </tr>
   </thead>
 <tbody>   
   <c:forEach var="list" items="${nbanana}">
   <tr height="40">
	 <th  scope="row">${list.seq}</th>
	 <td class="td1"><a style="color: black;" href="ndetail?seq=${list.seq}&id=${list.id}">${list.title}</a></td>
	 <td class="td2">${list.regdate}</td>
   </tr>
   </c:forEach>
   </tbody>
</table>
</div>

<div style="margin-left: 2em;">
<c:if test="${loginID=='admin'}">
  <a href="ninsertf" style="color: RebeccaPurple ;">글쓰기</a>&nbsp;&nbsp;
</c:if> 
<!-- <a href="home" style="color: RebeccaPurple ;">메인으로</a> -->
</div>

<div style="margin-left: 47%; margin-right: 53%;">
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="npagelist?currPage=${sPageNo-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
    </li>
    <c:forEach var="i" begin="${sPageNo}" end="${ePageNo}">
		<c:if test="${i==currPage}">
		<a class="page-link" style="color: Orchid;">${i}</a>
		</c:if>
		<c:if test="${i!=currPage}">
			<a  class="page-link" href="npagelist?currPage=${i}">${i}</a>&nbsp;
		</c:if>
	</c:forEach>
    <li class="page-item">
      <a class="page-link" href="npagelist?currPage=${ePageNo+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>



</body>
</html>