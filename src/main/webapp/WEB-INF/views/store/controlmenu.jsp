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
                if (response.numExists) {
                    $('#numCheckMessage').text('이미 사용중인 상품코드입니다.');
                } else {
                    $('#numCheckMessage').text('');
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
    
     
//     $('#typeList').change(function() {
//         var selectedType = $(this).val();
//         if (selectedType) {
//             // 선택된 값이 있을 때: 값을 설정하고 읽기 전용으로 설정
//             $('#ST_TYPE').val(selectedType).prop('readonly', true);
//         } else {
//             // 선택된 값이 기본값(빈 문자열)일 때: 읽기 전용 해제 및 입력 필드를 비움
//             $('#ST_TYPE').val('').prop('readonly', false);
//         }
//     });
    
    
    document.getElementById('reset-button').addEventListener('click', function() {
        // 이미지 미리보기 영역 비우기
        document.getElementById('image-preview').innerHTML = '';

        // 파일 입력 필드 초기화
        var fileInput = document.getElementById('file-upload');
        fileInput.value = ''; // 파일 입력 필드의 값을 초기화

        // 다른 필요한 필드 초기화 작업도 여기서 수행 가능
    });
 
    
    
    
    
});

function updateReadonlyFields(formIdentifier) {
    var select, code_id_field;

    if (formIdentifier === 'bottom') {
        select = document.getElementById('codeValueSelect_bottom');
        code_id_field = document.getElementById('code_id_bottom');
    } else {
        select = document.getElementById('codeValueSelect');
        code_id_field = document.getElementById('code_id_top');
    }

    if (select && code_id_field) {
        var selectedOption = select.options[select.selectedIndex];
        
        // 옵션에서 데이터 속성 값 가져오기
        var code_id = selectedOption.getAttribute('data-code_id');
        var code_value = selectedOption.getAttribute('data-code_value');
        
        console.log('Selected Code ID:', code_id); // 디버깅용 콘솔 로그
        console.log('Selected Code Value:', code_value); // 디버깅용 콘솔 로그
        
        // 필드에 값 설정
        code_id_field.value = code_id;
        code_id_field.setAttribute('readonly', true); // 필드를 읽기 전용으로 설정
    } else {
        console.error('Select or input field not found.');
    }
    
    // 수정 예정
}

function deleteCode(detail_code_num) {
    if (confirm('정말 삭제하시겠습니까?')) {
        $.ajax({
            url: '${pageContext.request.contextPath}/store/deleteCode', // 서버의 삭제 엔드포인트
            type: 'POST',
            data: { detail_code_num: detail_code_num }, // 전달할 데이터
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

				<!-- Topbar Include -->
				<jsp:include page="/WEB-INF/views/admin/inc/top.jsp" />
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- container-fluid -->


					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800" style="margin-left: 20px;">스토어메뉴관리</h1>
					<br>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-danger">코드등록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form action = 
									"${pageContext.request.contextPath}/store/addCode" method="post" enctype="multipart/form-data">
										<c:if test="${not empty errorMessage}">
    										<div class="alert alert-danger">
        										<c:out value="${errorMessage}" />
    										</div>
										</c:if>
									<table class="table schedule-bordered" id="dataTable1" name="codeForm"
										width="100%" cellspacing="0">
										<c:if test="${not empty message}">
										    <script>
										        alert("${message}");
										    </script>
										</c:if>
										<tr>
											<th>메뉴코드ID</th>
											<td><input type="text" id="code_id_top" name="code_id">
		
										</tr>
										<tr>
											<th>메뉴코드ID값</th>
											<td><input type="text" id="code_value_top" name="code_value">
											</td>
										</tr>
										
									</table>
									<div class="button-container">
										<button type="submit"
											class="btn btn-danger btn-user same-size"
											style="margin-right: 2px;">등록</button>
										<button type="reset"
											class="btn btn-secondary btn-user same-size" id="reset-button">초기화</button>
									</div>
								</form>
								<form action = 
									"${pageContext.request.contextPath}/store/addDetailCode" method="post" enctype="multipart/form-data">
									<table class="table schedule-bordered" id="dataTable1" name="codeForm"
										width="100%" cellspacing="0"><hr>
										<tr>
								            <th>메뉴코드값</th>
								            <td> 
								                <select id="codeValueSelect_bottom" name="code_value" onchange="updateReadonlyFields('bottom')">
								                    <option value="">메뉴코드값 선택</option>
                    								<c:forEach var="list" items="${codeList}">
                        								<option value="${list.code_value}" data-code_id="${list.code_id}" data-code_value="${list.code_value}">
                            								${list.code_value}
                        								</option>
                    								</c:forEach>
								                </select>
								            </td>
								        </tr>
								        <tr>
								            <th>메뉴코드ID</th>
								            <td>
								                <input type="text" id="code_id_bottom" name="code_id" readonly>
								            </td>
								        </tr>
										<tr>
											<th>상세메뉴코드</th>
											<td>
												<input type="text" id="detail_code" name="detail_code" maxlength="3">
											</td>
										</tr>	
										<tr>
											<th>상세메뉴값</th>
											<td>
												<input type="text" id="detail_value" name="detail_value">
											</td>
										</tr>
										
<!-- 										<tr> -->
<!-- 											<th>사용여부</th> -->
<!-- 											<td><input type="text" id="code_yn" name="code_yn"></td> -->
<!-- 										</tr> 										 -->
									</table>
									<div class="button-container">
										<button type="submit"
											class="btn btn-danger btn-user same-size"
											style="margin-right: 2px;">등록</button>
										<button type="reset"
											class="btn btn-secondary btn-user same-size" id="reset-button">초기화</button>
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
							<h6 class="m-0 font-weight-bold text-danger">코드목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table schedule-bordered2" id="dataTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>메뉴코드ID</th>
											<th>메뉴코드ID설명</th>
											<th>상세메뉴코드</th>
											<th>상세메뉴값</th>
<!-- 											<th>사용여부</th> -->
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="codeDetail" items="${codeDetailList}">
								        	<tr id="row${detail_code_num}">
								            	<td>${codeDetail.code_id}</td>
								            	<td>${codeDetail.code_value}</td>
								            	<td>${codeDetail.detail_code}</td>
								            	<td>${codeDetail.detail_value}</td>
<%-- 								            	<td>${codeDetail.code_yn}</td> --%>
												<td id="delete-button-cell"><button type="button"
														onclick="deleteCode('${codeDetail.detail_code_num}')"
														class="btn btn-danger btn-user">삭제</button></td>
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