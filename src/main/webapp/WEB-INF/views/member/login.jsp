<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<body>
	<form action="${pageContext.request.contextPath}/member/loginPro"
		method="post" class="loginForm">

		<p>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</p>
		<div class="loginField">
			<input type="text" name="member_id" class="logintf" placeholder="아이디"><br> 
			<input type="password" name="member_pass" class="logintf" placeholder="비밀번호"><br>
		</div>
		
		<input type="submit" value="로그인하기" class="btn">
	</form>

</body>
</html>