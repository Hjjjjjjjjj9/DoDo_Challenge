
function search_check(num) {
	if (num == '1') {
		$('#resultArea2').css('display','none');
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";
		
	} else {
		$('#resultArea1').css('display','none');
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}

/* id 찾기 */
function idSearch_click(){
	$.ajax({
		type:"GET",
		url:"findID",
		data:{
			name : $('#inputName').val(),
			mail : $('#inputMail_1').val()
		},
		success:function(data){
			if(data != null){
				console.log("id찾기 성공");
				$('#resultArea1').css('display','');
				var name = $('#inputName').val();
				$('#name_value').html(name+"님의 아이디");	
			} else
				$('#message').html("※ 해당 정보와 일치하는 회원 정보 없음 ※");	
		},
		error:function() {
			alert("~~ 서버오류 !!! 잠시후 다시 하세요 ~~");
		}
	});
}

function pwSearch_click() {
	$.ajax({
		type:"GET",
		url:"findPW",
		data:{
			id : $('#inputId').val(),
			mail : $('#inputMail_2').val()
		},
		success:function(data){
			if(data != null){
				console.log("pw찾기 성공");
				$('#resultArea2').css('display','');
				var id = $('#inputId').val();
				$('#id_value').html(id+"님의 비밀번호");	
			} else
				$('#message').html("※ 해당 정보와 일치하는 회원 정보 없음 ※");	
		},
		error:function() {
			alert("~~ 서버오류 !!! 잠시후 다시 하세요 ~~");
		}
	});
}


$(function () {
	$('#tmpPasswordCheck').click(function() {
		var name = $('#inputName').val();
		var id = $('#inputId').val();
		var mail = $('#inputMail_2').val();
		$.ajax({
			type:"POST",
			data:{
				name : name,
				id : id,
				mail : mail
			},
			success:function() {
				alert("메일 전송!!"+id+", "+mail);
			},
			error:function() {
				alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
			}
		}); //ajax
	}); //recruit_click
	
	
}); //ready



/*
$(function() {
	$('#pwSearch_btn').click(function() {
		$.ajax({
			type:'Get',
			url:'findID',
			data:{
				mail : $('#inputMail_1').val()
			},
			success:function(data){
			if(data != null){
				document.getElementById("searchI").style.display = "none";
				document.getElementById("searchP").style.display = "";
				$('#inputMail_2').html(mail);
			} else
				$('#name_value').html("※ 해당 정보와 일치하는 회원 정보 없음 ※");	
		},
		error:function() {
			alert("~~ 서버오류 !!! 잠시후 다시 하세요 ~~");
		}
			
		});
	});
	
}); //read
y*/



