<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main/main.jsp</title>
<link href="${pageContext.request.contextPath}/resources/css/inquiry/customer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/giftstore.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/module.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/reset.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/top.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/script/ticket.js"></script> --%>
  <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css">
    
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/eggupdate.css">
    <link rel="stylesheet" media="print" type="text/css" href="https://img.cgv.co.kr/R2014/css/print.css">    
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css">
    
<!--     <script type="text/javascript" src="/common/js/extraTheaters.js"></script> -->
<!--     <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.config.js"></script> -->
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.tmpl.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.validate.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.paging.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.js"></script>
<!--     <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.utils.js"></script> -->
	<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.pageing.js"></script>
<!--     <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.init.js"></script> -->

    <!--[if lte IE 9]><script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.placeholder.js"></script><![endif]-->
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/silverlight_link.js"></script>
	<script src="https://img.cgv.co.kr/R2014/js/slick/slick.js" type="text/javascript" charset="utf-8"></script>
	

    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/phototicket/phototicket.css">
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick.css">
	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick-theme-custom.css">

    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/icheck/login.timer.js"></script>
    <script src="https://img.cgv.co.kr/R2014/js/icheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/icheck/iCheck.css">
    
    <!-- 홈페이지 CSS 일원화로 인한 반영 20220721 -->
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/resource_pc/css/cgv.min.css">
    <script type="text/javascript" src="https://img.cgv.co.kr/resource_pc/js/cgvUi.js"></script>


<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/swiper.min.js"></script>
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/swiper-bundle.min.css">
</head>
<body>
<!-- top include -->
<jsp:include page="/WEB-INF/views/ticket/top.jsp" />

    
    
  
<script type="text/javascript">
     $(document).ready(function(){
    	 	
	    	 var movieSelectionVideoObj = $('.video_wrap video')[0];
	
	         $('.video_wrap video').on({
	             ended:function(){
	                 $('.btn_movieSelection_playStop').removeClass('active');
	             }
	         })
    	 	 $('.btn_movieSelection_playStop').on('click', function(){
    	 		
    	 		 if(movieSelectionVideoObj.paused){
                     movieSelectionVideoObj.play();
                     $(this).addClass('active');
                 }else{
                     movieSelectionVideoObj.pause();
                     $(this).removeClass('active');
                 }
    	 	 });
	         $('.btn_movieSelection_soundOnOff').on('click', function(){
	        	 if(movieSelectionVideoObj.muted){
                     movieSelectionVideoObj.muted = false;
                     $(this).addClass('active');
                 }else{
                     movieSelectionVideoObj.muted = true;
                     $(this).removeClass('active');
                 }
	         });
	         
        	$('.tabBtn_wrap a').on('click', function(e) {
                e.preventDefault(); // 링크 클릭 시 페이지 이동 방지

                // 모든 버튼에서 active 클래스 제거
                $('.tabBtn_wrap a').removeClass('active');

                // 클릭한 버튼에 active 클래스 추가
                $(this).addClass('active');
            });
        	
            $("#btnMovie").click(function(){
                $("#movieChart_list").show();// 무비차트 슬라이더를 보이게 함
                $("#movieChart_list_Reser").hide();// 상영예정작 슬라이더를 숨김
                $("#btn_allView_Movie").attr("href", "${pageContext.request.contextPath}/movie/movie");
            });

            $("#btnReserMovie").click(function(){
                $("#movieChart_list").hide();// 무비차트 슬라이더를 숨김
                $("#movieChart_list_Reser").show();// 상영예정작 슬라이더를 보이게 함
                $("#btn_allView_Movie").attr("href", "${pageContext.request.contextPath}/movie/movie?page=pre_movie");
            });
			
            //슬라이드 버튼
            var movieChartSwiper = new Swiper("#movieChart_list", {

                slidesPerView: 5,
                spaceBetween: 32,
                slidesPerGroup: 5,
                loopFillGroupWithBlank: true,
                navigation: {
                    nextEl: ".swiper-button-next",

                    prevEl: ".swiper-button-prev",
                },
                a11y: {
                    prevSlideMessage: '이전 슬라이드',
                    nextSlideMessage: '다음 슬라이드',
                    slideLabelMessage: '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
                },
                on: {
                    init: function () {
                        setListFocus(this, '.img_wrap');
                    },
                    slideChangeTransitionEnd: function () {
                        setListFocus(this, '.img_wrap');
                    }
                }
            });

            var movieChartSwiper2 = new Swiper("#movieChart_list_Reser", {

            	slidesPerView: 5,
                spaceBetween: 32,
                slidesPerGroup: 5,
                loopFillGroupWithBlank: true,
                navigation: {
                    nextEl: ".swiper-button-next",

                    prevEl: ".swiper-button-prev",
                },
                a11y: {
                    prevSlideMessage: '이전 슬라이드',
                    nextSlideMessage: '다음 슬라이드',
                    slideLabelMessage: '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
                },
                on: {
                    init: function () {
                        setListFocus(this, '.img_wrap');
                    },
                    slideChangeTransitionEnd: function () {
                        setListFocus(this, '.img_wrap');
                    }
                }
            });

            $("#movieChart_list_Reser").hide(); //swiper 랜더링 완료 후 숨기기해야함

            var eventSwiper = new Swiper(".event_list", {
                autoplay: {
                    delay: 2500,
                    disableOnInteraction: false,
                },
                slidesPerView: 3,
                spaceBetween: 24,
                slidesPerGroup: 3,
                loopFillGroupWithBlank: true,
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                a11y: {
                    prevSlideMessage: '이전 슬라이드',
                    nextSlideMessage: '다음 슬라이드',
                    slideLabelMessage: '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
                },
                on: {
                    init: function (e) {
                        setListFocus(this, 'a');
                    },
                    slideChangeTransitionEnd: function () {
                        setListFocus(this, 'a');
                    }
                }
            });

            $('.event_list').on({
                'mouseenter focusin': function () {
                    let isActive = $('.btn_eventControl').hasClass('active');

                    if (isActive) {
                        eventSwiper.autoplay.stop();
                    }
                },
                'mouseleave focusout': function () {
                    let isActive = $('.btn_eventControl').hasClass('active');

                    if (isActive) {
                        eventSwiper.autoplay.start();
                    }
                }
            });

            if (eventSwiper.autoplay.running) {
                $('.btn_eventControl').addClass('active');
            }           

            $('.btn_eventControl').on({
                click: function (e) {
                    if (eventSwiper.autoplay.running) {
                        $(this).removeClass('active');
                        eventSwiper.autoplay.stop();
                    } else {
                        $(this).addClass('active');
                        eventSwiper.autoplay.start();
                    }
                }
            });
            
        
            $('.movieChartBeScreen_btn_wrap a').on({
                click:function(e){
                    var target = e.target;
                    $(target).addClass('active').parent('h3').siblings().children('a').removeClass('active');
                }
            });

            $('.specialHall_list a').on({
                'mouseenter focus':function(e){
                    var target = e.target;
                    var idx = $(target).closest('li').index();

                    var arrimgUrl = ["https://img.cgv.co.kr//Front/Main/2021/1209/16390080561620.png","https://img.cgv.co.kr//Front/Main/2022/0616/16553622935690.png","https://img.cgv.co.kr//Front/Main/2021/1130/16382612660240.png","https://img.cgv.co.kr//Front/Main/2021/1130/16382612660560.png"];

                    //$(target).closest('li').addClass('active').siblings('li').removeClass('active');
                    $(target).closest('li').addClass('active').attr({ 'aria-selected': true }).siblings('li').removeClass('active').attr({ 'aria-selected': false });

                    $('.specialHall_link').attr('href', target.href) // 링크 주소 넣을 곳
                    $('.specialHall_link img').attr('src', arrimgUrl[idx]);
                    $('.specialHall_link img').attr('alt', $(target).children('strong').text());
                }
            });

            var noticeClientBannerSwiper = new Swiper(".noticeClient_banner_list", {
                autoplay: {
                    delay: 2500,
                    disableOnInteraction:false,
                },
                slidesPerView: 1,
                spaceBetween: 0,
                loopFillGroupWithBlank: true,
            });

            if(noticeClientBannerSwiper.autoplay.running){
                $('.btn_noticeClientBannerControl').addClass('active');
            }

            $('.btn_noticeClientBannerControl').on({
                click:function(e){
                    if(noticeClientBannerSwiper.autoplay.running){
                        $(this).removeClass('active');
                        noticeClientBannerSwiper.autoplay.stop();
                    }else{
                        $(this).addClass('active');
                        noticeClientBannerSwiper.autoplay.start();
                    }
                } 
            });

            $.fn.openPopup = function( id ){
                var popObj = $('#' + id);

                popObj.parent('.pop_wrap').addClass('active');
                popObj.fadeIn();

                popObj.parent('.pop_wrap').on({
                    click:function(e){
                        if(e.target === e.currentTarget){
                            $.fn.closePopup();
                        }
                    }
                });
                popObj.find('.btn_close').on({
                    click:function(e){
                        $.fn.closePopup();
                    }
                });
            };

            $.fn.closePopup = function(){
                $('.pop_wrap').removeClass('active');
                $('.popup').fadeOut();
            };
            
            $().on('click',function(){
            });          

        });

//슬라이드 스와이퍼        
function setListFocus(swiper, selector) {
    let snapIdx = swiper.snapIndex;
    let snapGridTotalIdx = swiper.snapGrid.length - 1;
    let slideGridTotalLen = swiper.slidesGrid.length;
    let slidesPerView = swiper.passedParams.slidesPerView;


    swiper.slides.each(function (idx) {
        if (selector === 'a') {
            if (snapIdx === snapGridTotalIdx) {
                let lastCount = slideGridTotalLen - (slidesPerView - (slideGridTotalLen % slidesPerView)) - 1;

                if (idx >= lastCount) {
                    //console.log(idx);
                    $(this).find(selector).attr('tabindex', 0);
                } else {
                    $(this).find(selector).attr('tabindex', -1);
                }
            } else {
                if (idx >= snapIdx * slidesPerView && idx < snapIdx * slidesPerView + slidesPerView) {
                    $(this).find(selector).attr('tabindex', 0);
                } else {
                    $(this).find(selector).attr('tabindex', -1);
                }
            }
        } else {
            if (idx >= snapIdx * slidesPerView && idx < snapIdx * slidesPerView + slidesPerView) {
                $(this).find(selector).attr('tabindex', 0);
            } else {
                $(this).find(selector).removeAttr('tabindex');
            }

            if (snapIdx === 0) {
                if (idx === 0) {
                    // console.log($(this).children(selector).get(0))
                }
            } else if (snapIdx === snapGridTotalIdx) {
                $(".event_list .swiper-slide:last-child").children(selector).focus();
            }
        }
    });
}
    </script>
    
<script type="text/javascript" src="https://img.cgv.co.kr/R2014//js/system/system.packed.js"></script>

<!-- S Skip Navigation -->
<div class="skipnaiv">
    <a href="#contaniner" id="skipHeader">메인 컨텐츠 바로가기</a>
    <!--<a href="#goto_ticket" id="">예매하기 바로가기</a>//-->
    <a href="/reserve/show-times/" id="">예매하기 바로가기</a>
</div>
<div id="cgvwrap">
    
      <!-- S Header
        Description
        - class 'nav' 에 class 'active' 추가시 서브메뉴노출
        - class 'nav' 에 class 'fixed' 추가시 상단고정되며 스타일 변경됨
     -->
	<!-- E Header -->

	<!-- Contaniner -->
	<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        

		<!-- Contents Area -->
		
        
            
            <!-- Contents Start -->
			

<input type="hidden" id="isOpenUserEmailYNPopup" name="isOpenUserEmailYNPopup" value="False">

<!-- S > Movie Selection
    Description:
    - iframe 영역으로 추후 협의 후 작업 진행 예정
 -->
            <div id="ctl00_PlaceHolderContent_divMovieSelection_wrap" class="movieSelection_wrap">
                <div class="contents">

                    <div class="video_wrap">
                        
                    <video autoplay="" muted="">
                        <source src="https://adimg.cgv.co.kr/images/202408/bluelock/0806_bluelock_1080x608.mp4" type="video/mp4">
                        이 브라우저는 Video 태그를 지원하지 않습니다. (Your browser does not support the video tag.)
                    </video>
                    
                        <strong id="ctl00_PlaceHolderContent_AD_MOVIE_NM" class="movieSelection_title">극장판 블루 록 -에피소드 나기-</strong>
                        <span id="ctl00_PlaceHolderContent_AD_DESCRIPTION_NM" class="movieSelection_txt">축구천재 각성하다!<br>8월개봉예정</span>
                        <div class="movieSelection_video_controller_wrap">
<!--                             <a href="http://ad.cgv.co.kr/click/CGV/CGV_201401/main@MovieSelection2021?ads_id%3d51848%26creative_id%3d78732%26click_id%3d99646%26content_series%3d%26event%3d" id="ctl00_PlaceHolderContent_AD_CLIP_DETAIL_URL" class="btn_movieSelection_detailView">상세보기</a> -->
                            
                            <a href="#none" id="ctl00_PlaceHolderContent_playStop" class="btn_movieSelection_playStop">Stop</a>
                            <a href="#none" id="ctl00_PlaceHolderContent_soundOnOff" class="btn_movieSelection_soundOnOff">Sound On</a>

                            <input name="ctl00$PlaceHolderContent$AD_CNT_URL" type="hidden" id="ctl00_PlaceHolderContent_AD_CNT_URL" value="http://ad.cgv.co.kr/NetInsight/imp/CGV/CGV_201401/main@MovieSelection2021?ads_id%3d51848%26creative_id%3d78732">
                        </div>
                    </div>
                </div>
            </div>
<!-- E > Movie Selection -->

<!-- S > 무비차트 | 상영예정작


  - Description:
            - 검색 값 있는 경우 영역 미노출
            - 관람제한 (12.png, 15.png, 19.png, all.png, notyet.png)
            - Egg (eggGoldeneggBad.png, eggGoldeneggGood.png, eggGoldeneggGreat.png, eggPreegg.png)
            
 -->  
 
<!-- 무비차트 -->
            <div class="movieChartBeScreen_wrap">
                <div class="contents">
                    <div class="movieChartBeScreen_btn_wrap">
                        <div class="tabBtn_wrap">
                            <h3><a href="#none" class="active" id="btnMovie">무비차트</a></h3>
                            <h3><a href="#none" id="btnReserMovie">상영예정작</a></h3>
                        </div>
                        <a href="${pageContext.request.contextPath}/movie/movie" id="btn_allView_Movie" class="btn_allView">전체보기</a>
                    </div>

                    <div class="swiper movieChart_list swiper-container-initialized swiper-container-horizontal" id="movieChart_list">
                        <div class="swiper-button-prev swiper-button-disabled" tabindex="0" role="button" aria-label="이전 슬라이드" aria-disabled="true"></div>
                        <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
							<c:forEach var="movie" items="${movieList}">
							<div class="swiper-slide swiper-slide-movie swiper-slide-active" style="width: 170.4px; margin-right: 32px;">
								<div class="img_wrap" data-scale="false" tabindex="0">
									<img src="${movie.posterUrl}" alt="${movie.title}" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
<!-- 									관람등급 수정 -->
										<c:set var="setRating" value="${fn:substring(movie.rating, 0, 2)}" />
            						    <i class="cgvIcon etc age${setRating == '전체' ? 'All' : setRating == '청소' ? 18 	: setRating}">${movie.rating}</i>
<%-- 										<i class="cgvIcon etc age${movie.rating}">${movie.rating}</i> --%>
										<div class='dDay_wrap'><span>
										</span></div>
									</div>
									<div class="movieChart_btn_wrap">
										<a href="${pageContext.request.contextPath}/movie/information?num=${movie.MOVIE_NUM}" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '세븐틴 투어 ‘팔로우’ 어게인 투 시네마');" class="btn_movieChart_detail">상세보기</a>
										<a href="${pageContext.request.contextPath}/ticket?num=${movie.MOVIE_NUM}" onclick="gaEventLog('PC_메인', '무비차트_예매하기','세븐틴 투어 ‘팔로우’ 어게인 투 시네마')" class="btn_movieChart_ticketing">예매하기</a>
									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">${movie.title}</strong>
<%--                                         <span>누적관객수 ${movieList.audiAcc}</span> --%>
								</div>
							</div>
							</c:forEach>
                        </div>
                        <div class="swiper-button-next" tabindex="0" role="button" aria-label="다음 슬라이드" aria-disabled="true"></div>
                        <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>


<!-- 상영예정 -->
                    <div class="swiper movieChart_list swiper-container-initialized swiper-container-horizontal" id="movieChart_list_Reser">
                        <div class="swiper-button-prev swiper-button-disabled" tabindex="0" role="button" aria-label="이전 슬라이드" aria-disabled="true"></div>
                        <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                        
                           <c:forEach var="upcoming" items="${upcomingMovies}">
                           
                                <div class="swiper-slide swiper-slide-movie swiper-slide-active" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" tabindex="0" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="${upcoming.POSTERURL}" alt="${upcoming.TITLE}" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <i class="cgvIcon etc age${upcoming.RATING}">${upcoming.RATING}</i>
<%--                                             <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/${upcoming.RATING}.png" alt="${upcoming.RATING}세"> --%>
                                            <div class='dDay_wrap'><span></span></div>
                                            <i class="cgvIcon etc ageDay" data-before-text="D - ${upcoming.D_DAY}">D Day</i>
                                        </div>
                                        <div class="screenType_wrap">
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="${pageContext.request.contextPath}/movie/information?num=${upcoming.MOVIE_NUM}" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '비포 선셋');" class="btn_movieChart_detail">상세보기</a>
                                        
<!--                                             <a href="/ticket/?MOVIE_CD=20010791&amp;MOVIE_CD_GROUP=20010761" onclick="gaEventLog('PC_메인', '무비차트_예매하기','비포 선셋')" class="btn_movieChart_ticketing">예매하기</a> -->
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">${upcoming.TITLE}</strong>
<!--                                         <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 92%</span> -->
<!--                                         <span>예매율 0.3%</span> -->
                                    </div>
                                </div>
                                
                                </c:forEach>

                        </div>
                        <div class="swiper-button-next" tabindex="0" role="button" aria-label="다음 슬라이드" aria-disabled="true"></div>
                        <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                        
                      
                    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>

                </div>
            </div>
<!-- E > 무비차트 | 상영예정작 -->

<!-- S > 기프트콘 노출 -->
            <div class="giftcon_wrap">
                <div class="contents">
                    <ul class="giftcon_list_wrap">
                        
                        <li>
                            <dl class="giftcon_list">
                                <dt>패키지<a href=" ${pageContext.request.contextPath}/store/productCategory?category=패키지" alt="패키지" class="btn_more">더보기</a></dt>
                             
                               <c:forEach var="packages" items="${packagelist}">
                                <dd>
                                    <a href="${pageContext.request.contextPath}/store/productDetail?st_num=${packages.st_num}">
                                        <div class="img_wrap" data-scale="false"><img src="${pageContext.request.contextPath}/resources/img/${packages.st_picture}" alt="패키지"></div>
                                        <div class="giftcon_info_wrap">
                                            <span>${packages.st_name}</span>
                                            <strong>${packages.st_price}원</strong>
                                        </div>
                                    </a>
                                </dd>
                                </c:forEach>
                            </dl>
                        </li>

                        <li>
                            <dl class="giftcon_list">
                                <dt>영화관람권<a href="${pageContext.request.contextPath}/store/productCategory?category=영화관람권" alt="영화관람권" class="btn_more">더보기</a></dt>
                               
                               <c:forEach var="giftcon" items="${giftconliset}">
                                <dd>
                                    <a href="${pageContext.request.contextPath}/store/productDetail?st_num=${giftcon.st_num}">
                                        <div class="img_wrap" data-scale="false"><img src="${pageContext.request.contextPath}/resources/img/${giftcon.st_picture}" alt="영화관람권"></div>
                                        <div class="giftcon_info_wrap">
                                            <span>${giftcon.st_name}</span>
                                            <strong>${giftcon.st_price}원</strong>
                                        </div>
                                    </a>
                                </dd>
                                </c:forEach>
                            </dl>
                        </li>
                        
<!--                         TODO기프트카드 필요하면 다시 넣기 @@@@@@@@@@@@@@@@@@@@@@@@@@@-->
<!--                         <li> -->
<!--                             <dl class="giftcon_list"> -->
<!--                                 <dt>기프트카드<a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=3" alt="기프트카드" class="btn_more">더보기</a></dt> -->
                               
<!--                                 <dd> -->
<!--                                     <a href="/culture-event/popcorn-store/product-detail.aspx?GG_NO=100161"> -->
<!--                                         <div class="img_wrap" data-scale="false"><img src="https://img.cgv.co.kr/GiftStore/Product/Pc/List/15814124358590.jpg" alt="PACONNIE A형"></div> -->
<!--                                         <div class="giftcon_info_wrap"> -->
<!--                                             <span>PACONNIE A형</span> -->
<!--                                             <strong>금액충전형</strong> -->
<!--                                         </div> -->
<!--                                     </a> -->
<!--                                 </dd> -->
                            
<!--                                 <dd> -->
<!--                                     <a href="/culture-event/popcorn-store/product-detail.aspx?GG_NO=100162"> -->
<!--                                         <div class="img_wrap" data-scale="false"><img src="https://img.cgv.co.kr/GiftStore/Product/Pc/List/15814158039890.jpg" alt="PACONNIE B형"></div> -->
<!--                                         <div class="giftcon_info_wrap"> -->
<!--                                             <span>PACONNIE B형</span> -->
<!--                                             <strong>금액충전형</strong> -->
<!--                                         </div> -->
<!--                                     </a> -->
<!--                                 </dd> -->
                            
<!--                                 <dd> -->
<!--                                     <a href="/culture-event/popcorn-store/product-detail.aspx?GG_NO=100163"> -->
<!--                                         <div class="img_wrap" data-scale="false"><img src="https://img.cgv.co.kr/GiftStore/Product/Pc/List/15814162227570.jpg" alt="PACONNIE C형"></div> -->
<!--                                         <div class="giftcon_info_wrap"> -->
<!--                                             <span>PACONNIE C형</span> -->
<!--                                             <strong>금액충전형</strong> -->
<!--                                         </div> -->
<!--                                     </a> -->
<!--                                 </dd> -->
                               
<!--                             </dl> -->
<!--                         </li> -->
                        
                    </ul>
                </div>
            </div>
<!-- E > 기프트콘 노출 -->
<!-- S > 공지사항 & 고객센터 -->
            <div class="noticeClient_wrap">
                <div class="contents">
                    <div class="noticeClient_container">
                        <div class="noticeClient_content">
                            
                            <div id="ctl00_PlaceHolderContent_notice_wrap" class="notice_wrap">
                                <strong>공지사항</strong>
                                
                                    <a href="${pageContext.request.contextPath}/inquiry/newscontent?NEWS_NUM=${newNews.NEWS_NUM}" class="btn_link">${newNews.NEWS_SECTION} ${newNews.NEWS_NAME}</a>
                                
                                <a href="${pageContext.request.contextPath}/inquiry/news" id="notice_more" class="btn_more">더보기</a>
                            </div>

                            <div class="client_wrap">
                                <dl class="client_list">
                                    <dt><strong>고객센터</strong></dt>
                                    <dd>
                                        <strong>051-803-0909</strong>
                                        <span>고객센터 운영시간 (평일 09:00~18:00)
                                            <p>업무시간 외 자동응답 안내 가능합니다.</p>
                                        </span>
                                    </dd>
                                </dl>
                                <div class="client_btn_wrap" id="client_btn_wrap">
                                    <a href="${pageContext.request.contextPath}/inquiry/news">공지/뉴스</a>
                                    <a href="${pageContext.request.contextPath}/inquiry/write">1:1 문의</a>
                                    <a href="${pageContext.request.contextPath}/inquiry/often">자주찾는 질문</a>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="noticeClient_banner_wrap">

                        <!-- <div class="event_list_wrap"> -->
                        <div class="swiper noticeClient_banner_list swiper-container-initialized swiper-container-horizontal">
                            <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                                <div class="swiper-slide swiper-slide-active" id="divSpecialDiscountData" style="display: none;">
                                    <a id="bannerType1" href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=36641&amp;menu=006">
                                        <img src="about:blank" alt="카카오페이카드" onerror="onerror=null;javacript:;error_specialDiscountData(); ">
                                    </a>
                                </div>
                               
                                <div class="swiper-slide swiper-slide-next" style="width: 211px;"> <!--211x238-->
                                    <iframe src="https://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@Branding" width="211" height="238" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Branding" id="Branding"></iframe>
                                </div>
                            </div>
                            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                        <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                        <a href="#none" class="btn_noticeClientBannerControl active" style="display: none;">playStop</a>
                    </div>
                </div>
            </div>
<!-- E > 공지사항 & 고객센터 -->
<script id="temp_popup" type="text/x-jquery-tmpl">
</script>

<script type="text/javascript">

//     배너이미지가 깨질경우 oms등록 안보이게 처리
//     function error_specialDiscountData() {
//         $(".noticeClient_banner_list > .swiper-wrapper > .swiper-slide:eq(0)").hide();
//         $(".btn_noticeClientBannerControl").click();
//         $(".btn_noticeClientBannerControl").hide(); //시작중지 버튼
//     }

</script>


            
            <!--/ Contents End -->
		
		<!-- /Contents Area -->
	</div>
    <!-- E Contaniner -->
    
    <!-- S Popup -->
    <div class="com_pop_wrap">
        <div class="com_pop_fog"></div>
    </div>
    <div class="pop_wrap">
    <!-- S > [팝업] 지원 OS 업데이트 유도-->
        <div id="pop_supportOS" class="popup" style="display:none">
            <div class="pop_iexp_wrap" style="position:fixed; left:50%; top:50%; width:600px; margin:-165px 0 0 -300px; z-index:1000;">
                <div class="pi_headline">
                    <img src="https://img.cgv.co.kr/images/popup/1606_iexp/pop_iexp_headline2.jpg" alt="CGV 홈페이지는 고객님께서 사용중인 MS Windows XP에서 정상적인 서비스 이용이 어려울 수 있으며, OS업데이트를 권장합니다.">
                </div>
                <div class="down_app">
                    <p><img src="https://img.cgv.co.kr/images/popup/1606_iexp/pop_iexp_downtxt.jpg" alt="OS 업데이트가 어려운 경우 모바일앱을 이용하세요!!!"></p>
                    <a class="btn" href="https://itunes.apple.com/kr/app/id370441190?mt=8" target="_blank"><img src="https://img.cgv.co.kr/images/popup/1606_iexp/btn_down_ios.jpg" alt="Ios down"></a>
                    <a class="btn" href="https://play.google.com/store/apps/details?id=com.cgv.android.movieapp" target="_blank"><img src="https://img.cgv.co.kr/images/popup/1606_iexp/btn_down_android.jpg" alt="Android down"></a>
                </div>
                <a class="btn_close">닫기</a>
            </div>
         </div>
    <!-- S > [팝업] 지원 브라우저 다운로드 유도-->
         <div id="pop_supportBrower" class="popup" style="display:none">
            <div class="pop_iexp_wrap" style="position:fixed; left:50%; top:50%; width:600px; margin:-265px 0 0 -300px; z-index:1000;">
                <div class="pi_headline">
                    <img src="https://img.cgv.co.kr/images/popup/1606_iexp/pop_iexp_headline1.jpg" alt="CGV 홈페이지는 Internet Explorer 9이상에서 최적의 서비스 이용이 가능합니다. IE9 이하 브라우저에서 이용 시 정상적인 서비스 이용이 어려울 수 있으며, 브라우저 업그레이드 하시기를 권장합니다.">
                </div>
                <ul class="down_browser">
                    <li><a href="https://www.microsoft.com/ko-kr/edge" target="_blank"><img src="https://img.cgv.co.kr/images/popup/1606_iexp/btn_down_ie.jpg" alt="Internet Explorer 다운받기"></a></li>
                    <li><a href="https://www.google.com/chrome/browser/desktop/index.html" target="_blank"><img src="https://img.cgv.co.kr/images/popup/1606_iexp/btn_down_chrome.jpg" alt="Chrome 다운받기"></a></li>
                </ul>
                <div class="down_app">
                    <p><img src="https://img.cgv.co.kr/images/popup/1606_iexp/pop_iexp_downtxt.jpg" alt="OS 업데이트가 어려운 경우 모바일앱을 이용하세요!"></p>
                    <a class="btn" href="https://itunes.apple.com/kr/app/id370441190?mt=8" target="_blank"><img src="https://img.cgv.co.kr/images/popup/1606_iexp/btn_down_ios.jpg" alt="Ios down"></a>
                    <a class="btn" href="https://play.google.com/store/apps/details?id=com.cgv.android.movieapp " target="_blank"><img src="https://img.cgv.co.kr/images/popup/1606_iexp/btn_down_android.jpg" alt="Android down"></a>
                </div>
                <a class="btn_close">닫기</a>
            </div>
        </div>
	</div>

    <!-- E Popup -->
    
    <!-- S 예매하기 및 TOP Fixed 버튼 -->
    <div class="fixedBtn_wrap">
     
        <a href="/ticket/" class="btn_fixedTicketing">예매하기</a>
        
        <a href="#skipHeader" class="btn_gotoTop"><img src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png" alt="최상단으로 이동"></a>
    </div>
    
    <!-- E 예매하기 및 TOP Fixed 버튼 -->
	
    <!-- S Footer -->
    <footer>
		<!-- footer_area (s) -->
		
<div id="BottomWrapper" class="sect-ad">
    <iframe src="https://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@Bottom" width="100%" height="240" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Bottom" id="Bottom"></iframe>
</div>
<ul class="policy_list">
    <li><a href="${pageContext.request.contextPath}/movie/movie" target="_blank"><strong>영화</strong></a></li>
    <li><a href="${pageContext.request.contextPath}/theater/theater" target="_blank"><strong>극장</strong></a></li>
    <li><a href="${pageContext.request.contextPath}/ticket" target="_blank"><strong>예매</strong></a></li>
    <li><a href="${pageContext.request.contextPath}/store/storeMain" target="_blank"><strong>스토어</strong></a></li>
    <li><a href="${pageContext.request.contextPath}/member/register" target="_blank"><strong>회원가입</strong></a></li>
    <li><a href="${pageContext.request.contextPath}/inquiry/Imain"><strong>고객센터</strong></a></li>
    <li><a href="http://www.cgv.co.kr/rules/privacy.aspx">개인정보처리방침</a></li>
    <li><a href="http://www.cgv.co.kr/rules/disclaimer.aspx">법적고지</a></li>
    <li><a href="http://www.cgv.co.kr/rules/emreject.aspx">이메일주소무단수집거부</a></li>
    <li><a href="http://corp.cgv.co.kr/company/ethicalManagement/ceoMessage.aspx" target="_blank">윤리경영</a></li>
    <li><a href="/company/cyberAudit.aspx" class="empha-red">사이버감사실</a></li>
</ul>
<article class="company_info_wrap">
    <section class="company_info">
        
        <dl class="company_info_list">
        	<dt>부산광역시 부산진구 동천로 109 삼한골든게이트빌딩</dt>
        	<dd>7층</dd>
            <dt>대표이사</dt>
            <dd>조인형</dd>
            <dt>사업자등록번호</dt>
            <dd>507-85-07103 <a href="#none" onclick="goFtc()" class="btn_goFtc">사업자정보확인</a></dd>
        </dl>
        <dl class="company_info_list">
            <dt>총괄 담당자</dt>
            <dd>차동원</dd>
            <dt>개인정보보호 책임자</dt>
            <dd>정지윤</dd>
            <dt>이메일</dt>
            <dd>class@itwillbs.co.kr</dd>
            <dt>TEL </dt>
            <dd>051-803-0909</dd>
            <dt>FAX </dt>
            <dd>051-803-0979</dd>
            
        </dl>
        <p class="copyright">© OSTicket . All Rights Reserved</p>
    </section>
</article>
<script>
    //footer GA Analytics 영역 LOG
    $('.policy_list > li > a').on({
        click: function (e) {
            gaEventLog('PC_footer', this.text, '');
        }
    });
</script>
        <!-- footer_area (e) -->

        <div class="adFloat2" style="display:none">

            <iframe src="//ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@Popicon" width="154" height="182" frameborder="0" scrolling="no" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" allowtransparency="true" id="ad_float1" style="display: none;"></iframe>
        </div>
        <script type="text/javascript">            /* OpenAD(); */</script>
        <!-- //Float Ad -->
	</footer>
	<!-- E Footer -->

    <!-- Aside Banner :  -->
    <!--
	<div id="ctl00_sect_person_right" class="sect-aside-banner" style="padding:0; margin:0; position:fixed; z-index:1;display:none">
		<div class="aside-content-top">
			<div class="aside-content-btm">
				<a href="/theaters/"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_theater.gif" alt="CGV THEATER" /></a>
				<a href="/arthouse/"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_arthouse.gif" alt="CGV arthouse" /></a>
				<a href="/theaters/special/"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_special.gif" alt="CGV SPECIAL" /></a>

				<a href="/user/mycgv/reserve/" class="required-login" data-url="/user/mycgv/reserve/"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_ticket.gif" alt="CGV TICKET INFO" /></a>
				<a href="/discount/discountlist.aspx"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_discount.gif" alt="CGV DISCOUNT INFO" /></a>
			</div>
		</div>
		<div class="btn-top">
            <a href="#" onclick="window.scrollTo(0,0);return false;"><span>최상단으로 이동</span></a>
		</div>
	</div>
    //-->
	<!-- //Aside Banner -->
    
</div>


<script type="text/template" id="temp_popup_movie_player">
<div class="popwrap">
    <div class="sect-layerplayer">
        <div class="cols-pop-player">
            <h1 class="title" id="movie_player_popup_title"></h1>
            <div class="col-pop-player">
                <div class="warp-pop-player" style="position: relative;">
                    <iframe id="ifrm_movie_player_popup" name="ifrm_movie_player_popup" src="about:blank" style="width:800px;height:450px;" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
					
					<div class="sect-replay" style="display:none" id="pop_player_relation_wrap">
						<button class="btn-replay movie_player_inner_popup" type="button" data-gallery-idx="0" id="btn_movie_replay">다시보기</button>
						<!-- 없어지는 영역 -->
						<div class="wrap-relationmovie" id="pop_player_relation_item_wrap">
							<strong class="title">관련영상</strong>
							<ul id="pop_player_relation_movie">
                                <li></li>
                            </ul>
						</div><!-- .wrap-relationmovie -->
					</div><!-- .sect-replay -->
					
                </div><!-- .warp-pop-player -->
                <div class="descri-trailer">
                    <strong class="title">영상설명</strong>
                    <textarea readonly="readonly" id="movie_player_popup_caption"></textarea>
                </div>
            </div><!-- .col-player -->
            <div class="col-pop-playerinfo">
                <div id="movie_player_popup_movie_info"></div>
                <div class="sect-trailer">
                    <strong class="title">신규영상</strong>
                    <ul>
                        
                    </ul>
                </div>
            </div><!-- .col-playerinfo -->
        </div><!-- .cols-player -->
        <button type="button" class="btn-close">닫기</button>
    </div>
</div>
</script>

<script id="temp_popup_movie_player_movie_info" type="text/x-jquery-tmpl">

</script>

<script id="temp_popup_movie_player_relation_movie_item" type="text/x-jquery-tmpl">
<li>
    <div class="box-image">
        <a href="#" title="${Title} 영상보기" class="movie_player_inner_popup" data-gallery-idx="${GalleryIdx}">
            <span class="thumb-image">
                <img src="${ImageUrl}" 
                alt="${Title}_트레일러" />
                <span class="ico-play">영상보기</span>
            </span>
        </a>
    </div>
</li>
</script>

<script type="text/javascript" src="https://img.cgv.co.kr/R2014//js/system/crypto.js"></script>

<script type="text/javascript">
    //<![CDATA[
    function closeBanner(){        
        $('#cgv_main_ad').remove();     
        for(var i = 0; i < 2; i++) {
            window.setTimeout(function(){
                $(window).resize()                
            }, 30)
        }
    }
    function showPlayEndEvent() {
        $('#pop_player_relation_wrap').show();
        $('#btn_movie_replay').focus();
    }

    (function ($) {
        $(function () {

        
            $('.movie_player_popup').moviePlayer();     //동영상플레이어

            //노원타운
            $('.special5_pop').on('click', function () {
                openNowonTown();
                return false;
            });           
            // 검색 auto validate version.
            $('.btn-go-search').on('click', function () {
                var $frmSearch = $(this).parent().parent('form');
                $frmSearch.submit();
                return false;
            });

            ////메인스킵네비
            $('#skipHeader').on('click', function(){
                var $ctn = $('#contaniner');
                $ctn.attr({
                    tabIndex : -1
                }).focus();				
                return false;
            });

            //현재 URL 해당파라미터 교체
            function updateQueryStringParameter(uri, key, value) {
                var re = new RegExp("([?|&])" + key + "=.*?(&|#|$)", "i");
                if (uri.match(re)) {
                    return uri.replace(re, '$1' + key + "=" + value + '$2');
                } else {
                    var hash =  '';
                    var separator = uri.indexOf('?') !== -1 ? "&" : "?";    
                    if( uri.indexOf('#') !== -1 ){
                        hash = uri.replace(/.*#/, '#');
                        uri = uri.replace(/#.*/, '');
                    }
                    return uri + separator + key + "=" + value + hash;
                }
            }
            //모바일버전 가기
            $('.go-mobile').on('click', function() {
                location.replace(updateQueryStringParameter(location.href, "IsMobile", "N"));
                return false;
            });
        });
    })(jQuery);
	
    function goFamilySite() {
        var famulySiteURL = $(familysite).val();
        if (famulySiteURL != "") {
            var win = window.open(famulySiteURL, 'winFamilySite')
            win.focus();
        }
    }
    function goFtc() {
        var ftcUrl = "http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1048145690";
        window.open(ftcUrl, "bizCommPop", "width=750, height=700, scrollbars=1;");        
    }    
    //]]>
</script>

<!-- 앱다운로드 레이어 팝업 -->
<script type="text/javascript">
    //appDownInfoPop();
</script>

<script language="javascript" type="text/javascript">

    //GA 에널리스트 이벤트LOG 함수- 2022.01.12: MYILSAN
    function gaEventLog(pCategroy, pAction, pLabel) {
        ga('send', {
            hitType: 'event', eventCategory: pCategroy, eventAction: pAction, eventLabel: pLabel
            , hitCallback: function () {
            }
            , hitCallbackFail: function () { 
            }
        });
    }

    //201402 SYH GA추가
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o), m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-47126437-1', 'cgv.co.kr'); //지주사
    ga('create', 'UA-47951671-5', 'cgv.co.kr', { 'name': 'cgvTracker' }); //디마팀
    ga('create', 'UA-47951671-7', 'cgv.co.kr', { 'name': 'rollup' }); //추가

</script>


<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-NNNFR3"height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>    (function (w, d, s, l, i) {
        w[l] = w[l] || []; w[l].push({ 'gtm.start':
            new Date().getTime(), event: 'gtm.js'
        }); var f = d.getElementsByTagName(s)[0],
            j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
            '//www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-NNNFR3');
</script>
<!-- End Google Tag Manager -->




</body>
</html>