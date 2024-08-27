<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="${pageContext.request.contextPath}/resources/css/member/findResult.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/ticket/top.jsp" /><br>
	<div id="findPassContainer">
		<div id="findPassText">
			<c:if test="${not empty tempPassword}">
       		임시로 발급된 비밀번호는 <span id="tempPassword">${tempPassword}</span> 입니다.
     	</c:if>
		</div>

		<a href="${pageContext.request.contextPath}/member/login" class="findPassLink" id="loginLink">로그인</a>
	</div>

</body>
</html>