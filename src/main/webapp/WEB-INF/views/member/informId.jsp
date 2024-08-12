<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link href="${pageContext.request.contextPath}/resources/css/member/findResult.css" rel="stylesheet">
</head>
<body>
<div id="findIdContainer">
    <div id="findIdText">
        <c:if test="${not empty memberDTO2.member_id}">
            ${memberDTO.member_name}님의 아이디는 <span id="idText">${memberDTO2.member_id}</span> 입니다.
        </c:if>
    </div>
	
	
    <a href="${pageContext.request.contextPath}/member/findPass" class="findIdLink">비밀번호 찾기</a>
    <a href="${pageContext.request.contextPath}/member/login" class="findIdLink" id="loginLink">로그인</a>
</div>
</body>