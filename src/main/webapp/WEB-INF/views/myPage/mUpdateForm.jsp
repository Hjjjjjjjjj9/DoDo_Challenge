<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너Do나Do : 회원수정</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/joinFormCheck.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
</head>

<body>
<br><br>
<h3>회원정보</h3>
<br><hr><br>
<form action="mUpdate" method="post">
	<table>
		<tr><td>아이디 : <input type="text" name="id" id="id" value="${loginUser.id}" readonly="readonly"></td></tr>
		<tr><td>비밀번호 : <input type="password" name="password" id="password"></td></tr>
		<tr><td>이메일 : <input type="text" name="mail" id="mail" value="${loginUser.mail}"></td></tr>
		<tr><td>이름 : <input type="text" name="name" id="name" value="${loginUser.name}"></td></tr>
		<tr><td>닉네임 : <input type="text"name="nick" id="nick" value="${loginUser.nick}"></td></tr>
		<tr>
		  <td>관심사 : 
		    <input type="checkbox" name="prefer" value="취미">취미
		    <input type="checkbox" name="prefer" value="운동">운동
		    <input type="checkbox" name="prefer" value="생활">생활
		    <input type="checkbox" name="prefer" value="공부">공부
		  </td>
		</tr>
		<tr><td>추천인 id : <input type="text" name="rid" id="rid" value="${loginUser.rid}" readonly="readonly"></td></tr>
	</table>
		<input type="submit" value="정보수정">
	</form>
<c:if test="${not empty message}">
<br>${message}<br><br> 
</c:if>
</body>
</html>