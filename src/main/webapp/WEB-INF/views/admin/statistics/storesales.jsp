<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>OSTicket - Admin</title>
<!-- 페이지 title -->

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/css/osticketAdmin.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/mypage/customer.css"
	rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>



<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!--  sidebar include -->
		<jsp:include page="/WEB-INF/views/admin/inc/sidebar.jsp" />


		<!--  ======================================================================================== -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<br>

				<!--  ======================================================================================== -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800"
						style="margin-left: 30px; padding-top: 12px;">화면이름뭘로할래</h1>
					<hr style="margin-bottom: 20px; margin-top: 30px;">
					<!--                         <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i -->
					<!--                                 class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												일별매출 (Daily)</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												월별매출 (Monthly)</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
											</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 50%" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												Pending Requests</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												매출 통계</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">매출
												통계</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												월별매출 (Monthly)</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
											</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 50%" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												Pending Requests</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="c_tab_wrap">
						<ul class="c_tab" id="list">
							<li><a
								href="${pageContext.request.contextPath}/admin/statistics/mypayment">전체
									매출</a></li>
							<li><a
								href="${pageContext.request.contextPath}/admin/statistics/moviesales">영화
									매출</a></li>
							<li><a
								href="${pageContext.request.contextPath}/admin/statistics/storesales">스토어
									매출</a></li>
						</ul>
					</div>
					<br>

					<!-- Content Row -->

					<div class="row">

						<!-- Area Chart -->
						<div class="col-lg-6">
							<div class="card shadow mb-4" style="width: 700px;">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-danger">일별 스토어 매출</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="weeklyStoreChart"></canvas>
									</div>
								</div>
							</div>
						</div>
						<!-- Area Chart -->
						<div class="col-lg-6">
							<div class="card shadow mb-4" style="width: 700px;">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-danger">월별 스토어 매출</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="myAreaChart"></canvas>
									</div>
								</div>
							</div>
						</div>

					</div>

					<!-- Content Row -->





				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->


			<!--  ======================================================================================== -->

			<!-- Footer include -->
			<jsp:include page="/WEB-INF/views/admin/inc/bottom.jsp" />

			<!-- Footer 시작 (원본 Footer 참고용으로 index page에 하나만 주석으로 유지)-->

			<!--             <footer class="sticky-footer bg-white"> -->
			<!--                 <div class="container my-auto"> -->
			<!--                     <div class="copyright text-center my-auto"> -->
			<!--                         <span>Copyright &copy; Your Website 2021</span> -->
			<!--                     </div> -->
			<!--                 </div> -->
			<!--             </footer> -->
			<!-- End of Footer -->

			<!--  ======================================================================================== -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!--  ======================================================================================== -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>


	<script>
    const weekSalesData = JSON.parse('${weekSalesDataJson}');
    
    // 차트에 사용될 데이터 설정
    const labels = weekSalesData.map(data => data.ssales_DATE);
    const salesData = weekSalesData.map(data => parseInt(data.store_TOTALSALES));

    console.log(labels); // 날짜가 제대로 들어가는지 확인
    console.log(salesData); // 매출 데이터가 숫자로 변환되었는지 확인

    // 전일 대비 증감률 계산
    const percentChange = salesData.map((current, index, array) => {
        if (index === 0) return 0; // 첫 번째 날은 전일이 없으므로 0%
        const previous = array[index - 1];
        const change = ((current - previous) / previous) * 100;
        return change.toFixed(2); // 소수점 두 자리로 고정
    });

    console.log(percentChange); // 증감률 데이터를 확인

    const ctx = document.getElementById('weeklyStoreChart').getContext('2d');
    const chartData = {
        labels: labels, // X축에 날짜 추가
        datasets: [{
            label: '스토어 매출',
            data: salesData, // Y축에 매출 추가
            borderColor: 'rgba(255, 99, 132, 1)',
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderWidth: 1,
            yAxisID: 'y'
        },
        {
            label: '전일 대비 매출 증감률',
            data: percentChange, // Y축에 증감률 추가
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 0.5)',
            type: 'line',
            yAxisID: 'y1',
            fill: false,
        }]
    };

    const chartOptions = {
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    callback: function(value) {
                        return value.toLocaleString() + '원'; // 숫자 뒤에 '원' 추가
                    }
                },
                position: 'left',
            },
            y1: {
                beginAtZero: true,
                ticks: {
                    callback: function(value) {
                        return value + '%'; // 숫자 뒤에 '%' 추가
                    }
                },
                position: 'right',
                grid: {
                    drawOnChartArea: false, // 두 번째 Y축의 격자선을 숨깁니다.
                }
            }
        },
        plugins: {
            tooltip: {
                callbacks: {
                    label: function(context) {
                        let label = context.dataset.label || '';
                        if (label) {
                            label += ': ';
                        }
                        if (context.dataset.type === 'line') {
                            label += context.raw + '%'; // 증감률 툴팁에 '%' 추가
                        } else {
                            label += context.raw.toLocaleString() + '원'; // 매출 툴팁에 '원' 추가
                        }
                        return label;
                    }
                }
            }
        }
    };

    new Chart(ctx, {
        type: 'bar',
        data: chartData,
        options: chartOptions
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
		src="${pageContext.request.contextPath}/resources/script/sb-admin-2.js"></script>

	<!-- Page level plugins -->
	<%-- 	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script> --%>

	<!-- Page level custom scripts -->
	<%-- 	<script src="${pageContext.request.contextPath}/resources/script/demo/chart-area-demo.js"></script> --%>
	<%-- 	<script src="${pageContext.request.contextPath}/resources/script/demo/chart-pie-demo.js"></script> --%>

</body>

</html>