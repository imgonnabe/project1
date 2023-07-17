<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/board.css">
</head>
<body>
	<h1>보드</h1>
	<img alt="" src="./img/update.png" height="100px">
	<a href="./">index로 가기</a>
	<table border = "1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>날짜</td>
			<td>좋아요</td>
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
</body>
</html>