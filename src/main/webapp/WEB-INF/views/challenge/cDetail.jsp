<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge Detail List</title>
<link rel="icon" href="resources/image/skyblue.ico" type="image/x-icon" sizes="16x16">
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/myLib/mainPage.js"></script>
	
	<script>
	$(window).scroll(function(){
	       var position = $(document).scrollTop();
	       $(".floating").css('middle',  position );     
	});
	</script>
<style>
.dd {
    color: #6423ff;
    background: rgba(100, 35, 255, 0.04);
    border-color: rgba(100, 35, 255, 0.4);
    float: left; 
    font-size: 5px; 
    margin: 2em;
      
  }
.floating{
position:absolute;
right:50;
top:100;
}  

  </style> 
</head>	
<body>

<%@ include file="../header.jsp" %>
<div class="row" > 
<div class="col-2" ></div>
<div id="mainArea" class="col-8" >
<br>
<div>
  <p>챌린지 상세보기</p>
</div>
<hr>

<!-- 상세보기 table -->
<div class="row">
  <div style="background-color: WhiteSmoke;">
    <table class="table">
      <tr>
        <th rowspan="4"></th>
        <th colspan="5" style="text-align: center; ">${apple.title}</th>
        <th rowspan="4"></th>
      </tr>
      <tr>
        <th scope="col" colspan="5" style="text-align: center;">
        	작성자 : ${apple.id} &nbsp; 
        	시작날짜 : ${apple.sdate}
      </tr>
      <tr>
        <td colspan="3" style="text-align: left;" width="65%;">
        <br>
		  <p class="text-break"><img src="${apple.thumbnail}" width="400" height="250" style="margin-bottom:10px; margin-left: 5em;"><br>${apple.content}</p></td>  
        <td colspan="2" style="text-align: center; ">
          <div  class="floating" style="margin-left:3em; width: 10em; height: 15em; border-radius:5px; border-radius: 5px; border: solid blcak; background-color:white; border:thin;">
          <button class="dd">
          <c:if test="${apple.category == 'A'}">공부</c:if> 
          <c:if test="${apple.category == 'B'}">운동</c:if>
          <c:if test="${apple.category == 'C'}">생활</c:if>
          <c:if test="${apple.category == 'D'}">취미</c:if>
          </button>
          <br>
          <br>
          <!-- D-day -->
          <jsp:useBean id="toDay" class="java.util.Date"/>
          <fmt:parseDate value="${apple.sdate}" var="sDate" pattern="yyyy-MM-dd"/>
          <a hidden><fmt:formatDate value="${sDate}" pattern="yyyyMMdd"/></a>
          <fmt:parseNumber value="${toDay.time / (1000*60*60*24)}" integerOnly="true" var="nowDays" scope="request"></fmt:parseNumber>
          <fmt:parseNumber value="${sDate.time / (1000*60*60*24)}" integerOnly="true" var="sDates" scope="request"></fmt:parseNumber>
          <br>
          <span style="font-size: xx-large;"><c:if test="${(sDates - nowDays) != 0}"> D- ${sDates - nowDays}</c:if><c:if test="${(sDates - nowDays) == 0}">진행중</c:if></span>
          <br>
          <br>
           <c:if test="${apple.state == 'recruit'}">
          <a href="participate?seq=${apple.seq}&term=${apple.term}" 
          		class="btn btn-secondary btn-sm">참여하기</a><br><br>
          </c:if>
          <c:if test="${apple.state == 'doing'}">
          <a href="attend?seq=${apple.seq}" 
          		class="btn btn-secondary btn-sm">출석하기</a>
          </c:if>
          <c:if test="${apple.id == nickName && apple.state == 'done'}">
          	  <a href="donePoint?loginID=${loginID}&seq=${apple.seq}" 
          		class="btn btn-secondary btn-sm">챌린지 완료 / 포인트 받기</a>
          </c:if>
          </div>
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
	  	<c:if test="${apple.state =='done'}">
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
<a class="btn btn-primary" style="font-size: 13px;" href="clist">목록보기</a>&nbsp;
<a class="btn btn-primary" style="font-size: 13px;" href="home">Home</a>


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
          <input class="btn btn-light" style="font-size: 13px;"  type="submit" value="입력"> </td> 
      </tr>
    </table>
    </form>
  </div>
  
  <div>
    <c:forEach var="list" items="${cherry}">
    <form action="rreport" method="get">
      <table class="table" style="width: 75%;  border="1">
        <tr>
          <td width="5%"  rowspan="2"></td>
          <td width="15%" rowspan="2">${list.id}</td>
          <td width="40%" colspan="2">${list.content}</td>
          <td width="30%"><fmt:formatDate value="${list.regdate}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
          <c:if test="${nickName != list.id}">
          <td style="text-align: right ;">
            <input type="image" src="resources/image/deicon.png" title="신고하기" onclick="return inputDetail(${list.seq},${list.step})" width="20em" height="20em"></td></c:if>
             
        </tr>
      </table>
    </form>
    </c:forEach>
  </div>
  
</div>

</div>

<div class="col-2"></div>
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