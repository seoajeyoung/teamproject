<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="${pageContext.request.contextPath}/resources/css/member/login.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>

</head>
<body>


	<form action="${pageContext.request.contextPath}/member/loginPro"
		method="post" class="loginForm" id="loginForm">

		<span id="leadtext">아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</span>
		<div class="logintf">
			<input type="text" name="member_id" id="id" placeholder="아이디">
		</div>
		<div class="logintf"><input type="password" name="member_pass" id="pass"
				placeholder="비밀번호">
		</div>

		<div class="findIdPass">
			<a href="${pageContext.request.contextPath}/member/findId" class="loginlink">아이디 찾기</a>
			<a href="${pageContext.request.contextPath}/member/findPass" class="loginlink">비밀번호 찾기</a>
			<a href="${pageContext.request.contextPath}/member/register" class="loginlink">회원가입</a>
		</div>

		<div class="buttonContainer">
			<input type="submit" value="로그인하기" class="btn">
			<!--  네이버 로그인  -->
			<div class="sns">
				<a href="${naverLoginUrl}"><img height="50"
					src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
			</div>
		</div>
		<c:if test="${not empty errorMessage}">
			<p style="color: red;">${errorMessage}</p>
		</c:if>

	</form>
	<%--     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/login.js"></script> --%>

</body>
</html>