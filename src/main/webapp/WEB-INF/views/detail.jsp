<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="./css/detail.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
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
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
		<h1>상세보기</h1>
	<div class="body">
		<div class="view">
			<div class="no">
				글번호 : ${dto.bno }
				<c:if test="${sessionScope.mid ne null && sessionScope.mid eq dto.m_id }">
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
	</div>
</body>
</html>