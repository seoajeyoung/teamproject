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

<title>OSTicket - Control Store</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/movieschedule.css">
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

<script
	src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    function checkStoreDetails() {
        var storeDetails = {
            ST_NUM: $('#ST_NUM').val(),
            ST_NAME: $('#ST_NAME').val(),
            ST_DETAIL: $('#ST_DETAIL').val()
        };

        $.ajax({
            url: '${pageContext.request.contextPath}/admin/store/check-store-details',
            type: 'POST',
            data: {
                ST_NUM: $('#ST_NUM').val(),
                ST_NAME: $('#ST_NAME').val(),
                ST_DETAIL: $('#ST_DETAIL').val()
            },
            success: function(response) {
            	console.log("Response:", response);
                if (response.numExists) {
                    $('#numCheckMessage').text('이미 사용중인 상품코드입니다.');
                    console.log(response.numExists);
                } else {
                    $('#numCheckMessage').text('');
                    console.log(response.numExists);
                    
                }

                if (response.nameExists) {
                    $('#nameCheckMessage').text('이미 사용중인 상품이름입니다.');
                } else {
                    $('#nameCheckMessage').text('');
                }

                if (response.detailExists) {
                    $('#detailCheckMessage').text('이미 사용중인 상품설명입니다.');
                } else {
                    $('#detailCheckMessage').text('');
                }
            }
        });
    }

    $('#ST_NUM, #ST_NAME, #ST_DETAIL').on('blur', checkStoreDetails);
});
</script>





</head>

<body id="page-top">

	<!--  Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar Include -->
		<jsp:include page="/WEB-INF/views/admin/inc/sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar Include -->
				<jsp:include page="/WEB-INF/views/admin/inc/top.jsp" />
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- container-fluid -->


					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800" style="margin-left: 20px;">스토어상품관리</h1>
					<br>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-danger">스토어 상품등록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form
									action="${pageContext.request.contextPath}/admin/store/storeinsertPro"
									method="post">
									<table class="table schedule-bordered" id="dataTable1"
										width="100%" cellspacing="0">
										<tr>
											<th>상품코드</th>
											<td><input type="text" id="ST_NUM" name="ST_NUM">
												<span id="numCheckMessage" style="color: red;"></span></td>
											<th>상품이미지</th>
										</tr>
										<tr>
											<th>상품이름</th>
											<td><input type="text" id="ST_NAME" name="ST_NAME">
												<span id="nameCheckMessage" style="color: red;"></span></td>

											<td rowspan="10"></td>
										<tr>
											<th>상품가격</th>
											<td><input type="text" id="ST_PRICE" name="ST_PRICE"></td>
										</tr>
										<tr>
											<th>상품타입</th>
											<td><input type="text" id="ST_TYPE" name="ST_TYPE">
												<select id="" name="">
													<option value="${list.TH_NUMBER}">상품타입</option>
											</select></td>
										</tr>
										<tr>
											<th>상품설명</th>
											<td><textarea id="ST_DETAIL" name="ST_DETAIL"
													rows="10" cols="50"></textarea> <span
												id="detailCheckMessage" style="color: red;"></span></td>
									</table>
									<div class="button-container">
										<button type="submit"
											class="btn btn-danger btn-user same-size"
											style="margin-right: 2px;">등록</button>
										<button type="reset"
											class="btn btn-secondary btn-user same-size">초기화</button>
									</div>
								</form>


							</div>
							<!-- table-responsive  -->
						</div>
						<!-- card-body -->
					</div>
					<!-- card shadow mb-4 -->

				</div>
				<!-- End of Page Content -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- container-fluid -->


					<!-- Page Heading -->


					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-danger">스토어 상품목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table schedule-bordered2" id="dataTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>지역</th>
											<th>지점명</th>
											<th>상영관</th>
											<th>영화제목</th>
											<th>상영시작시간</th>
											<th>상영종료시간</th>
											<th>비고</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="scheduleDTO" items="${scheduleList}">
											<tr id="row${scheduleDTO.CI_NUM}">
												<td id="region${scheduleDTO.CI_NUM}">${scheduleDTO.TH_REGION}</td>
												<td id="name${scheduleDTO.CI_NUM}">${scheduleDTO.TH_NAME}</td>
												<td id="cinema${scheduleDTO.CI_NUM}">${scheduleDTO.TH_NUMBER}</td>
												<td id="title${scheduleDTO.CI_NUM}">${scheduleDTO.title}</td>
												<td id="scTime${scheduleDTO.CI_NUM}">${scheduleDTO.SC_TIME}</td>
												<td id="scTimeEnd${scheduleDTO.CI_NUM}">${scheduleDTO.SC_TIME_END}</td>
												<td id="delete-button-cell"><button type="button"
														onclick="deleteRow(${scheduleDTO.CI_NUM})"
														class="btn btn-danger btn-user">일정삭제</button></td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>
							<!-- table-responsive  -->
						</div>
						<!-- card-body -->
					</div>
					<!-- card shadow mb-4 -->

				</div>
				<!-- End of Page Content -->

			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End Content Wrapper -->





	</div>
	<!-- End of Page Wrapper -->

	<!-- Footer Include-->
	<jsp:include page="/WEB-INF/views/admin/inc/bottom.jsp" />
	<!-- End of Footer -->

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
		src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/script/demo/datatables-demo.js"></script>
</body>

</html>