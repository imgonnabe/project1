<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="./css/menu.css">
<nav>
	<ul>
		<li onclick="link('')" class="menu">메인</li>
		<li onclick="link('board')" class="menu">게시판</li>
		<li onclick="link('board2')" class="menu">게시판2</li>
		<li onclick="link('mooni')" class="menu">문의사항</li>
		<li onclick="link('notice')" class="menu">공지</li>
		<li onclick="link('members')" class="menu">회원리스트</li>
		<c:choose>
			<c:when test="${sessionScope.mname eq null }">
				<li onclick="link('login')" class="login">로그인</li>&nbsp;
				<li onclick="link('join')" class="login">회원가입</li>
			</c:when>
			<c:otherwise>
				<li onclick="link('myInfo')" class="login">${sessionScope.mname }(${sessionScope.mid })님
					반갑습니다.</li>
				<li onclick="link('logout')" class="login">로그아웃</li>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>
<div style="height: 50px; width: 100%;"></div>
<script>
	function link(url) {
		location.href = "./" + url;
	}
</script>