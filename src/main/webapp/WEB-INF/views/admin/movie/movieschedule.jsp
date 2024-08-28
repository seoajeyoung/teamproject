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

<title>OSTicket - MovieSchdule</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/common.css">

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
$(function() {
    var endRDateTime = "";
    
    // 지역 선택시 이벤트 핸들러
    $("#regionList").change(function() {
        var selectedValue = $('#regionList option:selected').val(); // 선택된 지역 값 저장
        console.log(selectedValue);

        // 극장 목록을 가져오기 위한 AJAX 요청
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/movie/getTheaterList', // 요청 URL
            type: 'POST', // 요청 방식
            data: { TH_REGION: selectedValue }, // 전송할 데이터
            success: function(response) {
                var theaterList = $('#theaterList');
                theaterList.empty(); // 기존 옵션 제거
                theaterList.append(new Option("지점명을 선택하세요", "")); // 기본 옵션 추가
                if (response.length > 0) { // 응답 데이터가 있으면
                    response.forEach(function(theater) { // 각 극장명으로 옵션 추가
                        theaterList.append(new Option(theater, theater));
                    });
                }
            },
            error: function(xhr, status, error) { // 오류 발생시 처리
                alert("극장 목록을 불러오는 중 오류가 발생했습니다.");
                console.error(xhr, status, error);
            }
        });

        // 지점명이 선택되지 않은 경우 상영관 목록 초기화
        var cinemaList = $('#cinemaList');
        cinemaList.empty();
        cinemaList.append(new Option("상영관을 선택하세요", ""));
    });

    // 극장 선택시 이벤트 핸들러
    $("#theaterList").change(function() {
        var selectedValue = $('#theaterList option:selected').val(); // 선택된 극장 값 저장
        console.log(selectedValue);

        // 상영관 목록을 가져오기 위한 AJAX 요청
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/movie/getCinemaList', // 요청 URL
            type: 'POST', // 요청 방식
            data: { TH_NAME: selectedValue }, // 전송할 데이터
            success: function(response) {
                var cinemaList = $('#cinemaList');
                cinemaList.empty(); // 기존 옵션 제거
                cinemaList.append(new Option("상영관을 선택하세요", "")); // 기본 옵션 추가
                if (response.length > 0) { // 응답 데이터가 있으면
                    response.forEach(function(cinema) { // 각 상영관명으로 옵션 추가
                        cinemaList.append(new Option(cinema, cinema));
                    });
                }
            },
            error: function(xhr, status, error) { // 오류 발생시 처리
                alert("상영관을 불러오는 중 오류가 발생했습니다.");
                console.error(xhr, status, error);
            }
        });
    });

    // 날짜 입력시 이벤트 핸들러
    $('#dateInput').change(function() {
        var dateValue = $('#dateInput').val(); // 선택된 날짜 값 저장
        console.log("Selected Date: " + dateValue);

        // 영화 목록을 가져오기 위한 AJAX 요청
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/movie/getMovieNameList', // 요청 URL
            type: 'POST', // 요청 방식
            data: { releaseDate: dateValue }, // 전송할 데이터
            success: function(response) {
                console.log("Response: ", response); // 응답 데이터 출력
                movieData = response; // 전체 영화 데이터를 저장
                var movieNameList = $('#movieNameList');
                movieNameList.empty(); // 기존 옵션 제거
                movieNameList.append(new Option("영화를 선택하세요", "")); // 기본 옵션 추가

                if (response.length > 0) { // 응답 데이터가 있으면
                    response.forEach(function(movie) { // 각 영화 제목으로 옵션 추가
                        movieNameList.append(new Option(movie.TITLE, movie.TITLE));
                    });
                }
            },
            error: function(xhr, status, error) { // 오류 발생시 처리
                alert("영화 목록을 불러오는 중 오류가 발생했습니다.");
                console.error(xhr, status, error);
            }
        });
    });

    // 영화 제목 변경시 이벤트 핸들러
    $('#movieNameList').change(function() {
        var selectedTitle = $(this).val(); // 선택된 영화 제목 값 저장
        console.log("선택된 영화 제목: " + selectedTitle);

        var selectedMovie = movieData.find(movie => movie.TITLE === selectedTitle); // 선택된 영화 데이터 찾기
        var titleEngField = $('#titleEng');
        var runtimeField = $('#runtime');
        var runningDtsField = $('#runningDts');
        var runningDteField = $('#runningDte');

        if (selectedMovie) { // 영화가 선택되었으면
            console.log("Selected Movie: ", selectedMovie); // 선택된 영화 데이터 출력
            if (selectedMovie.RUNTIME) { // 선택된 영화에 런타임이 있으면
                runtimeField.val(selectedMovie.RUNTIME); // 런타임 입력
                runtimeField.trigger('change'); // change 이벤트 수동 발생
                runtimeField.prop('readonly', true); // readonly 속성 설정
            } else {
                runtimeField.val('런타임이 없습니다. 입력해주세요'); // 런타임이 없으면 기본 메시지 입력
                runtimeField.prop('readonly', false); // readonly 속성 해제
            }
        }
    });

    // 상영 시간 겹침 체크
    $('#regionList, #theaterList, #cinemaList, #runtime, #runningDts').change(function() {
        var TH_REGION = $('#regionList option:selected').val();
        var TH_NAME = $('#theaterList option:selected').val();
        var TH_NUMBER = $('#cinemaList option:selected').val();
        var runtime = $('#runtime').val();
        var runningDts = $('#runningDts').val();

        // 콘솔에 각 값 출력
        console.log("TH_REGION: " + TH_REGION);
        console.log("TH_NAME: " + TH_NAME);
        console.log("TH_NUMBER: " + TH_NUMBER);
        console.log("Runtime: " + runtime);
        console.log("RunningDts: " + runningDts);

        if (TH_REGION && TH_NAME && TH_NUMBER && runtime && runningDts) {
            console.log("Sending AJAX request to get schedule...");
            $.ajax({
                url: '${pageContext.request.contextPath}/admin/movie/getSchedule', // 요청 URL
                type: 'POST',
                data: { TH_REGION: TH_REGION, TH_NAME: TH_NAME, TH_NUMBER: TH_NUMBER, runningDts: runningDts },
                success: function(schedules) {
                    console.log("Schedules received: ", schedules);
                    checkOverlap(schedules, runtime);
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching schedule: ", status, error);
                }
            });
        }
    });

    function checkOverlap(schedules, runtime) {
        var runningDtsField = $('#runningDts');
        var runningDteField = $('#runningDte');
        var possibleTimesField = $('#possibleTimes');

        var selectedTime = new Date(runningDtsField.val()).getTime();
        var runtimeMs = parseInt(runtime) * 60 * 1000; // 런타임을 밀리초로 변환
        console.log("Runtime in ms: " + runtimeMs);

        console.log("Schedules received: ", schedules); // schedules 객체 출력

        // 스케줄을 날짜 순서대로 정렬
        schedules.sort(function(a, b) {
            return new Date(a.sc_TIME) - new Date(b.sc_TIME);
        });

        var possibleTimes = [];
        var selectedDate = new Date(runningDtsField.val());
        var businessStart = new Date(selectedDate.setHours(8, 30, 0, 0)).getTime(); // 08:30 AM
        var businessEnd = new Date(selectedDate.setHours(24, 30, 0, 0)).getTime(); // 00:30AM (등록가능시간)

        var previousEnd = businessStart;

        schedules.forEach(function(schedule) {
            var scheduleStartTime = new Date(schedule.sc_TIME).getTime();
            var scheduleEndTime = new Date(schedule.sc_TIME_END).getTime();
            var bufferBefore = scheduleStartTime - (30 * 60 * 1000); // 스케줄 시작 30분 전
            var bufferAfter = scheduleEndTime + (30 * 60 * 1000); // 스케줄 종료 30분 후

            if (bufferBefore - previousEnd >= runtimeMs) {
                possibleTimes.push({
                    start: new Date(previousEnd),
                    end: new Date(bufferBefore)
                });
            }

            previousEnd = bufferAfter;
        });

     // 마지막 영화는 익일 00:00에 시작할 수 있도록 설정
        if (businessEnd >= previousEnd) {
            possibleTimes.push({
                start: new Date(previousEnd),
                end: new Date(businessEnd)
            });
        }

        // 가능한 시간대를 포맷하여 출력
        var timeMessage = "[상영 등록 가능 시간]\n";
        possibleTimesField.css({
              'font-family': 'Arial, sans-serif',  // 글꼴 설정
              'text-align': 'center',               // 텍스트 가운데 정렬
              'color': '#858796', 
              'font-weight': 'bold',
              'font-size': '17px'
            });
        
        possibleTimes.forEach(function(time) {
            var adjustedEnd = new Date(time.end.getTime() - runtimeMs); // 런타임을 뺀 종료 시간 계산
            
            // 종료 시간이 시작 시간보다 이전으로 계산되는 경우, 현재 시간을 유지
            if (adjustedEnd < time.start) {
                adjustedEnd = time.end;
            }

            timeMessage += "* " + formatDate(time.start) + " " + formatTime(time.start) + " ~ " + formatDate(adjustedEnd) + " " + formatTime(adjustedEnd) + "\n";
        });
        
        
        if (possibleTimes.length === 0) {
            timeMessage = "해당 날짜에 비어있는 상영시간이 없습니다.";
            alert(timeMessage);
            possibleTimesField.val(timeMessage);
        }

        // 선택한 시간이 가능한 시간대인지 확인
        var isTimeValid = possibleTimes.some(function(time) {
            return selectedTime >= time.start.getTime() && selectedTime + runtimeMs <= time.end.getTime();
        });

        if (selectedTime < businessStart || selectedTime > businessEnd - runtimeMs) {
            timeMessage = "등록가능한 시간이 아닙니다.\n영업시간은 08:30부터 익일 00:30까지입니다.";
            alert(timeMessage);
            possibleTimesField.val(timeMessage);
            runningDtsField.val(''); // 입력 필드 초기화
            runningDteField.val(''); // 종료 시간 필드 초기화
        } else if (isTimeValid) {
            var runtimeMinutes = parseInt(runtime); // 런타임을 분으로 변환
            var startDateTime = new Date(runningDtsField.val());

            // 종료 시간을 계산
            startDateTime.setMinutes(startDateTime.getMinutes() + runtimeMinutes);

            // 종료 시간을 datetime-local 형식으로 변환 (한국 표준시 적용)
            var year = startDateTime.getFullYear();
            var month = String(startDateTime.getMonth() + 1).padStart(2, '0');
            var day = String(startDateTime.getDate()).padStart(2, '0');
            var hours = String(startDateTime.getHours()).padStart(2, '0');
            var minutes = String(startDateTime.getMinutes()).padStart(2, '0');
            var endDateTime = year + "-" + month + "-" + day + "T" + hours + ":" + minutes;

            runningDteField.val(endDateTime);
        } else {
            alert("선택한 시간대에 이미 상영 일정이 있습니다. 다른 시간을 선택하세요.\n" + timeMessage);
            runningDtsField.val(''); // 입력 필드 초기화
            runningDteField.val(''); // 종료 시간 필드 초기화
            possibleTimesField.val(timeMessage);
        }
    }

    function formatDate(date) {
        var year = date.getFullYear();
        var month = String(date.getMonth() + 1).padStart(2, '0');
        var day = String(date.getDate()).padStart(2, '0');
        return year + "-" + month + "-" + day;
    }

    function formatTime(date) {
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var ampm = hours >= 12 ? '오후' : '오전';
        var isMidnight = hours === 0 && ampm === '오전';
        hours = hours % 12;
        hours = hours ? hours : 12; // 0시를 12시로 표시
        minutes = minutes < 10 ? '0' + minutes : minutes;
        if (isMidnight) {
            return '오전 00:' + minutes;
        }
        return ampm + ' ' + hours + ':' + minutes;
    }
});
</script>
<script>
function deleteRow(ciNum) {
    var scTime = document.getElementById('scTime' + ciNum).innerText;
    var scTimeEnd = document.getElementById('scTimeEnd' + ciNum).innerText;

    if (confirm('정말 삭제하시겠습니까?')) {
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/movie/deleteSchedule',
            type: 'POST',
            data: {
                CI_NUM: ciNum, 
                SC_TIME: scTime, 
                SC_TIME_END: scTimeEnd 
            }, // SC_TIME과 SC_TIME_END 전달
            success: function(response) {
                alert('삭제 완료!');
                location.reload(); // 페이지를 새로고침하여 변경 내용을 반영
            }
        });
    }
}

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
				<br>

				<!-- Topbar Include -->
				<%-- 				<jsp:include page="/WEB-INF/views/admin/inc/top.jsp" /> --%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- container-fluid -->


					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800"
						style="margin-left: 30px; padding-top: 12px;">상영 일정 관리</h1>
					<hr style="margin-bottom: 20px; margin-top: 30px;">

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-danger">상영 일정 등록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form
									action="${pageContext.request.contextPath}/admin/movie/movieschedulePro"
									method="post">
									<table class="table schedule-bordered" id="dataTable1"
										width="100%" cellspacing="0">
										<tr>
											<th>개봉날짜(최근3개월)</th>
											<td style="width: 331px;"><input type="date"
												id="dateInput" name="date"></td>
											<th>상영시작시간</th>
											<td><input type="datetime-local" id="runningDts"
												name="runningDts"></td>
											<th>상영 등록 가능 시간</th>
										</tr>
										<tr>
											<th>지역</th>
											<td><select id="regionList" name="TH_REGION">
													<option value="">지역 선택</option>
													<c:forEach var="list" items="${regionList}">
														<option value="${list.TH_REGION}">${list.TH_REGION}</option>
													</c:forEach>
											</select></td>
											<th>상영종료시간</th>
											<td><input type="datetime-local" id="runningDte"
												name="runningDte"></td>
											<td rowspan="10"><textarea id="possibleTimes"
													name="possibleTimes" rows="10" cols="50"
													style="height: 280px;"></textarea></td>
										<tr>
											<th>지점명</th>
											<td colspan="3"><select id="theaterList" name="TH_NAME">
													<option value="${list.TH_NAME}">먼저 지역을 선택하세요</option>
											</select></td>
										</tr>
										<tr>
											<th>상영관</th>
											<td colspan="3"><select id="cinemaList" name="TH_NUMBER">
													<option value="${list.TH_NUMBER}">먼저 지점명을 선택하세요</option>
											</select></td>
										</tr>
										<tr>
											<th>영화제목</th>
											<td colspan="3"><select id="movieNameList" name="title">
													<option value="${list.title}">영화를 선택하세요</option>
											</select></td>
										</tr>
										<tr>
											<th>런타임(분)</th>
											<td colspan="3"><input type="text" id="runtime"
												name="runtime" value=""></td>
										</tr>
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
					<hr>
					<!-- container-fluid -->


					<!-- Page Heading -->


					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-danger">예정 상영 일정</h6>
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
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="scheduleDTO" items="${scheduleList}">
											<tr id="row${scheduleDTO.CI_NUM}">
												<td id="region${scheduleDTO.CI_NUM}">${scheduleDTO.TH_REGION}</td>
												<td id="name${scheduleDTO.CI_NUM}">${scheduleDTO.TH_NAME}</td>
												<td id="cinema${scheduleDTO.CI_NUM}">${scheduleDTO.TH_NUMBER}</td>
												<td id="title${scheduleDTO.CI_NUM}"
													style="width: 900px !important;">${scheduleDTO.title}</td>
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
					<!-- Footer Include-->
					<jsp:include page="/WEB-INF/views/admin/inc/bottom.jsp" />
					<!-- End of Footer -->
				</div>
				<!-- End of Page Content -->

			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End Content Wrapper -->



	</div>


	<!-- End of Page Wrapper -->



	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>


	<script>	
	$(document).ready(function() {
    $('form').on('submit', function(event) {
        // 각 입력 필드 가져오기
        var dateInput = $('#dateInput');
        var runningDts = $('#runningDts');
        var runningDte = $('#runningDte');
        var regionList = $('#regionList');
        var theaterList = $('#theaterList');
        var cinemaList = $('#cinemaList');
        var movieNameList = $('#movieNameList');
        var titleEng = $('#titleEng');
        var runtime = $('#runtime');

        // 빈 칸 체크
        if (!dateInput.val()) {
            alert('개봉날짜를 입력해주세요.');
            dateInput.focus();
            event.preventDefault(); // 폼 제출 막기
            return false;
        }

        if (!runningDts.val()) {
            alert('상영시작시간을 입력해주세요.');
            runningDts.focus();
            event.preventDefault(); // 폼 제출 막기
            return false;
        }

        if (!runningDte.val()) {
            alert('상영종료시간을 입력해주세요.');
            runningDte.focus();
            event.preventDefault(); // 폼 제출 막기
            return false;
        }

        if (!regionList.val()) {
            alert('지역을 선택해주세요.');
            regionList.focus();
            event.preventDefault(); // 폼 제출 막기
            return false;
        }

        if (!theaterList.val()) {
            alert('지점명을 선택해주세요.');
            theaterList.focus();
            event.preventDefault(); // 폼 제출 막기
            return false;
        }

        if (!cinemaList.val()) {
            alert('상영관을 선택해주세요.');
            cinemaList.focus();
            event.preventDefault(); // 폼 제출 막기
            return false;
        }

        if (!movieNameList.val()) {
            alert('영화를 선택해주세요.');
            movieNameList.focus();
            event.preventDefault(); // 폼 제출 막기
            return false;
        }

        if (!runtime.val()) {
            alert('런타임을 입력해주세요.');
            runtime.focus();
            event.preventDefault(); // 폼 제출 막기
            return false;
        }
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