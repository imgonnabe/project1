<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습용</title>
<script src="./js/jquery-3.7.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 버튼 클릭하면 새로운 스레드 생성
		$(".okbtn").click(function(){
			var newText = $('<textarea cols="50" rows="8" maxlength="500" name="content" class="content" required="required" placeholder="스레드를 시작하세요..."></textarea>');
		    var newImg = $('<br><img alt="" src="./img/clip.png"><br>');
		    $('.container').append(newText);
		    $('.container').append(newImg); 
		});
		  
	  // 글썼을 때 내용이 없으면
	   $(document).on('click', '.writebtn', function() {
		var contents = document.getElementsByClassName('content');
		for (var i = 0; i < contents.length; i++) {
			if (contents[i].value.length < 1){
				alert("내용을 적어주세요.");
				contents[i].focus();
				return false;
			 }
		 }
	 });
	  
	 //글쓰기 버튼 클릭
	  $('.writebtn').click(function(event) {
	      event.preventDefault(); // 기본 제출 동작 방지
	
	      var contents = []; // textarea 내용을 저장할 배열
	      $('.content').each(function() {
	          contents.push($(this).val());
	      });
	
	      // AJAX 요청 설정
	      $.ajax({
	          url: './write2',
	          type: 'post',
	          data: { contents: contents }, // 전송할 데이터
	          contentType: 'application/json', // 데이터 타입 설정
	          dataType : "json",
	          success: function(data) {
	              if(data.result == 1){
	            	  alert("성공");
	              } else{
	            	  alert("실패");
	              }
	          },
	          error: function(error) {
	              alert("에러");
	          }
	      });
	  });
		  
	});
</script>
</head>
<body>
	<h1><img onclick="location.href='./thread'" alt="" src="./img/x.png">새로운 스레드</h1>
	<hr>
	<!--  <form action="./write2" method="post">-->
		<div id="thread">
			<img alt="" src="./img/profile.png">
			<div id="m_id">아이디</div>
			<div class="container">
				<textarea cols="50" rows="8" maxlength="500" name="content"
				class="content" required="required" placeholder="스레드를 시작하세요..."></textarea>
				<br><img alt="" src="./img/clip.png"><br>
			</div>
		</div>
		<button type="button" class="okbtn">새로운 스레드</button>
		<button type="submit" class="writebtn">게시</button>
	<!-- </form> -->
</body>
</html>