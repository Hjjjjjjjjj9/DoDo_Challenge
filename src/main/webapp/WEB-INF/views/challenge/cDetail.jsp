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
        <td colspan="2" rowspan="2" style="text-align: center; ">출석 Div</td>
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
    <table class="table" style="width: 70%; background: Gainsboro; ">
      <tr>
        <td rowspan="2" ></td>
        <td width="30%" >닉네임~~</td>
        <td width="40%">작성 날짜</td>
        <td style="text-align: right;"><input type="button" value="신고"> </td>
      </tr>
      <tr>
        <td>댓글 내용~~</td>
      </tr>
    </table>
  </div>
</div>
</div>

<div class="col-2" style="background-color: lavender;"></div>
</div>

<div class="row container-fluid" style="height: 10rem; position: absolute; background: snow; ">
  <%@ include file="../footer.jsp" %>
</div>
</body>
</html>