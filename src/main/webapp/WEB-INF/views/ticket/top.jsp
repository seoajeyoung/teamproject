<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/test.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/tnb.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/layout.css">

<script
	src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/top.js"></script>

</head>
<body>

	<div class="header">
		<!-- 서비스 메뉴 -->

		<div class="header_content">
			<div class="contents">
				<h1 onclick="">
					<a href="/"><img
						src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png"
						alt="CGV"></a><span>DEEP DIVE SPACE</span>
				</h1>
				<c:choose>
					<c:when test="${sessionScope.member_num == '1'}">
						<ul class="memberInfo_wrap">
							<li><a href="/user/mycgv/"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"
									alt="admin"><span>관리자 페이지</span></a></li>
						</ul>
					</c:when>

					<c:when
						test="${not empty sessionScope.member_num and sessionScope.member_num != '1'}">
						<ul class="memberInfo_wrap">

							<li><a
								href="/user/login/?returnURL=https%3a%2f%2fwww.cgv.co.kr%2fdefault.aspx"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png"
									alt="로그아웃"><span>로그아웃</span></a></li>

							<li><a href="/user/mycgv/"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"
									alt="MY CGV"><span>MY CGV</span></a></li>
							<li><a href="/support/default.aspx"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png"
									alt="고객센터"><span>고객센터</span></a></li>
						</ul>

					</c:when>

					<c:otherwise>
						<ul class="memberInfo_wrap">


							<li><a
								href="/user/login/?returnURL=https%3a%2f%2fwww.cgv.co.kr%2fdefault.aspx"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png"
									alt="로그인"><span>로그인</span></a></li>
							<li><a href="/user/join/"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png"
									alt="회원가입"><span>회원가입</span></a></li>


							<li><a href="/user/mycgv/"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"
									alt="MY CGV"><span>MY CGV</span></a></li>
							<li><a href="/support/default.aspx"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png"
									alt="고객센터"><span>고객센터</span></a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

 

		<div class="nav" style="left: 0px;">
			<div class="contents">
				<h1>
					<a href="/" tabindex="-1"><img
						src="https://img.cgv.co.kr/R2014/images/common/logo/logoWhite.png"
						alt="CGV"></a>
				</h1>
				<ul class="nav_menu">
					<li>
						<h2>
							<a href="/movies/?lt=1&amp;ft=0">영화</a>
						</h2>
						<dl class="nav_overMenu" style="display: none;">
							<dt>
								<h2>
									<a href="/movies/?lt=1&amp;ft=0" tabindex="-1">영화</a>
								</h2>
							</dt>
							<dd>
								<h3>
									<a href="/movies/?lt=1&amp;ft=0">무비차트</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a href="/arthouse/">아트하우스</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a href="/culture-event/event/detailViewUnited.aspx?seq=30717">ICECON</a>
								</h3>
							</dd>
						</dl>
					</li>
					<li>
						<h2>
							<a href="/theaters/">극장</a>
						</h2>
						<dl class="nav_overMenu" style="display: none;">
							<dt>
								<h2>
									<a href="/theaters/" tabindex="-1">극장</a>
								</h2>
							</dt>
							<dd>
								<h3>
									<a href="/theaters/">CGV 극장</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a href="/theaters/special/defaultNew.aspx">특별관</a>
								</h3>
							</dd>
						</dl>
					</li>
					<li>
						<h2>
							<a href="/ticket/"><strong>예매</strong></a>
						</h2>
						<dl class="nav_overMenu" style="display: none;">
							<dt>
								<h2>
									<a href="/ticket/" tabindex="-1">예매</a>
								</h2>
							</dt>
							<dd>
								<h3>
									<a href="/ticket/">빠른예매</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a href="/reserve/show-times/">상영스케줄</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a href="/ticket/eng/newdefault.aspx">English Ticketing</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a href="/reserve/show-times/eng/">English Schedule</a>
								</h3>
							</dd>
						</dl>
					</li>
					<li>
						<h2>
							<a href="/culture-event/popcorn-store/">스토어</a>
						</h2>
						<dl class="nav_overMenu" style="display: none;">
							<dt>
								<h2>
									<a href="/culture-event/popcorn-store/" tabindex="-1">스토어</a>
								</h2>
							</dt>

							<dd>
								<h3>
									<a
										href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=1">패키지</a>
								</h3>
							</dd>

							<dd>
								<h3>
									<a
										href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=2">영화관람권</a>
								</h3>
							</dd>

							<dd>
								<h3>
									<a
										href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=3">기프트카드</a>
								</h3>
							</dd>

							<dd>
								<h3>
									<a
										href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=4">콤보</a>
								</h3>
							</dd>

							<dd>
								<h3>
									<a
										href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=5">팝콘</a>
								</h3>
							</dd>

							<dd>
								<h3>
									<a
										href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=6">음료</a>
								</h3>
							</dd>

							<dd>
								<h3>
									<a
										href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=7">스낵</a>
								</h3>
							</dd>

							<dd>
								<h3>
									<a
										href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=10">플레이존</a>
								</h3>
							</dd>

							<!-- 2024.06.27 씨네샵 URL 변경 요청 -->
							<dd>
								<h3>
									<a href="https://brand.naver.com/cgv" class="arrowR"
										target="_blank">씨네샵</a>
								</h3>
							</dd>
						</dl>
					</li>
					<li>
						<h2 onclick="gaEventLog('PC_GNB','주메뉴_이벤트','')">
							<a href="/culture-event/event/defaultNew.aspx">이벤트</a>
						</h2>
						<dl class="nav_overMenu" style="display: none;">
							<dt>
								<h2>
									<a href="/culture-event/event/defaultNew.aspx?mCode=001"
										tabindex="-1">이벤트</a>
								</h2>
							</dt>
							<dd>
								<h3>
									<a href="/culture-event/event/defaultNew.aspx?mCode=001">SPECIAL</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a href="/culture-event/event/defaultNew.aspx?mCode=004">영화/예매</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a href="/culture-event/event/defaultNew.aspx?mCode=008">멤버십/CLUB</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a href="/culture-event/event/defaultNew.aspx?mCode=005">CGV
										극장별</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a href="/culture-event/event/defaultNew.aspx?mCode=006">제휴할인</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a href="/user/mycgv/event/result_list.aspx">당첨자 발표</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a href="/culture-event/event/end-list.aspx">종료된 이벤트</a>
								</h3>
							</dd>
						</dl>
					</li>
					<li>
						<h2 onclick="gaEventLog('PC_GNB','주메뉴_해택','')">
							<a href="/discount/discountlist.aspx">혜택</a>
						</h2>
						<dl class="nav_overMenu" style="display: none;">
							<dt>
								<h2>
									<a href="/discount/discountlist.aspx" tabindex="-1">혜택</a>
								</h2>
							</dt>
							<dd>
								<h3>
									<a href="/discount/discountlist.aspx">CGV 할인정보</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a
										href="https://www.cgv.co.kr/user/memberShip/ClubService.aspx">CLUB
										서비스</a>
								</h3>
							</dd>
							<dd>
								<h3>
									<a href="/user/vip-lounge/">VIP 라운지</a>
								</h3>
							</dd>
						</dl>
					</li>
				</ul>
				
			</div>
		</div>
		<!-- 서브 메뉴 -->
	</div>

</body>
</html>