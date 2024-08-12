<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/module.css" rel="stylesheet">
<script src="../resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function() {
	$("#chk_nowshow").change(function() {
		if ($("#chk_nowshow").is(':checked')) {
	        $.ajax({
	            type: 'get',
	            url: "${pageContext.request.contextPath}/movie/showMovies",
	            dataType: 'json',
	            success: function(result) {
	                $.each(result, function(index, movieDTO) {
	                	$('#ol-movie-chart').html(`
	                            <li>
	                            <div class="box-image">
	                                <strong class="rank">\${movieDTO.rank}</strong>	
	                                <a href="${pageContext.request.contextPath}/resources/img/\${movieDTO.movieNum}.jpg">
	                                    <span class="thumb-image">
	                                        <img src="${pageContext.request.contextPath}/resources/img/\${movieDTO.movieNum}.jpg" alt="명탐정 코난-100만 달러의 펜타그램 포스터" onerror="errorImage(this)">
	                                        <!-- 영상물 등급 노출 변경 2022.08.24 -->
	                                        <i class="cgvIcon etc age12">12</i>
	                                        <!-- <span class="ico-grade 12">12</span> -->
	                                    </span>
	                                </a>
	                                <span class="screentype">
	                                        <a class="imax" href="#" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a>
	                                </span>
	                            </div>
	                            
	                            <div class="box-contents">
	                                <a href="${pageContext.request.contextPath}/movie/information?num=\${movieDTO.movieNum}">
	                                    <strong class="title">\${movieDTO.title}</strong>
	                                </a>

	                                <div class="score">
	                                    <strong class="percent">예매율<span>26.2%</span></strong>
	                                    <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위1~ 3위)-->
	        <!--                             <div class="egg-gage small"> -->
	        <!--                                             <span class="sprite_preegg default"></span> -->
	        <!--                                             <span class="percent">99%</span> -->
	        <!--                             </div> -->
	                                </div>
	                                <span class="txt-info">
	                                    <strong>
	                                        \${movieDTO.releaseDts}
	                                        <span>개봉</span>
	                                        <em class="dday">???</em>
	                                    </strong>
	                                </span>
	                                <span class="like"> 
	                                    <a class="link-reservation" href="#">예매하기</a>
	                                </span>
	                            </div>    
	                        </li>
               			`)
	                });
	            }, // success
	            error: function(e) {
	                alert("에러 발생: " + e.responseText);
	            } // error
	        }); // $.ajax
	    }// if
	});//$("#chk_nowshow").change()
	
	
	// GO버튼 클릭시 정렬 이벤트
	$(".round_gray").click(function() {
		$.ajax({
            type: 'get',
    		url: "${pageContext.request.contextPath}/movie/sortMovies?val=" + $('#order_type').val(), // select중 어느게 선택되어 있는지 value값을 숫자 1(예매율), 2(평점), 3(관람객)으로 받아옴 
            dataType: 'json',
            success: function(result) {
            	$('#ol-movie-chart').html('')
                $.each(result, function(index, movieDTO) {
                	$('#ol-movie-chart').append(`
                            <li>
                            <div class="box-image">
                                <strong class="rank">\${movieDTO.rank}</strong>	
                                <a href="${pageContext.request.contextPath}/resources/img/\${movieDTO.movieNum}.jpg">
                                    <span class="thumb-image">
                                        <img src="${pageContext.request.contextPath}/resources/img/\${movieDTO.movieNum}.jpg" alt="명탐정 코난-100만 달러의 펜타그램 포스터" onerror="errorImage(this)">
                                        <i class="cgvIcon etc age12">12</i>
                                    </span>
                                </a>
                                <span class="screentype">
                                        <a class="imax" href="#" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a>
                                </span>
                            </div>
                            
                            <div class="box-contents">
                                <a href="${pageContext.request.contextPath}/movie/information?num=\${movieDTO.movieNum}">
                                    <strong class="title">\${movieDTO.title}</strong>
                                </a>

                                <div class="score">
                                    <strong class="percent">예매율<span>26.2%</span></strong>
                                    <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위1~ 3위)-->
        <!--                             <div class="egg-gage small"> -->
        <!--                                             <span class="sprite_preegg default"></span> -->
        <!--                                             <span class="percent">99%</span> -->
        <!--                             </div> -->
                                </div>
                                <span class="txt-info">
                                    <strong>
                                        \${movieDTO.releaseDts}
                                        <span>개봉</span>
                                        <em class="dday">???</em>
                                    </strong>
                                </span>
                                <span class="like"> 
                                    <a class="link-reservation" href="#">예매하기</a>
                                </span>
                            </div>    
                        </li>
                        `)
   	                });
   	            }, // success
            error: function(e) {
                alert("에러 발생: " + e.responseText);
            }
		});
	}); // $(".round_gray").click()
		
	
});

</script>
</head>
<body>

<div id="contaniner">
		<!-- Contents Area -->
	<div id="contents">
<!--             Contents Start -->
<!-- 실컨텐츠 시작 -->
    <div class="wrap-movie-chart">
        <!-- Heading Map Multi -->
        <div class="tit-heading-wrap">
            <h3>무비차트</h3>
            <div class="submenu">
                <ul>
                    <li class="on"><a href="${pageContext.request.contextPath}/movie/movie" title="선택">무비차트</a></li>
                    <li><a href="${pageContext.request.contextPath}/movie/movie?page=2">상영예정작</a></li>
                    <!--<li><a href="/movie/?lt=3">CGV아트하우스</a></li>//-->
                </ul>
            </div>
        </div>
        <!-- //Heading Map Multi -->
        <!-- Sorting -->
        <div class="sect-sorting">
             <div class="nowshow">
                        <input type="checkbox" id="chk_nowshow">
                <label for="chk_nowshow">현재 상영작만 보기</label>                
            </div>
            <label for="order_type" class="hidden">정렬</label>
            <select id="order_type" name="order-type">
				<option title="현재 선택됨" selected="" value="1">예매율순</option>
                <option value="2">평점순</option>
                <option value="3">관람객순</option>
            </select>
            <button type="button" class="round_gray"><span>GO</span></button>
        </div>
        <!-- //Sorting -->
        
        <div class="sect-movie-chart">
            <h4 class="hidden">
                무비차트 - 예매율순
            </h4>
            <ol id="ol-movie-chart">
            <c:forEach var="movieDTO" items="${movieList}">
                <li>
                    <div class="box-image">
                        <strong class="rank">${movieDTO.rank}</strong>	
                        <a href="${pageContext.request.contextPath}/resources/img/${movieDTO.movieNum}.jpg">
                            <span class="thumb-image">
                                <img src="${pageContext.request.contextPath}/resources/img/${movieDTO.movieNum}.jpg" alt="명탐정 코난-100만 달러의 펜타그램 포스터" onerror="errorImage(this)">
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age12">12</i>
                                <!-- <span class="ico-grade 12">12</span> -->
                            </span>
                        </a>
                        <span class="screentype">
                                <a class="imax" href="#" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a>
                        </span>
                    </div>
                    
                    <div class="box-contents">
                        <a href="${pageContext.request.contextPath}/movie/information?num=${movieDTO.movieNum}">
                            <strong class="title">${movieDTO.title}</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>26.2%</span></strong>
                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위1~ 3위)-->
<!--                             <div class="egg-gage small"> -->
<!--                                             <span class="sprite_preegg default"></span> -->
<!--                                             <span class="percent">99%</span> -->
<!--                             </div> -->
                        </div>
                        <span class="txt-info">
                            <strong>
                                ${movieDTO.releaseDts}
                                <span>개봉</span>
                                <em class="dday">???</em>
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reservation" href="#">예매하기</a>
                        </span>
                    </div>    
                </li>
            </c:forEach>
            </ol>
            
            <button class="btn-more-fontbold">더보기 <i class="link-more">더보기</i></button>
        </div>
    </div><!-- .sect-moviechart -->


<div class="cols-rank" style="display:none">
    <div class="col-rank-trailer">
        <h3>인기 트레일러</h3>
        <div class="sect-popular-trailer">
            
            <ul>
            
            </ul>
        </div><!-- .sect-popular-trailer -->
    </div><!-- .col-rank-trailer -->
    
</div>

<!--
  2016-
- Fried : 0 ~69
- Good :  70 ~ 84
- Great : 85 ~ 100  
//-->
<script id="temp_movie" type="text/x-jquery-tmpl">
    <li>
        <div class="box-image" >
            <a href="/movie/detail-view/?midx=${MovieIdx}">
                <span class="thumb-image">
                    <img src="${PosterImage.LargeImage}" alt="${Title}" onerror="errorImage(this)"/>
                    <!-- 영상물 등급 노출 변경 2022.08.24 -->
                    <i class="cgvIcon etc age${MovieGrade.StyleClassName}">${MovieGrade.GradeText}</i>
                    <!--<span class="ico-grade ${MovieGrade.StyleClassName}">${MovieGrade.GradeText}</span>-->
                </span>
            </a>
            <span class="screentype">
                {{each MovieKindList}}
                <a class="${StyleClassName}" href="#" data-regioncode="${RegionCode}">${KindName}</a>
                {{/each}}
            </span>
        </div>
                    
        <div class="box-contents">
            <a href="/movie/detail-view/?midx=${MovieIdx}">
                <strong class="title">${Title}</strong>
            </a>

            <div class="score">
                <strong class="percent">예매율<span>${TicketRate}%</span></strong>
                <!--2020.05.07 개봉일 12시 30분전 프리에그, 개봉일 12시 30분후 골든에그지수 노출 기준변경-->
                <div class="egg-gage small">
                    <span class="${StarPoint}"></span>
                    <span class="percent">${EggPoint}</span>
                </div>
            </div>

            <span class="txt-info">
                <strong>
                    ${OpenDate}
                    <span>${OpenText}</span>
                    {{if D_Day > 0}}
                        <em class="dday">D-${D_Day}</em>
                    {{/if}}
                </strong>
            </span>
            <span class="like"> 
                {{if (IsTicketing)}}<a class="link-reservation" href="http://www.cgv.co.kr/ticket/?MOVIE_CD=${CGVCode}&MOVIE_CD_GROUP=${MovieGroupCode}">예매</a>{{/if}}
            </span>
        </div>    
    </li>
</script>

            <!--/ Contents End -->
		 </div>
		<!-- /Contents Area -->
	</div>
</body>
</html>