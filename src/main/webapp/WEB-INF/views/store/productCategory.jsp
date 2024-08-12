<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/categoryDetail.css">
</head>
<body>
<h3>카테고리 상세</h3>

<div id="product">
    <ul class="productList">
    <c:forEach var="storeDTO" items="${productList}">
        <li>
            <img class="productImage" src="${pageContext.request.contextPath}/resources/img/${storeDTO.st_picture}" alt="${storeDTO.st_name}" />
            <h4>${storeDTO.st_name}</h4>
            <p class="price">${storeDTO.st_price}원</p>
        </li>
    </c:forEach>
    </ul>
</div>

</body>
</html>