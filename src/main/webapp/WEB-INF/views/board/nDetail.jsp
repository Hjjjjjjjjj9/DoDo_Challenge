<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항_상세보기</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<br>
<div>
  <p>공지사항_상세보기</p>
</div>
<hr>

<!-- 상세보기 table -->
<div class="row">
  <div>
    <table class="table">
      <tr>
        <th rowspan="4" style="background: Gainsboro ;"></th>
        <th colspan="5" style="text-align: center; background: pink;">개인정보 동의 안내</th>
        <th rowspan="4" style="background: Gainsboro ;"></th>
      </tr>
      <tr>
        <th scope="col" colspan="5" style="text-align: center; background: yellow">관리자 작성일 :__________ 조회수 :___</th>
      </tr>
      <tr>
		<td style="text-align: center; background: AliceBlue;">
		  <p class="text-break">~~~~ 공지사항 내용 ~~~~</p></td>        
      </tr>
      <tr style="text-align: center;">
        <td><input type="button" value="목록보기"></td>
      </tr>
    </table>
  </div>
</div>



</body>
</html>