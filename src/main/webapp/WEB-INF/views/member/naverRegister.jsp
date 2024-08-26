<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인</title>
<link href="${pageContext.request.contextPath}/resources/css/member/naverRegister.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/register.js"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/ticket/top.jsp" />
	<form id="naverRegister" action="${pageContext.request.contextPath}/member/naverRegisterPro" method="post">
		<div class="leadtext">처음 네이버 로그인을 통해 OSTicket을 이용하시는 경우 사이트에서
			사용할 닉네임을 만들어야 합니다.</div>

		<div class="naverNickTf">
			<input id=nickname name="member_nickname" type="text" class="nickname" placeholder="닉네임(활동명)"> 
			<input type="button" value="중복체크" id="nickbtn">
			<div id="nickck" class="checkText"></div>
		</div>
		
		<input type="submit" value="사이트 이용하기" id="naverNickBtn">
	</form>
</body>
</html>