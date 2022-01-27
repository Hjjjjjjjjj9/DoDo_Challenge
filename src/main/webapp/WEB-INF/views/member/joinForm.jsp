<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Join Form **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>

</head>
<body>
<h3>** Join **</h3>
<form action="join" method="post">
<table>
	<tr height="40"><td bgcolor="Thistle">I D</td>
		<td><input type="text" name="id" id="id" size="20">&nbsp;&nbsp;
			<span id="idMessage" class="eMessage"></span></td></tr>
			
	<tr height="40"><td bgcolor="Thistle">Password</td>
		<td><input type="password" name="password" id="password" size="20"><br>
			<span id="passwordMessage" class="eMessage"></span></td></tr>	
			
	<tr height="40"><td bgcolor="Thistle">Name</td>
		<td><input type="text" name="name" id="name" size="20"><br>
			<span id="nameMessage" class="eMessage"></span></td></tr>
			
	<tr height="40"><td bgcolor="Thistle">Mail</td>
		<td><input type="text" name="mail" id="mail" size="20"><br>
			<span id="mailMessage" class="eMessage"></span></td></tr>
			
	<tr height="40"><td bgcolor="Thistle">Nick</td>
		<td><input type="text" name="nick" id="nick" size="20"><br>
			<span id="nickMessage" class="eMessage"></span></td></tr>
			
	<tr height="40"><td bgcolor="Thistle">추천인</td>
		<td><input type="text" name="rid" id="rid" size="20"><br>
			
	<tr height="40"><td bgcolor="Thistle">관심사</td>
		<td><select name="prefer" id="prefer">
				<option value="-" selected >----</option>
				<option value="A" >공부</option>
				<option value="B" >운동</option>
				<option value="C" >생활</option>
				<option value="D" >취미</option>
			</select>
		</td></tr>
		
	<tr height="40"><td></td>
		<td><input type="submit" value="가입" >&nbsp;&nbsp;
			<input type="reset" value="취소">&nbsp;&nbsp;
		</td></tr>			
</table>
</form>

<c:if test="${not empty message}">
<br>=> ${message}<br><br> 
</c:if>
<hr>
<a href="home">[Home]</a>
</body>
</html>