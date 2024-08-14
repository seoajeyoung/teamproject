<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세</title>
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/cart.js"></script>
</head>
<body>

	 <!-- 상품 이미지와 정보 -->
	<img class="productImage" src="${pageContext.request.contextPath}/resources/img/${storeDTO.st_picture}" alt="${storeDTO.st_name}" />
	<h4>${storeDTO.st_name }</h4>
    <p class="price">${storeDTO.st_price }원</p>
    
    <!-- 장바구니에 추가하는 폼 -->
    <form id="addCartForm" data-member-num="${sessionScope.member_num}" action="${pageContext.request.contextPath}/store/addCart" method="POST">
        <input type="hidden" name="st_num" value="${storeDTO.st_num}" />
        <input type="hidden" name="member_num" value="${sessionScope.member_num}" />
        <label for="quantity">수량:</label>
        <input type="number" id="quantity" name="cart_quantity" value="1" min="1" />
        <button type="submit" id="addCartBtn">장바구니에 추가</button>
    </form>

</body>
</html>