<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OSTicket - MyPage</title>
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/customer.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/content.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/giftstore.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/layout.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/module.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/reset.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/newinsert.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
</head>
<body>
	<div id="contaniner" class="">
		<!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->


		<!-- Contents Area -->
		<div id="contents" class="">
		<jsp:include page="/WEB-INF/views/ticket/top.jsp" />


			<!-- Contents Start -->

			<!-- Contents Area -->
			<div id="contents">
				<!-- Contents Start -->
				<div class="cols-content">

					<div class="col-aside">
						<h2>MYPAGE 메뉴</h2>
						<div class="snb">
							<ul>
								<li class="on"><a
									href="${pageContext.request.contextPath}/mypage/mymain">MY
										OSTicket HOME<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/mypage/myinfo">나의
										정보<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/mypage/mypayment">나의
										결제 내역<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/movie/bookmarkMovie">나의 선호 영화<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/often"
									title="현재선택">자주찾는 질문<i></i></a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/write">1 :
										1 문의하기<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/list">문의/답변<i></i></a></li>
							</ul>
						</div>
						<div class="ad-area">
							<div class="ad-partner01">
								<iframe
									src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@C_Rectangle"
									width="160" height="300" title="기업광고-하나TV쇼핑" frameborder="0"
									scrolling="no" marginwidth="0" marginheight="0"
									name="C_Rectangle" id="C_Rectangle"></iframe>
							</div>
							<div class="ad-partner02">
								<iframe
									src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@Image_text"
									width="160" height="35" title="영화광고-꾸뻬씨의행복여행" frameborder="0"
									scrolling="no" marginwidth="0" marginheight="0"
									name="Image_text" id="Image_text"></iframe>
							</div>
						</div>
					</div>
					<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
					<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
					<div class="col-detail">
						<div class="mycgv-info-wrap">
							<div class="skipnaiv">
								<a href="#menu" id="skipPersoninfo">개인화영역 건너띄기</a>
							</div>
							<div class="sect-person-info">
								<h2 class="hidden">개인화 영역</h2>
								<div class="box-image">
									<span class="thumb-image"> <img
										src="https://img.cgv.co.kr/MyCGV/Profile/2015/0713/kis0726_053122_M.jpg"
										onerror="errorImage(this, {'type':'profile'})"> <span
										class="profile-mask"></span>
									</span>
								</div>
								<div class="box-contents newtype" style="width: 520px;">
									<div class="person-info">
										<strong>${mypageDTO.MEM_NAME}님</strong> <em>${sessionScope.member_id}</em>
										<span>닉네임 : ${mypageDTO.MEM_NICKNAME} </span>
									</div>
									<div class="grade-info">

										<p
											style="margin-bottom: 4px; color: #342929; font-family: 'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif; font-size: 20px; line-height: 20px;">

											고객님은 <strong class="txt-purple">${mypageDTO.MEM_GRADE}</strong>
											입니다.

										</p>

										<button type="button" id="view_usergrade" class="round black"
											onclick="location.href='${pageContext.request.contextPath}/mypage/mypoint';">
											<span>MY POINT 이력 보기</span>
										</button>

									</div>
								</div>
							</div>
							<div class="cols-benefit-info">
								<div class="col-my-coupon">
									<h3>보유중인 상품</h3>
									<br> <br>
									<ul>

										<li><strong>OSTicket 할인쿠폰 </strong><span style="font-weight: bold;">0 개</span> </li>
										<li><strong>영화관람권</strong><span style="font-weight: bold;">0 개</span> </li>
									</ul>
								</div>


								<div class="col-one-point">
									<h3>OSTicket POINT</h3>
									<ul>
										<li><strong>OSTicket 사용가능 포인트</strong> <span><em
												class="txt-maroon">${point.PO_CURP}</em> 점</span></li>
									</ul>
									<!-- 2022.11.15 VIP 1차 개편 관련 수정-->
									<div class="myCgv_content">
										<h3>VIP 점수</h3>
										<ul>
											<li><strong>VIP 누적 포인트 </strong> <span>${point.PO_CUMP}점</span></li>
										</ul>
									</div>


								</div>



							</div>
						</div>

					</div>

					<!--/ Contents End -->
				</div>
				<!-- /Contents Area -->
			</div>
</body>
</html>