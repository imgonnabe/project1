<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드2</title>
<link rel="stylesheet" href="./css/board2.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 보드 내용 가져오기
		var lists = [];
		$.ajax({
			url: "./boardList2",
			type: "get",
			data: {"pageNo":1},
			dataType: "json",
			success: function(data){
				alert("정상입니다"+data);
			},
			error: function(error){
				alert("에러가 발생했습니다"+error);
			}
		});
		const list = [{bno:1, btitle:'제목', m_name:'홍길동', bdate:'2023-08-02', blike:15},{bno:1, btitle:'제목', m_name:'홍길동', bdate:'2023-08-02', blike:15},{bno:1, btitle:'제목', m_name:'홍길동', bdate:'2023-08-02', blike:15},{bno:1, btitle:'제목', m_name:'홍길동', bdate:'2023-08-02', blike:15},{bno:1, btitle:'제목', m_name:'홍길동', bdate:'2023-08-02', blike:15},{bno:1, btitle:'제목', m_name:'홍길동', bdate:'2023-08-02', blike:15},{bno:1, btitle:'제목', m_name:'홍길동', bdate:'2023-08-02', blike:15},{bno:1, btitle:'제목', m_name:'홍길동', bdate:'2023-08-02', blike:15},{bno:1, btitle:'제목', m_name:'홍길동', bdate:'2023-08-02', blike:15},{bno:1, btitle:'제목', m_name:'홍길동', bdate:'2023-08-02', blike:15}];
		for (let i = 0; i < list.length; i++) {
			$(".table2").append("<tr><td>"+list[i].bno+"</td><td>"+list[i].btitle+"</td><td>"+list[i].m_name+"</td><td>"+list[i].bdate+"</td><td>"+list[i].blike+"</td></tr>");
		}
	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1>보드2</h1>
	<img alt="" src="./img/home.png" height="100px">
	<c:if test="${sessionScope.mname ne null }">
		<button onclick="location.href='./write'" class="btn">글쓰기</button>
	</c:if>
	<br>
	<br>
	<div class="table">
		<table class="table2">
			<tr>
				<th class="th1">번호</th>
				<th>제목</th>
				<th class="th2">글쓴이</th>
				<th class="th2">날짜</th>
				<th class="th1">조회수</th>
			</tr>
		</table>
	</div>
</body>
</html>