<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="./css/login.css">
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="section">
		<form action="./login" method="post">
			<h2 class="mb-4 pb-3">Log In</h2>
			<div class="form-group">
				<input type="text" name="id" class="form-style"
					placeholder="Your ID" required="required" autocomplete="off">
				<i class="input-icon"></i>
			</div>
			<div class="form-group">
				<input type="password" name="pw" class="form-style"
					placeholder="Your Password" required="required" autocomplete="off">
				<i class="input-icon"></i>
			</div>
			<button class="btn">submit</button>
		</form>
	</div>
</body>
</html>