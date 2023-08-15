<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<h1>
		<img onclick="location.href='./thread'" alt="" src="./img/x.png">&nbsp;새로운
		스레드
	</h1>
	<hr>
	<div id="thread">
		<img alt="" src="./img/profile.png">
		<div id="m_id">${sessionScope.mid}</div>
		<div class="container">
			<textarea cols="50" rows="8" maxlength="500" name="content"
				class="content" required="required" placeholder="스레드를 시작하세요..."></textarea>
			<br>
			<!-- 파일 업로드에서는 enctype(인코딩타입)을 multipart/form-data로 반드시 설정 -->
			<form action="upload_ok" method="post" enctype="multipart/form-data">
				<img alt="" src="./img/clip.png"> <input type="file"
					name="file"> <input type="submit" value="전송">
			</form>
		</div>
		<c:forEach items="${list }" var="row">
			<div>
				<img alt="" src="/upload/${dto }" width="400px" height="400px" style="object-fit:cover">
			</div>
		</c:forEach>
	</div>
	<button type="button" class="okbtn">새로운 스레드</button>
	<button type="button" class="writebtn">게시</button>
</body>
</html>