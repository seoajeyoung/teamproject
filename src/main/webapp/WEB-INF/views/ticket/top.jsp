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
 <style>
        .sidebar-brand-text {
            font-size: 30px;
            color: red;
            margin-left: 5px !important;
            font-family: 'Montserrat', sans-serif !important;
            margin-right: 7px !important;
            text-decoration: none; /* 링크의 밑줄 제거 */
            cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능함을 표시 */
        }
    </style>
</head>
<body>

	<div class="header">
		<!-- 서비스 메뉴 -->

		<div class="header_content">
			<div class="contents">
				<h1 onclick="">
				   <a href="${pageContext.request.contextPath}/main/main" class="sidebar-brand-text mx-3">OSTicket</a>
<!-- 					<a href="/"><img -->
<%-- 						src="${pageContext.request.contextPath}/main/main" alt="CGV"></a><span>DEEP --%>
<!-- 						DIVE SPACE</span> -->
				</h1>
				<c:choose>
					<c:when test="${sessionScope.member_num == '1'}">
						<ul class="memberInfo_wrap">
							<li><a
								href="${pageContext.request.contextPath}/admin/member/index"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"
									alt="admin"><span>관리자 페이지</span></a></li>
						</ul>
					</c:when>

					<c:when
						test="${not empty sessionScope.member_num and sessionScope.member_num != '1'}">
						<ul class="memberInfo_wrap">

							<li><a
								href="${pageContext.request.contextPath}/member/logout"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png"
									alt="로그아웃"><span>로그아웃</span></a></li>

							<li><a
								href="${pageContext.request.contextPath}/mypage/mymain"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"
									alt="MY CGV"><span>MY CGV</span></a></li>
							<li><a
								href="${pageContext.request.contextPath}/inquiry/Imain"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png"
									alt="고객센터"><span>고객센터</span></a></li>
						</ul>

					</c:when>

					<c:otherwise>
						<ul class="memberInfo_wrap">


							<li><a
								href="${pageContext.request.contextPath}/member/login"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png"
									alt="로그인"><span>로그인</span></a></li>
							<li><a
								href="${pageContext.request.contextPath}/member/register"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png"
									alt="회원가입"><span>회원가입</span></a></li>
							<li><a
								href="${pageContext.request.contextPath}/inquiry/Imain"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png"
									alt="고객센터"><span>고객센터</span></a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>



		<div class="nav" style="left: 0px;">
			<div class="contents">
				<ul class="nav_menu">
					<li>
						<h2>
							<a href="${pageContext.request.contextPath}/movie/movie">영화</a>
						</h2>
						<dl class="nav_overMenu" style="display: none;">
							<dt>
								<h2>
									<a href="${pageContext.request.contextPath}/movie/movie">영화</a>
								</h2>
							</dt>
							<dd>
								<h3>
									<a href="${pageContext.request.contextPath}/movie/movie">무비차트</a>
								</h3>
							</dd>
						</dl>
					</li>
					<li>
						<h2>
							<a href="${pageContext.request.contextPath}/theater/theater">극장</a>
						</h2>
						<dl class="nav_overMenu" style="display: none;">
							<dt>
								<h2>
									<a href="${pageContext.request.contextPath}/theater/theater" tabindex="-1">극장</a>
								</h2>
							</dt>
							<dd>
								<h3>
									<a href="${pageContext.request.contextPath}/theater/theater">OST TICKET 극장</a>
								</h3>
							</dd>
						</dl>
					</li>
					<li>
						<h2>
							<a href="${pageContext.request.contextPath}/ticket"><strong>예매</strong></a>
						</h2>
						<dl class="nav_overMenu" style="display: none;">
							<dt>
								<h2>
									<a href="${pageContext.request.contextPath}/ticket" tabindex="-1">예매</a>
								</h2>
							</dt>
							<dd>
								<h3>
									<a href="${pageContext.request.contextPath}/ticket">빠른예매</a>
								</h3>
							</dd>
							
						</dl>
					</li>
					<li>
						<h2>
							<a href="${pageContext.request.contextPath}/store/storeMain">스토어</a>
						</h2>
						<dl class="nav_overMenu" style="display: none;">
							<dt>
								<h2>
									<a href="${pageContext.request.contextPath}/store/storeMain" tabindex="-1">스토어</a>
								</h2>
							</dt>

							<dd>
								<h3>
									<a
										href="${pageContext.request.contextPath}/store/productCategory?category=패키지">패키지</a>
								</h3>
							</dd>

							<dd>
								<h3>
									<a
										href="${pageContext.request.contextPath}/store/productCategory?category=영화관람권">영화관람권</a>
								</h3>
							</dd>

							<dd>
								<h3>
									<a
										href="${pageContext.request.contextPath}/store/productCategory?category=기프트카드">기프트카드</a>
								</h3>
							</dd>

							<dd>
								<h3>
									<a
										href="${pageContext.request.contextPath}/store/productCategory?category=영화관람권/팝콘">팝콘</a>
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