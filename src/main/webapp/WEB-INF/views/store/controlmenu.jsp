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
    // 대분류 코드 등록 폼의 유효성 검사
    $('#codeForm').on('submit', function(event) {
        var isValid = true;
        var codeId = $('#code_id_top').val().trim();
        var codeValue = $('#code_value_top').val().trim();

        // 필수 입력 필드 확인
        if (codeId === "" || codeValue === "") {
            alert('대분류 코드 ID와 값은 필수 입력 항목입니다.');
            isValid = false;
            event.preventDefault();
        }

        // 유효성 검사 통과 시 서버에 중복 검사를 요청
        if (isValid) {
            $.ajax({
                url: '${pageContext.request.contextPath}/store/checkCode',
                type: 'POST',
                data: {
                    code_id: codeId,
                    code_value: codeValue,
                },
                success: function(response) {
                    if (response.idExists) {
                        alert('이미 사용중인 대분류 코드 ID입니다.');
                        isValid = false;
                    }

                    if (response.valueExists) {
                        alert('이미 사용중인 대분류 코드 값입니다.');
                        isValid = false;
                    }

                    if (isValid) {
                        $('#codeForm').off('submit').submit(); // 유효성 검사 통과 시 폼 제출
                    }
                }
            });

            event.preventDefault(); // 기본 폼 제출 방지
        }
    });

 // 상세코드 등록 폼의 유효성 검사
    $('#detailCodeForm').on('submit', function(event) {
        event.preventDefault(); // 기본 폼 제출 방지

        var isValid = true;
        var codeId = $('#code_id_bottom').val().trim();
        var detailCode = $('#detail_code').val().trim();
        var detailValue = $('#detail_value').val().trim();

        // 필수 입력 필드 확인
        if (codeId === "" || detailCode === "" || detailValue === "") {
            alert('상세 메뉴 코드 ID, 코드, 값은 필수 입력 항목입니다.');
            isValid = false;
        }

        // 유효성 검사 통과 시 서버에 중복 검사를 요청
        if (isValid) {
            $.ajax({
                url: '${pageContext.request.contextPath}/store/checkDetailCode',
                type: 'POST',
                data: {
                    code_id: codeId,
                    detail_code: detailCode,
                    detail_value: detailValue
                },
                success: function(response) {
                    if (response.detailCodeExists) {
                        alert('이미 사용중인 상세 메뉴 코드입니다.');
                        isValid = false;
                    }

                    if (response.detailValueExists) {
                        alert('이미 사용중인 상세 메뉴 값입니다.');
                        isValid = false;
                    }

                    if (isValid) {
                        $('#detailCodeForm').off('submit').submit(); // 유효성 검사 통과 시 폼 제출
                    }
                },
                error: function() {
                    alert('서버와의 통신 중 오류가 발생했습니다.');
                }
            });
        }
    });
});

function updateReadonlyFields(formIdentifier) { // 대분류코드값 가져오기 위함
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

function deleteCategory(code_num) {
    if (confirm('정말 삭제하시겠습니까?')) {
        $.ajax({
            url: '${pageContext.request.contextPath}/store/deleteCategory', // 서버의 삭제 엔드포인트
            type: 'POST',
            data: { code_num: code_num }, // 전달할 데이터
            success: function(response) {
                alert('삭제 완료!');
                location.reload(); // 페이지를 새로고침하여 변경 내용을 반영
            }
        });
    }
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
			<div id="content"><br>

				<!-- Topbar Include -->
<%-- 				<jsp:include page="/WEB-INF/views/admin/inc/top.jsp" /> --%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- container-fluid -->


					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800"
						style="margin-left: 30px; padding-top: 12px;">스토어 메뉴 관리</h1>
					<hr style="margin-bottom: 20px; margin-top: 30px;">

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-danger">코드등록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form action = 
									"${pageContext.request.contextPath}/store/addCode" method="post" enctype="multipart/form-data" id="codeForm">
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
									<div class="button-container" style="margin-bottom: 15px;">
										<button type="submit"
											class="btn btn-danger btn-user same-size"
											style="margin-right: 2px;">등록</button>
										<button type="reset"
											class="btn btn-secondary btn-user same-size" id="reset-button">초기화</button>
									</div>
								</form>
								
								
								<!-- DataTales Example -->
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-danger">대분류 코드 목록</h6>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table schedule-bordered2" id="dataTableCategory" width="100%" cellspacing="0">
												<thead>
													<tr>
														<th>메뉴코드ID</th>
														<th>메뉴코드ID설명</th>
														<th>관리</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="category" items="${codeList}">
														<tr id="categoryRow${category.code_num}">
															<td>${category.code_id}</td>
															<td>${category.code_value}</td>
															<td>
																<button type="button" onclick="deleteCategory('${category.code_num}')" class="btn btn-danger btn-user">삭제</button>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- table-responsive -->
									</div>
									<!-- card-body -->
								</div>
								<!-- card shadow mb-4 -->




								<form action = 
									"${pageContext.request.contextPath}/store/addDetailCode" method="post" enctype="multipart/form-data" id="detailCodeForm">
									<table class="table schedule-bordered" id="dataTable1"
										width="100%" cellspacing="0"><hr>
										<tr>
								            <th>메뉴코드값</th>
								            <td> 
								                <select id="codeValueSelect_bottom" name="code_value" onchange="updateReadonlyFields('bottom')">
								                    <option value="">메뉴코드값 선택</option>
                    								<c:forEach var="list" items="${codeList}">
                        								<option value="${list.code_value}" data-code_id="${list.code_id}" data-code_value="${list.code_value}">
                            								${list.code_value}(${list.code_id})
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
							<h6 class="m-0 font-weight-bold text-danger">상세코드목록</h6>
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