
$(function(){
	
	/* 메뉴 버튼 클릭 function */
	$('.nav-link').click(function () { 
		$(".nav-item > .active"); 
		$('.nav-link').removeClass('active'); 
		$(this).addClass('active'); 
		$(".nav-item > .active").css("color", "DimGray"); 
	});

	/* 공지사항 */
	$('#notice').click(function() {
		$.ajax({
			type:"Get",
			url:"nlist",
			success:function(resultPage) {
				$('#mainArea').html(resultPage);	
			},
			error:function() {
				alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
			}
		}); //ajax
	}); //notice_click
	
	/* 챌린지 리스트 */
	$('#recom').click(function() {
		$.ajax({
			type:"Get",
			url:"clist",
			success:function(resultPage) {
				$('#mainArea').html(resultPage);	
			},
			error:function() {
				alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
			}
		}); //ajax
	}); //recruit_click
	
	/* 로그인 폼 */
	$('#login').click(function() {
		$.ajax({
			type:"Get",
			url:"loginf",
			success:function(resultPage) {
				$('#mainArea').html(resultPage);	
			},
			error:function() {
				alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
			}
		}); //ajax
	});
	
	/* 회원가입 폼 */
	$('#join').click(function() {
		$.ajax({
			type:"Get",
			url:"joinf",
			success:function(resultPage) {
				$('#mainArea').html(resultPage);	
			},
			error:function() {
				alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
			}
		}); //ajax
	});
	
}); //ready