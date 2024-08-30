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

<title>OSTicket - StoreUpdate</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/movieschedule.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/controlstore.css">
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
    // 초기 로드 시 ST_NAME과 ST_DETAIL 값이 이 상품의 것인지 확인
    var originalName = $('#ST_NAME').val();
    var originalDetail = $('#ST_DETAIL').val();

    // 초기 상태에서 '이 상품의 상품이름입니다.' 또는 '이 상품의 상품내용입니다.'로 표시
    $('#nameCheckMessage').text('이 상품의 상품이름입니다.').css('color', 'blue');
    $('#detailCheckMessage').text('이 상품의 상품내용입니다.').css('color', 'blue');

    function checkStoreDetails(storeDetails, callback) {
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/store/check-store-details',
            type: 'POST',
            data: $.param(storeDetails),
            success: function(response) {
                callback(null, response);
            },
            error: function() {
                callback('서버 요청 중 오류가 발생했습니다. 다시 시도해 주세요.', null);
            }
        });
    }

    // 폼 제출 핸들러
    $('#storeForm').on('submit', function(event) {
        event.preventDefault(); // 기본 폼 제출 막기

        var isValid = true;

        // 입력 필드 가져오기
        var stName = $('#ST_NAME');
        var stPrice = $('#ST_PRICE');
        var stType = $('#ST_TYPE');
        var stDetail = $('#ST_DETAIL');

        // 이전 메시지 초기화
        $('#nameCheckMessage').text('');
        $('#detailCheckMessage').text('');

        // 빈 칸 검증 - 첫 번째 빈 칸에 대해 경고 후 중지
        if (!stName.val().trim()) {
            alert('상품이름을 입력하세요.');
            stName.focus();
            return false;
        }

        if (!stPrice.val().trim()) {
            alert('상품가격을 입력하세요.');
            stPrice.focus();
            return false;
        }

        if (!stType.val().trim()) {
            alert('상품타입을 선택하세요.');
            stType.focus();
            return false;
        }

        if (!stDetail.val().trim()) {
            alert('상품설명을 입력하세요.');
            stDetail.focus();
            return false;
        }

        // 중복 검사 데이터 준비
        var storeDetails = {
            ST_NUM: $('#ST_NUM').val(), // 기존 상품번호
            ST_NAME: stName.val().trim(),
            ST_DETAIL: stDetail.val().trim()
        };

        // AJAX를 통한 중복 검사
        checkStoreDetails(storeDetails, function(error, response) {
            if (error) {
                alert(error);
                return false;
            }

            var canSubmit = true;

            // 상품 이름 중복 검사
            if (storeDetails.ST_NAME !== originalName && response.nameExists) {
                $('#nameCheckMessage').text('이미 사용중인 상품이름입니다.').css('color', 'red');
                canSubmit = false;
            } else if (storeDetails.ST_NAME === originalName) {
                $('#nameCheckMessage').text('이 상품의 상품이름입니다.').css('color', 'blue');
            } else {
                $('#nameCheckMessage').text('사용가능한 상품이름입니다.').css('color', 'green');
            }

            // 상품 설명 중복 검사
            if (storeDetails.ST_DETAIL !== originalDetail && response.detailExists) {
                $('#detailCheckMessage').text('이미 사용중인 상품설명입니다.').css('color', 'red');
                canSubmit = false;
            } else if (storeDetails.ST_DETAIL === originalDetail) {
                $('#detailCheckMessage').text('이 상품의 상품내용입니다.').css('color', 'blue');
            } else {
                $('#detailCheckMessage').text('사용가능한 상품내용입니다.').css('color', 'green');
            }

            if (canSubmit) {
                // 모든 검증이 통과되면 폼 제출
                $('#storeForm')[0].submit();
            } else {
                alert('이미 사용중인 상품이름 또는 설명이 있습니다.');
            }
        });
    });

    // 기존의 중복 검사 (blur 이벤트)
    $('#ST_NAME, #ST_DETAIL').on('blur', function() {
        var storeDetails = {
            ST_NUM: $('#ST_NUM').val(), // 기존 상품번호
            ST_NAME: $('#ST_NAME').val().trim(),
            ST_DETAIL: $('#ST_DETAIL').val().trim()
        };

        // 필드에 값이 있을 경우에만 검사 수행
        if (storeDetails.ST_NAME || storeDetails.ST_DETAIL) {
            $.ajax({
                url: '${pageContext.request.contextPath}/admin/store/check-store-details',
                type: 'POST',
                data: $.param(storeDetails),
                success: function(response) {
                    // 상품 이름 검사
                    if (storeDetails.ST_NAME === "") {
                        $('#nameCheckMessage').text('');
                    } else if (storeDetails.ST_NAME === originalName) {
                        $('#nameCheckMessage').text('이 상품의 상품이름입니다.').css('color', 'blue');
                    } else if (response.nameExists) {
                        $('#nameCheckMessage').text('이미 사용중인 상품이름입니다.').css('color', 'red');
                    } else {
                        $('#nameCheckMessage').text('사용가능한 상품이름입니다.').css('color', 'green');
                    }

                    // 상품 설명 검사
                    if (storeDetails.ST_DETAIL === "") {
                        $('#detailCheckMessage').text('');
                    } else if (storeDetails.ST_DETAIL === originalDetail) {
                        $('#detailCheckMessage').text('이 상품의 상품내용입니다.').css('color', 'blue');
                    } else if (response.detailExists) {
                        $('#detailCheckMessage').text('이미 사용중인 상품설명입니다.').css('color', 'red');
                    } else {
                        $('#detailCheckMessage').text('사용가능한 상품설명입니다.').css('color', 'green');
                    }
                },
                error: function() {
                    alert('서버 요청 중 오류가 발생했습니다. 다시 시도해 주세요.');
                }
            });
        }
    });

    // 기타 기존 핸들러들
    $('#typeList').change(function() {
        var selectedType = $(this).val();
        if (selectedType) {
            $('#ST_TYPE').val(selectedType).prop('readonly', true);
        } else {
            $('#ST_TYPE').val('').prop('readonly', false);
        }
    });

    $('#file-upload').on('change', function(event) {
        var file = event.target.files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                var imgElement = $('<img>').attr('src', e.target.result).css({
                    'max-width': '100%',
                    'height': 'auto',
                    'display': 'block',
                    'margin': 'auto'
                });
                $('#image-preview').empty().append(imgElement);
            }
            reader.readAsDataURL(file);
        }
    });

    $('#reset-button').on('click', function() {
        $('#image-preview').empty();
        $('#file-upload').val('');
        // 다른 필드 초기화가 필요하면 추가
    });

    $('#NEW_DATE').on('change', function() {
        var selectedDate = $(this).val();
        $('#ST_PERIOD').val(selectedDate);
    });
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
				<br>

				<!-- Topbar Include -->
				<%-- 				<jsp:include page="/WEB-INF/views/admin/inc/top.jsp" /> --%>
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
								<form id="storeForm"
									action="${pageContext.request.contextPath}/admin/store/storeinfoPro"
									method="post" enctype="multipart/form-data">
									<input type="hidden" name="ST_NUM" value="${adminDTO.ST_NUM}">
									<table class="table schedule-bordered" id="dataTable1"
										width="100%" cellspacing="0">
										<tr>
											<th>상품번호</th>
											<td>${adminDTO.ST_NUM}</td>
											<th style="width: 526px;">상품이미지 <label for="file-upload"
												class="custom-file-upload"
												style="padding-top: 0px; padding-bottom: 0px; border-bottom-width: 0px; border-top-width: 0px; height: 25px;">
													첨부하기 </label> <input id="file-upload" type="file"
												name="store_picture" style="display: none;"></th>
										</tr>
										<tr>
											<th>상품이름</th>
											<td><input type="text" id="ST_NAME" name="ST_NAME"
												value="${adminDTO.ST_NAME}" style="margin-right: 5px;">
												<span id="nameCheckMessage"></span></td>
											<td rowspan="8" id="image-preview">
												<img src="${pageContext.request.contextPath}/resources/img/${adminDTO.ST_PICTURE}" alt="${storeDTO.ST_NAME }">								
											</td>
										<tr>
											<th>상품타입</th>
											<td><input type="text" id="ST_TYPE" name="ST_TYPE"
												value="${adminDTO.ST_TYPE}"> <select id="typeList"
												name="ST_TYPE1" style="padding-top: 1px;">
													<option value="">상품타입</option>
													<c:forEach var="list" items="${typeList}">
														<option value="${list.ST_TYPE}">${list.ST_TYPE}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th>상품구성</th>
											<td><input type="text" id="ST_CONST" name="ST_CONST"
												value="${adminDTO.ST_CONST}"></td>
										</tr>
										<tr>
											<th>상품유효기간</th>
											<td><input type="text" id="ST_PERIOD" name="ST_PERIOD"
												value="${adminDTO.ST_PERIOD}"> <input type="date"
												id="NEW_DATE" name="NEW_DATE" style="padding-top: 4px;"></td>
										</tr>
										<tr>
											<th>상품가격</th>
											<td><input type="text" id="ST_PRICE" name="ST_PRICE"
												value="${adminDTO.ST_PRICE}"> 원</td>
										</tr>
										<tr>
											<th rowspan="6">상품설명</th>
											<td rowspan="6"><textarea id="ST_DETAIL"
													name="ST_DETAIL" rows="10" cols="50" style="width: 799px;">${adminDTO.ST_DETAIL}</textarea><br>
												<span id="detailCheckMessage"></span></td>
										</tr>
									</table>
									<div class="button-container">
										<button type="submit" class="btn btn-danger btn-user"
											style="margin-right: 2px;">수정완료</button>
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

			</div>
			<!-- End of Page Wrapper -->

			<!-- Footer Include-->
			<jsp:include page="/WEB-INF/views/admin/inc/bottom.jsp" />
			<!-- End of Footer -->

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