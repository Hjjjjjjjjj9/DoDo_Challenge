<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<%
    String contentPage=request.getParameter("contentPage");
    if(contentPage==null)
        contentPage="http://localhost:8080/sdsd/clist";
%>

<html>
<head>
<meta charset="UTF-8">
<title>DoDo</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script>

const result = "${logoutMsg}"
if(result === "logoutSucess") { 
    alert('로그아웃되었습니다.');
    }
</script>
</head>
<%@ include file="header.jsp" %>

<div class="row"> 
  <div class="col-2" ></div>
  <div class="col-8" style="background-color: gray; height: 45em;">
<!-- 챌린지 --> 

<%-- <jsp:include page="<%=contentPage%>"/> --%>
<iframe style="height:100%; width:100%;" name="frameTest" src="<%=contentPage%>" scrolling="auto" frameborder="0"></iframe>
<%-- <%@ include file="challenge/cList.jsp" %> --%>
<%-- <%@ include file="challenge/cDetail.jsp" %> --%>
<%-- <%@ include file="challenge/cInput.jsp" %> --%>

<!-- 마이페이지 -->
<%-- <%@ include file="myPage/myPage.jsp" %> --%>

<!-- 로그인 및 회원가입 -->
<%-- <%@ include file="member/loginForm.jsp" %> --%>
<%-- <%@ include file="member/joinForm.jsp" %> --%>

<!-- 공지사항 -->
<%-- <%@ include file="board/noticeList.jsp" %> --%>
<%-- <%@ include file="board/noticeDetail.jsp" %> --%>
<%-- <%@ include file="board/nInput.jsp" %> --%>

<!-- 문의 -->
<%-- <%@ include file="board/askList.jsp" %> --%>
<%-- <%@ include file="board/askDetail.jsp" %> --%>
<%-- <%@ include file="board/askInput.jsp" %> --%>
<!-- <a id="rank" href="ranklist">랭킹</a> -->

  </div>
  <div class="col-2"></div>
</div>
<div class="row container-fluid" style="height: 10rem; position: absolute; background: snow; ">
  <%@ include file="footer.jsp" %>
</div>


</body>
</html>
