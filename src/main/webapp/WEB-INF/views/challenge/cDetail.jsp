<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge Detail List</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/myLib/mainPage.js"></script>
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
        <th scope="col" colspan="5" style="text-align: center;">
        	작성자 : ${apple.id} &nbsp; 
        	작성일 : <fmt:formatDate value="${apple.regdate}" pattern="yyyy-MM-dd" /> &nbsp; 
        	조회수 : ${apple.cnt}</th>
      </tr>
      <tr>
        <%--  
        <td colspan="3" style="text-align: center;">
          <img src="${apple.thumbnail}" width="200"></td> --%>
        <td colspan="3" style="text-align: center;">
		  <p class="text-break">${apple.content}</p></td>  
        <td colspan="2" style="text-align: center; ">
          <c:if test="${apple.state == 'recruit'}">
          <a href="participate?seq=${apple.seq}&term=${apple.term}" 
          		class="btn btn-secondary btn-sm">참여하기</a><br><br>
          </c:if>
          <c:if test="${apple.state == 'doing'}">
          <a href="attend?seq=${apple.seq}" 
          		class="btn btn-secondary btn-sm">출석하기</a>
          </c:if>
        </td>
      </tr>
      <tr>
        <c:if test="${apple.state =='doing'}">
  	    <c:forEach var="list" items="${result}"> 
		<td>
		  <span style="text-align: right;">${list.nick}(${list.result}%)</span><br>
		  <progress value="${list.result}" max="100" class="progress-bar-striped"></progress>
		</td>
	  	</c:forEach>
	  	</c:if>
	  </tr>
    </table>
  </div>
</div>
<c:if test="${not empty message}">
  <span>${message}</span><br>
</c:if>
<c:if test="${not empty rmessage}">
  <span>${rmessage}</span><br>
</c:if>
<c:if test="${not empty amessage}">
  <span>${amessage}</span><br>
</c:if>
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
    <c:forEach var="list" items="${cherry}">
    <form action="rreport" method="get">
      <table class="table" style="width: 70%; background: Gainsboro; " border="1">
        <tr>
          <td width="5%"  rowspan="2"></td>
          <td width="15%" rowspan="2">${list.id}</td>
          <td width="40%" colspan="2">${list.content}</td>
          <td width="30%"><fmt:formatDate value="${list.regdate}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
          <td style="text-align: right ;">
            <input type="button" value="신고하기" onclick="return inputDetail(${list.seq},${list.step})"> 
        </tr>
      </table>
    </form>
    </c:forEach>
  </div>
  
</div>

</div>

<div class="col-2" style="background-color: lavender;"></div>
</div>

<div class="row container-fluid" style="height: 10rem; position: absolute; background: snow; ">
  <%@ include file="../footer.jsp" %>
</div>

<script>
function inputDetail(seq, step) {
	var seq = seq;
	var step = step;
	console.log('seq : '+seq+', step : '+step);
	var test = prompt('신고 사유를 입력해주세요.');
	if(test == null) {
		alert('신고가 취소되었습니다.');
		return false;
	} else {
		alert('신고 완료되었습니다.');
		location.href = 'rreport?seq='+seq+'&step='+step+'&detail='+test;
		return true;
	}
}
</script>
</body>
</html>