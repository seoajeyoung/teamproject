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

<title>OSTicket - Info</title>

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
			<div id="content"><br>

				<!-- Topbar -->
<%-- 				<jsp:include page="/WEB-INF/views/admin/inc/top.jsp" /> --%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800" style="margin-left: 30px;padding-top: 12px;">
						회원 상세정보</h1>
					<hr style="margin-bottom: 20px;margin-top: 30px;">

					<!-- DataTales -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-infoboard" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th colspan="6">상세정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>회원번호</th>
											<td>${memberDTO.member_num}</td>
											<th>아이디</th>
											<td>${memberDTO.member_id}</td>
											<th>회원등급</th>
											<td>${memberDTO.member_grade}</td>
										</tr>
										<tr>
											<th>관리자유무</th>
											<td>${memberDTO.member_admin}</td>
											<th>닉네임</th>
											<td>${memberDTO.member_nickname}</td>
											<th>전화번호</th>
											<td>${memberDTO.member_phone}</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td colspan="3">${memberDTO.member_email}</td>
											<th>비밀번호</th>
											<td>${memberDTO.member_pass}</td>
										</tr>
										<tr>
											<th>이름</th>
											<td>${memberDTO.member_name}</td>
											<th>성별</th>
											<td>${memberDTO.member_gender}</td>
											<th>생년월일</th>
											<td>${memberDTO.member_birth}</td>
										</tr>
										<tr>
											<th>주소</th>
											<td colspan="5">${memberDTO.member_address}</td>
										</tr>
										<tr>
											<th>누적포인트</th>
											<td>${memberDTO.point_cumulativeP}</td>
											<th>보유포인트</th>
											<td>${memberDTO.point_currentP}</td>
											<th>가입시간</th>
											<td>${memberDTO.member_input}</td>
										</tr>
										<tr>
											<th>탈퇴여부</th>
											<td>${memberDTO.member_status}</td>
											<th>탈퇴유예시작시간</th>
											<td>${memberDTO.member_respite}</td>
											<th>자동탈퇴시간</th>
											<td>${memberDTO.member_out}</td>
										</tr>
										<tr>
											<th>포인트지급기록</th>
											<td colspan="5"><pre>${memberDTO.point_history}</pre></td>
										</tr>
									</tbody>
								</table>

								<div class="button-container" style="text-align: right;">
									<a
										href="${pageContext.request.contextPath}/admin/member/update?member_num=${memberDTO.member_num}"
										class="btn btn-success btn-user">회원정보수정</a> 
									<a
										href="${pageContext.request.contextPath}/admin/member/memberdelete?member_num=${memberDTO.member_num}"
										class="btn btn-danger btn-user">회원정보삭제</a>
								</div>

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