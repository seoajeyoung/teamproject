<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css">
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
			style="font-size: 30px; margin-left: 5px !important;">OSTicket</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link"
		href="${pageContext.request.contextPath}/main/main"
		style="text-align: center; padding-top: 15px; padding-bottom: 15px; font-size: 17px;">
			<i class="fas fa-fw fa-home"></i> <span>OSTicket<br>공식
				홈페이지
		</span>
	</a></li>

	<!-- Divider -->
	<!--             <hr class="sidebar-divider"> -->

	<!-- Heading -->
	<!--             <div class="sidebar-heading"> -->
	<!--                 Interface -->
	<!--             </div> -->

	<!-- Nav Item - Pages Collapse Menu -->
	<!--             <li class="nav-item"> -->
	<!--                 <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" -->
	<!--                     aria-expanded="true" aria-controls="collapseTwo"> -->
	<!--                     <i class="fas fa-fw fa-cog"></i> -->
	<!--                     <span>Components</span> -->
	<!--                 </a> -->
	<!--                 <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar"> -->
	<!--                     <div class="bg-white py-2 collapse-inner rounded"> -->
	<!--                         <h6 class="collapse-header">Custom Components:</h6> -->
	<!--                         <a class="collapse-item" href="buttons.html">Buttons</a> -->
	<!--                         <a class="collapse-item" href="cards.html">Cards</a> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--             </li> -->

	<!--             Nav Item - Utilities Collapse Menu -->
	<!--             <li class="nav-item"> -->
	<!--                 <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" -->
	<!--                     aria-expanded="true" aria-controls="collapseUtilities"> -->
	<!--                     <i class="fas fa-fw fa-wrench"></i> -->
	<!--                     <span>Utilities</span> -->
	<!--                 </a> -->
	<!--                 <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" -->
	<!--                     data-parent="#accordionSidebar"> -->
	<!--                     <div class="bg-white py-2 collapse-inner rounded"> -->
	<!--                         <h6 class="collapse-header">Custom Utilities:</h6> -->
	<!--                         <a class="collapse-item" href="utilities-color.html">Colors</a> -->
	<!--                         <a class="collapse-item" href="utilities-border.html">Borders</a> -->
	<!--                         <a class="collapse-item" href="utilities-animation.html">Animations</a> -->
	<!--                         <a class="collapse-item" href="utilities-other.html">Other</a> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--             </li> -->

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading"
		style="font-size: 15px; padding-left: 25px;">목차</div>

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
			style="font-size: 17px; padding-left: 8px;">회원관리</span>
	</a>
		<div id="collapsePages2" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header" style="font-size: 12px;">member:</h6>
				<a class="collapse-item"
					href="${pageContext.request.contextPath}/admin/member/memberlist"
					style="font-size: 15px;">회원목록</a>
				<%--                         <a class="collapse-item" href="${pageContext.request.contextPath}/admin/member/setm">메일보내기</a> --%>
				<div class="collapse-divider"></div>
			</div>
		</div></li>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapsePages3"
		aria-expanded="true" aria-controls="collapsePages"> <i
			class="fas fa-fw fa-folder"></i> <span
			style="font-size: 17px; padding-left: 8px;">영화관리</span>
	</a>
		<div id="collapsePages3" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header" style="font-size: 12px;">movie:</h6>
				<a class="collapse-item"
					href="${pageContext.request.contextPath}/admin/movie/movielist"
					style="font-size: 15px;">영화목록</a> <a class="collapse-item"
					href="${pageContext.request.contextPath}/admin/movie/movieschedule"
					style="font-size: 15px;">상영일정관리</a> <a class="collapse-item"
					href="${pageContext.request.contextPath}/admin/movie/theaterinsert"
					style="font-size: 15px;">상영지점관리</a> <a class="collapse-item"
					href="${pageContext.request.contextPath}/admin/movie/bookinglist"
					style="font-size: 15px;">영화예매관리</a>
			</div>
		</div></li>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapsePages4"
		aria-expanded="true" aria-controls="collapsePages"> <i
			class="fas fa-fw fa-folder"></i> <span
			style="font-size: 17px; padding-left: 8px;">스토어관리</span>
	</a>
		<div id="collapsePages4" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header" style="font-size: 12px;">store:</h6>
				<a class="collapse-item"
					href="${pageContext.request.contextPath}/admin/store/controlstore"
					style="font-size: 15px;">스토어상품관리</a> <a class="collapse-item"
					href="${pageContext.request.contextPath}/store/controlmenu"
					style="font-size: 15px;">스토어메뉴관리</a>
			</div>
		</div></li>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapsePages5"
		aria-expanded="true" aria-controls="collapsePages"> <i
			class="fas fa-fw fa-folder"></i> <span
			style="font-size: 17px; padding-left: 8px;">고객센터</span>
	</a>
		<div id="collapsePages5" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header" style="font-size: 12px;">inquiry:</h6>
				<a class="collapse-item"
					href="${pageContext.request.contextPath}/inquiry/Imain"
					style="font-size: 15px;">공식홈페이지 고객센터</a>
			</div>
		</div></li>
		
	<!-- Nav Item - Charts -->
	<!--             <li class="nav-item"> -->
	<!--                 <a class="nav-link" href="charts.html"> -->
	<!--                     <i class="fas fa-fw fa-chart-area"></i> -->
	<!--                     <span>Charts</span></a> -->
	<!--             </li> -->

	<!-- Nav Item - Tables -->
	<!--             <li class="nav-item"> -->
	<%--                 <a class="nav-link" href="${pageContext.request.contextPath}/admin/tables"> --%>
	<!--                     <i class="fas fa-fw fa-table"></i> -->
	<!--                     <span>Tables</span></a> -->
	<!--             </li> -->

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">
	
	<li class="nav-item active"><a class="nav-link"
		href="${pageContext.request.contextPath}/admin/logout"
		style="text-align: center;padding-top: 3px;padding-bottom: 20px;font-size: 17px;padding-left: 27px;">
			<i class="fas fa-fw fa-plug"></i> <span>로그아웃
		</span>
		</a></li>

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
<!-- End of Sidebar -->