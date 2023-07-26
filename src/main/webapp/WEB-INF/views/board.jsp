<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/board.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script type="text/javascript">
	function linkPage(pageNo){
		location.href = "./board?pageNo="+pageNo;
	}	
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1>보드</h1>
	<img alt="" src="./img/home.png" height="100px">
	<c:if test="${sessionScope.mname ne null }">
		<button onclick="location.href='./write'" class="btn">글쓰기</button>
	</c:if>
	<br>
	<br>
	<c:choose>
		<c:when test="${fn:length(list) gt 0}">
			<div class="table">
				<table>
					<tr>
						<th class="th1">번호</th>
						<th>제목</th>
						<th class="th2">글쓴이</th>
						<th class="th2">날짜</th>
						<th class="th1">조회수</th>
					</tr>
					<c:forEach items="${list }" var="row">
						<tr onclick="location.href='./detail?bno=${row.bno }'">
							<td class="th1">${row.bno }</td>
							<td>${row.btitle }</td>
							<td class="th2">${row.m_name }</td>
							<td class="th2">${row.bdate }</td>
							<td class="th1">${row.blike }</td>
						</tr>
					</c:forEach>
				</table>
				<ui:pagination paginationInfo="${paginationInfo}" type="image"
					jsFunction="linkPage" />
			</div>
		</c:when>
		<c:otherwise>
			<h2>출력할 데이터가 없습니다.</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>