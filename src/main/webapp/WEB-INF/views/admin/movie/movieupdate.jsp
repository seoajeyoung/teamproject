<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>OSTicket - MovieUpdate</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/osticketAdmin.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar include -->
        <jsp:include page = "/WEB-INF/views/admin/inc/sidebar.jsp"/>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            
            <!-- Topbar include -->
            <jsp:include page = "/WEB-INF/views/admin/inc/top.jsp"/>
            <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">영화정보</h1>
                    <p class="mb-4">넣을 것 있으면 넣기 <a target="_blank"
                            href="https://datatables.net">하이퍼링크 넣을거면 넣기</a>.</p>

                    <!-- DataTales -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">영화정보</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            
                            <form action="${pageContext.request.contextPath}/admin/movie/movieupdatePro" method="post">
                            
                                <table class="table table-infobord" id="dataTable" width="100%" cellspacing="0">
                                		<thead>
                                			<tr>
                                			<th colspan="7">${movieDTO.title } 상세정보</th>
                                			</tr>
                                		</thead>
                                        <tbody>
                                        <tr>
                                            <th>영화코드</th>
                                            <td><input type="hidden" name="MOVIE_NUM" value="${movieDTO.MOVIE_NUM}">${movieDTO.MOVIE_NUM}</td>
                                            <th colspan="4">영화포스터</th>
                                        </tr>
                                        <tr>
                                            <th>영화제목</th>
                                            <td><input type="text" name="title" value="${movieDTO.title}"></td>
                                            <td colspan="4" rowspan="4"><img src="${pageContext.request.contextPath}/resources/img/${movieDTO.MOVIE_NUM}.jpg" onerror="errorImage(this)" width="200"></td>
                                        </tr>
                                        <tr>
                                            <th>영문제목</th>
                                            <td><input type="text" name="titleEng" value="${movieDTO.titleEng}"></td>
                                        </tr>
                                        <tr>
                                            <th>감독</th>
                                            <td><input type="text" name="direcotrNm" value="${movieDTO.direcotrNm}"></td>
                                        </tr>
                                        <tr>
                                            <th>배우</th>
                                            <td><input type="text" name="actorNm" value="${movieDTO.actorNm}"></td>
                                        </tr>
                                        <tr>
                                            <th>장르</th>
                                            <td><input type="text" name="genre" value="${movieDTO.genre}"></td>
                                        </tr>
                                        <tr>
                                            <th>상영등급</th>
                                            <td><input type="text" name="rating" value="${movieDTO.rating}"></td>
                                            <th>런닝타임</th>
                                            <td><input type="text" name="runtime" value="${movieDTO.runtime}"></td>
                                            <th>누적관객수</th>
                                            <td><input type="text" name="audiAcc" value="${movieDTO.audiAcc}"></td>
                                        </tr>
                                        <tr>
                                            <th>등록일자</th>
                                            <td><input type="date" name="releaseDate" value="${movieDTO.releaseDate}"></td>
                                            <th>상영일자</th>
<%--                                             <td><input type="date" name="releaseDts" value="${movieDTO.releaseDts}"></td> --%>
                                            <th>종영일자</th>
<%--                                             <td><input type="date" name="releaseDte" value="${movieDTO.releaseDte}"></td> --%>
                                        </tr>
                                        <tr>
                                            <th>주제곡</th>
                                            <td colspan="5">${movieDTO.themsSong}</td>
                                        </tr>
                                        <tr>
                                            <th>삽입곡</th>
                                            <td colspan="5">${movieDTO.soundtrack}</td>
                                        </tr>
                                        <tr>
                                            <th>줄거리</th>
                                            <td colspan="5">${movieDTO.plot}</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button type="submit" class = "btn btn-success btn-user">수정완료</button>
                               </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <jsp:include page="/WEB-INF/views/admin/inc/bottom.jsp"/>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

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
    <script src="${pageContext.request.contextPath}/resources/js/osticketAdmin.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>

</body>

</html>