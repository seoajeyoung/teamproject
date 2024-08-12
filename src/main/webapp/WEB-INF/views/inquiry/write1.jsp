<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry/write.jsp</title>
</head>
<body>
<h1>inquiry/write.jsp</h1>
<%
//String id = (String)session.getAttribute("id");
%>
<form action="${pageContext.request.contextPath}/inquiry/writePro" method="post" enctype="multipart/form-data">
<table border="1">
<label><input type="radio" name="inquiry_type" value=T" checked>공개글</label>	
<label><input type="radio" name="inquiry_type" value="F">비밀글</label>	
<tr><td>글쓴이</td>
	<td><input type="text" name="member_num" value="${sessionScope.id }" readonly></td></tr>
<tr><td>문의 제목</td>
	<td><input type="text" name="inquiry_name"></td></tr>
<tr><td>문의 내용</td>
	<td><textarea row="10" cols="20" name="inquiry_detail"></textarea></td></tr>
<tr><td>첨부파일</td>
	<td><input type="file" name="inquiry_picture"></td></tr>
<tr><td>극장 번호(어느 상황?)</td>
	<td><input type="number" name="theater_num"></td></tr>	
	
<tr><td colspan="2">
<input type="submit" value="문의하기">
<input type="reset" value="다시쓰기">
<input type="button" onclick="location.href='${pageContext.request.contextPath}/inquiry/list'" value="취소">
</td></tr>
</table>
</form>
</body>
</html>