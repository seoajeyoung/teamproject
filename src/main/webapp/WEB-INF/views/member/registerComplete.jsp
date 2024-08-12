<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료</title>
</head>
<body>


<form action="${pageContext.request.contextPath}/member/login" method="get">
회원가입이 완료되었습니다.
이름:${memberDTO.member_id}<br>
아이디:${memberDTO.member_name}<br>
<input type="submit" value="로그인 하러가기">
</form>
</body>
</html>