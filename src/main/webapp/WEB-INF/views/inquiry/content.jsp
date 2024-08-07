<%-- <%@page import="borad.BoardDTO"%> --%>
<%-- <%@page import="borad.BoardDAO"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>inquiry/content.jsp</title>
</head>
<body>
<h1>inquiry/content.jsp</h1>

<div style="display: none;">
</div>

<table border="1">
<tr><td>문의 번호</td><td>${inquiryDTO.num}</td></tr>
<tr><td>글쓴이(멤버번호)</td><td>${inquiryDTO.member_num}</td></tr>
<tr><td>문의 날짜</td><td>${inquiryDTO.date}</td></tr>
<tr><td>비밀글/공개글</td><td>${inquiryDTO.readcount}</td></tr>
<tr><td>문의 제목</td><td>${inquiryDTO.name}</td></tr>
<tr><td>문의 내용</td><td>${inquiryDTO.detail}</td></tr>
<tr><td>영화 번호</td><td>${inquiryDTO.theater_num}</td></tr>
<tr><td colspan="2">

		<c:if test="${!(empty sessionScope.id)}">
			<c:if test="${sessionScope.id eq inquiryDTO.member_num }">
		<a href="${pageContext.request.contextPath}/inquiry/update?num=${inquiryDTO.num}">글수정</a>
		<a href="${pageContext.request.contextPath}/inquiry/delete?num=${inquiryDTO.num}">글삭제</a>
			</c:if>
		</c:if>


<a href="${pageContext.request.contextPath}/inquiry/list">글목록</a></td></tr>
</table>
</body>
</html>