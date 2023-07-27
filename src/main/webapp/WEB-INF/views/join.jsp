<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/join.css">
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="section">
		<form action="./signup" method="post">
			<h2 class="mb-4 pb-3">Sign Up</h2>
			<div class="form-group">
				<input type="text" name="id" class="form-style"
					placeholder="아이디를 입력하세요." required="required" autocomplete="off">
				<i class="input-icon"></i>
			</div><br>
			<div class="form-group">
				<input type="password" name="pw" class="form-style"
					placeholder="비밀번호를 입력하세요." required="required" autocomplete="off">
				<i class="input-icon"></i>
			</div><br>
			<div class="form-group">
				<input type="password" name="pwcheck" class="form-style"
					placeholder="비밀번호를 다시 입력하세요." required="required" autocomplete="off">
				<i class="input-icon"></i>
			</div><br>
			<div class="form-group">
				<input type="text" name="name" class="form-style"
					placeholder="이름을 입력하세요." required="required" autocomplete="off">
				<i class="input-icon"></i>
			</div><br>
			<div class="form-group">
				<input type="text" name="addr" class="form-style"
					placeholder="주소를 입력하세요." autocomplete="off">
				<i class="input-icon"></i>
			</div><br>
			<div class="form-group">
				<input type="text" name="mbti" class="form-style"
					placeholder="mbti를 체크하세요." autocomplete="off">
				<i class="input-icon"></i>
			</div><br>
			<div class="form-group">
				<input type="date" name="birthday" class="form-style"
					placeholder="생년월일을 체크하세요." autocomplete="off">
				<i class="input-icon"></i>
			</div><br>
			<div class="form-group">
				<input type="radio" name="gender" class="form-style"
					placeholder="성별을 체크하세요." autocomplete="off">
				<i class="input-icon"></i>
			</div><br>
			<button class="btn">submit</button>
		</form>
	</div>
</body>
</html>