<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge Detail List</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

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
        <th rowspan="4" style="background: Gainsboro ;"></th>
        <th colspan="5" style="text-align: center; background: pink;">런데이 같이 합시다!!</th>
        <th rowspan="4" style="background: Gainsboro ;"></th>
      </tr>
      <tr>
        <th scope="col" colspan="5" style="text-align: center; background: yellow">닉네임 :_______ 작성일 :__________ 조회수 :___</th>
      </tr>
      <tr>
        <td colspan="3" style="text-align: center; background: skyblue">
          <img src="resources/image/track.jpg" width="200"></td>
        <td colspan="2" rowspan="2" style="text-align: center; background: HoneyDew;">출석 Div</td>
      </tr>
      <tr>
		<td style="text-align: center; background: AliceBlue;">
		  <p class="text-break">챌린지 모집 내용~~~~</p></td>        
      </tr>
    </table>
  </div>
</div>

<hr width="70%">
<!-- 댓글 table -->
<div class="row">
  <div>
    <table class="table" style="width: 70%;">
      <tr>
        <td rowspan="2" style="background: Gainsboro;"></td>
        <td width="30%" style="background: Linen ;">닉네임~~</td>
        <td width="40%" style="background: AntiqueWhite ;">작성 날짜</td>
        <td style="text-align: right;"><input type="button" value="신고"> </td>
      </tr>
      <tr>
        <td>댓글 내용~~</td>
      </tr>
    </table>
  </div>
</div>


</body>
</html>