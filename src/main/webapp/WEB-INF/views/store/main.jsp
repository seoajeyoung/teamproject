<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/storeMain.css">
</head>
<body>
<h3>스토어</h3>
	<div id="categoryWrap">
	<div id="categoryMenuWrap">
    <ul class categeryMenu>
    	<li>패키지</li>
    	<li>영화관람권</li>
    	<li>기프트카드</li>
    	<li>콤보</li>
    	<li>팝콘</li>
    	<li>음료</li>
    	<li>스낵</li>
   
    </ul>
   </div>
   </div> 
    
<div id="product">
    <div id="package">
        <span class="category">패키지</span>
        <ul class="productList">
        <c:forEach var="storeDTO" items="${productList }">
        <div class=productWrap>
            <c:if test="${storeDTO.st_type == '패키지'}">
                <li>
                    <img class="productImage" src="${pageContext.request.contextPath}/resources/img/${storeDTO.st_picture}" alt="${storeDTO.st_name}" />
                    <h4>${storeDTO.st_name }</h4>
                    <p class="price">${storeDTO.st_price }원</p>
                </li>
            </c:if>
        </div> 
        </c:forEach>
        </ul>
    </div>
    
    <div id="ticket">
        <span class="category">영화관람권</span>
        <ul class="productList">
        <c:forEach var="storeDTO" items="${productList }">
        <div class=productWrap>
            <c:if test="${storeDTO.st_type == '영화관람권'}">
                <li>
                    <img class="productImage" src="${pageContext.request.contextPath}/resources/img/${storeDTO.st_picture}" alt="${storeDTO.st_name}" />
                    <h4>${storeDTO.st_name }</h4>
                    <p class="price">${storeDTO.st_price }원</p>
                </li>
            </c:if>
           </div>
        </c:forEach>
        </ul>
    </div>
    
    <div id="giftcard">
        <span class="category">기프트카드</span>
        <ul class="productList">
        <c:forEach var="storeDTO" items="${productList }">
        <div class=productWrap>
            <c:if test="${storeDTO.st_type == '기프트카드'}">
                <li>
                    <img class="productImage" src="${pageContext.request.contextPath}/resources/img/${storeDTO.st_picture}" alt="${storeDTO.st_name}" />
                    <h4>${storeDTO.st_name }</h4>
                    <p class="price">${storeDTO.st_price }원</p>
                </li>
            </c:if>
            </div>
        </c:forEach>
        </ul>
    </div>
</div>

</body>
</html>