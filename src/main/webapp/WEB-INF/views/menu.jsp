<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./css/menu.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<nav>
	<ul>
		<li><img src="./img/bulletin-board.png" height="40px"></li>
		<li onclick="link('')">메인</li>
		<li onclick="link('board')">게시판</li>
		<li onclick="link('board2')">게시판2</li>
		<li onclick="link('mooni')">문의사항</li>
		<li onclick="link('notice')">공지</li>
	</ul>
</nav>
<div style="height: 50px; width: 100%;"></div>
<script>
	function link(url) {
		location.href = "./" + url;
	}
</script>