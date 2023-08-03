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
	$(function() {
		let totalCount = 0;
		let pageNo = 1;
		// ajax 호출
		ajax_call(1);
		function ajax_call(pageNo) {
			// alert(pageNo);
			$.ajax({
				url : "./boardList2",
				type : "get",
				data : {
					"pageNo" : pageNo
				},
				dataType : "json",
				success : function(data) {
					totalCount = data.totalCount;
					pageNo = data.pageNo;
					let startPage = pageNo;
					let endPage = pageNo + 9;
					
					let list = data.list;
					$(".table2").empty();
					$(".paging").empty();
					let html = "";
					$.each(list, function(index) {
						html += "<tr>";
						html +=	"<td>" + list[index].bno + "</td>";
						html +=	"<td>" + list[index].btitle + "</td>";
						html +=	"<td>" + list[index].m_name + "</td>";
						html +=	"<td>" + list[index].bdate + "</td>";
						html +=	"<td>" + list[index].blike + "</td>";
						html += "</tr>";
					});
					$(".table2").append(html);
					
					// 페이징하기
					let pages = totalCount / 10;// let 안쓰면 오류
					if (totalCount % 10 != 0){
						pages += 1;
					}
					startPage = pageNo;
					endPage = startPage + 10 < pages ? startPage + 9 : pages;
					
					// 페이지 버튼
					// ◀◀
					if (pageNo - 10 > 0) {
						$(".paging").append("<button class='begin'>◀◀</button>");
					} else {
						$(".paging").append("<button disable='disabled'>◀◀</button>");
					}
					// ◀
					if (pageNo - 1 > 0) {
						$(".paging").append("<button class='backward'>◀</button>");
					} else{
						$(".paging").append("<button disabled='disabled'>◀</button>");
					}
					// 1 2 3 4 5 6 7 8 9 10
					for (let i = startPage; i <= endPage; i++) {
						$(".paging").append(
								"<button type='button' class='page'>" + i
										+ "</button>");// 동적으로 생성
					}
					// ▶
					if(pageNo + 1 < pages){
						$(".paging").append("<button class='forward'>▶</button>");
					} else {
						$(".paging").append("<button disabled='disabled'>▶</button>");
					}
					// ▶▶
					if (pageNo + 10 < pages) {
						$(".paging").append("<button class='end'>▶▶</button>");
					} else {
						$(".paging").append("<button disabled='disabled'>▶▶</button>");
					}
				},
				error : function(error) {
					alert("에러가 발생했습니다" + error);
				}
			});// ajax 끝
		}// ajax_call 끝

		$(document).on("click", ".page", function() {// 동적으로 생성된 버튼 클릭
			let pageNo = $(this).text();
			// alert(pageNo);
			ajax_call(pageNo);
		});
		// $(".page").onclick(function(){// 정적으로 생성된 버튼 클릭
		// 	
		// });
		$(document).on("click", ".begin", function() {// ▶▶
			pageNo = pageNo - 10;
			ajax_call(pageNo);
		});
		$(document).on("click", ".backward", function() {// ▶
			
			ajax_call(pageNo -= 1);
		});
		$(document).on("click", ".forward", function() {// ▶
			ajax_call(pageNo += 1);
		});
		$(document).on("click", ".end", function() {// ▶▶
			pageNo = pageNo + 10;
			ajax_call(pageNo);
		});
		
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
		<table>
			<thead>
				<tr>
					<th class="th1">번호</th>
					<th>제목</th>
					<th class="th2">글쓴이</th>
					<th class="th2">날짜</th>
					<th class="th1">조회수</th>
				</tr>
			</thead>
			<tbody class="table2">
			</tbody>
		</table>
		<div class="paging"></div>
	</div>
</body>
</html>