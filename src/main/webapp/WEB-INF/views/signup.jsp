<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/signup.css">
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="section">
		<form action="./signup" method="post">
			<h2 class="mb-4 pb-3">Sign Up</h2>
			<div class="form-group">
				<input type="text" name="id" class="form-style"
					placeholder="ID를 입력하세요." required="required" autocomplete="off">
				<i class="input-icon"></i>
			</div>
			<div class="form-group">
				<input type="password" name="pw" class="form-style"
					placeholder="Password를 입력하세요." required="required" autocomplete="off">
				<i class="input-icon"></i>
			</div>
			<div class="form-group">
				<input type="text" name="name" class="form-style"
					placeholder="이름을 입력하세요." required="required" autocomplete="off">
				<i class="input-icon"></i>
			</div>
			<div class="form-group">
				<input type="text" name="addr" class="form-style"
					placeholder="주소를 입력하세요." autocomplete="off">
				<i class="input-icon"></i>
			</div>
			<button class="btn">submit</button>
		</form>
	</div>
</body>
</html>