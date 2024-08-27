<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ticket/payment.css">
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script>

    $(document).ready(function() {
        initializeCartData();  // 페이지가 로드되면 장바구니 데이터를 초기화
//         console.log("member_num: " + ${memberDTO.member_num});
    });

    function initializeCartData() { // 페이지 로드되면 실행
        let st_num = [];  // 각 상품의 st_num을 저장할 배열 초기화
        let cart_quantity = [];  // 각 상품의 수량을 저장할 배열 초기화
        let st_name = [];  // 결제 시 사용할 상품명 배열 초기화
        let product_total_price = 0;  // 결제 시 총 가격을 저장할 변수 초기화
        let cart_num = [];

        // 상품 아이디 배열에 저장
        $(".cart_item").each(function() {
            let stNumber = $(this).find(".st_num").val();  // 상품의 st_num을 가져옴
            let quantity = $(this).find(".cart_quantity").val();  // 상품의 수량을 가져옴
            let price = parseInt($(this).find(".st_price").text().replace(/[^0-9]/g, ""));  // 가격을 정수로 변환
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
    function generateMerchantUid() { // 주문번호 생성
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

    function subBtnClick() { // 결제 버튼 눌렀을 시
        if (!isAgreementChecked()) {
            alert("모든 동의 항목을 체크해 주세요.");
            return false;  // 모든 체크박스가 체크되지 않았을 경우 결제 진행 안 함
        }

        if (window.product_total_price > 0) {  // 결제 금액이 0보다 큰 경우에만 결제 요청
            requestPay();
        } else {
            alert("장바구니에 상품이 없습니다.");
        }
    }
	// 모든 사항에 동의를 체크해 '모두 동의'가 체크되었는지 확인
    function isAgreementChecked() {
        return $("#agreeAll").is(":checked");  // 주문정보/결제 대행 서비스 약관 모두 동의 체크박스 확인
    }
    
    $(function() { //  체크박스 전체동의, 동의 다 누르면 전체동의 체크되게
        $("#agreeAll").on("change", function() {
            if ($("#agreeAll").prop("checked")) {
                $(":checkbox[name=agree]").prop("checked", true);
                $(":checkbox[name=agree2]").prop("checked", true);
            } else {
                $(":checkbox[name=agree]").prop("checked", false);
                $(":checkbox[name=agree2]").prop("checked", false);
            }
        });

        $(":checkbox[name=agree]").on("change", function() {
            var allChecked = $(":checkbox[name=agree]").length === $(":checkbox[name=agree]:checked").length;
            $("#agreeAll").prop("checked", allChecked);
        });

        $("#agree").on("change", function() {
            if ($("#agree").prop("checked")) {
                $(":checkbox[name=agree2]").prop("checked", true);
            } else {
                $(":checkbox[name=agree2]").prop("checked", false);
                $("#agreeAll").prop("checked", false);
            }
        });

        $(":checkbox[name=agree2]").on("change", function() {
            var allChecked = $(":checkbox[name=agree2]").length === $(":checkbox[name=agree2]:checked").length;
            $("#agree").prop("checked", allChecked);
            
            // 전체 동의 체크박스 상태 업데이트
            var allAgreeChecked = $(":checkbox[name=agree]").length === $(":checkbox[name=agree]:checked").length &&
                                  $(":checkbox[name=agree2]").length === $(":checkbox[name=agree2]:checked").length;
            $("#agreeAll").prop("checked", allAgreeChecked);
        });
    });

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
                alert("구매가 완료되었습니다. 스토어 메인화면으로 이동합니다.");
                savePaymentDetails(rsp); // 결제정보 저장
                window.location.href = "${pageContext.request.contextPath}/store/storeMain";
            } else {
                alert("결제 실패: " + rsp.error_msg);
            }
        });
    }

    function savePaymentDetails(rsp) { // 결제정보 저장
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
                member_num: "${sessionScope.member_num}", // 회원 번호
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
    
	// 장바구니에서 상품 제거
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
            	alert("상품을 삭제하였습니다."); 
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
    
 	// 수량 증가 버튼 클릭 이벤트
    $(document).on("click", ".quantity-increase", function() {
        let $input = $(this).closest("span").find(".cart_quantity");
        let currentValue = parseInt($input.val());
        if (currentValue < 10) {
        	$input.val(currentValue + 1);
        }
        
    });

    // 수량 감소 버튼 클릭 이벤트
    $(document).on("click", ".quantity-decrease", function() {
        let $input = $(this).closest("span").find(".cart_quantity");
        let currentValue = parseInt($input.val());
        if (currentValue > 1) {
            $input.val(currentValue - 1);
        }
    });
	
    // 수량 변경 후 적용 버튼 누르면
    $(document).on("click", ".apply-changes", function() {
        // 버튼 클릭 시 실행할 코드
        let $row = $(this).closest("tr");  // 현재 버튼이 포함된 행을 찾기
        let newQuantity = $row.find(".cart_quantity").val();  // 새 수량 값 가져오기
        let cartNum = $row.find(".cart_num").val();  // 장바구니 번호 가져오기

        // 서버에 AJAX 요청 보내기
        $.ajax({
            url: "${pageContext.request.contextPath}/store/updateCartQuantity",
            type: "POST",
            contentType: "application/json",
            dataType: "text",
            data: JSON.stringify({
                cart_num: cartNum,
                cart_quantity: newQuantity,
                member_num: "${memberDTO.member_num}"
            }),
            success: function(response) {
                if (response === "success") {
                    alert("수량이 성공적으로 업데이트되었습니다.");
                    location.reload();  // 페이지 새로고침
                } else {
                    alert("수량 업데이트 실패: " + response);
                }
            },
            error: function() {
                alert("서버 통신 오류");
            }
        });
    });
    


</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/ticket/top.jsp" />

	<jsp:include page="../store/storeMenu.jsp" />

	<section id="content">
		<div class="store_progress">
			<div id="prog_img">
				<img src="http://c5d2308t1.itwillbs.com/iTicket/resources/img/cart2.png">
			</div>
			<div id="progress_red">
				<span class="step">STEP 01</span><br>장바구니/결제하기
			</div>
			<div>
				<span class="bracket"> &gt; </span>
			</div>
			<div id="prog_img">
				<img src="http://c5d2308t1.itwillbs.com/iTicket/resources/img/pay1.png">
			</div>
			<div>
				<span class="step">STEP 02</span><br>결제완료
			</div>
		</div>

		<!-- 구매 상품 정보 테이블 -->
		<div class="store_pay" style="text-align: center; margin-left: 24%;">
			<div class="store_pay_box">
				<div class="store_subject">장바구니</div>
				<table class="store_pay_table">
					<tbody>
						<tr class="store_table_box01">
							<!-- 이미지와 상품정보 두칸 합치기 위해 상품명 colspan2 사용 -->
							<th>상품명</th>
							<th>가격</th>
							<th>수량</th>
							<th>합계금액</th>
							<th>삭제하기</th>
							<!-- 							<th>구매금액</th> -->
						</tr>

						<c:if test="${not empty cartItemList}">
							<c:forEach var="item" items="${cartItemList}">
								<tr class="store_table_box02 cart_item"
									style="border-bottom: 2px solid #9d9d9d;">
									<td class="st_name"><span> ${item.st_name}</span></td>
									<td class="st_price">
										<span>${item.st_price}원</span><br>
									</td>
									<td>
									<span><button type="button" class="quantity-decrease">-</button> 
										<input type="number" size="1" name="cart_quantity" class="cart_quantity"
											value="${item.cart_quantity}" min="1" max="99" readonly
											style="text-align: center; font-size: 20px;"> 
										<input type="hidden" name="st_num" class="st_num" value="${item.st_num}"> 
										<input type="hidden" name="cart_num" class="cart_num" value="${item.cart_num}">
<%-- 										<input type="hidden" name="member_num" class="member_num" value="${item.member_num}"> --%>
											<button type="button" class="quantity-increase">+</button>
											<button type="button" class="apply-changes">적용</button></span></td>
									<td class="product_total_price">${item.st_price * item.cart_quantity}원</td>
									
									<td><button type="button" onclick="removeFromCart(${item.cart_num})">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</c:if>

						<c:if test="${empty cartItemList}">
							<tr>
								<td colspan="7" align="center" style="padding: 30px; font-size: 19px;">장바구니에
									상품이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>

			</div>
			<br>
			<div class="">
				<div class="store_subject">주문자 정보확인</div>
				<div class="store_member_info">
					<section>
						<span><b>이름</b> 
						<input type="text" value="${memberDTO.member_name }" readonly="readonly"></span> 
						<span><b>닉네임</b>
						<input type="text" value="${memberDTO.member_nickname }"
							readonly="readonly"></span> 
						<span><b>휴대전화 번호</b> 
						<input type="text" value="${memberDTO.member_phone }" readonly="readonly"></span>
					</section>
				</div>
				<div class="store_member_info_ex">
					* 사용자 정보가 고객님의 정보와 다를 시 <br> &nbsp; 사용자 정보 조회 또는 관리자에게 문의
					바랍니다.
				</div>
			</div>

			<div class="store_payment">
				<div class="store_subject" onclick="passTriger()">총 결제금액</div>
				<div class="store_payment_line">
					<section>
						<span id="totalPriceDisplay" style="font-size: 30px; color:red;">0원</span>
					</section>
				</div>
			</div>

			<div class="store_pay_info">
				<div class="store_pay_info_check">
					<input type="checkbox" id="agreeAll">주문정보/결제 대행 서비스 약관 모두
					동의
				</div>
				<div class="store_pay_info_group">
					<div class="info01">
						<input type="checkbox" name="agree">기프트콘 구매 동의 <br> <span
							class="info01_01">&nbsp;&nbsp;&nbsp;기프트콘 발송 및 CS 처리 등을 이해
							수신자로부터 영화관에 수신자의 전화번호를 제공하는 것에 대한 적합한 동의를 받습니다.</span>
					</div>
					<div class="info02">
						<input type="checkbox" id="agree" name="agree"> 결제 대행 서비스
						약관 모두 동의 <br>&nbsp;&nbsp;
						<input type="checkbox" id="terms1" name="agree2">전자금융거래 이용약관 <br>&nbsp;&nbsp;
						<input type="checkbox" id="terms2" name="agree2">개인정보 수집 이용약관 <br>&nbsp;&nbsp;
						<input type="checkbox" id="terms3" name="agree2">개인정보 제공 및 위탁안내
					</div>
				</div>
			</div>
			<div class="paybtn">
				<a href="${pageContext.request.contextPath}/store/storeMain"><input
					type="button" value="스토어로" class="goStore"></a> <input
					type="button" value="결제하기" id="subBtn" onclick="subBtnClick()">
			</div>
		</div>
	</section>


</body>
</html>