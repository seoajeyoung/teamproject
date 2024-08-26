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

<title>OSTicket - MemberList</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/memberlist.css">

<!-- Custom fonts for this template -->

<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<!--     <link -->
<!--         href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" -->
<!--         rel="stylesheet"> -->

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

				<!-- Topbar -->
				<%--             <jsp:include page = "/WEB-INF/views/admin/inc/top.jsp"/> --%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800"
						style="margin-left: 30px; padding-top: 12px;">회원목록</h1>
					<hr style="margin-bottom: 20px; margin-top: 30px;">

					<!-- DataTales -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="memberlist table table-bordered" id="dataTable"
									width="100%" cellspacing="0">
									<thead class="thc">
										<tr>
											<th class="column-member-number">회원번호</th>
											<th class="column-member-id">회원ID</th>
											<th class="column-member-name">이름</th>
											<th class="column-phone">전화번호</th>
											<th class="column-email">이메일</th>
											<th class="column-grade">회원등급</th>
											<th class="column-action">상세정보</th>
										</tr>
									</thead>
									<tfoot class="thc">
										<tr>
											<th class="column-member-number">회원번호</th>
											<th class="column-member-id">회원ID</th>
											<th class="column-member-name">이름</th>
											<th class="column-phone">전화번호</th>
											<th class="column-email">이메일</th>
											<th class="column-grade">회원등급</th>
											<th class="column-action">상세정보</th>
										</tr>
									</tfoot>
									<tbody>
										<!-- 회원목록  -->

										<c:forEach var="adminDTO" items="${memberList}">
											<tr>
												<td class="column-member-number">${adminDTO.MEM_NUM}</td>
												<td class="column-member-id">${adminDTO.MEM_ID}</td>
												<td class="column-member-name">${adminDTO.MEM_NAME}</td>
												<td class="column-phone">${adminDTO.MEM_PHONE}</td>
												<td class="column-email">${adminDTO.MEM_EMAIL}</td>
												<td class="column-grade">${adminDTO.MEM_GRADE}</td>
												<td class="column-action"><a
													href="${pageContext.request.contextPath}/admin/member/info?MEM_NUM=${adminDTO.MEM_NUM}"
													class="btn btn-detailinfo btn-user btn-block"
													>상세정보확인</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer include-->
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