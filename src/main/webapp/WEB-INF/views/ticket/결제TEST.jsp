<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/real.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/test.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/tnb.css">	
	
<script
	src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/script/ticketpayment.js"></script>	
	
	
</head>
<body>
	 <script type="text/javascript">
        var selectRegionName = "${param.selectRegionName}";
        var theaterTitle = "${param.theaterTitle}";
        var thNumber = "${param.th_number}";
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
                    남은좌석  ${param.now_count} / ${param.se_count}<br>
                    <b>${param.fullDate} ${param.starttime}  ~  ${param.endtime}</b>
                </th>
            </tr>
        </tbody>
    </table>
		</div>

		<div id="seat_num" class="">

			<h1 id="screenArea">Screen</h1>


		</div>
	</article>
	
	<div id="ticket_tnb" class="tnb_container ">
		<div class="tnb step1">
			<!-- btn-left -->
			<div class="info movie">
				<span class="movie_poster"><img src="undefined" alt="영화 포스터" style="display: inline;"></span>
				<div class="row movie_title colspan2" style="display: block;">
					<span class="data letter-spacing-min ellipsis-line2"><a href="" target="_blank" title="핸섬가이즈">핸섬가이즈</a></span>
				</div>
				<div class="row movie_type" style="display: block;">
					<span class="data ellipsis-line1" title=""></span>  <!--2D 인곳  -->  
				</div>
				<div class="row movie_rating" style="display: block;">
					<span class="data" title="15">15</span>
				</div>
				<div class="placeholder" title="영화선택" style="display: none;"></div>
			</div>
			<div class="info theater">
				<div class="row name" style="display: block;">
					<span class="header">극장</span>
					<span class="data letter-spacing-min ellipsis-line1"><a href="" target="_blank" title="강남">강남</a></span>
				</div>
				<div class="row date" style="display: block;">
					<span class="header">일시</span>
					<span class="data" title="2024-08-16 18:00">2024-08-16 18:00</span>
				</div>
				<div class="row screen" style="display: block;">
					<span class="header">상영관</span>
					<span class="data" title="1관">1관</span>
				</div>
				<div class="placeholder" title="극장선택" style="display: none;"></div>
			</div>
			<div class="info seat">
				<div class="row seat_name" style="display: block;">
					<span class="header">좌석명</span>
					<span class="data">일반석</span>
				</div>
				<div class="row seat_no colspan3" style="display: block;">
					<span class="header">좌석번호</span>
					<span class="data ellipsis-line3"></span>
				</div>
				<div class="placeholder" title="좌석선택"></div>
			</div>
			<div class="info path">
				<div class="row colspan4" style="display: block;">
					<span class="path-step2" title="좌석선택">&nbsp;</span>
					<span class="path-step3" title="결제">&nbsp;</span>
				</div>
			</div>
			<div class="tnb_step_btn_right_before" id="tnb_step_btn_right_before"></div>
			<a class="btn-right on" id="tnb_step_btn_right" href="#" title="좌석선택"> </a>
			
			
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>