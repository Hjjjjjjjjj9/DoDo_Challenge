<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

  <script src="resources/myLib/jquery-3.2.1.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 

    <script type="text/javascript">
        function changeView(value){
        	
            if(value == "0") // 고객센터 버튼 클릭시 askList으로 이동
            {
                location.href="home?contentPage=http://localhost:8080/sdsd/apagelist";
            }
            else if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
            {
                location.href="home?contentPage=member/loginForm.jsp";
            }
            else if(value == "2") // 추천 버튼 list test
            {
                location.href="home?contentPage=http://localhost:8080/sdsd/clist";
            }
            else if(value == "3") // 모집 버튼 cinsert test
            {
                location.href="home?contentPage=http://localhost:8080/sdsd/cinsertf";
            }
            else if(value == "4") // 진행 버튼 디테일 test
            {
                location.href="home?contentPage=http://localhost:8080/sdsd/cdetail";
            }
            else if(value == "5") // 완료 버튼 
            {
                location.href="home?contentPage=http://localhost:8080/sdsd/npagelist";
            }
            else if(value == "6") // 공지사항 버튼 클릭시 pageNList 이동
            {
                location.href="home?contentPage=http://localhost:8080/sdsd/npagelist";
            }
            else if(value == "7") // 로그인 안했는데 고객지원 클릭
            {
            	alert("로그인 후 이용가능 합니다.");
                location.href="http://localhost:8080/sdsd/loginf";
            }
        }
        
        function refresh() {
        	window.location = window.location.pathname;
        } 
</script>

<style> 
	a:hover { background: WhiteSmoke;}
	a {font-family: Pretendard-Regular;}
	span {font-family: Pretendard-Regular;} 
	
	@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
    }
    
/* 서서히 나타나는 글자 */    
    .fadein{
  font-size: medium;
  position: relative;
  overflow: hidden;
  animation: fadein 3s ease-in-out;


}


@keyframes fadein{
  0% {
    opacity: 0;
    transform: translateY(20px);
  }
  100% {
    opacity: 1;
    transform: none;
  }

}
</style>

</head>

<body>
<div>
<br>
<div class="row container-fluid" style="margin-left: auto; margin-right: auto;">
 <div class="col-1"></div>
  <img onClick="refresh()" style="cursor:pointer; width: 9em; height: 7em; margin-left:5em; margin-bottom:auto; margin-top: auto;" src="resources/image/dodo.png">
  <!-- <div style="background-color: red;" class="col-2"></div> -->
  <!-- <div style="background-color: green;" class="col-1"> -->
    <!-- <img style="width: 4em; height: 5em; margin-bottom:auto; margin-top: auto;" src="resources/image/dodo.png"> -->
  <!-- </div> -->
  <div class="col-4">
  <br>
    <div style="width: 30em;" class="input-group flex-nowrap text-center">
   <form name="frameForm" method="post">
    <input type="hidden" name="isIndex" value="oh ye~"/>
   </form>
   <input style="height: 3em;" type="button" onclick="javascript:sendData();" value="전송" hidden />
   <iframe style="height: 3em; width: 32em;" name="frameTest"  width="600px" height="600px" src="http://localhost:8080/sdsd/ranklist" scrolling="auto" frameborder="0"></iframe>
      <%-- <span class="input-group-text" id="addon-wrapping">1️⃣</span>
      <input type="text" class="form-control" placeholder="${serverTime}" aria-label="Username" aria-describedby="addon-wrapping"> --%>
    </div> 
  </div>
 <%--  <div class="col-1" align="right" style="background-color: green;">
  <br>
    <c:if test="${not empty loginID}">
  	<span class="badge rounded-pill text-dark" style="background-color: Lavender;">${loginName}님 반갑습니다.</span></c:if>
  	<c:if test="${empty loginID}">
  	<a href="joinf" style="color: Black; text-decoration: none; background-color: red;">회원가입</a>
  	</c:if>
  </div> --%>
  <div class="col-3 text-end">
  <br>
    <c:if test="${not empty loginID}">
  	<span class="badge rounded-pill text-dark" style="background-color: Lavender;">${loginName}님 반갑습니다.</span>&nbsp;&nbsp;</c:if>
  	<c:if test="${empty loginID}">
  	<a href="joinf" style="color: Black; text-decoration: none;">회원가입</a>&nbsp;&nbsp;
  	</c:if>
  	<c:if test="${not empty loginID}">
    <a onclick="changeView(0)" id="ask1" style="text-decoration: none; color: Black;">고객지원</a>&nbsp;
    </c:if>
  	<c:if test="${empty loginID}">
    <a id="ask2" onclick="changeView(7)" style="text-decoration: none; color: Black;">고객지원</a>&nbsp;
    </c:if>
    <span>|</span>&nbsp;
    <c:if test="${empty loginID}">
    <a href="loginf" onclick="changeView(1)" style="text-decoration: none; color: Black;">로그인</a>
    </c:if>
    <c:if test="${not empty loginID}">
    <a href="logout" style="text-decoration: none; color: Black;">로그아웃</a>
    </c:if>
  </div>
  <div class="col-1"></div>
</div>

<div class="image_box" style="width: 100%; height: 18em; text-align:center; background-color:Khaki;">
     <br>
     <span class="fadein" style="font-size: 25px; color: Black; line-height: 3em;">만들고 싶은 습관, 작심삼일로 끝나는 계획들... <br><span style="font-size: 30px; color: MidnightBlue ;"><span style="color:  Purple;">'너DO 나DO'</span>에서 다른 사람들과 같이 챌린지로 시작해보세요!!</span><br> 더욱 많은 챌린지를 성공하고 상위 랭크에 도전하세요</span>
     <!-- <div style="width: 100%; height:20em; text-align:center; background-color:#27304f;"></div> -->
     <!-- <img style="width:100%; height:8em;" src="resources/image/study.jpg"> -->
</div>

<!-- 메뉴 바 -->
<br style="background: snow;">
<div class="row">
  <ul class="nav nav-tabs">
    <li class="nav-item col-2">
      <a class="nav-link disabled" style="text-align: center;"> </a>
    </li>
    <li class="nav-item col-1">
      <a class="nav-link active" onclick="changeView(2)" aria-current="page" id="recom" style="text-align: center; color: Black;">추 천</a>
    </li>
    <li class="nav-item col-1">
      <a class="nav-link" onclick="changeView(3)" id="recruit" style="text-align: center; color: Black;">모 집</a>
    </li>
    <li class="nav-item col-1">
      <a class="nav-link" onclick="changeView(4)" id="doing" style="text-align: center; color: Black;">진 행</a>
    </li>
    <li class="nav-item col-1">
      <a class="nav-link" onclick="changeView(5)" id="done" style="text-align: center; color: Black;">완 료</a>
    </li>
    <li class="nav-item col-3">
      <a class="nav-link disabled" style="text-align: center; color: Black;"> </a>
    </li>
    <li class="nav-item col-1">
      <a class="nav-link" onclick="changeView(6)" id="notice" style="text-align: center; color: Black;">공지사항</a>
    </li> <!-- href="npagelist" -->
    <li class="nav-item col-2">
      <a class="nav-link disabled" style="text-align: center;"> </a>
    </li>
  </ul>
</div>
</div>
</body>
</html>