<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap"
	rel="stylesheet">

</head>
<body>
	<ul
		class="navbar-nav bg-gradient-sidebar sidebar sidebar-dark accordion"
		id="accordionSidebar">



		<!-- Sidebar - Brand -->
		<a
			class="sidebar-brand d-flex align-items-center justify-content-center"
			href="${pageContext.request.contextPath}/admin/member/index"
			style="margin-bottom: 30px; padding-top: 50px; padding-bottom: 20px;">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-fw fa-tachometer-alt"></i>
			</div>
			<div class="sidebar-brand-text mx-3"
				style="font-size: 30px; margin-left: 5px !important; font-family: 'Montserrat', sans-serif !important; margin-right: 7px !important;">OSTicket</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item active"><a class="nav-link"
			href="${pageContext.request.contextPath}/main/main"
			style="text-align: center; padding-top: 15px; padding-bottom: 15px; font-size: 17px;">
				<i class="fas fa-fw fa-home"></i> <span>OSTicket<br>공식
					홈페이지 바로가기
			</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading"
			style="font-size: 15px; padding-left: 40px;">목차</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<!--             <li class="nav-item"> -->
		<!--                 <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" -->
		<!--                     aria-expanded="true" aria-controls="collapsePages"> -->
		<!--                     <i class="fas fa-fw fa-folder"></i> -->
		<!--                     <span>Pages</span> -->
		<!--                 </a> -->
		<!--                 <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar"> -->
		<!--                     <div class="bg-white py-2 collapse-inner rounded"> -->
		<!--                         <h6 class="collapse-header">Login Screens:</h6> -->
		<!--                         <a class="collapse-item" href="login.html">Login</a> -->
		<!--                         <a class="collapse-item" href="register.html">Register</a> -->
		<!--                         <a class="collapse-item" href="forgot-password.html">Forgot Password</a> -->
		<!--                         <div class="collapse-divider"></div> -->
		<!--                         <h6 class="collapse-header">Other Pages:</h6> -->
		<!--                         <a class="collapse-item" href="404.html">404 Page</a> -->
		<!--                         <a class="collapse-item" href="blank.html">Blank Page</a> -->
		<!--                     </div> -->
		<!--                 </div> -->
		<!--             </li> -->

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapsePages2"
			aria-expanded="true" aria-controls="collapsePages"> <i
				class="fas fa-fw fa-folder"></i> <span
				style="font-size: 17px; padding-left: 8px; font-weight: bold;" >회원 관리</span>
		</a>
			<div id="collapsePages2" class="collapse"
				aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header" style="font-size: 12px;">member:</h6>
					<a class="collapse-item"
						href="${pageContext.request.contextPath}/admin/member/memberlist"
						style="font-size: 15px;">회원 목록</a>
					<%--                         <a class="collapse-item" href="${pageContext.request.contextPath}/admin/member/setm">메일보내기</a> --%>
					<div class="collapse-divider"></div>
				</div>
			</div></li>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapsePages3"
			aria-expanded="true" aria-controls="collapsePages"> <i
				class="fas fa-fw fa-folder"></i> <span
				style="font-size: 17px; padding-left: 8px; font-weight: bold;">영화 관리</span>
		</a>
			<div id="collapsePages3" class="collapse"
				aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header" style="font-size: 12px;">movie:</h6>
					<a class="collapse-item"
						href="${pageContext.request.contextPath}/admin/movie/movielist"
						style="font-size: 15px;">영화 목록</a> <a class="collapse-item"
						href="${pageContext.request.contextPath}/admin/movie/movieschedule"
						style="font-size: 15px;">상영 일정 관리</a> <a class="collapse-item"
						href="${pageContext.request.contextPath}/admin/movie/theaterinsert"
						style="font-size: 15px;">상영 지점 관리</a> <a class="collapse-item"
						href="${pageContext.request.contextPath}/admin/movie/bookinglist"
						style="font-size: 15px;">영화 예매 목록</a> <a class="collapse-item"
						href="${pageContext.request.contextPath}/modal"
						style="font-size: 15px;">극장 좌석 관리</a>
				</div>
			</div></li>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapsePages4"
			aria-expanded="true" aria-controls="collapsePages"> <i
				class="fas fa-fw fa-folder"></i> <span
				style="font-size: 17px; padding-left: 8px; font-weight: bold;">스토어 관리</span>
		</a>
			<div id="collapsePages4" class="collapse"
				aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header" style="font-size: 12px;">store:</h6>
					<a class="collapse-item"
						href="${pageContext.request.contextPath}/admin/store/controlstore"
						style="font-size: 15px;">스토어 상품 관리</a> <a class="collapse-item"
						href="${pageContext.request.contextPath}/store/controlmenu"
						style="font-size: 15px;">스토어 메뉴 관리</a> <a class="collapse-item"
						href="${pageContext.request.contextPath}/admin/store/paymentlist"
						style="font-size: 15px;">스토어 결제 목록</a>
				</div>
			</div></li>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapsePages5"
			aria-expanded="true" aria-controls="collapsePages"> <i
				class="fas fa-fw fa-folder"></i> <span
				style="font-size: 17px; padding-left: 8px; font-weight: bold;">고객센터</span>
		</a>
			<div id="collapsePages5" class="collapse"
				aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header" style="font-size: 12px;">inquiry:</h6>
					<a class="collapse-item"
						href="${pageContext.request.contextPath}/inquiry/Imain"
						style="font-size: 15px;">공식 홈페이지 고객센터</a>
				</div>
			</div></li>


		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<li class="nav-item active"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/logout"
			style="text-align: center; padding-top: 3px; padding-bottom: 3px; font-size: 17px; padding-left: 27px;">
				<i class="fas fa-fw fa-plug"></i> <span>로그아웃 </span>
		</a></li>

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline" style="margin-top: 50px;">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

	</ul>
</body>
<!-- End of Sidebar -->