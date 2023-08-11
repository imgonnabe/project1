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
				let c_comments = $(this).parents(".c-parent");// 변수처리
				$.ajax({
					url : "./cdelR",
					type : "post",
					data : {bno: ${dto.bno}, cno: cno},
					dataType : "json",
					success : function(data){
						if(data.result == 1){
							c_comments.remove();
						} else{
							alert("통신에 문제가 발생했습니다. 다시 시도해주세요.");
						}
					},
					error : function(error){
						alert("에러"+error);
					}
				});
			}
		});
		// 댓글 수정 버튼 = 로그인 > 자기 글인지 확인
		$(".cedit").click(function(){
			// 변수 만들기 bno, cno, content, 글쓰기 수정 html
			const bno = "${dto.bno}";
			const cno = $(this).parent().siblings('#c-no').text();
			let content = $(this).parents(".c-view").siblings('#c-comment').text();
			let recommentBox = '<div class="c-box">';
			recommentBox += '<form action="./cedit" method="post">';
			recommentBox += '<textarea id="c-textarea" name="recomment" placeholder="댓글을 입력하세요.">'+content+'</textarea>';
			recommentBox += '<input type="hidden" name="bno" id="bno" value="${dto.bno}">';
			recommentBox += '<input type="hidden" name="cno" id="cno" value="'+cno+'">';
			recommentBox += '<button type="submit" id="recommentbtn" class="btn">수정하기</button>';
			recommentBox += '</form>';
			recommentBox += '</div>';
			// alert(bno + "/" + cno + "/" + content);
			// <div class="c-parent"> 설정 안하면 수정버튼 누를 때 밑에 있는 내용도 같이 나옴
			
			/* // 내 위치 찾기
			let commentDIV = $(this).parents(".c-parent");
			// commentDIV.css("color", "red");
			commentDIV.after(recommentBox);
			commentDIV.remove();
			// 수정, 삭제, 댓글창 열기 모두 삭제하기
			$(".c-openbtn").remove();
			$(".cedit").remove();
			$(".cdel").remove(); */
			$.ajax({
				url : "./ceditR",
				type : "post",
				data : {bno: bno, cno: cno, recomment: content},
				dataType : "json",
				success : function(data){
					if(data.result == 1){
						let commentDIV = $(this).parents(".c-parent");
						commentDIV.after(recommentBox);
						commentDIV.remove();
						// 수정, 삭제, 댓글창 열기 모두 삭제하기
						$(".c-openbtn").remove();
						$(".cedit").remove();
						$(".cdel").remove();
					} else {
						alert("통신에 문제가 발생했습니다. 다시 시도해주세요.");
					}
				},
				error : function(error){
					alert("에러"+error);
				}
			});
			
		});
		
		
		// 댓글 몇 글자 썼는지 확인하는 코드
		// keyup 텍스트입력창 id="c-textarea", 댓글쓰기 버튼 id="c-btn"
		$("#c-textarea").keyup(function(){
			let text = $(this).val();
			if(text.length > 100){
				alert("100자를 초과했습니다.");
				$(this).val(text.substr(0, 99));
			}
			$("#c-btn").text("댓글쓰기 "+text.length+"/100");
		});
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
			<div id="content">
				<c:set var="original" value="${dto.bcontent}" />
				<c:set var="c1" value="[" />
				<c:set var="r1" value="<br>" />
				<c:set var="c2" value="]" />
				<c:set var="r2" value="<br>" />
				
				<c:set var="m1" value="${fn:replace(original, c1, r1)}" />
				<c:set var="m2" value="${fn:replace(m1, c2, r2)}" />
				
				${m2}
			</div>
			<div style="height: 10px; width: 100%;"></div>
			<div class="commentsList">
				<c:choose>
					<c:when test="${fn:length(commentsList) gt 0}">
						<div class="comments">
							<c:forEach items="${commentsList }" var="c">
								<div class="c-parent">
									<div class="c-view">
										<div id="c-name">${c.m_name }(${c.m_id})
											<c:if
												test="${sessionScope.mid ne null && sessionScope.mid eq c.m_id }">
												<img alt="" src="./img/update2.png" class="cedit"
													onclick="cedit()">
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
						</div>
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
							<button type="submit" class="c-writebtn btn" id="c-btn">댓글쓰기</button>
							<input type="hidden" name="bno" value="${dto.bno }">
						</form>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>