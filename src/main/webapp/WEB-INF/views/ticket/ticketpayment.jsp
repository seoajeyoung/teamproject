<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section id="content">
			<div class="store_progress">
				<div id="prog_img"><img src="/iTicket/resources/img/pay2.png"></div><div id="progress_red"><span class="step">STEP 01</span><br>결제하기</div>
				<div> <span class="bracket"> &gt; </span> </div>
				<div id="prog_img"><img src="/iTicket/resources/img/finish1.png"></div><div><span class="step">STEP 02</span><br>예매완료</div>
			</div>
			
			<!-- 구매 상품 정보 테이블 -->
			<div class="store_pay">
				<div class="store_pay_box">
					<div class="store_subject">구매상품 정보</div>
					<table class="store_pay_table">
						<tbody><tr class="store_table_box01">
							<!-- 이미지와 상품정보 두칸 합치기 위해 상품명 colspan2 사용 -->
							<th>영화정보</th>
							<th>극장정보</th>
							<th>상영일정 </th>
							<th>인원 </th>
							<th>좌석 </th>
							<th>구매금액</th>
						</tr>
						<!-- 이미지 가격표 없는 이미지로 편집 -->
						<!-- 단일 구매 인 경우 바로 결제 페이지에 데이터 입력 -->
						<!-- 장바구니에서 넘어오는 경우 랑 단일인 경우 판별 -->
						<!-- 장바구니에서 넘어오는 데이터 테이블화 시켜서 보여줄것 -->
							<tr class="store_table_box02">
								<td><span>데드맨</span></td>
								<td> 
									<span>서면</span><br>
									<span>1관</span><br>
								</td>
								<td><span>2024-08-23<br>12:00</span></td>
								<td>일반3 </td>
								<td>A5,B5,C5 </td>
								<td id="totalPrice">45000</td>
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
							<span><b>이름</b> <input type="text" value="관리자" readonly="readonly"></span>
							<span><b>휴대전화 번호</b> <input type="text" value="010-1111-2222" readonly="readonly"></span>
						</section>
					</div>
					<div class="store_member_info_ex">* 구매하신 기프티콘은 주문자 정보에 입력된 휴대전화 번호로
					MMS로 발송 됩니다. <br> &nbsp; 입력된 휴대전화 번호가 맞는지 꼭 확인하세요</div>
				</div>
				
				<div class="store_payment">
					<div class="store_subject" onclick="passTriger()">결제 수단</div>
					<div class="store_payment_line">
						<section>
							<span><input type="radio" value="html5_inicis" name="radiocheck" onclick="radio(this)"><b>신용카드</b></span>
							<span><input type="radio" value="kakaopay" name="radiocheck" onclick="radio(this)">kakao<b>Pay</b></span>
						</section>
					</div>	
				</div>
			
				<div class="store_pay_info">
					<div class="store_pay_info_check"><input type="checkbox" onclick="checkAll()">주문정보/결제 대행 서비스 약관 모두 동의</div>
					<div class="store_pay_info_group">
						<div class="info01"><input type="checkbox">기프트콘 구매 동의
							<br> <span class="info01_01">&nbsp;&nbsp;&nbsp;기프트콘 발송 및 CS 처리 등을 이해 수신자로부터 영화관에 수신자의 전화번호를 제공하는 것에 대한 적합한 동의를 받습니다.</span>
						</div>
						<div class="info02"><input type="checkbox" onclick="checkAll2()">결제 대행 서비스 약관 모두 동의 
							<br>&nbsp;&nbsp;<input type="checkbox" id="terms1">전자금융거래 이용약관
							<br>&nbsp;&nbsp;<input type="checkbox" id="terms2">개인정보 수집 이용약관
							<br>&nbsp;&nbsp;<input type="checkbox" id="terms3">개인정보 제공 및 위탁안내
						</div>
					</div>
				</div>
				<div class="paybtn">
					<form action="completePay" method="get" id="reservePayForm">
						<input type="button" value="이전화면" class="back">
						<input type="hidden" name="movie_title" id="movie_title" value="데드맨">
						<input type="hidden" name="theater_name" value="서면">
						<input type="hidden" name="room_name" value="1관">
						<input type="hidden" name="play_date" value="2024-08-23">
						<input type="hidden" name="play_start_time" value="12:00">
						<input type="hidden" name="typeCount" value="일반3">
						<input type="hidden" name="seat_name" value="A5,B5,C5">
						<input type="hidden" class="totalPriceResult" name="payment_total_price" value="45000">
						<input type="button" value="결제하기" id="subBtn" onclick="subBtnClick()">
					</form>
				</div>
			</div>
		</section>


</body>
</html>