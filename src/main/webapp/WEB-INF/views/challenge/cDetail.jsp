<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge Detail List</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<body>

<%@ include file="../header.jsp" %>
<div class="row" > 
<div class="col-2" style="background-color: lavender;"></div>
<div id="mainArea" class="col-8" >
<br>
<div>
  <p>챌린지 상세보기</p>
</div>
<hr>

<!-- 상세보기 table -->
<div class="row">
  <div>
    <table class="table">
      <tr>
        <th rowspan="4"></th>
        <th colspan="5" style="text-align: center; ">${apple.title}</th>
        <th rowspan="4"></th>
      </tr>
      <tr>
        <th scope="col" colspan="5" style="text-align: center;">작성자 :${apple.id} 작성일 :${apple.regdate} 조회수 :${apple.cnt}</th>
      </tr>
      <tr>
        <td colspan="3" style="text-align: center;">
          <img src="${apple.thumbnail}" width="200"></td>
        <td colspan="2" rowspan="2" style="text-align: center; ">
          <a href="participate?seq=${apple.seq}&term=${apple.term}" 
          		class="btn btn-secondary btn-sm">참여하기</a>
        </td>
      </tr>
      <tr>
		<td style="text-align: center;">
		  <p class="text-break">${apple.content}</p></td>        
      </tr>
    </table>
  </div>
</div>

<c:if test="${nickName == apple.id  || loginID=='admin'}">
	<a href="cdetail?jcode=U&seq=${apple.seq}">글수정</a>&nbsp;
	<a href="cdelete?seq=${apple.seq}">글삭제</a>
</c:if> 
<br>
<a href="clist">목록보기</a>&nbsp;
<a href="home">[Home]</a>

<hr width="70%">
<!-- 댓글 table -->
<div class="row">
  <div>
    <form action="rinsert" method="get">
    <table class="table" style="width: 70%; background: Gainsboro; " border="1">
      <tr>
        <td colspan="2"></td>
        <td colspan="2">
          <input type="text" name="content" placeholder="댓글 내용을 입력하세요" size="70"></td> 
        <td colspan="2">  
          <input type="text" name="id" hidden="hidden" value="${nickName}"></td> 
        <td colspan="2">  
          <input type="text" name="seq" hidden="hidden" value="${apple.seq}"></td> 
        <td style="text-align: center;">
          <input type="submit" value="입력"> </td> 
      </tr>
    </table>
    </form>
  </div>
    
  <div>
    <table class="table" style="width: 70%; background: Gainsboro; " border="1">
      <c:forEach var="list" items="${cherry}">
        <tr>
          <td rowspan="2"></td>
          <td width="10%" rowspan="2">${list.id}</td>
        </tr>
        <tr>
          <td width="40%" colspan="2">${list.content}</td>
          <td style="text-align: center;">
            <input type="button" value="신고하기"> </td>
        </tr>
        <tr>
          <td colspan="2"></td>
          <td width="30%">${list.regdate}</td>
        </tr>
      </c:forEach>
    </table>
  </div>
</div>

</div>

<div class="col-2" style="background-color: lavender;"></div>
</div>

<c:if test="${not empty message}">
  <span>${message}</span>
</c:if>

<div class="row container-fluid" style="height: 10rem; position: absolute; background: snow; ">
  <%@ include file="../footer.jsp" %>
</div>
</body>
</html>