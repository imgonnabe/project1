<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/write2.css">
<title>연습용</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 버튼 클릭하면 새로운 스레드 생성
		$(".okbtn").click(function() {
				var newText = $('<textarea cols="50" rows="8" maxlength="500" name="content" class="content" required="required" placeholder="스레드를 시작하세요..."></textarea><br>');
				newText += $('<input type="file" name="file" class="file" multiple>');
				$('.uploadForm').append(newText);
		});

		// 글썼을 때 내용이 없으면
		$(document).on('click', '.writebtn', function() {
			var contents = document.getElementsByClassName('content');
			for (var i = 0; i < contents.length; i++) {
				if (contents[i].value.length < 1) {
					alert("내용을 적어주세요.");
					contents[i].focus();
					return false;
				}
			}
		});

		//글쓰기 버튼 클릭
		$('.writebtn').click(function(event) {
			event.preventDefault(); // 기본 제출 동작 방지

			var formData = new FormData();
			var contents = document.getElementsByClassName('content');
			for (var i = 0; i < contents.length; i++) {
				   var name = "form_" + i;
				   formData.append(name , $(".content")[i].value);
				   if($(".file")[i].files.length > 0){
					   formData.append("file", $(".file")[i].files[0]);
				   }
				   
				   for (let key of formData.keys()) {
					   console.log(key + ":", formData.get(key));
					}
			}
			
			$.ajax({
				url : './write2',
				type : 'post',
				data: formData,
		        contentType: false,
		        processData: false,
				/* dataType : 'json',// 받아올 데이터의 자료형 */
				success : function(data) {
					if (data.result == 1) {
						window.location.href = 'board';
					} else {
						alert("실패입니다. 다시 시도해주세요.");
					}
				},
				error : function(error) {
					alert("에러입니다. 다시 시도해주세요.");
				}
			});
		});
	});
</script>
</head>
<body>
	<h1>새로운 스레드</h1>
	<hr>
	<div id="thread">
		<img alt="" src="./img/profile.png">
		<div id="m_id">${sessionScope.mid}</div>
		<div class="container">
			<form class="uploadForm">
				<textarea cols="50" rows="8" maxlength="500" name="content"
					class="content" required="required" placeholder="스레드를 시작하세요..."></textarea>
				<br>
				<input type="file" name="file" class="file" multiple>
			</form>
		</div>
	</div>
	<button type="button" class="okbtn">새로운 스레드</button>
	<button type="button" class="writebtn">게시</button>
</body>
</html>