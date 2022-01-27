<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** LoginForm **</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<body>
<h3>** LoginForm **</h3><br>
<form action="login" method="post" >
<table>
	<tr><td bgcolor="lavender">I D</td>
		<td><input type="text" name="id" id="id"></td>
		<td rowspan="2"><input type="submit" value="Login">
	</tr>
	<tr><td bgcolor="lavender ">Password</td>
		<td><input type="password" name="password" id="password"></td>
	</tr>
	<tr><td><a href="findf">ID/PW 찾기</a></td>
	</tr>
</table>
</form>

<span id="message"></span><br>
<c:if test="${not empty message}">
	<br>=> ${message}<br><br>
</c:if>
<hr>
<a href="home">[Home]</a>
</body>
</html>