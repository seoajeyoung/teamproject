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

<script type = "text/javascript">
$(function() {
    var endRDateTime = "";
    
    $('#titleEngTh').hide();
    $('#titleEngTd').hide();
    
	
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
        var titleEngTh = $('#titleEngTh');
        var titleEngTd = $('#titleEngTd');
        var runtimeField = $('#runtime');
        var runningDtsField = $('#runningDts');
        var runningDteField = $('#runningDte');

        if (selectedMovie) { // 영화가 선택되었으면
            console.log("Selected Movie: ", selectedMovie); // 선택된 영화 데이터 출력
            if (selectedMovie.TITLEENG) { // 선택된 영화에 영문 제목이 있으면
                titleEngField.val(selectedMovie.TITLEENG); // 영문 제목 입력
                titleEngTh.hide(); // 영문 제목 <th> 숨김
                titleEngTd.hide(); // 영문 제목 <td> 숨김
            } else {
                titleEngField.val('영문제목이 없습니다. 입력해주세요'); // 영문 제목이 없으면 기본 메시지 입력
                titleEngTh.show(); // 영문 제목 <th> 표시
                titleEngTd.show(); // 영문 제목 <td> 표시
            }

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
    $('#regionList, #theaterList, #cinemaList, #runtime').change(function() {
        var TH_REGION = $('#regionList option:selected').val();
        var TH_NAME = $('#theaterList option:selected').val();
        var CI_NUMBER = $('#cinemaList option:selected').val();
        var runtime = $('#runtime').val();

        // 콘솔에 각 값 출력
        console.log("TH_REGION: " + TH_REGION);
        console.log("TH_NAME: " + TH_NAME);
        console.log("CI_NUMBER: " + CI_NUMBER);
        console.log("Runtime: " + runtime);

        if (TH_REGION && TH_NAME && CI_NUMBER && runtime) {
            console.log("Sending AJAX request to get schedule...");
            $.ajax({
                url: '${pageContext.request.contextPath}/admin/movie/getSchedule', // 요청 URL
                type: 'POST',
                data: { TH_REGION: TH_REGION, TH_NAME: TH_NAME, CI_NUMBER: CI_NUMBER },
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

        runningDtsField.off('change').on('change', function() {
            var selectedTime = new Date($(this).val()).getTime();
            var runtimeMs = parseInt(runtime) * 60 * 1000; // 런타임을 밀리초로 변환
            console.log("Runtime in ms: " + runtimeMs);

            console.log("Schedules received: ", schedules); // schedules 객체 출력

            // 스케줄을 날짜 순서대로 정렬
            schedules.sort(function(a, b) {
                return new Date(a.sc_TIME) - new Date(b.sc_TIME);
            });

            var possibleTimes = [];
            var selectedDate = new Date($(this).val());
            var businessStart = new Date(selectedDate.setHours(8, 30, 0, 0)).getTime(); // 08:30 AM
            var businessEnd = new Date(selectedDate.setHours(24, 30, 0, 0)).getTime(); // 00:30 AM next day

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

            if (businessEnd - previousEnd >= runtimeMs) {
                possibleTimes.push({
                    start: new Date(previousEnd),
                    end: new Date(businessEnd)
                });
            }

            // 가능한 시간대를 포맷하여 출력
            var timeMessage = "<상영등록가능시간>\n";
            possibleTimes.forEach(function(time) {
                timeMessage += formatDate(time.start) + " " + formatTime(time.start) + " ~ " + formatDate(time.end) + " " + formatTime(time.end) + "\n";
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
                $(this).val(''); // 입력 필드 초기화
                runningDteField.val(''); // 종료 시간 필드 초기화
            } else if (isTimeValid) {
                var runtimeMinutes = parseInt(runtime); // 런타임을 분으로 변환
                var startDateTime = new Date($(this).val());

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
                $(this).val(''); // 입력 필드 초기화
                runningDteField.val(''); // 종료 시간 필드 초기화
                possibleTimesField.val(timeMessage);
            }
        });

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
                return '익일 00:' + minutes;
            }
            return ampm + ' ' + hours + ':' + minutes;
        }
    }



    // 영문 제목 입력 필드 클릭시 이벤트 핸들러
    $('#titleEng').focus(function() {
        if ($(this).val() === '영문제목이 없습니다. 입력해주세요') { // 기본 메시지가 있으면
            $(this).val(''); // 빈 값으로 변경
        }
    });

    // 영문 제목 입력 필드에서 포커스가 벗어났을 때 이벤트 핸들러
    $('#titleEng').blur(function() {
        if ($(this).val().trim() === '') { // 입력 필드가 비어있으면
            $(this).val('영문제목이 없습니다. 입력해주세요'); // 기본 메시지 다시 표시
        }
    });
});
</script>
<script>
    function enableEdit(ciNumber) {
        // 각 셀의 내용을 <input type="text">로 변경
        var region = document.getElementById('region' + ciNumber);
        var name = document.getElementById('name' + ciNumber);
        var cinema = document.getElementById('cinema' + ciNumber);
        var title = document.getElementById('title' + ciNumber);
        var scTime = document.getElementById('scTime' + ciNumber);
        var scTimeEnd = document.getElementById('scTimeEnd' + ciNumber);

        region.innerHTML = '<input type="text" value="' + region.textContent + '">';
        name.innerHTML = '<input type="text" value="' + name.textContent + '">';
        cinema.innerHTML = '<input type="text" value="' + cinema.textContent + '">';
        title.innerHTML = '<input type="text" value="' + title.textContent + '">';
        scTime.innerHTML = '<input type="text" value="' + scTime.textContent + '">';
        scTimeEnd.innerHTML = '<input type="text" value="' + scTimeEnd.textContent + '">';

        // 수정 버튼을 저장 버튼으로 변경
        var editButton = document.querySelector('#row' + ciNumber + ' button:first-child');
        editButton.textContent = '저장';
        editButton.setAttribute('onclick', 'saveRow(' + ciNumber + ')');
    }

    function saveRow(ciNumber) {
        // 수정된 내용을 다시 텍스트로 변환
        var region = document.querySelector('#region' + ciNumber + ' input').value;
        var name = document.querySelector('#name' + ciNumber + ' input').value;
        var cinema = document.querySelector('#cinema' + ciNumber + ' input').value;
        var title = document.querySelector('#title' + ciNumber + ' input').value;
        var scTime = document.querySelector('#scTime' + ciNumber + ' input').value;
        var scTimeEnd = document.querySelector('#scTimeEnd' + ciNumber + ' input').value;

        // 서버로 데이터 전송 (AJAX)
        var params = {
            CI_NUMBER: ciNumber,
            TH_REGION: region,
            TH_NAME: name,
            title: title,
            SC_TIME: scTime,
            SC_TIME_END: scTimeEnd
        };

        $.ajax({
            url: '${pageContext.request.contextPath}/admin/movie/updateSchedule', // 서버의 적절한 엔드포인트로 수정
            type: 'POST',
            data: params,
            success: function(response) {
                alert('수정 완료!');
                location.reload(); // 페이지를 새로고침하여 변경된 내용을 반영
            }
        });
    }

    function deleteRow(ciNumber) {
        if (confirm('정말 삭제하시겠습니까?')) {
            $.ajax({
                url: '${pageContext.request.contextPath}/admin/movie/deleteSchedule', // 서버의 적절한 엔드포인트로 수정
                type: 'POST',
                data: { CI_NUMBER: ciNumber },
                success: function(response) {
                    alert('삭제 완료!');
                    location.reload();
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

				<!-- Topbar Include -->
				<jsp:include page="/WEB-INF/views/admin/inc/top.jsp" />
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
				<!-- container-fluid -->


					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">상영일정관리</h1>
					<p class="mb-4">
						링크~ <a target="_blank" href="https://datatables.net">넣던가~</a>.
					</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">상영일정관리</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form
									action="${pageContext.request.contextPath}/admin/movie/movieschedulePro"
									method="post">
									<table class="table table-bordered" id="dataTable1" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th>개봉날짜(최근3개월)</th>
												<th>지역</th>
												<th>지점명</th>
												<th>상영관</th>
												<th>영화제목</th>
												<th id="titleEngTh">영문제목</th>
												<th>런타임(분)</th>
												<th>상영가능시간</th>
												<th>상영시작시간</th>
												<th>상영종료시간</th>
												<th>등록</th>
												<th>초기화</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="date" id="dateInput" name="date">
												</td>
												<td><select id="regionList" name="TH_REGION">
														<option value="">지역 선택</option>
														<c:forEach var="list" items="${regionList}">
															<option value="${list.TH_REGION}">${list.TH_REGION}</option>
														</c:forEach>
												</select></td>
												<td><select id="theaterList" name="TH_NAME">
														<option value="${list.TH_NAME}">먼저 지역을 선택하세요</option>
												</select></td>
												<td><select id="cinemaList" name="CI_NUMBER">
														<option value="${list.CI_NUMBER}">먼저 지점명을 선택하세요</option>
												</select></td>
												<td><select id="movieNameList" name="title">
														<option value="${list.title}">영화를 선택하세요</option>
												</select></td>
												<td id="titleEngTd"><input type="text" id="titleEng"
													name="titleEng" value="영문제목이 없습니다. 입력해주세요"></td>
												<td><input type="text" id="runtime" name="runtime" value=""></td>
													
													
												<td><textarea id="possibleTimes" name="possibleTimes" rows="10" cols="50"></textarea></td>
												
												
												<td><input type="datetime-local" id="runningDts"
													name="runningDts"></td>
												<td><input type="datetime-local" id="runningDte"
													name="runningDte"></td>
												<td><button type="submit">등록</button></td>
												<td><button type="reset">초기화</button></td>
											</tr>
										</tbody>
									</table>
								</form>
								
								
							</div> <!-- table-responsive  --> 
						</div> <!-- card-body -->
					</div><!-- card shadow mb-4 -->

				</div> <!-- End of Page Content -->
				
				<!-- Begin Page Content -->
				<div class="container-fluid">
				<!-- container-fluid -->


					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">상영일정관리</h1>
					<p class="mb-4">
						링크~ <a target="_blank" href="https://datatables.net">넣던가~</a>.
					</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">상영일정관리</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
									<thead>
                                        <tr>
                                        	<th>지역</th>
											<th>지점명</th>
											<th>상영관</th>
											<th>영화제목</th>
											<th>상영시작시간</th>
											<th>상영종료시간</th>
											<th>수정</th>
											<th>삭제</th>
                                        </tr>
                                    </thead>
                                   <tbody>
    <c:forEach var="scheduleDTO" items="${scheduleList}">
    <tr id="row${scheduleDTO.CI_NUMBER}">
        <td id="region${scheduleDTO.CI_NUMBER}">${scheduleDTO.TH_REGION}</td>
        <td id="name${scheduleDTO.CI_NUMBER}">${scheduleDTO.TH_NAME}</td>
        <td id="cinema${scheduleDTO.CI_NUMBER}">${scheduleDTO.CI_NUMBER}</td>
        <td id="title${scheduleDTO.CI_NUMBER}">${scheduleDTO.title}</td>
        <td id="scTime${scheduleDTO.CI_NUMBER}">${scheduleDTO.SC_TIME}</td>
        <td id="scTimeEnd${scheduleDTO.CI_NUMBER}">${scheduleDTO.SC_TIME_END}</td>
        <td><button type="button" onclick="enableEdit(${scheduleDTO.CI_NUMBER})">수정</button></td>
        <td><button type="button" onclick="deleteRow(${scheduleDTO.CI_NUMBER})">삭제</button></td>
    </tr>
    </c:forEach>
</tbody>

								</table>
							</div> <!-- table-responsive  --> 
						</div> <!-- card-body -->
					</div><!-- card shadow mb-4 -->

				</div> <!-- End of Page Content -->
				
			</div><!-- End of Main Content -->
			
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
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">Ã</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
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
		<script
			src="${pageContext.request.contextPath}/resources/script/demo/datatables-demo.js"></script>
</body>

</html>