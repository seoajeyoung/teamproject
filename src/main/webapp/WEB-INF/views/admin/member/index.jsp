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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.custom-button {
	background-color: #b0b0b0; /* 내부 색 */
	border: 1px solid #dfdfdf; /* 테두리 색 */
	border-radius: 10px; /* 모서리를 둥글게 */
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 */
	color: #ffffff; /* 글자 색 */
	padding: 3px 10px; /* 버튼 크기 조절 */
	cursor: pointer; /* 마우스를 올렸을 때 커서 모양 변경 */
}

.custom-button:hover {
	background-color: #a0a0a0; /* 호버 시 내부 색 */
}

/* 테두리와 내부 텍스트 스타일 변경 */
input[type="date"], [type="month"] {
	border: 1px solid #e0e0e0;
	background-color: #f9f9f9;
	color: #a0a0a0;
	padding: 3px;
	border-radius: 8px;
	font-weight: bold;
	width: 130px;
	text-align: center; /* 텍스트 가운데 정렬 */
}

/* 선택된 날짜 텍스트 색상 */
input[type="date"]::after, input[type="month"]::after {
	color: #333; /* 날짜 선택 후 텍스트 색상 */
}

a {
	text-decoration: none;
	background-color: transparent;
}
</style>
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

					<jsp:include page="/WEB-INF/views/admin/inc/top.jsp" />

				<!--  ======================================================================================== -->

					<div class="c_tab_wrap"
						style="width: 1445px; margin-left: 40px !important;">
						<ul class="c_tab" id="list"
							style="margin-left: 15.5px !important;">
							<li><a
								href="${pageContext.request.contextPath}/admin/member/index"
								style="color: #ffffff; font-size: 15px;">전체 매출</a></li>
							<li><a
								href="${pageContext.request.contextPath}/admin/statistics/moviesales"
								style="color: #ffffff; font-size: 15px;">영화 매출</a></li>
							<li><a
								href="${pageContext.request.contextPath}/admin/statistics/storesales"
								style="color: #ffffff; font-size: 15px;">스토어 매출</a></li>
						</ul>
					</div>
					<br>

					<!-- Content Row -->

					<div class="row" style="margin-right: 0px;">

						<!-- Area Chart -->
						<div class="col-lg-6" style="padding-left: 50px; width: 762px;">
							<div class="card shadow mb-4" style="width: 708px;">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 align-items-center justify-content-between">
									<h6
										class="m-0 font-weight-bold text-danger d-flex justify-content-between align-items-center">
										<span>일간 매출</span>
										<div class="d-flex align-items-center">
											<input type="date" id="start_date" name="start_date" readonly>
											<!-- start_date를 readonly로 설정 -->
											&nbsp;&nbsp; <input type="date" id="end_date" name="end_date">
											<!-- end_date를 입력 가능 -->
											&nbsp;
											<button id="searchWeekButton" class="custom-button">검색</button>
										</div>
									</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="weeklyAllChart"></canvas>
									</div>
								</div>
							</div>
						</div>
						<!-- Area Chart -->
						<div class="col-lg-6" style="padding-left: 25px; width: 762px;">
							<div class="card shadow mb-4" style="width: 708px;">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 align-items-center justify-content-between">
									<h6
										class="m-0 font-weight-bold text-danger d-flex justify-content-between align-items-center">
										<span>월간 매출</span>
										<div class="d-flex align-items-center">
											<input type="month" id="start_month" name="start_month"
												readonly>
											<!-- start_date를 readonly로 설정 -->
											&nbsp;&nbsp; <input type="month" id="end_month"
												name="end_month">
											<!-- end_date를 입력 가능 -->
											&nbsp;
											<button id="searchMonthButton" class="custom-button">검색</button>
										</div>
									</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="monthlyAllChart"></canvas>
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
	document.addEventListener('DOMContentLoaded', function () {
	    // 일별 매출 데이터를 설정합니다.
	    const weekSalesData = JSON.parse('${weekSalesDataJson}');
	    updateWeekChart(weekSalesData); // 페이지가 로드될 때 기본 차트 설정

	    const startDateInput = document.getElementById('start_date');
	    const endDateInput = document.getElementById('end_date');

	    endDateInput.addEventListener('change', function () {
	        const selectedDate = new Date(endDateInput.value);
	        const today = new Date();
	        today.setHours(0, 0, 0, 0);

	        if (selectedDate > today) {
	            alert("종료 날짜는 오늘을 포함, 미래일 수 없습니다.");
	            endDateInput.value = '';
	            startDateInput.value = '';
	            return;
	        }

	        const startDate = new Date(selectedDate);
	        startDate.setDate(selectedDate.getDate() - 6);

	        startDateInput.valueAsDate = startDate;
	    });

	    document.getElementById('searchWeekButton').addEventListener('click', function () {
	        const startDate = startDateInput.value;
	        const endDate = endDateInput.value;

	        if (!endDate) {
	            alert("종료 날짜를 선택하세요.");
	        } else if (new Date(startDate) > new Date(endDate)) {
	            alert("시작 날짜는 종료 날짜보다 앞서야 합니다.");
	        } else {
	            fetchWeekSalesData(startDate, endDate);
	        }
	    });

	    // 월별 매출 데이터를 설정합니다.
	    const monthSalesData = JSON.parse('${monthSalesDataJson}');
	    updateMonthChart(monthSalesData); // 페이지가 로드될 때 기본 차트 설정

	    const startMonthInput = document.getElementById('start_month');
	    const endMonthInput = document.getElementById('end_month');

	    endMonthInput.addEventListener('change', function () {
	        const selectedMonth = new Date(endMonthInput.value + '-01');
	        const today = new Date();

	        if (selectedMonth.getFullYear() > today.getFullYear() || 
	            (selectedMonth.getFullYear() === today.getFullYear() && selectedMonth.getMonth() > today.getMonth())) {
	            alert("종료 월은 미래일 수 없습니다.");
	            endMonthInput.value = '';
	            startMonthInput.value = '';
	            return;
	        }

	        const startMonth = new Date(selectedMonth);
	        startMonth.setMonth(selectedMonth.getMonth() - 5);

	        startMonthInput.valueAsDate = startMonth;
	    });

	    document.getElementById('searchMonthButton').addEventListener('click', function () {
	        const startMonth = startMonthInput.value;
	        const endMonth = endMonthInput.value;

	        if (!endMonth) {
	            alert("종료 월을 선택하세요.");
	        } else if (new Date(startMonth) > new Date(endMonth)) {
	            alert("시작 월은 종료 월보다 앞서야 합니다.");
	        } else {
	            fetchMonthSalesData(startMonth, endMonth);
	        }
	    });
	});

	// 일별 매출 데이터를 가져오는 함수
	function fetchWeekSalesData(startDate, endDate) {
	    $.ajax({
	        url: '${pageContext.request.contextPath}/admin/statistics/allWeekSalesSearch',
	        type: 'GET',
	        data: {
	            start_date: startDate,
	            end_date: endDate
	        },
	        dataType: 'json',
	        success: function(data) {
	            updateWeekChart(data);
	        },
	        error: function(xhr, status, error) {
	            console.error("Error fetching sales data: ", status, error);
	        }
	    });
	}

	// 월별 매출 데이터를 가져오는 함수
	function fetchMonthSalesData(startMonth, endMonth) {
	    $.ajax({
	        url: '${pageContext.request.contextPath}/admin/statistics/allMonthSalesSearch',
	        type: 'GET',
	        data: {
	            start_date: startMonth,
	            end_date: endMonth
	        },
	        dataType: 'json',
	        success: function(data) {
	            updateMonthChart(data);
	        },
	        error: function(xhr, status, error) {
	            console.error("Error fetching sales data: ", status, error);
	        }
	    });
	}

	// 일별 차트를 업데이트하는 함수
	function updateWeekChart(weekSalesData) {
	    const labels = weekSalesData.map(data => data.sales_DATE);
	    const salesData = weekSalesData.map(data => parseInt(data.all_TOTALSALES));

	    const percentChange = salesData.map((current, index, array) => {
	        if (index === 0) return 100; // 첫 번째 날은 100%로 시작
	        const previous = array[index - 1];
	        const change = (current / previous) * 100;
	        return change.toFixed(2);
	    });

	    const ctx = document.getElementById('weeklyAllChart').getContext('2d');
	    const chartData = {
	        labels: labels,
	        datasets: [{
	            label: '총 매출 (원)',
	            data: salesData,
	            borderColor: 'rgba(255, 99, 132, 1)',
	            backgroundColor: 'rgba(255, 99, 132, 0.05)',
	            borderWidth: 1,
	            yAxisID: 'y'
	        },
	        {
	            label: '전일 대비 매출 증감률 (%)',
	            data: percentChange,
	            backgroundColor: 'rgba(54, 162, 235, 0.1)',
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
	                        return value.toLocaleString() + '원';
	                    }
	                },
	                position: 'left',
	            },
	            y1: {
	                beginAtZero: true,
	                ticks: {
	                    callback: function(value) {
	                        return value + '%';
	                    }
	                },
	                position: 'right',
	                grid: {
	                    drawOnChartArea: false,
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
	                            label += context.raw + '%';
	                        } else {
	                            label += context.raw.toLocaleString() + '원';
	                        }
	                        return label;
	                    }
	                }
	            }
	        }
	    };

	    if (window.weeklyChart) {
	        window.weeklyChart.destroy();
	    }

	    window.weeklyChart = new Chart(ctx, {
	        type: 'bar',
	        data: chartData,
	        options: chartOptions
	    });
	}

	// 월별 차트를 업데이트하는 함수
	function updateMonthChart(monthSalesData) {
	    const labels = monthSalesData.map(data => data.sales_DATE);

	    const salesData = monthSalesData.map(data => parseInt(data.all_TOTALSALES));

	    const percentChange = salesData.map((current, index, array) => {
	        if (index === 0) return 100; // 첫 번째 달은 100%로 시작
	        const previous = array[index - 1];
	        const change = (current / previous) * 100;
	        return change.toFixed(2);
	    });

	    const ctx = document.getElementById('monthlyAllChart').getContext('2d');
	    const chartData = {
	        labels: labels,
	        datasets: [{
	            label: '총 매출 (원)',
	            data: salesData,
	            borderColor: 'rgba(255, 99, 132, 1)',
	            backgroundColor: 'rgba(255, 99, 132, 0.05)',
	            borderWidth: 1,
	            yAxisID: 'y'
	        },
	        {
	            label: '전월 대비 매출 증감률 (%)',
	            data: percentChange,
	            backgroundColor: 'rgba(54, 162, 235, 0.1)',
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
	                        if (value >= 100000000) {
	                            return (value / 100000000).toFixed(1) + '억 원';
	                        } else if (value >= 10000) {
	                            return (value / 10000).toLocaleString() + '만원';
	                        }
	                        return value.toLocaleString() + '원';
	                    }
	                },
	                position: 'left',
	            },
	            y1: {
	                beginAtZero: true,
	                ticks: {
	                    callback: function(value) {
	                        return value + '%';
	                    }
	                },
	                position: 'right',
	                grid: {
	                    drawOnChartArea: false,
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
	                            label += context.raw + '%';
	                        } else {
	                            let value = context.raw;
	                            if (value >= 100000000) {
	                                label += (value / 100000000).toFixed(1) + '억 원';
	                            } else if (value >= 10000) {
	                                label += (value / 10000).toLocaleString() + '만원';
	                            } else {
	                                label += value.toLocaleString() + '원';
	                            }
	                        }
	                        return label;
	                    }
	                }
	            }
	        }
	    };

	    if (window.monthlyChart) {
	        window.monthlyChart.destroy();
	    }

	    window.monthlyChart = new Chart(ctx, {
	        type: 'bar',
	        data: chartData,
	        options: chartOptions
	    });
	}
</script>
	<script type="text/javascript">
				$(document).ready(function() {
					// 현재 URL 경로를 가져오기
					var currentPath = window.location.pathname;

					// 모든 탭에서 'on' 클래스 제거
					$('#list li').removeClass('on');

					// 현재 URL에 해당하는 링크를 찾아 해당 li 요소에 'on' 클래스 추가
					$('#list a').each(function() {
						var href = $(this).attr('href');
						if (href === currentPath) {
							$(this).parent('li').addClass('on');
						}
					});

					// 처음 페이지 로드 시 영화 탭에 'on' 클래스 추가 (기본 설정)
					if ($('#list li.on').length === 0) {
						$('#list li:first').addClass('on');
					}

					// 섹션 클릭 이벤트
					$('#list').on('click', 'a', function(event) {
						// 모든 탭에서 'on' 클래스 제거
						$('#list li').removeClass('on');

						// 클릭한 a 요소의 부모 li에 'on' 클래스 추가
						$(this).parent('li').addClass('on');
					});
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
</body>

</html>