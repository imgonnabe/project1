<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="./css/login.css">
<script type="text/javascript">
	let text = "<p>올바른 아이디를 입력하세요.</p>";// 전역변수
	// 호이스팅(hoisting) : 인터프리터가 변수와 함수의 메모리 공간을 선언 전에 미리 할당
	// var로 선언한 변수의 경우 호이스팅 시 undefined로 변수를 초기화
	function checkID() {
		let msg = document.getElementById("msg");// 지역변수
		msg.innerHTML = "<p>" + document.getElementById("id").value
				+ " 아이디를 변경했습니다.</p>";
	}

	function check() {
		let msg = document.getElementById("msg");
		let id = document.getElementById("id");
		if (id.value.length < 4) {
			alert("아이디는 4글자 이상이어야 합니다.");
			msg.innerHTML = text;
			id.focus();
			return false;
		}

		let pw = document.getElementById("pw");
		if (pw.value.length < 4) {
			alert("비밀번호는 4글자 이상이어야 합니다.");
			pw.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="section">
		<form action="./login" method="post" onsubmit="return check()">
			<h2 class="mb-4 pb-3">Log In</h2>
			<div class="form-group">
				<input type="text" name="id" class="form-style" id="id"
					placeholder="Your ID" required="required" onchange="checkID()">
				<i class="input-icon"></i>
			</div>
			<div class="form-group">
				<input type="password" name="pw" class="form-style" id="pw"
					placeholder="Your Password" required="required"> <i
					class="input-icon"></i>
			</div>
			<button type="submit" class="btn">login</button>
			<span id="msg"></span>
		</form>
	</div>
</body>
</html>