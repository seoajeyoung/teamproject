<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>OSTicket - MovieUpdate</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/movieupdate.css">

<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<!-- <link -->
<!-- 	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" -->
<!-- 	rel="stylesheet"> -->

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
						style="margin-left: 30px; padding-top: 12px;">영화 정보 수정</h1>
					<hr style="margin-bottom: 20px; margin-top: 30px;">

					<!-- DataTales -->
					<div class="card shadow mb-4">

						<div class="card-body">
							<div class="table-responsive">

								<form
									action="${pageContext.request.contextPath}/admin/movie/movieupdatePro"
									method="post">
									<input type="hidden" name="MOVIE_NUM"
										value="${movieDTO.MOVIE_NUM}">

									<table class="table table-infoboard" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th colspan="5">${movieDTO.title} 상세정보</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th style="width: 265px;">영화코드</th>
												<td colspan="3">${movieDTO.MOVIE_NUM}</td>
												<th style="width: 300px;">영화 포스터</th>
											</tr>
											<tr>
												<th>영화제목</th>
												<td style="width: 379px;"><input type="text"
													name="title" value="${movieDTO.title}"></td>
												<th style="width: 265px;">영문제목</th>
												<td><input type="text" name="titleEng"
													value="${movieDTO.titleEng}"></td>
												<td rowspan="6" style="text-align: center; vertical-align: middle;"><img
													src="${fn:split(movieDTO.posterUrl, '\\|')[0]}"
													alt="영화 포스터"
													style="width: 100%; height: 100%; object-fit: cover;"></td>
											</tr>
											<tr>
												<th>감독</th>
												<td><input type="text" name="direcotrNm"
													value="${movieDTO.direcotrNm}"></td>
												<th>배우</th>
												<td><input type="text" name="actorNm"
													value="${movieDTO.actorNm}"></td>
											</tr>
											<tr>
												<th>장르</th>
												<td><input type="text" name="genre"
													value="${movieDTO.genre}"></td>
												<th>상영등급</th>
												<td><input type="text" name="rating"
													value="${movieDTO.rating}"></td>
											</tr>
											<tr>
												<th>런타임</th>
												<td><input type="text" name="runtime"
													value="${movieDTO.runtime}"></td>
												<th>등록일자</th>
												<td><input type="date" name="releaseDate"
													value="${movieDTO.releaseDate}"></td>
											</tr>
											<tr>
												<th>주제곡</th>
												<td colspan="3" style="height: 72px;"><textarea
														name="themeSong" style="width: 100%; height: 100%;">${movieDTO.themeSong}</textarea></td>
											</tr>
											<tr>
												<th>삽입곡</th>
												<td colspan="3" style="height: 72px;"><textarea
														name="soundtrack" style="width: 100%; height: 100%;">${movieDTO.soundtrack}</textarea></td>
											</tr>
											<tr>
												<th>줄거리</th>
												<td colspan="5"><textarea name="plot"
														style="width: 100%; height: 100%;">${movieDTO.plot}</textarea></td>
											</tr>
										</tbody>
									</table>
									<button type="submit" class="btn btn-success btn-user"
										style="float: right;">수정완료</button>
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