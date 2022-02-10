<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<style>
      a {text-decoration: none;}
	</style>
</head>
<body>

<br>
<div style="margin-left: 5em;">
  <h4>Notice</h4>
</div>
<hr style="width: 95%; margin-left: auto;margin-right: auto;">

<!-- 상세보기 table -->
<div class="row">
  <div style="width: 95%; margin-left: auto; margin-right: auto;">
    <table class="table">
      <tr>
        <th colspan="9" style="font-size:20px; border-color:White; text-align: center;"><input value="${napple.seq}" hidden>${napple.title}</th>
      </tr>
      <tr>
        <th scope="col" colspan="5" style="border-bottom-color:Gray; text-align: center; font-size:10px; "> 작성자 : 관리자 / 작성일 :${napple.regdate} / 조회수 :${napple.cnt}</th>
      </tr> 
      <tr>
		<td style="text-align: center; height: auto; font-size: 16px; border-bottom-color:DarkGray; border-bottom-width:1px;">
		  <p class="text-break">${napple.content}</p></td>        
      </tr>
    </table>
    <!-- 글 수정 & 삭제  -->
<c:if test="${loginID=='admin'}">
	<a href="nupdatef?jcode=U&seq=${napple.seq}" style="color: RebeccaPurple; font-size: 18px;">수정</a>&nbsp;&nbsp;
	<a href="ndelete?seq=${napple.seq}" style="color: RebeccaPurple; font-size: 18px;">삭제</a>
</c:if>
  </div>
</div>

<div align="center">
 <a href='javascript:history.go(-1)' style="border-radius:3px; background-color: Gray; color:white; display:inline-block; width: 3em; height: 1.5em; font-size: 18px;">목록</a>&nbsp;&nbsp;
 </div>

</body>
</html>