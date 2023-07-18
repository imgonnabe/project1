<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/detail.css">
</head>
<body>
<%@ include file="menu.jsp" %>
<h1>상세보기</h1>
	<div class="view">
		<div class="no">${dto.bno }</div>
		<div class="title">${dto.btitle }</div>
		<div class="write">${dto.bwrite }</div>
		<div class="like">${dto.blike }</div>
	</div>
		<div id="content">${dto.bcontent }</div>
</body>
</html>