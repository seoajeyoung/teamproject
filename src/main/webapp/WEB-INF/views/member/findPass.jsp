<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="${pageContext.request.contextPath}/resources/css/member/findIdPass.css" rel="stylesheet">

</head>
<body>
	<form class="findForm"
		action="${pageContext.request.contextPath}/member/tempPass"
		method="post">
		<div class="findPassField">
			<span id="leadtext">네이버 계정의 아이디/비밀번호를 찾고자 하실 경우, 네이버 사이트의
				아이디/비밀번호 찾기를 이용해 주세요.</span><br> 
			<input type="text" name="member_id" id="id" placeholder="아이디" maxlength="20">
		</div>
		<div class="findIdField">
			<input type="text" name="member_birth" id="birth" placeholder="생년월일" maxlength="8">
		</div>
		<div class="findIdField">
			<input type="text" name="member_phone" id="phone" placeholder="전화번호" maxlength="11">
		</div>
		<input type="submit" class="findBtn" value="임시비밀번호 받기">

		<c:if test="${not empty error}">
			<div class="error-message" >${error}</div>
		</c:if>
	</form>

</body>
</html>