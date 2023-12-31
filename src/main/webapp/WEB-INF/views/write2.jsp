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

<<<<<<< HEAD
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
			
			var contents = []; // textarea 내용을 저장할 배열
			var contentsValid = true; // 모든 내용이 유효한지 여부
			
			$('.content').each(function(index) {
				/*  var contentKey = 'content' + index; // 각 content에 대한 고유한 키 생성 */
				var contentValue = $(this).val();
				if(!contentValue){
					 contentsValid = false;
			         return false; // 반복 중단
				}
				contents.push({
					contentKey : contentValue
				});
			});
			
			$(".file")
			
			if (!contentsValid) {
				alert("내용을 입력하세요.");
		        return false; // AJAX 요청 막음
		    }
			
			var jsonData = JSON.stringify(contents); // JSON으로 변환
			// alert(contents);
			// alert(jsonData);

>>>>>>> refs/remotes/origin/master
			$.ajax({
				url : './write2',
				type : 'post',
				data: formData,
		        contentType: false,
		        processData: false,
				/* dataType : 'json',// 받아올 데이터의 자료형 */
				success : function(data) {
					if (data.result == 1) {
						location.href = 'board';
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
<<<<<<< HEAD
			<form class="uploadForm">
				<textarea cols="50" rows="8" maxlength="500" name="content"
					class="content" required="required" placeholder="스레드를 시작하세요..."></textarea>
				<br>
				<input type="file" name="file" class="file" multiple>
			</form>
=======
			<textarea cols="50" rows="8" maxlength="500" name="content"
				class="content" required="required" placeholder="스레드를 시작하세요..."></textarea>
			<br>
			<!-- 파일 업로드에서는 enctype(인코딩타입)을 multipart/form-data로 반드시 설정 -->
			<img alt="" src="./img/clip.png"> <input type="file" name="file" class="file">
>>>>>>> refs/remotes/origin/master
		</div>
	</div>
	<button type="button" class="okbtn">새로운 스레드</button>
	<button type="button" class="writebtn">게시</button>
</body>
</html>