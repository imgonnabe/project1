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

	$(function() {
		$(".c-box").hide();
		$(".c-openbtn").click(function() {
			$(".c-box").show('slow');
			$(".c-openbtn").remove();
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
		</div>
		<div id="content">${dto.bcontent }</div>
		<div style="height: 10px; width: 100%;"></div>
		<div class="commentsList">
			<c:choose>
				<c:when test="${fn:length(commentsList) gt 0}">
					<c:forEach items="${commentsList }" var="c">
						<div class="c-view">
							<div id="c-name">${c.m_name }</div>
							<div id="c-date">${c.c_date }</div>
						</div>
						<div id="c-comment">${c.c_comment }</div>
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