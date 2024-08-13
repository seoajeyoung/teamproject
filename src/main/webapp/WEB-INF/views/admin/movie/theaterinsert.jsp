<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>OSTicket - schedule list</title>
    
<!--     <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/resources/css/admin/common.css"> --%>
    
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/theaterinsert.css">

<!--     Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!--     Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/osticketAdmin.css" rel="stylesheet">

<!--     Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
<script>
    $(document).ready(function() {
    	$('#RegionT').prop('readonly', false);
        $('#regionList').change(function() {
            var selectedRegion = $(this).val();
            
            if (selectedRegion) {
                $('#RegionT').val(selectedRegion).prop('readonly', true); // 선택 후 필드를 읽기 전용으로 설정
            } else {
                $('#RegionT').val('').prop('readonly', false); // 선택된 지역이 없으면 필드를 수정 가능하게 설정
            }
            
            $('#NameT').val('').prop('readonly', false);
            $('#TH_NAMEEngT').val('').prop('readonly', false);
            $('#TH_ADDRT').val('').prop('readonly', false);
            $('#CI_NT').val('').prop('readonly', false);
            $('#cinemaList').empty().append('<option value="">상영관 선택</option>');
            console.log("Selected Region: " + selectedRegion);
            
            if (selectedRegion) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/admin/movie/findRegionEng',
                    type: 'POST',
                    data: { TH_REGION: selectedRegion },
                    beforeSend: function(xhr) {
                        console.log("Sending request to server with region: " + selectedRegion);
                    },
                    success: function(response) {
                        console.log("Response from server: ", response);
                        var thRegionEng = response.find(function(item) {
                            return item.th_REGION === selectedRegion && item.th_REGIONEng !== null;
                        });
                        if (thRegionEng) {
                            $('#TH_REGIONEngT').val(thRegionEng.th_REGIONEng).prop('readonly', true);
                        } else {
                            $('#TH_REGIONEngT').val('영문명을 입력하세요').prop('readonly', false);
                        }

                        // 중복 제거를 위한 Set 사용
                        var theaterNames = new Set();
                        response.forEach(function(item) {
                            if (item.th_REGION === selectedRegion) {
                                theaterNames.add(item.th_NAME);
                            }
                        });

                        // 지점 목록 설정
                        var theaterListSelect = $('#theaterList');
                        theaterListSelect.empty();
                        theaterListSelect.append('<option value="">지점 선택</option>');
                        theaterNames.forEach(function(name) {
                            theaterListSelect.append('<option value="' + name + '">' + name + '</option>');
                        });

                        // 지점 선택 이벤트
                        theaterListSelect.change(function() {
                            var selectedTheater = $(this).val();
                            if (selectedTheater) {
                                $('#NameT').val(selectedTheater).prop('readonly', true);
                                
                                // 지점명에 해당하는 영문 지점명 및 지점주소 설정
                                var selectedTheaterData = response.find(function(item) {
                                    return item.th_NAME === selectedTheater;
                                });
                                if (selectedTheaterData) {
                                    if (selectedTheaterData.th_NAMEEng) {
                                        $('#TH_NAMEEngT').val(selectedTheaterData.th_NAMEEng).prop('readonly', true);
                                    } else {
                                        $('#TH_NAMEEngT').val('영문명을 입력하세요').prop('readonly', false);
                                    }

                                    if (selectedTheaterData.th_ADDR) {
                                        $('#TH_ADDRT').val(selectedTheaterData.th_ADDR).prop('readonly', true);
                                    } else {
                                        $('#TH_ADDRT').val('지점주소를 입력하세요').prop('readonly', false);
                                    }

                                    // 상영관 목록 설정
                                    var cinemaListSelect = $('#cinemaList');
                                    cinemaListSelect.empty();
                                    cinemaListSelect.append('<option value="">상영관 선택</option>');
                                    var cinemaNumbers = new Set();
                                    response.forEach(function(item) {
                                        if (item.th_NAME === selectedTheater && item.th_NUMBER !== null) {
                                            cinemaNumbers.add(item.th_NUMBER);
                                        }
                                    });

                                    if (cinemaNumbers.size > 0) {
                                        cinemaNumbers.forEach(function(number) {
                                            cinemaListSelect.append('<option value="' + number + '">' + number + '</option>');
                                        });

                                        // 상영관 선택 이벤트
                                        cinemaListSelect.change(function() {
                                            var selectedCinema = $(this).val();
                                            if (selectedCinema) {
                                                $('#CI_NT').val(selectedCinema).prop('readonly', true);
                                            } else {
                                                $('#CI_NT').val('').prop('readonly', false);
                                            }
                                        });
                                    } else {
                                        // 상영관이 없을 때
                                        $('#CI_NT').val('상영관을 입력하세요').prop('readonly', false);
                                    }
                                }
                            } else {
                                $('#NameT').val('').prop('readonly', false);
                                $('#TH_NAMEEngT').val('').prop('readonly', false);
                                $('#TH_ADDRT').val('').prop('readonly', false);
                                $('#CI_NT').val('').prop('readonly', false);
                                $('#cinemaList').empty().append('<option value="">상영관 선택</option>');
                            }
                        });
                    },
                    error: function(xhr, status, error) {
                        console.log("AJAX Error: ", status, error);
                        alert("영문명을 가져오는데 실패했습니다.");
                        $('#TH_REGIONEngT').val('영문명을 입력하세요').prop('readonly', false);
                    }
                });
            } else {
                $('#TH_REGIONEngT').val('').prop('readonly', false);
                $('#theaterList').empty().append('<option value="">지점 선택</option>');
                $('#NameT').val('').prop('readonly', false);
                $('#TH_NAMEEngT').val('').prop('readonly', false);
                $('#TH_ADDRT').val('').prop('readonly', false);
                $('#CI_NT').val('').prop('readonly', false);
                $('#cinemaList').empty().append('<option value="">상영관 선택</option>');
            }
        });

        // Focus 및 Blur 이벤트 핸들러 합치기
        $('#TH_REGIONEngT, #TH_NAMEEngT').on('focus blur', function(event) {
            if (event.type === 'focus' && $(this).val() === '영문명을 입력하세요') {
                $(this).val('');
            } else if (event.type === 'blur' && $(this).val().trim() === '') {
                $(this).val('영문명을 입력하세요');
            }
        });

        // 지점주소 입력 필드 focus/blur 핸들러
        $('#TH_ADDRT').focus(function() {
            if ($(this).val() === '지점주소를 입력하세요') {
                $(this).val('');
            }
        }).blur(function() {
            if ($(this).val().trim() === '') {
                $(this).val('지점주소를 입력하세요');
            }
        });
        
     // 상영관 입력 필드 focus/blur 핸들러
        $('#CI_NT').focus(function() {
            if ($(this).val() === '상영관을 입력하세요') {
                $(this).val('');
            }
        }).blur(function() {
            if ($(this).val().trim() === '') {
                $(this).val('상영관을 입력하세요');
            }
        });
    });
</script>
<script>
    function enableEdit(thNum) {
        // 각 셀의 내용을 <input type="text">로 변경
        var region = document.getElementById('region' + thNum);
        var regionEng = document.getElementById('regionEng' + thNum);
        var name = document.getElementById('name' + thNum);
        var nameEng = document.getElementById('nameEng' + thNum);
        var addr = document.getElementById('addr' + thNum);
        var cinema = document.getElementById('cinema' + thNum);
        
        region.innerHTML = '<input type="text" value="' + region.textContent + '">';
        regionEng.innerHTML = '<input type="text" value="' + regionEng.textContent + '">';
        name.innerHTML = '<input type="text" value="' + name.textContent + '">';
        nameEng.innerHTML = '<input type="text" value="' + nameEng.textContent + '">';
        addr.innerHTML = '<textarea rows="1" cols="30" value="' + addr.textContent + '">';
        cinema.innerHTML = '<input type="text" value="' + cinema.textContent + '">';

        // 수정 버튼을 저장 버튼으로 변경
        var editButton = document.querySelector('#row' + thNum + ' button:first-child');
        editButton.textContent = '저장';
        editButton.setAttribute('onclick', 'saveRow(' + thNum + ')');
    }

    function saveRow(thNum) {
        // 수정된 내용을 다시 텍스트로 변환
        var region = document.querySelector('#region' + thNum + ' input').value;
        var regionEng = document.querySelector('#regionEng' + thNum + ' input').value;
        var name = document.querySelector('#name' + thNum + ' input').value;
        var nameEng = document.querySelector('#nameEng' + thNum + ' input').value;
        var addr = document.querySelector('#addr' + thNum + ' input').value;
        var cinema = document.querySelector('#cinema' + thNum + ' input').value;

        // 서버로 데이터 전송 (AJAX)
        var params = {
            TH_NUM: thNum,
            TH_REGION: region,
            TH_REGIONEng: regionEng,
            TH_NAME: name,
            TH_NAMEEng: nameEng,
            TH_ADDR: addr,
            TH_NUMBER: cinema
        };

        $.ajax({
            url: '${pageContext.request.contextPath}/admin/movie/updateTheater',
            type: 'POST',
            data: params,
            success: function(response) {
                alert('수정 완료!');
                location.reload(); // 페이지를 새로고침하여 변경된 내용을 반영
            }
        });
    }
    
    function deleteRow(thNum) {
        if (confirm('정말 삭제하시겠습니까?')) {
            $.ajax({
                url: '${pageContext.request.contextPath}/admin/movie/deleteTheater',
                type: 'POST',
                data: { TH_NUM: thNum },
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

<!--     Page Wrapper -->
    <div id="wrapper">

		<!-- Sidebar Include -->
        <jsp:include page = "/WEB-INF/views/admin/inc/sidebar.jsp"/>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

			<!-- Topbar Include -->
            <jsp:include page = "/WEB-INF/views/admin/inc/top.jsp"/>
            <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
				<!-- container-fluid -->
				
				
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800" style="margin-left: 20px;">상영지점관리</h1><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-danger">상영지점등록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                           		<form
									action="${pageContext.request.contextPath}/admin/movie/theaterinsertPro"
									method="post">
                                <table class="table theater-bordered" id="dataTable1" width="100%" cellspacing="0">
                                    <tbody>
                                        <tr>
                                        	<th>지역</th>
                                        	<th>지역영문명</th>
                                        	<th>지점명</th>
                                        	<th>지점영문명</th>
                                        	<th>지점주소</th>
                                        	<th>상영관</th>
                                        </tr>
                                        <tr>	
                                        	<td>
                                        		<input type="text" id="RegionT" name="RegionT" value=""><select id="regionList" name="TH_REGION"> 
													<option value="">지역 선택</option>
														<c:forEach var="list" items="${regionList}">
															<option value="${list.TH_REGION}">${list.TH_REGION}</option>
														</c:forEach>
												</select>
											</td>
											<td id="TD_REGIONEng">
                                    			<input type="text" id="TH_REGIONEngT" name="TH_REGIONEngT" value="">
                                    		</td>
											<td>
                                    			<input type="text" id="NameT" name="NameT" value="">
                                    			<select id="theaterList" name="TH_NAME">
														<option value="">지점 선택</option>
												</select>
											</td>
                                    		<td id="TD_NAMEEng">
                                    			<input type="text" id="TH_NAMEEngT" name="TH_NAMEEngT" value="">
                                    		</td>
                                    		
                                    		<td>
                                    			<textarea id="TH_ADDRT" name="TH_ADDRT" value=""
														rows="1" cols="30"></textarea>
<!-- 												<input type="text" id="TH_ADDRT" name="TH_ADDRT" value=""> -->
											</td>
											
											<td>
												<input type="text" id="CI_NT" name="CI_NT" value="">
												<select id="cinemaList" name="CI_NUMBER">
													<option value="">상영관 선택</option>
												</select></td>
										</tr>
                                    </tbody>
                                </table>
                                <div class="button-container">
                                <button type="submit" class="btn btn-danger btn-user same-size">등록</button>
								<button type="reset" class="btn btn-secondary btn-user same-size">초기화</button>
								</div>
                              </form>
                              
                            </div> <!-- table-responsive  --> 
                        </div> <!-- card-body -->
                    </div> <!-- card shadow mb-4 -->

                </div> <!-- End of Page Content -->
                
                <!-- Begin Page Content -->
				<div class="container-fluid">
				<!-- container-fluid -->


					<!-- Page Heading -->
					

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-danger">상영지점목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form action="${pageContext.request.contextPath}/admin/movie/branchupdatePro" method="post">
								<div class="table-container">
									<table class="table theater-bordered2" id="dataTable" width="100%"
										cellspacing="0">
									<thead>
                                        <tr>
                                        	<th>지역</th>
                                        	<th>지역영문명</th>
											<th>지점명</th>
											<th>지점영문명</th>
											<th>지점주소</th>
											<th>상영관</th>
											<th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
    									<c:forEach var="adminDTO" items="${branchList}">
    										<tr id="row${adminDTO.TH_NUM}">
        										<td id="region${adminDTO.TH_NUM}">${adminDTO.TH_REGION}</td>
        										<td id="regionEng${adminDTO.TH_NUM}">${adminDTO.TH_REGIONEng}</td>
        										<td id="name${adminDTO.TH_NUM}">${adminDTO.TH_NAME}</td>
        										<td id="nameEng${adminDTO.TH_NUM}">${adminDTO.TH_NAMEEng}</td>
        										<td id="addr${adminDTO.TH_NUM}">${adminDTO.TH_ADDR}</td>
        										<td id="cinema${adminDTO.TH_NUM}">${adminDTO.TH_NUMBER}</td>
        										<td>
        										<button type="button" class="btn btn-danger btn-user same-size1" onclick="enableEdit(${adminDTO.TH_NUM})">수정</button>
        										<button type="button" class="btn btn-secondary btn-user same-size1" onclick="deleteRow(${adminDTO.TH_NUM})">삭제</button>
        										</td>
    										</tr>
    									</c:forEach>
									</tbody>
								</table>
								</div>
								</form>
							</div> <!-- table-responsive  --> 
						</div> <!-- card-body -->
					</div><!-- card shadow mb-4 -->

				</div> <!-- End of Page Content -->

            </div> <!-- End of Main Content -->

            <!-- Footer Include-->
       		<jsp:include page="/WEB-INF/views/admin/inc/bottom.jsp"/>
        	<!-- End of Footer -->

    	</div><!-- End of Content Wrapper -->
    
	</div><!-- End of Page Wrapper -->
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
	
    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Ã</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/script/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/script/demo/datatables-demo.js"></script>

</body>

</html>