<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge Update</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/nullCheck.js"></script>
</head>
<body>


<%@ include file="../header.jsp" %>
<div class="row" > 
  <div class="col-2" style="background-color: lavender;"></div>
  <div id="mainArea" class="col-8" >
<br>
<div>
  <p>수정하기</p>
</div>
<hr>

<div class="row-col-3">
  <div>
  <form action="cupdate" method="post" enctype="multipart/form-data">
  <table class="table">
    <tr>
      <th rowspan="7" width="80"></th>
      <th>제 목</th>
        <td><input name="title" id="title" type="text" value="${apple.title}" size="80"></td>
    </tr>
    <tr>
      <th>작성자</th>
        <td><input name="id" type="text" size="20" readonly="readonly" value="${apple.id}"></td>
    </tr>
    <tr height="40"><td bgcolor="Thistle">카테고리</td>
      <c:if test="${apple.category=='-'}">
        <td><select name="category" id="category">
			  <option value="-" selected>----</option>
			  <option value="A">공부</option>
			  <option value="B">운동</option>
			  <option value="C">생활</option>
			  <option value="D">취미</option>
		    </select>
	    </td>
      </c:if>
    
      <c:if test="${apple.category=='A'}">
        <td><select name="category" id="category">
			  <option value="-">----</option>
			  <option value="A" selected>공부</option>
			  <option value="B">운동</option>
			  <option value="C">생활</option>
			  <option value="D">취미</option>
		    </select>
	    </td>
      </c:if>
	  <c:if test="${apple.category=='B'}">
        <td><select name="category" id="category">
			  <option value="-">----</option>
			  <option value="A">공부</option>
			  <option value="B" selected>운동</option>
			  <option value="C">생활</option>
			  <option value="D">취미</option>
		    </select>
	    </td>
      </c:if>
      <c:if test="${apple.category=='C'}">
        <td><select name="category" id="category">
			  <option value="-">----</option>
			  <option value="A">공부</option>
			  <option value="B">운동</option>
			  <option value="C" selected>생활</option>
			  <option value="D">취미</option>
		    </select>
	    </td>
      </c:if>
      <c:if test="${apple.category=='D'}">
        <td><select name="category" id="category">
			  <option value="-">----</option>
			  <option value="A">공부</option>
			  <option value="B">운동</option>
			  <option value="C">생활</option>
			  <option value="D" selected>취미</option>
		    </select>
	    </td>
      </c:if>
	</tr>
    <tr>
      <th>시작날짜</th>
        <td><input name="sdate" id="sdate" type="date" value="${apple.sdate}"></td>
    </tr>
    <tr>
      <th>기 간</th>
        <c:if test="${apple.term==10}">
          <td><input id="term_10" class="termCheck" name="term" type="radio" value="10" checked>
        	    <label for="term_10">10일</label> &nbsp;&nbsp;
        	  <input id="term_15" name="term" type="radio" value="15">
        		<label for="term_15">15일</label> &nbsp;&nbsp;
        	  <input id="term_30" name="term" type="radio" value="30">
        		<label for="term_30">30일</label> &nbsp;&nbsp;
        	  <input id="term_60" name="term" type="radio" value="60">
        		<label for="term_60">60일</label> &nbsp;&nbsp;
          </td>
        </c:if>
        <c:if test="${apple.term==15}">
          <td><input id="term_10" class="termCheck" name="term" type="radio" value="10">
        	    <label for="term_10">10일</label> &nbsp;&nbsp;
        	  <input id="term_15" name="term" type="radio" value="15" checked>
        		<label for="term_15">15일</label> &nbsp;&nbsp;
        	  <input id="term_30" name="term" type="radio" value="30">
        		<label for="term_30">30일</label> &nbsp;&nbsp;
        	  <input id="term_60" name="term" type="radio" value="60">
        		<label for="term_60">60일</label> &nbsp;&nbsp;
          </td>
        </c:if>
        <c:if test="${apple.term==30}">
          <td><input id="term_10" class="termCheck" name="term" type="radio" value="10">
        	    <label for="term_10">10일</label> &nbsp;&nbsp;
        	  <input id="term_15" name="term" type="radio" value="15">
        		<label for="term_15">15일</label> &nbsp;&nbsp;
        	  <input id="term_30" name="term" type="radio" value="30" checked>
        		<label for="term_30">30일</label> &nbsp;&nbsp;
        	  <input id="term_60" name="term" type="radio" value="60">
        		<label for="term_60">60일</label> &nbsp;&nbsp;
          </td>
        </c:if>
        <c:if test="${apple.term==60}">
          <td><input id="term_10" class="termCheck" name="term" type="radio" value="10">
        	    <label for="term_10">10일</label> &nbsp;&nbsp;
        	  <input id="term_15" name="term" type="radio" value="15">
        		<label for="term_15">15일</label> &nbsp;&nbsp;
        	  <input id="term_30" name="term" type="radio" value="30">
        		<label for="term_30">30일</label> &nbsp;&nbsp;
        	  <input id="term_60" name="term" type="radio" value="60" checked>
        		<label for="term_60">60일</label> &nbsp;&nbsp;
          </td>
        </c:if>
    </tr>
    <tr>
      <th>내 용</th>
        <td><textarea name="content" rows="20" cols="81">${apple.content}</textarea></td>
    </tr>
    <tr>
      <th>썸네일 이미지</th>
        <td><input type="file" name="thumbnailf" id="uploadfilef" value="${apple.thumbnail}">
        	<img src="${apple.thumbnail}" class="select_img" width="200" height="100"><br>
			<script>
			$('#uploadfilef').change(function(){
				if(this.files && this.files[0]) {
					var reader = new FileReader;
				 	reader.onload = function(e) {
			 			$(".select_img").attr("src", e.target.result)
			 			.width(100).height(100); 
			 		} // onload_function
			 		reader.readAsDataURL(this.files[0]);
			 	}
			});
			</script>
		</td>
    </tr>
      
    <tr>
      <td colspan="4" style="text-align: center;">
        <input type="submit" value="확인">&nbsp;&nbsp;
	    <input type="reset" value="취소">&nbsp;&nbsp;
	  </td>
	</tr>
    </table>
    </form>
<hr>
<a href="home" >[Home]</a>
  </div>
</div>
</div>

<div class="col-2" style="background-color: lavender;"></div>
</div>

<c:if test="${not empty message}">
  <span>${message}</span>
</c:if>

<div class="row container-fluid" style="height: 10rem; position: absolute; background: snow; ">
  <%@ include file="../footer.jsp" %>
</div>

</body>
</html>