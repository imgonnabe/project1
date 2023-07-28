<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원게시판</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/members.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1>회원게시판</h1>
	<img alt="" src="./img/home.png" height="100px">
	<c:forEach items="${list }" var="m">
		${m.no } ${m.id } ${m.name } ${m.birth } ${m.mbti } ${m.gender }<br>
	</c:forEach>
	<br>
	<br>
	<div class="table">
		<table>
			<tr>
				<th class="th1">번호</th>
				<th>제목</th>
				<th class="th2">글쓴이</th>
				<th class="th2">날짜</th>
				<th class="th1">조회수</th>
			</tr>
			<tr onclick="location.href='./detail?bno=${row.bno }'">
				<td class="th1">${row.bno }</td>
				<td>${row.btitle }</td>
				<td class="th2">${row.m_name }</td>
				<td class="th2">${row.bdate }</td>
				<td class="th1">${row.blike }</td>
			</tr>
		</table>
	</div>
</body>
</html>