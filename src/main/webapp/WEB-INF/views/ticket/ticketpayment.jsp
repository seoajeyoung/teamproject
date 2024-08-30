<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/payment.css">	
	
<script
	src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>

<script 
 	src="https://cdn.iamport.kr/v1/iamport.js"></script>
 		
<script
	src="${pageContext.request.contextPath}/resources/script/ticketpayment.js"></script>
	
</head>

<script type="text/javascript">
var movietitle = "${param.movietitle}";
var th_region = "${param.th_region}";
var th_name = "${param.th_name}";
var th_number = "${param.th_number}";
var sctime = "${param.sctime}";
var seseat = "${param.seseat}";
var fulldate = "${param.fulldate}";
var totalprice = "${param.totalprice}";
var tp_num = "${param.tp_num}";

</script>

<body>
<jsp:include page="/WEB-INF/views/ticket/top.jsp" />
<section id="content">
			<div class="store_progress">
			<div id="prog_img">
				<img src="http://c5d2308t1.itwillbs.com/iTicket/resources/img/cart2.png">
			</div>
			<div id="progress_red">
				<span class="step">STEP 01</span><br>결제하기
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
			<div class="store_pay">
				<div class="store_pay_box">
					<div class="store_subject">구매상품 정보</div>
					<table class="store_pay_table">
						<tbody><tr class="store_table_box01" style="text-align: center;">
							<!-- 이미지와 상품정보 두칸 합치기 위해 상품명 colspan2 사용 -->
							<th>영화정보</th>
							<th>극장정보</th>
							<th>상영일정 </th>
							<th>인원 </th>
							<th>좌석 </th>
							<th>구매금액</th>
						</tr>
							<tr class="store_table_box02">
								<td><span> <c:out value="${param.movietitle}" /></span></td>
								<td> 
									<span><c:out value="${param.th_name}" /></span><br>
									<span><c:out value="${param.th_number}" /></span><br>
								</td>
								<td><span><c:out value="${param.fulldate}" /><br><c:out value="${param.sctime}" /></span></td>
								<td><c:out value="${param.categoryname}" /><c:out value="${param.count}" /></td>
								<td><c:out value="${param.seseat}" /> </td>
								<td id="totalPrice"><c:out value="${param.totalprice}" /></td>
							</tr>
					</tbody></table>
					
				</div>
				<br>
				<div class="">
					<div class="store_subject">주문자 정보확인</div>
					<div class="store_member_info">	
						<!-- 이름과 휴대전화 번호는 자동 저장 -->
						<!-- 이름 중간 *, 번호 중간 네자리 * 처리 -->
						<section>
							<span><b>이름</b> <input type="text" value="${selectmember.MEM_NAME}" readonly="readonly"></span>
							<span><b>휴대전화 번호</b> <input type="text" value="${selectmember.MEM_PHONE}" readonly="readonly"></span>
						</section>
					</div>
				</div>
				
			
				<div class="paybtn">
						<input type="button" value="이전화면" id="backbtn">
						<input type="button" value="결제하기" id="paymentbtn">
				</div>
			</div>
		</section>


</body>
</html>