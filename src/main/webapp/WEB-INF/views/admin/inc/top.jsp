<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800"
	style="margin-left: 30px; padding-top: 12px; margin-left: 70px;">OSTicket
	- Admin</h1>
<hr
	style="margin-bottom: 20px; margin-top: 30px; width: 1445px; margin-left: 40px;">
<!--                         <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i -->
<!--                                 class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->

<!-- Content Row -->
<div class="row"
	style="width: 1475px; margin-left: 25px; margin-top: 30px;"">

	<!-- Earnings (Monthly) Card Example -->
	<div class="col-xl-3 col-md-6 mb-4">
		<div class="card border-left-danger shadow h-100 py-2">
			<div class="card-body" style="padding-left: 30px;">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div
							class="text-xs font-weight-bold text-danger text-uppercase mb-1"
							style="font-size: 15px;">${adminDTO.SALES_DATE} 매출 (Daily)</div>
						<div class="h5 mb-0 font-weight-bold text-gray-800">${formattedSales}</div>
					</div>
					<div class="col-auto">
						<i class="fas fa-won-sign fa-2x text-gray-300"></i>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Earnings (Monthly) Card Example -->
	<div class="col-xl-3 col-md-6 mb-4">
		<div class="card border-left-info shadow h-100 py-2">
			<div class="card-body" style="padding-left: 30px;">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div
							class="text-xs font-weight-bold text-info text-uppercase mb-1"
							style="font-size: 15px;">${adminDTO2.SALES_DATE} 매출
							(Monthly)</div>
						<div class="h5 mb-0 font-weight-bold text-gray-800">${formattedMonthSales}</div>
					</div>
					<div class="col-auto">
						<i class="fas fa-won-sign fa-2x text-gray-300"></i>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Earnings (Monthly) Card Example -->
	<div class="col-xl-3 col-md-6 mb-4">
		<div class="card border-left-danger shadow h-100 py-2">
			<div class="card-body" style="padding-left: 30px;">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div
							class="text-xs font-weight-bold text-danger text-uppercase mb-1"
							style="font-size: 15px;">매출 통계 (Revenue)</div>
						<div>
							<a class="h5 mb-0 font-weight-bold text-gray-800"
								href="${pageContext.request.contextPath}/admin/member/index"
								style="font-size: 1.25rem;">매출 통계</a>
						</div>
					</div>
					<div class="col-auto">
						<i class="fas fa-chart-bar fa-2x text-gray-300"></i>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Earnings (Monthly) Card Example -->

	<!-- Earnings (Monthly) Card Example -->
	<div class="col-xl-3 col-md-6 mb-4">
		<div class="card border-left-info shadow h-100 py-2">
			<div class="card-body" style="padding-left: 30px;">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div
							class="text-xs font-weight-bold text-info text-uppercase mb-1"
							style="font-size: 15px;">회원 통계 (Member)</div>
						<div>
							<a class="h5 mb-0 font-weight-bold text-gray-800"
								href="${pageContext.request.contextPath}/admin/statistics/memberStatistics"
								style="font-size: 1.25rem;">회원 통계</a>
						</div>
					</div>
					<div class="col-auto">
						<i class="fas fa-chart-bar fa-2x text-gray-300"></i>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>