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

<title>OSTicket - BookingInfo</title>

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
						style="margin-left: 30px; padding-top: 12px;">예매 상세 정보</h1>
					<hr style="margin-bottom: 20px; margin-top: 30px;">

					<!-- DataTales -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-infoboard" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th colspan="10">상세정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th colspan="2">예매번호</th>
											<td colspan="4">${adminDTO.TP_NUM}</td>
											<th>회원ID</th>
											<td colspan="3">${adminDTO.member_id}</td>
										</tr>
										<tr>
											<th colspan="2">영화명</th>
											<td colspan="4">${adminDTO.title}</td>
											<th>상영관</th>
											<td>${adminDTO.TH_REGION}/${adminDTO.TH_NAME}/${adminDTO.TH_NUMBER}</td>
											<th>좌석</th>
											<td>${adminDTO.TP_SEAT}</td>
										</tr>
										<tr>
											<th colspan="2">예매날짜</th>
											<td colspan="4">${adminDTO.TP_TIME}</td>
											<th>상영시작시간</th>
											<td>${adminDTO.SC_TIME}</td>
											<th>상영종료시간</th>
											<td>${adminDTO.SC_TIME_END}</td>
										</tr>
										<tr>
											<th colspan="2">결제가격</th>
											<td colspan="4">${adminDTO.TP_PRICE}원</td>
											<th>결제유형</th>
											<td>${adminDTO.TP_TYPE}</td>
											<th>결제상태</th>
											<td>
											<c:choose>
												<c:when test="${adminDTO.TP_PAYMENT == 'T'}">
                    								결제완료
                								</c:when>
												<c:otherwise>
                    								${adminDTO.TP_PAYMENT}
                									</c:otherwise>
											</c:choose>
											</td>
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