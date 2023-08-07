<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="./css/detail.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	function edit() {
		if (confirm("수정하시겠습니까?")) {
			location.href = "./edit?bno=${dto.bno }";
		}
	}

	function del() {
		let chk = confirm("삭제하시겠습니까?");// 참 거짓
		if (chk) {
			location.href = "./delete?bno=${dto.bno }";
		}
	}
	
	// 댓글 삭제 버튼 = 로그인 > 자기 글인지 확인
	function cdel(cno){// cno
		if (confirm ("댓글을 삭제하시겠습니까?")){
			location.href = "./cdel?bno=${dto.bno}&cno=" + cno;// cno
		}
			
	}
	
	$(function() {
		$(".c-box").hide();
		$(".c-openbtn").click(function() {
			$(".c-box").show('slow');
			$(".c-openbtn").remove();
		});
		// 댓글 삭제 다른 방법
		$(".cdel").click(function(){
			if (confirm ("댓글을 삭제하시겠습니까?")){
				// alert($(this).parent().siblings('#c-no').text());// 부모인 c-name의 형제 c-no (div를 기준으로 찾음)
				let cno = $(this).parent().siblings('#c-no').text();
				// location.href = "./cdel?bno=${dto.bno}&cno=" + cno;// el, java, jstl > html, css, javascript, jQuery
				$.ajax({
					url : "./cdelR",
					type : "post",
					data : {bno: ${dto.bno}, cno: cno},
					dataType : "json",
					success : function(data){
						if(data.result == 1){
							$(this).parents(".c-parent").remove();
						} else{
							alert("통신에 문제가 발생했습니다. 다시 시도해주세요.");
						}
					},
					error:function(error){
						alert("에러"+error);
					}
				});
			}
		});
		
		// 댓글 수정 버튼 = 로그인 > 자기 글인지 확인
		/* function ajax_call(cno){
			$.ajax({
				url : "./edit2",
				type : "post",
				data : {"c_no", cno},
				dataType : "json",
				success : function(data){
					
				},
				error : function(error){
					
				}
			});
		} */
	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1>상세보기</h1>
	<div class="body">
		<div class="view">
			<div class="no">
				글번호 : ${dto.bno }
				<c:if
					test="${sessionScope.mid ne null && sessionScope.mid eq dto.m_id }">
					<img alt="" src="./img/update2.png" onclick="edit()">
					<img alt="" src="./img/delete2.png" onclick="del()">
				</c:if>
			</div>
			<div class="name">${dto.m_name }</div>
			<br>
			<div class="like">
				<img alt="" src="./img/like.png">${dto.blike } / ${dto.bip }
			</div>
			<br>
			<div class="title">${dto.btitle }</div>
		</div>
		<div id="content">${dto.bcontent }</div>
		<div style="height: 10px; width: 100%;"></div>
		<div class="commentsList">
			<c:choose>
				<c:when test="${fn:length(commentsList) gt 0}">
					<c:forEach items="${commentsList }" var="c">
						<div class="c-parent">
							<div class="c-view">
								<div id="c-name">${c.m_name }(${c.m_id})
									<c:if
										test="${sessionScope.mid ne null && sessionScope.mid eq c.m_id }">
										<img alt="" src="./img/update2.png" onclick="cedit()">
										<img alt="" src="./img/delete2.png" class="cdel"
											onclick="cdel1(${c.c_no })">
									</c:if>
								</div>
								<div id="c-date">${c.c_date }</div>
								<div id="c-no" hidden="">${c.c_no }</div>
							</div>
							<div id="c-comment">${c.c_comment }</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h4>아직 댓글이 없습니다.</h4>
				</c:otherwise>
			</c:choose>
			<c:if test="${sessionScope.mid ne null}">
				<button type="button" class="c-openbtn btn">댓글창 열기</button>
				<div class="c-box">
					<form action="./comment" method="post">
						<textarea id="c-textarea" name="comment" placeholder="댓글을 입력하세요."></textarea>
						<button type="submit" class="c-writebtn btn">댓글쓰기</button>
						<input type="hidden" name="bno" value="${dto.bno }">
					</form>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>