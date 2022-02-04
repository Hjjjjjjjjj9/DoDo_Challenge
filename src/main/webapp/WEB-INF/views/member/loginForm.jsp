<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/axTest01.js"></script>
</head>
<body>
<br>
<h2 style="text-align: center; margin-top:1.5em; margin-bottom:1.5em;">LOGIN</h2>
<hr>
<br>
<div align="center" style="color: green;">
<span id="message" ></span><br>
<c:if test="${not empty message}">
	<br> ${message}<br><br>
</c:if>
</div>
<!-- login style1 -->
<form action="login" method="post">
<div>
<table style=" border-radius:9px; height:8em; width:30em; margin-top:2em; margin-bottom:8em; margin-left:auto; margin-right:auto;">
	<tr align="center" style="margin-top: 1em;">
		<td height="3.5em"><input style="border-radius: 3px; width: 20em;" type="text" name="id" id="id" placeholder="아이디" onfocus="this.placeholder=''" onblur="this.placeholder='아이디'"></td>
		<td rowspan="2"><input style="border-radius:3px; height:5em; width: 7em; background-color: MediumPurple; color:white; align-self:center;" type="submit" value="로그인">&nbsp;</td>
	</tr>
	<tr align="center">
		<td height="3.5em"><input style="border-radius: 3px; width: 20em;"  type="password" name="password" id="password" placeholder="비밀번호" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'"></td>
	</tr>
	<tr align="center">
	     <td>
	    </td>
	    <td>
	        <a href="joinf" style="color: gray; text-decoration: none; font-size: 12px;">회원가입</a>
		</td>
		
	</tr> 
</table>
</div>
</form>

<!-- login style2 새페이지 전용 -->
<!-- <form action="login" method="post">
<div>
<table style=" border-radius:9px; height:13em; width:13em; margin-top:10em; margin-bottom:20em; margin-left:auto; margin-right:auto; background-color: WhiteSmoke;">
	<tr align="center"><td></td>
		<td><input style="border-radius: 6px;" type="text" name="id" id="id" placeholder="아이디" onfocus="this.placeholder=''" onblur="this.placeholder='아이디'"></td></tr>
	<tr align="center"><td></td>
		<td><input style="border-radius: 6px;" type="password" name="password" id="password" placeholder="비밀번호" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'"></td></tr>
	<tr align="center"><td></td>
	    <td>
	       <input style="border-radius:6px; background-color: MediumPurple; color:white; align-self:center; width: 11.5em;" type="submit" value="Login">&nbsp;
	    </td>
    </tr>	
	<tr align="center"><td></td>
	    <td>
	        <a onclick="joinForm.jsp" style="color: gray; font-size: 12px;">회원가입</a>
			<span id="axlogin" class="textLink">axLogin</span>&nbsp;
			<span id="jslogin" class="textLink">jsLogin</span>
		</td>
	<td></td></tr> 
</table>
</div>
</form> -->
<br>
<div class="row container-fluid" style="height: 10rem; position: absolute; background: snow; ">
  <%@ include file="../footer.jsp" %>
</div>
<!-- <a href="home">[Home]</a> -->
</body>
</html>




