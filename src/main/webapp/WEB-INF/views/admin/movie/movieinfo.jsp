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

<title>OSTicket - MovieInfo</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/movieinfo.css">
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

<script>
function deleteMovie(movieNum) {
    if (confirm('정말 삭제하시겠습니까?')) {
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/movie/moviedelete',
            type: 'POST',
            data: { MOVIE_NUM: movieNum },
            success: function(response) {
                window.location.href = '${pageContext.request.contextPath}/admin/movie/movielist';
            },
            error: function() {
                alert('삭제 중 오류가 발생했습니다.');
            }
        });
    }
}
</script>


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
						style="margin-left: 30px; padding-top: 12px;">영화 상세정보</h1>
					<hr style="margin-bottom: 20px; margin-top: 30px;">

					<!-- DataTales -->
					<div class="card shadow mb-4">

						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-infoboard" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th colspan="4">${movieDTO.title} 상세정보</th>
											<!-- 											<th colspan="2">영화 포스터</th> -->
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>영화코드</th>
											<td style="width: 536px;">${movieDTO.MOVIE_NUM}</td>
											<th>영화제목</th>
											<td>${movieDTO.title}</td>
											<!-- 											<td colspan="2" rowspan="6"> -->
											<!-- 												포스터 <img -->
											<%-- 												src="${pageContext.request.contextPath}/resources/img/${movieDTO.MOVIE_NUM}.jpg" --%>
											<!-- 												onerror="errorImage(this)" width="300"> -->
											<!-- 											</td> -->
										</tr>
										<tr>
											<th>영문제목</th>
											<td>${movieDTO.titleEng}</td>
											<th>감독</th>
											<td>${movieDTO.direcotrNm}</td>
										</tr>
										<tr>
											<th>배우</th>
											<td>${movieDTO.actorNm}</td>
											<th>장르</th>
											<td>${movieDTO.genre}</td>
										</tr>
										<tr>
											<th>상영등급</th>
											<td>${movieDTO.rating}</td>
											<th>런닝타임</th>
											<td>${movieDTO.runtime}분</td>
										</tr>
										<tr>
											<th>누적관객수</th>
											<td>${movieDTO.audiAcc}</td>
											<th>개봉일자</th>
											<td>${movieDTO.releaseDate}</td>
										</tr>
										<tr>
											<th>상영일자</th>
											<td>${movieDTO.releaseDts}</td>
											<th>종영일자</th>
											<td>${movieDTO.releaseDte}</td>
										</tr>
										<tr>
											<th>주제곡</th>
											<td colspan="4">${movieDTO.themsSong}</td>
										</tr>
										<tr>
											<th>삽입곡</th>
											<td colspan="4">${movieDTO.soundtrack}</td>
										</tr>
										<tr>
											<th>줄거리</th>
											<td colspan="4">${movieDTO.plot}</td>
										</tr>
									</tbody>
								</table>

								<div class="button-container" style="text-align: right;">
									<a
										href="${pageContext.request.contextPath}/admin/movie/movieupdate?MOVIE_NUM=${movieDTO.MOVIE_NUM}"
										class="btn btn-success btn-user" style="font-weight:bold;">영화정보수정</a>
									<button type="button" class="btn btn-danger btn-user"
										onclick="deleteMovie(${movieDTO.MOVIE_NUM})" style="font-weight:bold;">영화정보삭제</button>
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