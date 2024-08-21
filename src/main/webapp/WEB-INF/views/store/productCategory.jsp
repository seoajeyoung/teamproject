<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 상세</title>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/categoryDetail.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/storeMain.css">

</head>
<body>

<jsp:include page="../store/storeMenu.jsp" />


<h3>${storeDTO.st_type }</h3>

<!-- <div id="product"> -->
<!--     <ul class="productList"> -->
<%--     <c:forEach var="storeDTO" items="${productList}"> --%>
<%--     <a href="${pageContext.request.contextPath}/store/productDetail?st_num=${storeDTO.st_num}"><div class=productWrap> --%>
<!--         <li> -->
<%--             <img class="productImage" src="${pageContext.request.contextPath}/resources/img/${storeDTO.st_picture}" alt="${storeDTO.st_name}" /> --%>
<%--             <h4>${storeDTO.st_name}</h4> --%>
<%--             <p class="price">${storeDTO.st_price}원</p> --%>
<!--         </li> -->
<!--         </div> -->
<%--     </c:forEach> --%>
<!--     </ul> -->
<!-- </div> -->

<div id="product">
    <div id="package">
        <span class="category">${category}</span>
        <ul class="productList">
        <c:forEach var="storeDTO" items="${productList }">
        <a href="${pageContext.request.contextPath}/store/productDetail?st_num=${storeDTO.st_num}"><div class=productWrap>
               <li>
                   <img class="productImage" src="${pageContext.request.contextPath}/resources/img/${storeDTO.st_picture}" alt="${storeDTO.st_name}" />
                   <h4>${storeDTO.st_name }</h4>
                   <p class="price">${storeDTO.st_price }원</p>
               </li>
        </div> </a>
        </c:forEach>
        </ul>
    </div>



</body>
</html>