<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/real.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/test.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/tnb.css">	
	
<script
	src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/script/selectseat.js"></script>	
	
	
</head>
<body>
	 <script type="text/javascript">
        var selectRegionName = "${param.selectRegionName}";
        var theaterTitle = "${param.theaterTitle}";
        var thNumber = "${param.th_number}";
        var title = "${param.movieTitle}";
        var fullDate= "${param.fullDate}" ;
        var sc_time = "${param.starttime}" ; 
    </script>

	<h1 style="font-size: 35px; text-align: center;">좌석 선택</h1>
	<article id="seat_select">
		<div id="header_box">
			 <table class="header_box">
        <tbody>
            <tr>
                <td colspan="6" id="titleArea" style="height: 45px;"><h3>인원/좌석</h3></td>
            </tr>
            <tr></tr>
            <tr id="height50">
                <th colspan="2" id="peoSelTableTh">
                    <table class="peoSelTable">
                        <tbody id="peoSelTableBody">
                        </tbody>
                    </table>
                </th>
                <td id="DiscountInformation">
                    <div>*최대 8명 선택 가능</div>
                    <div id="popup">
                        <input type="button" id="DiscountInfo" value="관람할인안내">
                    </div>
                </td>
                <th colspan="3" class="header_box_Runtime">
                    ${param.movieTitle}  ${param.selectRegionName} ${param.theaterTitle}  ${param.th_number} 
                    남은좌석  ${nowCount} / ${param.se_count}<br>
                    <b>${param.fullDate} ${param.starttime}  ~  ${param.endtime}</b>
                </th>
            </tr>
        </tbody>
    </table>
		</div>

		<div id="seat_num" class="">



		</div>
	</article>
	
	  <div id="ticket_tnb" class="tnb_container ">
        <div class="tnb step2">
            <!-- btn-left -->
            <div class="info movie">
                <span class="movie_poster">
                    <img src="${param.MovieUrl}" alt="영화 포스터" style="display: inline;">
                </span>
                <div class="row movie_title colspan2" style="display: block;">
                    <span class="data letter-spacing-min ellipsis-line2">
                        <a href="#" target="_blank" title="${param.movieTitle}">${param.movieTitle}</a>
                    </span>
                </div>
                <div class="row movie_type" style="display: block;">
                    <span class="data ellipsis-line1" title=""></span>  <!--2D 인곳  -->  
                </div>
                <div class="row movie_rating" style="display: block;">
                    <span class="data" title="${param.MovieRating}">${param.MovieRating}</span>
                </div>
                <div class="placeholder" title="영화선택" style="display: none;"></div>
            </div>
            <div class="info theater">
                <div class="row name" style="display: block;">
                    <span class="header">극장</span>
                    <span class="data letter-spacing-min ellipsis-line1">
                        <a href="#" target="_blank" title="${param.theaterTitle}">${param.theaterTitle}</a>
                    </span>
                </div>
                <div class="row date" style="display: block;">
                    <span class="header">일시</span>
                    <span class="data" title="${param.fullDate} ${param.starttime}">${param.fullDate} ${param.starttime}</span>
                </div>
                <div class="row screen" style="display: block;">
                    <span class="header">상영관</span>
                    <span class="data" title="${param.th_number}">${param.th_number}</span>
                </div>
                <div class="placeholder" title="극장선택" style="display: none;"></div>
            </div>
            <div class="info path">
                <div class="row colspan4" style="display: block;">
                    <span class="header">좌석명:일반석 </span>
                    <div>
                    <span class="header">번호:</span>
                    <span class="header" id="seatnum"></span>
                    </div>
                </div>
            </div>
            
            
            <a class="btn-right on" id="tnb_step_btn_right" href="#" title="결제하기"> </a>
        </div>
    </div>
	
	
	
	
	
	
	
	
	
	
</body>
</html>