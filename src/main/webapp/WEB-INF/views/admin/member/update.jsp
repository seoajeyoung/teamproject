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

<title>OSTicket - MemberUpdate</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/update.css">

<!-- Custom fonts for this template -->
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

		<!-- Sidebar include -->
		<jsp:include page="/WEB-INF/views/admin/inc/sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<br>

				<!-- Topbar include -->
				<%-- 				<jsp:include page="/WEB-INF/views/admin/inc/top.jsp" /> --%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800"
						style="margin-left: 30px; padding-top: 12px;">회원 정보 수정</h1>
					<hr style="margin-bottom: 20px; margin-top: 30px;">

					<!-- DataTales -->
					<div class="card shadow mb-4">

						<div class="card-body">
							<div class="table-responsive">

								<form
									action="${pageContext.request.contextPath}/admin/member/updatePro"
									method="post">

									<table class="table table-infoboard" id="dataTable"
										width="100%" cellspacing="0">
										<thead>
											<tr>
												<th colspan="4" class="column-header">상세정보</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th class="column-header">회원번호</th>
												<td><input type="hidden" name="MEM_NUM"
													value="${adminDTO.MEM_NUM}">${adminDTO.MEM_NUM}</td>
												<th class="column-header" style="width: 286px;">회원ID</th>
												<td><input type="text" name="MEM_ID"
													value="${adminDTO.MEM_ID}" readonly></td>
											</tr>
											<tr>
												<th class="column-header">비밀번호</th>
												<td><input type="password" name="MEM_PASS"
													value="${adminDTO.MEM_PASS}"></td>
												<th class="column-header">이름</th>
												<td><input type="text" name="MEM_NAME"
													value="${adminDTO.MEM_NAME }"></td>
											</tr>
											<tr>
												<th class="column-header">전화번호</th>
												<td><input type="text" name="MEM_PHONE"
													value="${adminDTO.MEM_PHONE }"></td>
												<th class="column-header">회원등급</th>
												<td>${adminDTO.MEM_GRADE}</td>
											</tr>
											<tr>
												<th class="column-header">이메일</th>
												<td colspan="3"><input type="text" name="MEM_EMAIL"
													value="${adminDTO.MEM_EMAIL}"></td>
											</tr>
											<tr>
												<th class="column-header">보유포인트</th>
												<td>${adminDTO.PO_CURP}  점</td>
												<th class="column-header">누적포인트</th>
												<td>${adminDTO.PO_CUMP}  점</td>
											</tr>
											<tr>
												<th class="column-header">지급할포인트</th>
												<td colspan="3"><input type="text" name="sPoint"
													value="0"> 점</td>
											</tr>
											<tr>
												<th class="column-header">지급사유</th>
												<td colspan="3"><select id="detailList"
													name="DE_DETAIL">
														<option value="">지급사유를 선택하세요</option>
														<c:forEach var="list" items="${detailList}">
															<option value="${list.DE_DETAIL}">${list.DE_DETAIL}</option>
														</c:forEach>
												</select></td>
											</tr>
											<tr>
												<th class="column-header">포인트지급기록</th>
												<td colspan="3"><pre>${adminDTO.PO_HIS}</pre></td>
											</tr>
										</tbody>
									</table>
									<button type="submit" class="btn btn-success btn-user"
										style="float: right; font-weight: bold;">수정완료</button>
								</form>
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
		src="${pageContext.request.contextPath}/resources/js/osticketAdmin.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>

</body>

</html>