<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/cart.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
</head>
<body>
<h3>장바구니</h3>

<form id="cartForm" action="${pageContext.request.contextPath}/store/checkout" method="post">
    <table>
        <thead>
            <tr>
                <th>상품명</th>
                <th>가격</th>
                <th>수량</th>
                <th>합계</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${cartItemList}">
                <tr>
                    <td>${item.st_name}</td>
                    <td>${item.st_price}원</td>
                    <td>
                        <input type="number" name="quantity" value="${item.cart_quantity}" min="1" data-cart-num="${item.cart_num}">
                    </td>
                    <td>${item.st_price * item.cart_quantity}원</td>
                    <td>
                        <button type="button" onclick="removeFromCart(${item.cart_num})">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <button type="submit">결제하기</button>
</form>
