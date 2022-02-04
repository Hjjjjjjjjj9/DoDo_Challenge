<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoDo</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    }) 
</script>

</head>

<%@ include file="header.jsp" %>

<div class="row"> 
  <div class="col-2"></div>
  <div class="col-8">
<!-- 챌린지 -->  
<%@ include file="challenge/cList.jsp" %>
<%-- <%@ include file="challenge/cDetail.jsp" %> --%>
<%-- <%@ include file="challenge/cInput.jsp" %> --%>

<!-- 마이페이지 -->
<%--<%@ include file="myPage/myPage.jsp" %> --%>

<!-- 공지사항 -->
<%-- <%@ include file="board/notice.jsp" %> --%>
<%-- <%@ include file="board/nDetail.jsp" %> --%>
<%-- <%@ include file="board/nInput.jsp" %> --%>

<!-- 문의 -->
<%-- <%@ include file="board/ask.jsp" %> --%>
<%-- <%@ include file="board/askDetail.jsp" %> --%>
<%-- <%@ include file="board/askInput.jsp" %> --%>


  </div>
  <div class="col-2"></div>
</div>

<div class="row container-fluid" style="height: 10rem; position: absolute;">
  <%@ include file="footer.jsp" %>
</div>


</body>
</html>
