<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/cart.css">
	<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/script/cart.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script>
    $(document).ready(function() {
        initializeCartData();  // 페이지가 로드되면 장바구니 데이터를 초기화
        alert(${memberDTO.member_num});
    });

    function initializeCartData() {
        let st_num = [];  // 각 상품의 st_num을 저장할 배열 초기화
        let cart_quantity = [];  // 각 상품의 수량을 저장할 배열 초기화
        let st_name = [];  // 결제 시 사용할 상품명 배열 초기화
        let product_total_price = 0;  // 결제 시 총 가격을 저장할 변수 초기화
        let cart_num = [];

        // 상품 아이디 배열에 저장
        $(".cart_item").each(function() {
            let stNumber = $(this).find(".st_num").val();  // 상품의 st_num을 가져옴
            let quantity = $(this).find(".cart_quantity").val();  // 상품의 수량을 가져옴
            let price = parseInt($(this).find(".product_price").text().replace(/[^0-9]/g, ""));  // 가격을 정수로 변환
            let name = $(this).find(".st_name").text();  // 상품명을 가져옴
            let cartNum = $(this).find(".cart_num").val(); 

            if (stNumber && quantity && price && cartNum) {
                st_num.push(stNumber);
                cart_quantity.push(quantity);
                st_name.push(name);
                cart_num.push(cartNum)
                product_total_price += price * parseInt(quantity);  // 총 가격 계산
            }
        });

        // 상품명 배열을 문자열로 결합
        let st_name_string = st_name.join(",");
        console.log("상품명:", st_name_string);
        console.log("총 가격:", product_total_price);

        // 이후에 사용할 변수들을 전역으로 설정
        window.st_num = st_num;
        window.cart_quantity = cart_quantity;
        window.st_name = st_name_string;
        window.product_total_price = product_total_price;
        window.cart_num = cart_num;
        
        $("#totalPriceDisplay").text(product_total_price.toLocaleString() + "원");
    }

    let count = 0;
    function generateMerchantUid() {
        let now = new Date();
        let year = now.getFullYear().toString().substr(2, 2);
        let month = ('0' + (now.getMonth() + 1)).slice(-2);
        let date = ('0' + now.getDate()).slice(-2);
        let randomString = Math.random().toString(36).substr(2, 3);
        let index = ('000' + (++count)).slice(-6);
        let merchantUid = "ST" + year + month + date + "-" + randomString + index;
        return merchantUid;
    }

    let merchantUid = generateMerchantUid();

    function subBtnClick() {
        if (window.product_total_price > 0) {  // 결제 금액이 0보다 큰 경우에만 결제 요청
            requestPay();
        } else {
            alert("장바구니에 상품이 없습니다.");
        }
    }

    console.log("Merchant UID:", merchantUid);

    // API 초기화 : 포트원 API를 사용하기 위해 초기화
    var IMP = window.IMP;
    IMP.init("imp33746408");

    function requestPay() {
        IMP.request_pay({
            pg: 'html5_inicis',   // 테스트용 PG사
            pay_method: "card",   // 결제 수단
            merchant_uid: merchantUid,   // 생성된 주문번호
            name: window.st_name,  // 상품명
            //amount: window.product_total_price, // 결제 금액
            amount: 100, // 결제 금액
            buyer_email: "${memberDTO.member_email}", // 사용자 이메일
            buyer_name: "${memberDTO.member_name}",   // 사용자명
            buyer_tel: "${memberDTO.member_phone}" // 사용자 전화번호
        }, function (rsp) {
            if (rsp.success) {
                alert("결제 성공");
                savePaymentDetails(rsp);
            } else {
                alert("결제 실패: " + rsp.error_msg);
            }
        });
    }

    function savePaymentDetails(rsp) {
        $.ajax({
            url: "${pageContext.request.contextPath}/store/processPayment",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                imp_uid: rsp.imp_uid,
                merchant_uid: rsp.merchant_uid,
                payment_total_price: rsp.paid_amount,
                st_num: window.st_num, // 상품 번호 배열
                cart_quantity: window.cart_quantity, // 수량 배열
                member_num: "${memberDTO.member_num}", // 회원 번호
                cart_num: window.cart_num
            }),
            success: function(response) {
                if (response === "success") {
                    console.log("결제 정보가 저장되었습니다.");
                } else {
                    console.log("결제 정보 저장 실패: " + response);
                }
            },
            error: function() {
                console.log("서버 통신 오류");
            }
        });
    }

    function removeFromCart(cart_num) {
        $.ajax({
            url: "${pageContext.request.contextPath}/store/removeFromCart",
            type: "POST",
            contentType: "application/json",
            dataType: "text",
            data: JSON.stringify({
                cart_num: cart_num,
                member_num: "${sessionScope.member_num}"
            }),
            success: function(response) {
            	alert("서버 응답: " +  response); // 서버에서 반환된 값을 콘솔에 출력
                if (response === "success") {
                	location.reload(); // 성공적으로 삭제된 경우 페이지 새로고침
                } else {
                    alert("삭제 실패: " + response);
                }
            },
            error: function() {
                alert("서버 통신 오류");
            }
        });
    }
    
    </script>
</head>
<body>
<h3>장바구니</h3>

<%-- <form id="cartForm" action="${pageContext.request.contextPath}/store/payment" method="post"> --%>
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
                <tr class="cart_item">
                    <td class="st_name">${item.st_name}</td>
                    <td class="product_price">${item.st_price}원</td>
                    <td>
                        <input type="number" name="cart_quantity" class="cart_quantity" value="${item.cart_quantity}" min="1">
                        <input type="hidden" name="st_num" class="st_num" value="${item.st_num}">
                        <input type="hidden" name="cart_num" class="cart_num" value="${item.cart_num}">
                    </td>
                    <td class="product_total_price">${item.st_price * item.cart_quantity}원</td>
                    <td>
                        <button type="button" onclick="removeFromCart(${item.cart_num})">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div>
    <strong>총 가격: </strong><span id="totalPriceDisplay">0원</span>
	</div>
    
    <button onclick=subBtnClick()>결제하기</button>
<!-- </form> -->
