<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry/list.jsp</title>
</head>
<body>
<h1>inquiry/list.jsp</h1>

<a href="${pageContext.request.contextPath}/inquiry/write">글쓰기</a>
<h1>글목록[전체 글개수 ${pageDTO.count}]</h1>
<table border="1">
<tr><td>글번호</td><td>글제목</td><td>글쓴이</td>
	<td>등록일</td><td>극장번호</td></tr>

 		<c:forEach var="inquiryDTO" items="${inquiryList}">
<tr><td>${inquiryDTO.inquiry_num}</td>
	<td><a href="${pageContext.request.contextPath}/inquiry/content?inquiry_num=${inquiryDTO.inquiry_name}">
		${inquiryDTO.inquiry_name}</a></td>
	<td>${inquiryDTO.member_num}</td>
	<td>${inquiryDTO.inquiry_date}</td>
	<td>${inquiryDTO.theater_num}</td></tr>	
		</c:forEach>


</table>
<br>

	<c:if test="${ pageDTO.startPage > pageDTO.pageBlock }">
		<a href="${pageCountext.request.contextPath}/inquiry/list?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
		<a href="${pageContext.request.contextPath}/inquiry/list?pageNum=${i}"> ${i}</a>
	</c:forEach>

	<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
		<a href="${pageContext.request.contextPath}/inquiry/list?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[다음]</a>
	</c:if>

</body>
</html>