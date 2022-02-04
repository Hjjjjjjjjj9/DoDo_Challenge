<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 Input</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<br>
<div>
  <p>1:1문의 작성하기</p>
</div>
<hr>

<div class="row-col-3">
  <div>
    <table class="table">
      <tr>
        <th rowspan="6" width="80"></th>
        <th>제 목</th>
        <td><input type="text" placeholder="제목을 입력해주세요" size="80"></td>
      </tr>
      <tr>
        <th>내 용</th>
        <td><textarea rows="20" cols="81" placeholder="내용을 입력해주세요" ></textarea></td>
      </tr>
      <tr>
        <th>사진첨부</th>
        <td><input type="file" name="uploadfilef" id="uploadfilef">
			<script>
			$('#uploadfilef').change(function(){
				if(this.files && this.files[0]) {
					var reader = new FileReader;
				 	reader.onload = function(e) {
			 			$(".select_img").attr("src", e.target.result)
			 			.width(100).height(100); 
			 		} // onload_function
			 		reader.readAsDataURL(this.files[0]);
			 	} // if
			}); // change			
			</script>
		</td>
      </tr>
      <tr>
        <td colspan="2" style="text-align: center;">
          <input type="submit" value="확인">&nbsp;&nbsp;
		  <input type="reset" value="취소">&nbsp;&nbsp;
		</td>
	  </tr>
    </table>
  </div>
</div>


</body>
</html>