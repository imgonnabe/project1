<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/board.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="body1">
		<h1>보드</h1>
		<img alt="" src="./img/home.png" height="100px"><br>
		<table>
			<tr>
				<th class="th1">번호</th>
				<th>제목</th>
				<th class="th2">글쓴이</th>
				<th class="th2">날짜</th>
				<th class="th1">좋아요</th>
			</tr>
			<c:forEach items="${list }" var="row">
				<tr onclick="location.href='./detail?bno=${row.bno }'">
					<td>${row.bno }</td>
					<td>${row.btitle }</td>
					<td>${row.bwrite }</td>
					<td>${row.bdate }</td>
					<td>${row.blike }</td>
				</tr>
			</c:forEach>
		</table>
		<button onclick="location.href='./write'">글쓰기</button>
	</div>
</body>
</html>