<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <style>
    *{margin:0; padding:0;}
    ul,li{list-style:none;}
    .slide{height:300px; overflow:hidden;}
    .slide ul{height:calc(100% * 5);animation:slide 12s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .slide li{height:calc(100% / 5); height:300px; font-family: beanpoleotM00; letter-spacing: 2px;}
    /* .slide li{background:#fca; } */ 
    /* flex-direction:column; 세로로 나타내기*/
    /* .slide li:nth-child(2){background:#faa; times, courier, arial}
    .slide li:nth-child(3){background:#afa;}
    .slide li:nth-child(4){background:#aaf;} */
    
     @keyframes slide {
       0% {margin-top:0;}
      10% {margin-top:0;}
      22% {margin-top:-300px;}
      32% {margin-top:-300px;}
      44% {margin-top:-600px;}
      54% {margin-top:-600px;}
      65% {margin-top:-900px;}
      75% {margin-top:-900px;}
      83% {margin-top:-1200px;}
      99% {margin-top:-1200px;}
      100% {margin-top:0;}
    } 
    
   /*  @keyframes slide {
      0% {margin-left:0;}
      10% {margin-left:0;} 
      25% {margin-left:-100%;} 
      35% {margin-left:-100%;} 
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      99% {margin-left:-300%;}
      100% {margin-left:0;}
    } */
    @font-face {
    font-family: 'beanpoleotM00';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/beanpoleotM00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }
  </style>
  
</head>
<body>
<div style="width: 30em; height: 2em; margin-left: auto; margin-right: auto;">
<div style="border-top-left-radius:3px; border-bottom-left-radius:3px; font-family:beanpoleotM00; line-height:2em; width: 5em; height: 2em; border-style:groove; border-right:none; color:white; background-color:SteelBlue; border-color: LightSlateGray; float: left;" align="center">Lanking</div>
  <div class="slide" style="border-top-right-radius:3px; border-bottom-right-radius:3px; width: 25em; height: 2em;  margin-right: auto; border-style:groove; float:right; border-color: LightSlateGray;">
    <ul style="padding-left: 0px;">
    <c:forEach var="list" items="${rankbanana}" >
      <li style="text-align: center; font-size: 20px;"> <span style="color: Crimson;">${list.rank}</span>위 &nbsp;&nbsp;&nbsp; 아이디  : <span style="color: DarkCyan;">${list.id}</span> &nbsp;&nbsp;&nbsp; 포인트  : <span style="color: Purple;">${list.point}</span></li>
      </c:forEach>
    </ul>
  </div>
  </div>

<!-- ul 왼쪽 여백 제거 다른 방법 : style="-webkit-padding-start:0px;" -->

</body>
</html>
    