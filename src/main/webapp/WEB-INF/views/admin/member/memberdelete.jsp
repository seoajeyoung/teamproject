<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<!-- <style> -->

<!--    .border-left-success { -->
<!--   	border-left: 0.25rem solid #e74a3b; !important; -->
<!-- 	} -->

<!-- </style> -->

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>OSTicke - Delete</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/osticketAdmin.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar Include -->
		<jsp:include page="/WEB-INF/views/admin/inc/sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<br>

				<!-- Topbar Include -->
				<%--             <jsp:include page = "/WEB-INF/views/admin/inc/top.jsp"/> --%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800"
						style="margin-left: 30px; padding-top: 12px;">회원탈퇴</h1>
					<hr style="margin-bottom: 100px; margin-top: 30px;">

				</div>
				<!-- /.container-fluid -->
				<div class="row justify-content-center">
					<div class="col-xl-4 col-md-6 mb-4">
						<div class="card border-left-danger shadow h-100 py-2"
							style="width: 465px; margin-right: 30px;" >
							<div class="card-body">
								<form id="respiteForm"
									action="${pageContext.request.contextPath}/admin/member/memberRespitePro"
									method="post">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-danger text-uppercase mb-1">
												탈퇴(유예)</div>
											<div class="h5 mb-2 font-weight-bold text-gray-800 mb-4">${memberDTO.member_id}
												회원탈퇴(6개월 유예) 하시겠습니까?</div>
										</div>
									</div>
									<input type="hidden" name="member_num"
										value="${memberDTO.member_num}">
									<button type="button" class="btn btn-light btn-icon-split"
										onclick="confirmRespite()">
										<span class="icon text-gray-600"> <i
											class="fas fa-arrow-right"></i>
										</span> <span class="text">회원탈퇴(유예)</span>
									</button>
								</form>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-md-6 mb-4">
						<div class="card border-left-success shadow h-100 py-2" style="width: 465px;">
							<div class="card-body">
								<form id="restoreForm"
									action="${pageContext.request.contextPath}/admin/member/memberRestorePro"
									method="post">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												유예복구</div>
											<div class="h5 mb-2 font-weight-bold text-gray-800 mb-4">${memberDTO.member_id}
												유예복구를 하시겠습니까?</div>
										</div>
									</div>
									<input type="hidden" name="member_num"
										value="${memberDTO.member_num}">
									<button type="button" class="btn btn-light btn-icon-split"
										onclick="confirmRestore()">
										<span class="icon text-gray-600"> <i
											class="fas fa-arrow-right"></i>
										</span> <span class="text">유예복구</span>
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer Include-->
			<jsp:include page="/WEB-INF/views/admin/inc/bottom.jsp" />
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->



	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">Ã</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- 회원탈퇴 유예-->

	<script>
		function confirmRespite() {
			if (confirm("정말 탈퇴(6개월 유예) 하시겠습니까?")) {
				document.getElementById('respiteForm').submit();
			}
		}
	</script>

	<!-- 회원탈퇴 -->

	<script>
		function confirmRestore() {
			if (confirm("정말 유예복구하시겠습니까?")) {
				document.getElementById('restoreForm').submit();
			}
		}
	</script>

	<!-- Bootstrap core JavaScrip	t-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/js/osticketAdmin.js"></script>

</body>

</html>