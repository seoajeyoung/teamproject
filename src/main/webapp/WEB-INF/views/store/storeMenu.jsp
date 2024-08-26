<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/storeMenu.css">

</head>
<body>

<header>
<div class="tit-heading-wrap tit-evt">
    <h3>스토어</h3>
</div>


<div class='category_wrap'>
 <div class='category_contents_wrap'>
     <ul class='category_content'>
     	<c:forEach var="category" items="${categories}">
			<li><a href="${pageContext.request.contextPath}/store/productCategory?category=${category.detail_value}">${category.detail_value}</a></li>
		</c:forEach>
     
     </ul>
     <ul class='cart_content'>
     	<li>
			<a href="${pageContext.request.contextPath}/store/storeCart">내 장바구니</a>     	
     	</li>
     </ul>

 </div>
</div>
</header>
</body>
</html>