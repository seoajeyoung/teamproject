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

<title>OSTicket - schedule list</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/common.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/theaterinsert.css">

<!--     Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!--     Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/osticketAdmin.css"
	rel="stylesheet">

<!--     Custom styles for this page -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- modal css, js  -->
<script
	src="${pageContext.request.contextPath}/resources/script/modal.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/real.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/modal.css">



</head>

<body id="page-top">

	<!--     Page Wrapper -->
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
					<!-- container-fluid -->


					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800"
						style="margin-left: 30px; padding-top: 12px;">영화 관 등록 관리</h1>
					<hr style="margin-bottom: 20px; margin-top: 30px;">

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-danger">관 등록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table theater-bordered" id="dataTable1"
									width="100%" cellspacing="0">
									<tbody>
										<tr>
											<th>지역</th>
											<th>극장</th>
											<th>관</th>
										</tr>
										<tr>
											<td><select id="region" name="region">
													<option value="" disabled selected>지역 선택해주세요</option>
													<c:forEach var="region" items="${th_region}">
														<c:forEach var="region" items="${region}">
															<option value="${region.value}">${region.value}</option>
														</c:forEach>
													</c:forEach>
											</select></td>
											<td id="TD_REGIONEng"><select id="th_name"
												name="th_name">
													<option value="" disabled selected>지역 먼저 등록해주세요</option>
											</select></td>
											<td><select id="theater-insert" class="theater-select">
													<option value="" disabled selected>극장 먼저 등록해주세요</option>
											</select></td>
										</tr>
									</tbody>
								</table>
								<div class="button-container">
									<button type="submit" id="btn-open-modal"
										class="btn btn-danger btn-user same-size">등록</button>
								</div>

							</div>
							<!-- table-responsive  -->
						</div>
						<!-- card-body -->
					</div>
					<!-- card shadow mb-4 -->

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-danger">결제 최대 인원 등록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table theater-bordered" id="dataTable2"
									width="100%" cellspacing="0">
									<tbody>
										<tr>
											<th>지역</th>
											<th>극장</th>
											<th>관</th>
											<th>최대 인원</th>
										</tr>
										<tr>
											<td><select id="region2" name="region2">
													<option value="" disabled selected>지역 선택해주세요</option>
													<c:forEach var="region" items="${th_region}">
														<c:forEach var="region" items="${region}">
															<option value="${region.value}">${region.value}</option>
														</c:forEach>
													</c:forEach>
											</select></td>
											<td id="TD_REGIONEng"><select id="th_name2"
												name="th_name2">
													<option value="" disabled selected>지역 먼저 등록해주세요</option>
											</select></td>
											<td><select id="theater-insert2" class="theater-select2">
													<option value="" disabled selected>극장 먼저 등록해주세요</option>
											</select></td>
											<td><input type="number" class="selectpeople"
												style="color: #888; border: 1px solid #b5b5b5; border-radius: 5px; padding: 5px;">
											</td>
										</tr>
									</tbody>
								</table>
								<div class="button-container">
									<button type="submit" id="btnperson"
										class="btn btn-danger btn-user same-size">등록</button>
								</div>

							</div>
							<!-- table-responsive  -->
						</div>
						<!-- card-body -->
					</div>



				</div>
				<!-- modal -->
				<div class="modal">
					<div class="modal_body">
						<span class="close">&times;</span>
						<form id="register-form">
							<div class="input-container">
								<label id="namecinema" class="namecinema"></label> <select
									id="theater-select" class="theater-select">
								</select>
							</div>
							<div class="input-container">
								<label for="rows">세로</label>
								<button type="button" id="decrease-rows" class="mbutton">-</button>
								<input type="number" id="rows" name="rows" value="15" min="1"
									readonly>
								<button type="button" id="increase-rows" class="mbutton">+</button>
								<label for="cols">가로</label>
								<button type="button" id="decrease-cols" class="mbutton">-</button>
								<input type="number" id="cols" name="cols" value="15" min="1"
									readonly>
								<button type="button" id="increase-cols" class="mbutton">+</button>
							</div>
							<button type="button" id="btn-create-seats" class="mbutton">생성</button>
						</form>
						<div id="seat-container">
							<div class="seat-table" id="seat-table"></div>
							<div class="button-container2">
								<button type="button" id="onetouch" class="hidden">마우스
									올리면 삭제</button>
								<button type="button" id="btn-save" class="hidden">저장</button>
							</div>
						</div>
					</div>
				</div>


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
		src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/script/demo/datatables-demo.js"></script>

</body>

</html>