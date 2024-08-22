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
    function checkStoreDetails() {
        var storeDetails = {
            ST_NUM: $('#ST_NUM').val(),
            ST_NAME: $('#ST_NAME').val(),
            ST_DETAIL: $('#ST_DETAIL').val()
        };
        
        console.log("Sending data to server:", storeDetails);

        $.ajax({
            url: '${pageContext.request.contextPath}/admin/store/check-store-details',
            type: 'POST',
            data: storeDetails,
            success: function(response) {
                console.log("Response:", response);
                // ST_NUM 검사
                if (storeDetails.ST_NUM === "") {
                    $('#numCheckMessage').text(''); // 빈칸일 때는 아무것도 표시하지 않음
                } else if (response.numExists) {
                    $('#numCheckMessage').text('이미 사용중인 상품코드입니다.').css('color', 'red');
                } else {
                    $('#numCheckMessage').text('사용가능한 상품코드입니다.').css('color', 'green');
                }

                // ST_NAME 검사
                if (storeDetails.ST_NAME === "") {
                    $('#nameCheckMessage').text(''); // 빈칸일 때는 아무것도 표시하지 않음
                } else if (response.nameExists) {
                    $('#nameCheckMessage').text('이미 사용중인 상품이름입니다.').css('color', 'red');
                } else {
                    $('#nameCheckMessage').text('사용가능한 상품이름입니다.').css('color', 'green');
                }

                // ST_DETAIL 검사
                if (storeDetails.ST_DETAIL === "") {
                    $('#detailCheckMessage').text(''); // 빈칸일 때는 아무것도 표시하지 않음
                } else if (response.detailExists) {
                    $('#detailCheckMessage').text('이미 사용중인 상품설명입니다.').css('color', 'red');
                } else {
                    $('#detailCheckMessage').text('사용가능한 상품설명입니다.').css('color', 'green');
                }
            }
        });
    }

    $('#ST_NUM, #ST_NAME, #ST_DETAIL').on('blur', checkStoreDetails);
    
     
    $('#typeList').change(function() {
        var selectedType = $(this).val();
        if (selectedType) {
            // 선택된 값이 있을 때: 값을 설정하고 읽기 전용으로 설정
            $('#ST_TYPE').val(selectedType).prop('readonly', true);
        } else {
            // 선택된 값이 기본값(빈 문자열)일 때: 읽기 전용 해제 및 입력 필드를 비움
            $('#ST_TYPE').val('').prop('readonly', false);
        }
    });
    
    document.getElementById('file-upload').addEventListener('change', function(event) {
        var file = event.target.files[0]; // 사용자가 선택한 파일
        if (file) {
            var reader = new FileReader(); // FileReader 객체 생성

            reader.onload = function(e) {
                // 이미지 미리보기를 위한 <img> 요소 생성
                var imgElement = document.createElement('img');
                imgElement.src = e.target.result;
                imgElement.style.maxWidth = '100%'; // 이미지의 최대 너비를 <td>에 맞춤
                imgElement.style.height = 'auto'; // 높이를 자동으로 조절

                // 기존의 이미지 미리보기를 제거하고 새로 추가
                var imagePreview = document.getElementById('image-preview');
                imagePreview.innerHTML = ''; // <td> 안의 기존 내용을 지움
                imagePreview.appendChild(imgElement); // 새 이미지를 <td> 안에 추가
            }

            reader.readAsDataURL(file); // 파일을 읽고 결과를 Data URL로 변환
        }
    });
    
    document.getElementById('reset-button').addEventListener('click', function() {
        // 이미지 미리보기 영역 비우기
        document.getElementById('image-preview').innerHTML = '';

        // 파일 입력 필드 초기화
        var fileInput = document.getElementById('file-upload');
        fileInput.value = ''; // 파일 입력 필드의 값을 초기화

        // 다른 필요한 필드 초기화 작업도 여기서 수행 가능
    });
    
    function submitStoreInfo() {
        // form element를 가져와 submit 메서드를 호출하여 폼을 제출
        document.getElementById('storeForm').submit();
    }
    
});
</script>
<script>
function deleteRow(stNum) {
    if (confirm('정말 삭제하시겠습니까?')) {
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/store/deleteStore', // 서버의 삭제 엔드포인트
            type: 'POST',
            data: { ST_NUM: stNum }, // 전달할 데이터
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
			<div id="content"><br>

				<!-- Topbar Include -->
<%-- 				<jsp:include page="/WEB-INF/views/admin/inc/top.jsp" /> --%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- container-fluid -->


					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800" style="margin-left: 30px;padding-top: 12px;">
						스토어 상품 관리</h1>
					<hr style="margin-bottom: 20px;margin-top: 30px;">

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-danger">스토어 상품 등록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form
									action="${pageContext.request.contextPath}/admin/store/controlstorePro"
									method="post" enctype="multipart/form-data">
									<table class="table schedule-bordered" id="dataTable1"
										width="100%" cellspacing="0">
										<tr>
											<th>상품번호</th>
											<td><input type="text" id="ST_NUM" name="ST_NUM"
												style="margin-right: 5px;"> <span
												id="numCheckMessage"></span></td>
											<th>상품이미지 <label for="file-upload"
												class="custom-file-upload"> 첨부하기 </label> <input
												id="file-upload" type="file" name="store_picture"
												style="display: none;"></th>
										</tr>
										<tr>
											<th>상품이름</th>
											<td><input type="text" id="ST_NAME" name="ST_NAME"
												style="margin-right: 5px;"> <span
												id="nameCheckMessage"></span></td>
											<td rowspan="8" id="image-preview"></td>
										<tr>
											<th>상품가격</th>
											<td><input type="text" id="ST_PRICE" name="ST_PRICE"></td>
										</tr>
										<tr>
											<th>상품타입</th>
											<td><input type="text" id="ST_TYPE" name="ST_TYPE">
												<select id="typeList" name="ST_TYPE">
													<option value="">상품타입</option>
													<c:forEach var="list" items="${typeList}">
														<option value="${list.ST_TYPE}">${list.ST_TYPE}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th rowspan="6">상품설명</th>
											<td rowspan="6"><textarea id="ST_DETAIL"
													name="ST_DETAIL" rows="10" cols="50"
													style="margin-right: 5px;"></textarea><br> <span
												id="detailCheckMessage"></span></td>
										</tr>
									</table>
									<div class="button-container">
										<button type="submit"
											class="btn btn-danger btn-user same-size"
											style="margin-right: 2px;">등록</button>
										<button type="reset"
											class="btn btn-secondary btn-user same-size"
											id="reset-button">초기화</button>
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
				<div class="container-fluid"><hr>
					<!-- container-fluid -->


					<!-- Page Heading -->


					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-danger">스토어 상품 목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table schedule-bordered2" id="dataTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>상품코드</th>
											<th>상품이름</th>
											<th>상품가격</th>
											<th>상품타입</th>
											<th>상세정보확인/수정</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="AdminDTO" items="${storeList}">
											<tr id="row${AdminDTO.ST_NUM}">
												<td id="ST_NUM${AdminDTO.ST_NUM}">${AdminDTO.ST_NUM}</td>
												<td id="ST_NAME${AdminDTO.ST_NUM}">${AdminDTO.ST_NAME}</td>
												<td id="ST_PRICE${AdminDTO.ST_NUM}">${AdminDTO.ST_PRICE}</td>
												<td id="ST_TYPE${AdminDTO.ST_NUM}">${AdminDTO.ST_TYPE}</td>
												<td>
													<form id="storeForm${AdminDTO.ST_NUM}"
														action="${pageContext.request.contextPath}/admin/store/storeinfo"
														method="POST" style="display: none;">
														<input type="hidden" name="ST_NUM"
															value="${AdminDTO.ST_NUM}">
													</form> <a href="javascript:void(0);"
													onclick="document.getElementById('storeForm${AdminDTO.ST_NUM}').submit();"
													class="btn btn-detailinfo btn-user btn-block" style="font-size: 16px !important;">
														상세정보확인/수정 </a>
												</td>
												<td id="delete-button-cell">
													<button type="button"
														onclick="deleteRow('${AdminDTO.ST_NUM}')"
														class="btn btn-secondary btn-user">삭제</button>
												</td>
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
	<script type="text/javascript">
    $(function() {
        $('form').on('submit', function(event) {
            var isValid = true; // 폼이 유효한지 여부를 저장

            // 각 입력 필드 검사
            var stNum = $('#ST_NUM').val().trim();
            var stName = $('#ST_NAME').val().trim();
            var stPrice = $('#ST_PRICE').val().trim();
            var stType = $('#ST_TYPE').val().trim();
            var stDetail = $('#ST_DETAIL').val().trim();

            // 각 필드가 빈 값인지 확인
            if (stNum === '') {
                isValid = false;
                $('#numCheckMessage').text('상품번호를 입력하세요.').css('color', 'red');
                event.preventDefault(); // 폼 제출 중지
                return false; // 첫 번째 오류가 발생하면 함수 종료
            }

            if (stName === '') {
                isValid = false;
                $('#nameCheckMessage').text('상품이름을 입력하세요.').css('color', 'red');
                event.preventDefault(); // 폼 제출 중지
                return false; // 첫 번째 오류가 발생하면 함수 종료
            }

            if (stPrice === '') {
                isValid = false;
                alert('상품가격을 입력하세요.');
                event.preventDefault(); // 폼 제출 중지
                return false; // 첫 번째 오류가 발생하면 함수 종료
            }

            if (stType === '') {
                isValid = false;
                alert('상품타입을 선택하세요.');
                event.preventDefault(); // 폼 제출 중지
                return false; // 첫 번째 오류가 발생하면 함수 종료
            }

            if (stDetail === '') {
                isValid = false;
                $('#detailCheckMessage').text('상품설명을 입력하세요.').css('color', 'red');
                event.preventDefault(); // 폼 제출 중지
                return false; // 첫 번째 오류가 발생하면 함수 종료
            }

            // 폼이 유효하지 않으면 제출을 막음
            if (!isValid) {
                event.preventDefault(); // 폼 제출 중지
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