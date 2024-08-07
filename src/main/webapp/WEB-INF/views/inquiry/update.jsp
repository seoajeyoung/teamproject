<%-- <%@page import="borad.BoardDTO"%> --%>
<%-- <%@page import="borad.BoardDAO"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry/update.jsp</title>
</head>
<body>
<h1>inquiry/update.jsp</h1>

<form action="${pageContext.request.contextPath}/inquiry/updatePro" method="post"> 
<input type="hidden" name="num" value="${inquiryDTO.num}">
<table border="1">

<tr><td>글쓴이</td>
	<td><input type="text" name="name" value="${inquiryDTO.member_num}" readonly></td></tr>
<tr><td>글제목</td>
	<td><input type="text" name="subject" value="${inquiryDTO.name}"></td></tr>
<tr><td>글내용</td>
	<td><textarea row="10" cols="20" name="content">${inquiryDTO.detail}</textarea></td></tr>
<tr><td>첨부파일</td>
	<td><input type="file" name="file">
	${inquiryDTO.file}
	<input type="hidden" name="oldfile" value="${inquiryDTO.file}"></td></tr>
<tr><td colspan="2">
<input type="submit" value="글수정하기">
<input type="reset" value="다시쓰기">
<input type="button" onclick="location.href='${pageContext.request.contextPath}/inquiry/list'" value="취소">
</td></tr>
</table>
</form>
</body>
</html>