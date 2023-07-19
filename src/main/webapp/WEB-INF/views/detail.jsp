<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/detail.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script type="text/javascript">
	function del(){
		let chk = confirm("삭제하시겠습니까?");// 참 거짓
		if(chk){
			location.href="./delete?bno=${dto.bno }";
		}
	}
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
<h1>상세보기</h1>
	<div class="view">
		<div class="no">
		${dto.bno }<img alt="" src="./img/update2.png"><img alt="" src="./img/delete2.png" onclick="del()">
		${dto.btitle }
		</div>
		<div class="write">${dto.bwrite }</div>
		<div class="like">${dto.blike } ${dto.bip }</div>
	</div>
		<div id="content">${dto.bcontent }</div>
</body>
</html>