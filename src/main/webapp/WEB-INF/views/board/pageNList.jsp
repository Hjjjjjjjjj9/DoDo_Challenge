<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	
	<style>
     table {text-align: center; margin-left: auto; margin-right: auto;}
     .td1 { font-size: 10pt; width:70%;}
     .td2 { font-size: 10pt; width:20%;}
     th {font-size: 10pt; width:10%;}
     a {text-decoration: none;}
	</style>
</head>

<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<br>
<div class="row" > 
  <div class="col-2" ></div>
  <div class="col-8">
    <h3>Notice</h3>
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
			  <a class="page-link" href="npagelist?currPage=${i}">${i}</a>&nbsp;
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
  
    <div class="col-2" ></div>
  </div>
</div>

<div class="row container-fluid" style="height: 10rem; position: fixed; bottom: 0;">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
</div>


</body>
</html>