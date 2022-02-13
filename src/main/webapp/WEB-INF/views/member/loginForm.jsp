<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너Do나Do : 로그인</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<style type="text/css">
    .container.custom-container {
      padding: 0 9rem;
    }
</style>
</head>
<body>
<%-- <%@ include file="/WEB-INF/views/header.jsp" %> --%>


<div class="custom-container container">
<br><br>
<h3>로그인</h3>
<br><hr><br>
    <div class="row">
            <form class="form" action="mLogin" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <div class="form-group">
                    <input type="text" class="form-control" name="id" id="id" placeholder="ID">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" id="password" placeholder="PASSWORD">
                </div>
                <button type="submit" class="btn btn-danger w-100">로그인</button>            
            </form>
        </div>
    
    <div class="row">
        <div class="col-lg-6 col-sm-12 text-lg-start text-center">
            <button type="button" class="btn text-secondary" onclick="location.href='joinf'">회원가입</button>
        </div>
        
        <div class="col-lg-6 col-sm-12 text-lg-end text-center">
            <button type="button" class="btn text-secondary" onclick="location.href='findf'">아이디/비밀번호 찾기</button>
        </div>  
    </div>
    <div class="row">
        <span id="message"></span><br>
        <c:if test="${not empty message}">
	        <br> ${message}<br><br>
	    </c:if>
	</div>
</div>
	
<div class="row container-fluid" style="height: 10rem; position: absolute;">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
  </div>
</body>
</html>