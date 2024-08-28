<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>OSTicket - StorePaymentInfo</title>

<!-- Custom fonts for this template -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/info.css">
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/osticketAdmin.css"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/admin/inc/sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<br>

				<!-- Topbar -->
				<%-- 				<jsp:include page="/WEB-INF/views/admin/inc/top.jsp" /> --%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800"
						style="margin-left: 30px; padding-top: 12px;">결제 상세 정보</h1>
					<hr style="margin-bottom: 20px; margin-top: 30px;">

					<!-- DataTales -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-infoboard" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th colspan="4">상세정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>결제번호</th>
											<td style="width: 556px;">${adminDTO.SP_NUM}</td>
											<th>회원ID</th>
											<td>${adminDTO.MEM_ID}</td>
										</tr>
										<tr>
											<th>결제가격</th>
											<td>${adminDTO.PRODUCT_TOTAL_PRICE} 원</td>
											<th>결제시간</th>
											<td>${adminDTO.PAYMENT_DATE}</td>
										</tr>
										<tr>
											<th>상품명</th>
											<td>${adminDTO.ST_NAME}</td>
											<th>상품타입</th>
											<td>${adminDTO.ST_TYPE}</td>
										</tr>
										<tr>
											<th>상품구성</th>
											<td colspan="3">${adminDTO.ST_CONST}</td>
										</tr>
									</tbody>

								</table>
								<button type="button" class="btn btn-danger btn-user"
									id="btn_cancel" style="float: right;">뒤로가기</button>

							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
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



	<script>
		document.getElementById('btn_cancel').addEventListener('click',
				function() {
					window.history.back();
				});
	</script>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/script/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<%--     <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script> --%>

</body>

</html>