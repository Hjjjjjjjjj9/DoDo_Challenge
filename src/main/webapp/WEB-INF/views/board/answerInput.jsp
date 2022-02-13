<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 답변하기</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	
	<script>
	$(document).ready(function(){
		$("#submit").click(function(){
			if($("#title").val()==""){alert("제목을 입력하세요."); $("#title").focus(); return false;}
			if($("#content").val()==""){alert("내용을 입력하세요."); $("#content").focus(); return false;}
		});
	});
	</script>
</head>

<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<br>
<div class="row" > 
  <div class="col-2" ></div>
  <div class="col-8">
    <h3>1:1문의 답변하기</h3>
    <form action="ansinsert" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <table class="table"  style="border:2; width: 60em; margin-left:auto; margin-right: auto;">
     <tr>
        <th style="border-color:GhostWhite; text-align: center; background: GhostWhite;" > 제목 : <input type="text" name="title" id="title" placeholder="제목을 입력해주세요" size="40"></th>
      </tr>
      <tr>
        <th scope="col" colspan="5" style="border-bottom-color:Gainsboro; text-align: center;  background: GhostWhite">문의 작성자 : 
        <input type="text" name="id" value="${askVO.id}" size="40" readonly="readonly"></th>
      </tr>
      <tr>
         <td style="text-align: center;"><textarea cols="50" rows="10" name="content" id="content" placeholder="내용을 입력해주세요" ></textarea></td>       
      </tr>
      <!-- 답글등록시 필요한 부모글의 root, step, indent 전달 위함 -->
	<tr height="40" hidden="hidden"><td></td>
		<td><input type="text" name="root" value="${askVO.root}" hidden="hidden">
			<input type="text" name="step" value="${askVO.step}" hidden="hidden">
			<input type="text" name="indent" value="${askVO.indent}" hidden="hidden">
		</td>
	</tr>
      <tr>
        <td colspan="2" style="text-align: center;">
          <a><input type="submit" id="submit" value="확인"></a>&nbsp;&nbsp;
		  <a><input onclick="javascript:history.go(-1)" type="reset" value="취소"></a>&nbsp;&nbsp;
		</td>
	  </tr>
    </table>
    </form>
  </div>
  <div class="col-2" ></div>
</div> 

<div class="row container-fluid" style="height: 10rem; position: fixed; bottom: 0;">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
</div>

</body>
</html>