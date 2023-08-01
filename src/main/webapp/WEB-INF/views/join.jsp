<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/join.css">
<link rel="stylesheet" href="./css/join.css?version=0.2">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#idCheck").click(function(){
			let id = $("#id").val();
			if(id == "" || id.length < 5){
				// alert("아이디는 5글자 이상이어야 합니다.");
				$("#resultMSG").text("아이디는 5글자 이상이어야 합니다.");
				$("#resultMSG").css("color", "red");
				$("#id").focus();
			} else {
				$.ajax({
					url: "./checkID",
					type: "post",
					data: {"id": id},// checkID?id=pororo
					dataType: "html",		
					success: function(data){
						$("#resultMSG").text("data : " + data);
					},
					error: function(request, status, error){
						$("#resultMSG").text("error : " + error);
					}
				});
				$("#resultMSG").text("5글자 이상으로 들어왔습니다.");
				$("#resultMSG").css("color", "green");
			}
		return false;
		});
	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="section">
		<h2>Sign Up</h2>
		<form action="./join" method="post">
			<div class="form-group">
				<input type="text" name="id" class="form-style" id="id"
					placeholder="아이디를 입력하세요." required="required" autocomplete="off">
				<i class="input-icon"></i> <br>
				<button class="btn" id="idCheck">중복검사</button>
				<br>
				<span id="resultMSG"></span>
			</div>
			<div class="form-group">
				<input type="password" name="pw" class="form-style" id="pw"
					placeholder="비밀번호를 입력하세요." required="required" autocomplete="off">
				<i class="input-icon"></i>
			</div>
			<br>
			<div class="form-group">
				<input type="password" name="pwcheck" class="form-style"
					placeholder="비밀번호를 다시 입력하세요." required="required"
					autocomplete="off"> <i class="input-icon"></i>
			</div>
			<br>
			<div class="form-group">
				<input type="text" name="name" class="form-style"
					placeholder="이름을 입력하세요." required="required" autocomplete="off">
				<i class="input-icon"></i>
			</div>
			<br>
			<div class="form-group">
				<input type="text" name="addr" class="form-style"
					placeholder="주소를 입력하세요." autocomplete="off"> <i
					class="input-icon"></i>
			</div>
			<br> <label for="date">생년월일을 선택하세요 : <input type="date"
				id="date" max="2023-07-28" min="1900-01-01" name="birth">
			</label> <br> <br>
			<div class="form-group form-mbti">
				<label for="mbti"> MBTI </label> <select id="mbti" name="mbti">
					<option value="" disabled="disabled">-- 선택하세요 --</option>
					<optgroup label="I">
						<option value="ISTJ">ISTJ</option>
						<option value="ISTP">ISTP</option>
						<option value="INFJ">INFJ</option>
						<option value="INTJ">INTJ</option>
						<option value="ISFJ">ISFJ</option>
						<option value="ISFP">ISFP</option>
						<option value="INFP">INFP</option>
						<option value="INTP">INTP</option>
					</optgroup>
					<optgroup label="E">
						<option value="ESTJ">ESTJ</option>
						<option value="ESTP">ESTP</option>
						<option value="ENFJ">ENFJ</option>
						<option value="ENTJ">ENTJ</option>
						<option value="ESFJ">ESFJ</option>
						<option value="ESFP">ESFP</option>
						<option value="ENFP">ENFP</option>
						<option value="ENTP">ENTP</option>
					</optgroup>
				</select>
			</div>
			<br>
			<div class="form-gender">
				<input type="radio" name="gender" id="m" value="1"> <label
					for="m">남</label> <input type="radio" name="gender" id="f"
					value="2"> <label for="f">여</label>
				<!-- label for : for 를 통해 for 뒤에 나오는 값 과 id 이름이 같은것을 찾아 연결시키는 역할을 한다. -->
				<!-- label을 클릭하면, 연결된 양식에 입력할 수 있도록 하거나, 체크를 하거나, 체크를 해제한다. -->
			</div>
			<button class="btn" type="submit">submit</button>
			<button class="btn" type="reset">reset</button>
		</form>
	</div>
</body>
</html>