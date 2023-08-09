<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습용</title>
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
  var FirstText = false; // 첫 번째 textarea가 수정되었는지 여부
 
  // 첫 번째 textarea에서 keyup 또는 change
  $('.content:first').on('keyup change', function() {
    if (!FirstText) {
      var newText = $('<textarea class="content"></textarea>');
      $('#container').append(newText);
     FirstText = true;
    }
  });
 
  // 다음 textarea들에서 keyup 또는 change
  $(document).on('keyup change', '.content', function() {
    var currentText = $(this);
    var nextText = currentTextarea.next('.content');
 
    if (currentTextarea.is('.content:last') && currentText.val().trim() !== '' && !nextText.length) {
      var newNextText = $('<textarea class="content" name="content"></textarea>');
      $('#container').append(newNextText);
   }
  });
  
	//글쓰기 버튼 클릭
	  $('form').submit(function(event) {
	      event.preventDefault(); // 기본 제출 동작 방지
	
	      var contents = []; // textarea 내용을 저장할 배열
	      $('.content').each(function() {
	          contents.push($(this).val());
	      });
	
	      // AJAX 요청 설정
	      $.ajax({
	          url: './write2',
	          type: 'post',
	          data: { content: contents }, // 전송할 데이터
	          dataType : "json",
	          success: function(data) {
	              if(data.result == 1){
	            	  alert("성공");
	              } els{
	            	  alert("실패");
	              }
	          },
	          error: function(error) {
	              alert("에러");
	          }
	      });
	  });
	});
});
</script>
</head>
<body>
<form action="./write2" method="post">
	<div id="container">
  		<textarea class="content" name="content"></textarea>
	</div>
	<button class="btn btn-primary" type="submit">글쓰기</button>
</form>
</body>
</html>