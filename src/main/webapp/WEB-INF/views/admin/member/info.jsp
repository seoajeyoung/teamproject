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

<title>OSTicket - MemberInfo</title>

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
						style="margin-left: 30px; padding-top: 12px;">회원 상세정보</h1>
					<hr style="margin-bottom: 20px; margin-top: 30px;">

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
											<td style="width: 260px;">${adminDTO.MEM_NUM}</td>
											<th>아이디</th>
											<td style="width: 260px;">${adminDTO.MEM_ID}</td>
											<th>회원등급</th>
											<td style="width: 260px;">${adminDTO.MEM_GRADE}</td>
										</tr>
										<tr>
											<th>관리자유무</th>
											<td>${adminDTO.MEM_ADMIN}</td>
											<th>닉네임</th>
											<td>${adminDTO.MEM_NICKNAME}</td>
											<th>전화번호</th>
											<td>${adminDTO.MEM_PHONE}</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td colspan="3">${adminDTO.MEM_EMAIL}</td>
											<th>비밀번호</th>
											<td>${adminDTO.MEM_PASS}</td>
										</tr>
										<tr>
											<th>이름</th>
											<td>${adminDTO.MEM_NAME}</td>
											<th>성별</th>
											<td>${adminDTO.MEM_GENDER}</td>
											<th>생년월일</th>
											<td>${adminDTO.MEM_BIRTH}</td>
										</tr>
										<tr>
											<th>누적포인트</th>
											<td>${adminDTO.PO_CUMP} 점</td>
											<th>보유포인트</th>
											<td>${adminDTO.PO_CURP} 점</td>
											<th>가입시간</th>
											<td>${adminDTO.MEM_INPUT}</td>
										</tr>
										<tr>
											<th>탈퇴여부</th>
											<td>${adminDTO.MEM_STATUS}</td>
											<th>탈퇴유예시작시간</th>
											<td>${adminDTO.MEM_RESPITE}</td>
											<th>자동탈퇴시간</th>
											<td>${adminDTO.MEM_OUT}</td>
										</tr>
										<tr>
											<th>포인트지급기록</th>
											<td colspan="5"><pre>${adminDTO.PO_HIS}</pre></td>
										</tr>
									</tbody>
								</table>

								<div class="button-container" style="text-align: right;">
									<a
										href="${pageContext.request.contextPath}/admin/member/update?MEM_NUM=${adminDTO.MEM_NUM}"
										class="btn btn-success btn-user" style="font-weight: bold;">회원정보수정</a>
									<a
										href="${pageContext.request.contextPath}/admin/member/memberdelete?MEM_NUM=${adminDTO.MEM_NUM}"
										class="btn btn-danger btn-user" style="font-weight: bold;">회원정보삭제</a>
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