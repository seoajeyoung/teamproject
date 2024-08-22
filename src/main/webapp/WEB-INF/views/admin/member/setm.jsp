<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">

<style>

.border-top-danger {
  border-top: 5px solid #fb4357 !important;/* 원하는 색상 및 두께 */
}

</style>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>OSTicket - SendMailtoMember</title>
    
    
    
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
	$(function() {
		$('#detailList').change(function() {
			var selectedValue = $('#detailList option:selected').val();
			var values = selectedValue.split(','); // 쉼표를 기준으로 분리
	   	    var subject = values[0];
	     	var content = values.slice(1).join(','); // 내용에 쉼표가 있을 경우를 대비해 다시 합침
			
	     	$('#mail_subject').val(subject);
	        $('#mail_content').val(content);
		})
	})
	</script>
   
    
    
    

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/osticketAdmin.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar Include -->
        <jsp:include page = "/WEB-INF/views/admin/inc/sidebar.jsp"/>
        <!-- End of Sidebar -->
        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content"><br>

            <!-- Topbar Include -->
<%--             <jsp:include page = "/WEB-INF/views/admin/inc/top.jsp"/> --%>
            <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">메일보내기</h1>
                    <hr><br>

                </div>
                <!-- /.container-fluid -->
                
                <div class="row justify-content-center">
					<div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-top-danger shadow h-100 py-2 ">
                                <div class="card-body">
                                <form action="${pageContext.request.contextPath}/admin/member/setmPro" method="post" class="myForm" name="fr">
                                    <div class="row no-gutters align-items-center">
                                       <div class="col mr-2">
                                            <div class="h5 mb-2 font-weight-bold text-gray-800 mb-4">메일 발송</div>
                                            발송내용을 선택하세요<br>
                                            <select id="detailList" name="point_detail">
       												<option>발송목록</option>
        											<c:forEach var="list" items="${emailList}">
            											<option value="${list.email_subject},${list.email_content}">${list.email_list}</option>
        											</c:forEach>
    										</select><br>
                                            제목<br>
    										<input type="text" id="mail_subject" name="subject" value="" readonly><br>
    										글내용<br>
    										<textarea rows="10" cols="20" id="mail_content" name="content"></textarea></br>
    										수신자 이메일<br>
        									<input type="email" name="receiver" required><br>
                                       </div>
                                    </div>
                                    	<button type="button" onclick="document.getElementById('myForm').submit();" class="btn btn-light btn-icon-split">메일 발송</button>
<!--                                   	<button type="submit" class="btn btn-light btn-icon-split">메일 발송</button> -->
<!--                                    <button type="button" class="btn btn-light btn-icon-split" onclick="confirmRespite()"> -->
                                </form>
                                </div>
                            </div>
                   </div>

            </div>
            <!-- End of Main Content -->
            

        </div>
        <!-- End of Content Wrapper -->
        
        <!-- Footer Include-->
       	<jsp:include page="/WEB-INF/views/admin/inc/bottom.jsp"/>
        <!-- End of Footer -->
        
    </div>
    <!-- End of Page Wrapper -->

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

</body>

</html>