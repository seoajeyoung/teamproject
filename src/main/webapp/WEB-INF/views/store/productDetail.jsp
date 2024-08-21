<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/productDetail.css">
<script>
function adjustQuantity(delta) {
    const quantitySpan = document.querySelector('.com_form_count0');
    const totalPriceSpan = document.querySelector('.com_total_price');
    const unitPrice = parseInt(document.getElementById('spnSalePrice').textContent.replace(/,/g, ''), 10); // 단가
    let currentQuantity = parseInt(quantitySpan.textContent);
    
    // 수량 조정
    let newQuantity = currentQuantity + delta;
    if (newQuantity < 1) newQuantity = 1; // 최소 수량 1로 제한
    
    // 수량 업데이트
    quantitySpan.textContent = newQuantity;
    
    // 폼의 수량 필드 업데이트
    document.querySelector('input[name="cart_quantity"]').value = newQuantity;
    
    // 총 가격 계산
    let totalPrice = unitPrice * newQuantity;
    let formattedTotalPrice = totalPrice.toLocaleString('en'); // 천 단위 구분 기호 추가
    
    // 총 가격 업데이트
    totalPriceSpan.textContent = formattedTotalPrice;
    document.querySelector('.com_product_total_price').textContent = formattedTotalPrice;
}
function addToCart(event, member_num, st_num) {
    let contextPath = "/" + window.location.pathname.split("/")[1];
    
    let confirmMessage = '로그인이 필요한 서비스입니다. 로그인 하시겠습니까?';
    let path = '/member/login';

    if (member_num) { // 로그인 유무
        confirmMessage = '상품이 장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?';
        path = '/store/storeCart';
    }

    if (confirm(confirmMessage)) { // 사용자가 '예'를 클릭한 경우
        if (member_num == null || member_num.trim() === '') {
            window.location.href = contextPath + path;
        } else {
            // 폼을 실제로 제출하여 장바구니에 추가
            document.getElementById('addCartForm').submit();
        }
    } else {
        event.preventDefault(); // 폼 제출을 막고, 현재 페이지 유지
    }
}
</script>
</head>
<body>



	<jsp:include page="../store/storeMenu.jsp" />


	<!-- 상품정보 -->
	<div class='category_product_detail_wrap'>
		<strong class='category_product_detail_title'>${storeDTO.st_name }</strong>
		<div class='category_product_detail_contents'>
			<div class='category_product_detail_contents_img_wrap'>
				<ul class='bxslider'>
					<li><img
						src="${pageContext.request.contextPath}/resources/img/${storeDTO.st_picture}"
						alt="${storeDTO.st_name }"></li>
				</ul>
			</div>
			<div class='category_product_detail_contents_wrap'>
				<p class='category_product_detail_sale_price_wrap'>
					<span class="store_deatail_sale_price" id="spnSalePrice">${storeDTO.st_price }원</span>
<!-- 					<span class="store_deatail_source_price">66,000</span> -->
				</p>
				<dl class='category_product_detail_add_info'>
					<dt>상품구성</dt>
					<dd>${storeDTO.st_const }</dd>
					<dt>유효기간</dt>
					<dd>
						${storeDTO.st_period }<br>
					</dd>
					
					
				</dl>
				<div class='category_product_detail_price_wrap'>
					<div class='com_form_number'>
						<a href="#none" onclick="adjustQuantity(-1);" class="com_btn_minus">-</a>
						<span class='com_form_count com_form_count0'>1</span>
						<a href="#none" onclick="adjustQuantity(1);" class="com_btn_plus">+</a>
						<span class='com_total_price' id='spantotalprice' data-price='${storeDTO.st_price}'>${storeDTO.st_price}</span>
					</div>
					<div class='category_product_detail_total_price'>
						<p class='com_form_total_price'>
							총 구매금액<span class='com_total_price0 com_product_total_price'>${storeDTO.st_price}원</span>
						</p>
					</div>
				</div>
				<form id="addCartForm" data-member-num="${sessionScope.member_num}" action="${pageContext.request.contextPath}/store/addCart" method="POST">
    				<input type="hidden" name="st_num" value="${storeDTO.st_num}" />
    				<input type="hidden" name="member_num" value="${sessionScope.member_num}" />
    				<input type="hidden" name="cart_quantity" value="1" /> <!-- 초기 수량 값 -->
				</form>
				<div class='category_product_detail_btn_wrap'>
						 <a href='#' onclick="addToCart(event, '${sessionScope.member_num}', '${storeDTO.st_num}');">
        				 장바구니에 추가
   						</a>
				</div>
			</div>
		</div>
		<p class='category_product_detail_txtbox'>${storeDTO.st_detail }</p>
		
</body>
</html>