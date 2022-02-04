<%@page import="vo.AskVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>

	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<style>
     table {text-align: center; margin-left: auto; margin-right: auto;}
     .td1 { font-size: 10pt; width: 60%}
     .td2 { font-size: 10pt; width:17.5%;}
     th {font-size: 10pt; width: 10%;}
     .th1 {font-size: 10pt;}
      a {text-decoration: none;}
	</style>
</head>

<br>
<br>
<div style="margin-left: 5em;">
  <h3>Q & A</h3>
</div>
<hr style="width: 95%; margin-left: auto;margin-right: auto; margin-bottom: 2em;">

<!-- 1:1 문의하기 -->
<div style="width: 95%; margin-left: auto; margin-right: auto;">
<table class="table caption-top">
  <thead>
    <tr height="20">
      <th scope="col">글번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">날짜</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="list" items="${abanana}">
    <tr height="20">
      <th class="th1" scope="row"><c:if test="${list.indent > 0}">
			<c:forEach begin="1" end="${list.indent}">
				<span>&nbsp;&nbsp;</span>
			</c:forEach>
			<span style="color:CornflowerBlue "> ┗ (re) </span>${list.root}</c:if>
			<c:if test="${list.indent == 0}">${list.seq}</c:if></th>
      <td class="td1"><c:if test="${loginID =='admin' || loginID==list.id || loginID==aapple.id}"><a style="color: black;" href="adetail?seq=${list.seq}">${list.title}</a></c:if><c:if test="${loginID !='admin' && loginID != list.id }">${list.title}</c:if></td>
      <td class="td2"><c:if test="${list.indent == 0}">${list.id}</c:if><c:if test="${list.indent > 0}">관리자</c:if></td>
      <td class="td2">${list.regdate}</td>
    </tr>
    </c:forEach>
  </tbody>
</table>
&nbsp;&nbsp;<a href="ainsertf" style="color: RebeccaPurple ;">글쓰기</a>&nbsp;&nbsp;
<!-- <a href="home" style="color: RebeccaPurple ;">메인으로</a> -->
</div>


<div style="margin-left: 47%; margin-right: 53%;">
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="apagelist?currPage=${sPageNo-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
    </li>
    <c:forEach var="i" begin="${sPageNo}" end="${ePageNo}">
		<c:if test="${i==currPage}">
		<a class="page-link" style="color: Orchid;">${i}</a>
		</c:if>
		<c:if test="${i!=currPage}">
			<a  class="page-link" href="apagelist?currPage=${i}">${i}</a>&nbsp;
		</c:if>
	</c:forEach>
    <li class="page-item">
      <a class="page-link" href="apagelist?currPage=${ePageNo+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>


<br>
</body>
</html>