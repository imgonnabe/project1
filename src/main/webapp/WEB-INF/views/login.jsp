<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="./css/login.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
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
	// jQuery
	$(function() {
		$(".btn").click(function(){
			let id = $("#id").val();
			let pw = $("#pw").val();
			if (id.length < 5) {
				alert("아이디를 입력하세요.");
				$("#id").focus();
			} else {
				if (pw.length < 5) {
					alert("암호를 입력하세요.");
					$("#pw").focus();
				} else {
					// 아이디, 비밀번호 정확하게 입력
					let form = $("<form></form>");
	                form.attr("method", "post");
	                form.attr("action", "./login");
	                // form.attr("name", "loginForm");
	
	                form.append($("<input/>", {type:"hidden", name:"id", value:id}));
					form.append($("<input/>", {type:"hidden", name:"pw", value:pw}));
	                form.appendTo("body");
	                form.submit();
				}
			}
		});
	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="section">
		<h2>Log In</h2>
		<form action="./login" method="post" onsubmit="return check()">
		</form>
		<div class="form-group">
			<input type="text" name="id" class="form-style" id="id"
				placeholder="Your ID" required="required" onchange="checkID()">
			<i class="input-icon"></i>
		</div>
		<br>
		<div class="form-group">
			<input type="password" name="pw" class="form-style" id="pw"
				placeholder="Your Password" required="required"> <i
				class="input-icon"></i>
		</div>
		<br>
		<button type="submit" class="btn">login</button><br>
		<span id="msg"></span>
		<a href="./join"><button type="button" class="signUp">Sign Up</button></a>
	</div>
</body>
</html>