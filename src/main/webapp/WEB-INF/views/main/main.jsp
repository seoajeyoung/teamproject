<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
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
<script
	src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/script/top.js"></script>
</head>
<body>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"><head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="No-Cache">
    <meta http-equiv="imagetoolbar" content="no">
    <meta name="viewport" content="width=1024">
    <meta name="keywords" content="CGV, 시지브이, 영화관, 극장, 영화, 티켓, 박스오피스, 극장, Movie, Theater, Cinema, Cgv, cgv, 예매, 상영작">
    <meta name="description" content="영화 그 이상의 다양한 몰입의 경험을 만듭니다. DEEP DIVE SPACE, CGV">
    <meta property="og:site_name" content="깊이 빠져 보다, CGV">
    <meta id="ctl00_og_title" property="og:title" content="깊이 빠져 보다, CGV">

    <!-- 24.02 네이버 웹 검색 연관 채널 방식 수정 -->
     <script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-SSGE1ZCJKG&amp;cx=c&amp;_slc=1"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-559DE9WSKZ&amp;l=dataLayer&amp;cx=c"></script><script async="" src="//www.googletagmanager.com/gtm.js?id=GTM-NNNFR3"></script><script async="" src="//www.google-analytics.com/analytics.js"></script><script type="application/ld+json">
    {
         "@context": "http://schema.org",
         "@type": "Organization",
         "name": "CGV",
         "url": "https://www.cgv.co.kr",
         "sameAs": [
           "https://www.instagram.com/cgv_korea/",
           "https://www.youtube.com/channel/UCmjUMtUw6wXLrsULdxuXWdg",
           "https://www.facebook.com/CJCGV",
           "https://play.google.com/store/apps/details?id=com.cgv.android.movieapp&pli=1" ]
    }
    </script>
    
    
    <meta id="ctl00_og_image" property="og:image" content="https://img.cgv.co.kr/WebApp/images/common/logo_new_kakao_prevw.png">
    <link rel="alternate" href="http://m.cgv.co.kr">
    <link rel="shortcut icon" href="https://img.cgv.co.kr/theater_img/favicon.ico" type="image/x-icon">
    <title id="ctl00_headerTitle">깊이 빠져 보다, CGV</title>
    <link rel="shortcut icon" type="image/x-icon" href="https://img.cgv.co.kr/R2014/images/favicon.ico">
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css">
<!-- 	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css"> -->
<!--     <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css"> -->
<!--     <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209">     -->
<!--     <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css"> -->
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css">
    
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/eggupdate.css">
    <link rel="stylesheet" media="print" type="text/css" href="https://img.cgv.co.kr/R2014/css/print.css">    
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css">
    
    <script type="text/javascript" src="/common/js/extraTheaters.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.config.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.tmpl.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.validate.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.paging.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.utils.js"></script>
	<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.pageing.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.init.js"></script>

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

	<!-- 2020.05.07 감정지수/프리에그 프로젝트 추가 -->
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/preegg.css">

    <!-- 2023.03.27 홈페이지 스토어 영역 內 배너 영역 미노출의 件 -->
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/giftstore/giftstore.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/giftstore/commonstore.js"></script>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/giftstore/giftstore.css"> 

    <!-- 홈페이지 CSS 일원화로 인한 반영 20220721 -->
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/resource_pc/css/cgv.min.css">
    <script type="text/javascript" src="https://img.cgv.co.kr/resource_pc/js/cgvUi.js"></script>

    <!-- 각페이지 Header Start--> 
    
<!--<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">https, http  혼합사용시-->
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/swiper.min.js"></script>
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/swiper-bundle.min.css">
<script type="text/javascript">
        $(document).ready(function(){
        	
            $("#btnMovie").click(function(){
                $("#movieChart_list").show();
                $("#movieChart_list_Reser").hide();
                $("#btn_allView_Movie").attr("href", "/movies/?lt=1&ft=0");
            });

            $("#btnReserMovie").click(function(){
                $("#movieChart_list").hide();
                $("#movieChart_list_Reser").show();
                $("#btn_allView_Movie").attr("href", "/movies/pre-movies.aspx");
            });

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
                    slideLabelMessopenPopupage: '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
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

            var movieSelectionVideoObj = $('.video_wrap video')[0];

            $('.video_wrap video').on({
                ended:function(){
                    $('.btn_movieSelection_playStop').removeClass('active');
                }
            })
            // movieSelectionVideoObj.onended = function(){
                
            // }

            $('.btn_movieSelection_playStop').on({
                click:function(){
                    if(movieSelectionVideoObj.paused){
                        movieSelectionVideoObj.play();
                        $(this).addClass('active');
                    }else{
                        movieSelectionVideoObj.pause();
                        $(this).removeClass('active');
                    }
                }
            });

            $('.btn_movieSelection_soundOnOff').on({
                click:function(){
                    if(movieSelectionVideoObj.muted){
                        movieSelectionVideoObj.muted = false;
                        $(this).addClass('active');
                    }else{
                        movieSelectionVideoObj.muted = true;
                        $(this).removeClass('active');
                    }
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

        });
    </script>


    <!--/각페이지 Header End--> 
    <script type="text/javascript">
        //<![CDATA[
        _TRK_CP = "/홈";

        app.config('staticDomain', 'https://img.cgv.co.kr/R2014/')
            .config('imageDomain', 'https://img.cgv.co.kr')
            .config('isLogin', 'False');

        
        // AD FLOAT
        // 암호화 할 문자열과 키값(상수값)을 매개변수로 받는다.
        function EncryptAD(str, key) {
            output = new String;
            Temp = new Array();
            TextSize = str.length;
            for (i = 0; i < TextSize; i++) {
                // key 값을 원하는 대로 연산을 한다
                output += String.fromCharCode(str.charCodeAt(i) + parseInt(key) + 123 + i);
            }
            return output;
        }
        // 복호화
        // 암호화 된 문자열과 키값(상수값)을 매개변수로 받는다.
        function DecryptAD(str, key) {
            output = new String;
            Temp = new Array();
            TextSize = str.length;
            for (i = 0; i < TextSize; i++) {
                // 암호화시 사용한 연산과 같아야 한다.
                output += String.fromCharCode(str.charCodeAt(i) - (parseInt(key) + 123 + i));
            }

            return output;
        }

        function getCookieVal(offset) {
            var endstr = document.cookie.indexOf(";", offset);
            if (endstr == -1) endstr = document.cookie.length;
            return unescape(document.cookie.substring(offset, endstr));
        }
        function GetCookieAd(name) {
            var arg = name + "=";
            var alen = arg.length;
            var clen = document.cookie.length;
            var i = 0;
            while (i < clen) { //while open
                var j = i + alen;
                if (document.cookie.substring(i, j) == arg)
                    return getCookieVal(j);
                i = document.cookie.indexOf(" ", i) + 1;
                if (i == 0) break;
            } //while close
            return null;
        }
        function setCookieAD(name, value, expiredays) {
            var todayDate = new Date();
            todayDate.setTime(todayDate.getTime() + (expiredays * 24 * 60 * 60 * 1000));
            document.cookie = name + "=" + escape(value) + "; expires=" + todayDate.toGMTString() + "; path=/; domain=cgv.co.kr";
        }
        function CloseAD() {
            var AdUrl = window.location.href;
            var ArrAdUrl = AdUrl.split("/");

            var CurCookieName = 'CgvPopAd-' + ArrAdUrl[3];
            var CurCookieUrl = GetCookieAd(CurCookieName);
            var CookieUrl = ArrAdUrl[3];

            CookieUrl = EncryptAD(CookieUrl, "15442280");
            setCookieAD(CurCookieName, CookieUrl, '1');
            $(document).find('#ad_float1').hide();
        }
        function OpenAD() {
            var AdUrl = window.location.href;
            var ArrAdUrl = AdUrl.split("/");
            var CookieUrl = ArrAdUrl[3];
            var CurCookieName = 'CgvPopAd-' + ArrAdUrl[3];
            var CurCookieUrl = GetCookieAd(CurCookieName);

            if (CurCookieUrl == null) {
                CurCookieUrl = "";
            }
            else {
                CurCookieUrl = DecryptAD(CurCookieUrl, "15442280");
            }

            if (CurCookieUrl.indexOf(CookieUrl) != -1) {
                $(document).find('#ad_float1').hide();
            }

            //section.cgv.co.kr 매거진 체크
            var magazineckurl = GetCookieAd("CgvPopAd-magazine");
            if (magazineckurl != null) {
                var magazineck = DecryptAD(magazineckurl, "15442280");
                if (magazineck != null && magazineck == "magazine") {
                    //값이있는경우 표시하지않음
                    $(document).find('#ad_float1').hide();
                }
            }
        }

        

        //]]>
    </script>
    

    
<script type="text/javascript" src="https://img.cgv.co.kr/R2014//js/system/system.packed.js"></script></head>
<body class="" style="">

<!-- S Skip Navigation -->
<div class="skipnaiv">
    <a href="#contaniner" id="skipHeader">메인 컨텐츠 바로가기</a>
    <!--<a href="#goto_ticket" id="">예매하기 바로가기</a>//-->
    <a href="/reserve/show-times/" id="">예매하기 바로가기</a>
</div>
<div id="cgvwrap">
    
    
    <div class="cgv-ad-wrap" id="cgv_main_ad">
        <div id="TopBarWrapper" class="sect-head-ad">
            <div class="top_extend_ad_wrap">
                <div class="adreduce" id="adReduce">                    
                    <iframe src="//ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@TopBar_EX" width="100%" height="80" title="" frameborder="0" scrolling="no" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" name="TopBanner" id="TopBanner"></iframe>
                </div> 
                <div class="adextend" id="adExtend"></div>
            </div><!-- //.top_extend_ad_wrap -->
        </div>    
    </div>    
	
      <!-- S Header
        Description
        - class 'nav' 에 class 'active' 추가시 서브메뉴노출
        - class 'nav' 에 class 'fixed' 추가시 상단고정되며 스타일 변경됨
     -->
<!--      TODO    인클루드하면 지워야함 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
	<div class="header">			
            <!-- 서비스 메뉴 --> 
            
<div class="header_content">
    <div class="contents">
        <h1 onclick=""><a href="/"><img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png" alt="CGV"></a><span>DEEP DIVE SPACE</span></h1>
        <ul class="memberInfo_wrap">
            
            
            <li><a href="${pageContext.request.contextPath}/member/login"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그인"><span>로그인</span></a></li>
			<li><a href="${pageContext.request.contextPath}/member/register"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png" alt="회원가입"><span>회원가입</span></a></li>

<!-- 		$$$$$$$$$$$$$$$$$$$$$$$$$TODO 마이페이지 주소로 변경하기$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
			<li><a href="${pageContext.request.contextPath}/admin/member/index"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="MY CGV"><span>임시 관리자</span></a></li>
			<li><a href="${pageContext.request.contextPath}/inquiry/Imain"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png" alt="고객센터"><span>고객센터</span></a></li>
        </ul>
    </div>
</div>

           
			
<div class="nav" style="left: 0px;">
    <div class="contents">
        <h1><a href="/" tabindex="-1"><img src="https://img.cgv.co.kr/R2014/images/common/logo/logoWhite.png" alt="CGV"></a></h1>
        <ul class="nav_menu">
            <li>
                <h2><a href="${pageContext.request.contextPath}/movie/movie">영화</a></h2>
                <dl class="nav_overMenu" style="display: none;">
                    <dt><h2><a href="/movies/?lt=1&amp;ft=0" tabindex="-1">영화</a></h2></dt>
                    <dd><h3><a href="/movies/?lt=1&amp;ft=0">무비차트</a></h3></dd>
                    <dd><h3><a href="/arthouse/">아트하우스</a></h3></dd>
                    <dd><h3><a href="/culture-event/event/detailViewUnited.aspx?seq=30717">ICECON</a></h3></dd>
                </dl>
            </li>
            <li>
                <h2><a href="${pageContext.request.contextPath}/theater/theater">극장</a></h2>
                <dl class="nav_overMenu" style="display: none;">
                    <dt><h2><a href="/theaters/" tabindex="-1">극장</a></h2></dt>
                    <dd><h3><a href="/theaters/">CGV 극장</a></h3></dd>
                    <dd><h3><a href="/theaters/special/defaultNew.aspx">특별관</a></h3></dd>
                </dl>
            </li>
            <li>
                <h2><a href="${pageContext.request.contextPath}/ticket"><strong>예매</strong></a></h2>
                <dl class="nav_overMenu" style="display: none;">
                    <dt><h2><a href="/ticket/" tabindex="-1">예매</a></h2></dt>
                    <dd><h3><a href="/ticket/">빠른예매</a></h3></dd>
                    <dd><h3><a href="/reserve/show-times/">상영스케줄</a></h3></dd>
                    <dd><h3><a href="/ticket/eng/newdefault.aspx">English Ticketing</a></h3></dd>
                    <dd><h3><a href="/reserve/show-times/eng/">English Schedule</a></h3></dd>
                </dl>
            </li>
            <li>
                <h2><a href="${pageContext.request.contextPath}/store/storeMain">스토어</a></h2>
                <dl class="nav_overMenu" style="display: none;">
                    <dt><h2><a href="/culture-event/popcorn-store/" tabindex="-1">스토어</a></h2></dt>
                    
                            <dd><h3><a href="${pageContext.request.contextPath}/store/productCategory?category=패키지">패키지</a></h3></dd>
                        
                            <dd><h3><a href="${pageContext.request.contextPath}/store/productCategory?category=영화관람권">영화관람권</a></h3></dd>
                        
                            <dd><h3><a href="${pageContext.request.contextPath}/store/productCategory?category=기프트카드">기프트카드</a></h3></dd>
                        
                            <dd><h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=4">콤보</a></h3></dd>
                        
                            <dd><h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=5">팝콘</a></h3></dd>
                        
                            <dd><h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=6">음료</a></h3></dd>
                        
                            <dd><h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=7">스낵</a></h3></dd>
                        
                            <dd><h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=10">플레이존</a></h3></dd>
                        
                    <!-- 2024.06.27 씨네샵 URL 변경 요청 -->
                    <dd><h3><a href="https://brand.naver.com/cgv" class="arrowR" target="_blank">씨네샵</a></h3></dd>
                </dl>
            </li>
            <li>
                <h2 onclick="gaEventLog('PC_GNB','주메뉴_이벤트','')"><a href="/culture-event/event/defaultNew.aspx">이벤트</a></h2>
                <dl class="nav_overMenu" style="display: none;">
                    <dt><h2><a href="/culture-event/event/defaultNew.aspx?mCode=001" tabindex="-1">이벤트</a></h2></dt>
                    <dd><h3><a href="/culture-event/event/defaultNew.aspx?mCode=001">SPECIAL</a></h3></dd>
                    <dd><h3><a href="/culture-event/event/defaultNew.aspx?mCode=004">영화/예매</a></h3></dd>
                    <dd><h3><a href="/culture-event/event/defaultNew.aspx?mCode=008">멤버십/CLUB</a></h3></dd>
                    <dd><h3><a href="/culture-event/event/defaultNew.aspx?mCode=005">CGV 극장별</a></h3></dd>
                    <dd><h3><a href="/culture-event/event/defaultNew.aspx?mCode=006">제휴할인</a></h3></dd>
                    <dd><h3><a href="/user/mycgv/event/result_list.aspx">당첨자 발표</a></h3></dd>
                    <dd><h3><a href="/culture-event/event/end-list.aspx">종료된 이벤트</a></h3></dd>
                </dl>
            </li>
            <li>
                <h2 onclick="gaEventLog('PC_GNB','주메뉴_해택','')"><a href="/discount/discountlist.aspx">혜택</a></h2>
                <dl class="nav_overMenu" style="display: none;">
                    <dt><h2><a href="/discount/discountlist.aspx" tabindex="-1">혜택</a></h2></dt>
                    <dd><h3><a href="/discount/discountlist.aspx">CGV 할인정보</a></h3></dd>
                    <dd><h3><a href="https://www.cgv.co.kr/user/memberShip/ClubService.aspx">CLUB 서비스</a></h3></dd>
                    <dd><h3><a href="/user/vip-lounge/">VIP 라운지</a></h3></dd>
                </dl>
            </li>
        </ul>
        <div class="totalSearch_wrap">
            <!-- 24.03 홈페이지 內 검색 영역 광고 텍스트 미노출의 件 -->
            <label for="totalSearch">
                
                <input name="ctl00$subMenu$header_keyword" type="text" id="header_keyword" value="봇치 더 록! 전편">
                <input name="ctl00$subMenu$header_ad_keyword" type="hidden" id="header_ad_keyword" value="봇치 더 록! 전편">
            </label>
            <button type="button" class="btn_totalSearch" id="btn_header_search">검색</button>
        </div>
    </div>
</div>
            <!-- 서브 메뉴 -->			
	</div>
<!-- 	DOTO  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
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
                        <source src="https://adimg.cgv.co.kr/images/202407/LandofHappiness/LandofHappiness_1080x608.mp4" type="video/mp4">
                        이 브라우저는 Video 태그를 지원하지 않습니다. (Your browser does not support the video tag.)
                    </video>
                    
                        <strong id="ctl00_PlaceHolderContent_AD_MOVIE_NM" class="movieSelection_title">행복의 나라</strong>
                        <span id="ctl00_PlaceHolderContent_AD_DESCRIPTION_NM" class="movieSelection_txt">조정석의 눈물, 관객 심장 정조준!<br>8월 14일 극장 대개봉</span>
                        <div class="movieSelection_video_controller_wrap">
                            <a href="http://ad.cgv.co.kr/click/CGV/CGV_201401/main@MovieSelection2021?ads_id%3d51848%26creative_id%3d78732%26click_id%3d99646%26content_series%3d%26event%3d" id="ctl00_PlaceHolderContent_AD_CLIP_DETAIL_URL" class="btn_movieSelection_detailView">상세보기</a>
                            
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
            <div class="movieChartBeScreen_wrap">
                <div class="contents">
                    <div class="movieChartBeScreen_btn_wrap">
                        <div class="tabBtn_wrap">
                            <h3><a href="#none" class="active" id="btnMovie">무비차트</a></h3>
                            <h3><a href="#none" id="btnReserMovie">상영예정작</a></h3>
                        </div>
                        <a href="/movies/?lt=1&amp;ft=0" id="btn_allView_Movie" class="btn_allView">전체보기</a>
                    </div>




                    <div class="swiper movieChart_list swiper-container-initialized swiper-container-horizontal" id="movieChart_list">
                        <div class="swiper-button-prev swiper-button-disabled" tabindex="0" role="button" aria-label="이전 슬라이드" aria-disabled="true"></div>
                        <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                            
                            
                                <div class="swiper-slide swiper-slide-movie swiper-slide-active" style="width: 170.4px; margin-right: 32px;">
<!--                                     <div style="display: inline-block; margin-right: 10px;"> -->
                                    <div class="img_wrap" data-scale="false" tabindex="0">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88478/88478_320.jpg" alt="세븐틴 투어 ‘팔로우’ 어게인 투 시네마" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                        
<%--                                             <i class="cgvIcon etc ageAll">${movieList.RATING}</i> --%>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">
                                            <div class='dDay_wrap'><span>2</span></div>
<!--                 상영예정일인데 넣고 싶으면 쿼리짜야함                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i> -->
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/forDX_white.png" alt="forDX"></i>
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/screenx_white.png" alt="screenx"></i>
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88478" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '세븐틴 투어 ‘팔로우’ 어게인 투 시네마');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037350&amp;MOVIE_CD_GROUP=20037350" onclick="gaEventLog('PC_메인', '무비차트_예매하기','세븐틴 투어 ‘팔로우’ 어게인 투 시네마')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>

                            
                                   <div class="movie_info_wrap">
<%--                                         <strong class="movieName">${movie.title}</strong> --%>
<!--                                         <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"></span> -->
<%--                                         <span>누적관객수 ${movie.audiAcc}</span> --%>
                                       </div>
<!--                    @@@@@@@@@@@@@@@@@@@@@@@@@@@@        무비차트 for문         TODO @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   -->
<!--                                     </div> -->
                                    
                                    
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie swiper-slide-next" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" tabindex="0">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88454/88454_320.jpg" alt="행복의 나라" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age12">12</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">
                                            <div class='dDay_wrap'><span>2</span></div>
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88454" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '행복의 나라');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037223&amp;MOVIE_CD_GROUP=20037223" onclick="gaEventLog('PC_메인', '무비차트_예매하기','행복의 나라')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">행복의 나라</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 19.4%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" tabindex="0">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88170/88170_320.jpg" alt="에이리언- 로물루스" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age15">15</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세">
                                            <div class='dDay_wrap'><span>2</span></div>
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/imax_white.png" alt="imax"></i>
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/forDX_white.png" alt="forDX"></i>
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/screenx_white.png" alt="screenx"></i>
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88170" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '에이리언- 로물루스');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037604&amp;MOVIE_CD_GROUP=20036237" onclick="gaEventLog('PC_메인', '무비차트_예매하기','에이리언- 로물루스')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">에이리언- 로물루스</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 12.3%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" tabindex="0">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88380/88380_320.jpg" alt="빅토리" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age12">12</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">
                                            <div class='dDay_wrap'><span>2</span></div>
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88380" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '빅토리');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037600&amp;MOVIE_CD_GROUP=20036896" onclick="gaEventLog('PC_메인', '무비차트_예매하기','빅토리')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">빅토리</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 12.1%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" tabindex="0">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88442/88442_320.jpg" alt="트위스터스" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age12">12</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">
                                            <div class='dDay_wrap'><span>2</span></div>
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/imax_white.png" alt="imax"></i>
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/forDX_white.png" alt="forDX"></i>
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/screenx_white.png" alt="screenx"></i>
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88442" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '트위스터스');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037146&amp;MOVIE_CD_GROUP=20037146" onclick="gaEventLog('PC_메인', '무비차트_예매하기','트위스터스')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">트위스터스</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 8.7%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88437/88437_320.jpg" alt="파일럿" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age12">12</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">
                                           
                                            
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88437" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '파일럿');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037189&amp;MOVIE_CD_GROUP=20037139" onclick="gaEventLog('PC_메인', '무비차트_예매하기','파일럿')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">파일럿</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 92%</span>
                                        <span>예매율 5.1%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88403/88403_320.jpg" alt="사랑의 하츄핑" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc ageAll">All</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">
                                           
                                            
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88403" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '사랑의 하츄핑');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037268&amp;MOVIE_CD_GROUP=20037005" onclick="gaEventLog('PC_메인', '무비차트_예매하기','사랑의 하츄핑')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">사랑의 하츄핑</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 98%</span>
                                        <span>예매율 3.3%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88431/88431_320.jpg" alt="리볼버" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age15">15</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세">
                                           
                                            
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88431" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '리볼버');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037374&amp;MOVIE_CD_GROUP=20037116" onclick="gaEventLog('PC_메인', '무비차트_예매하기','리볼버')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">리볼버</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggood.png" alt="Golden Egg good"> 72%</span>
                                        <span>예매율 3.0%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88411/88411_320.jpg" alt="10 라이브즈" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc ageAll">All</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">
                                            <div class='dDay_wrap'><span>3</span></div>
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 3">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88411" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '10 라이브즈');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037066&amp;MOVIE_CD_GROUP=20037066" onclick="gaEventLog('PC_메인', '무비차트_예매하기','10 라이브즈')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">10 라이브즈</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 2.8%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88457/88457_320.jpg" alt="신비아파트 특별편: 붉은 눈의 사신" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc ageAll">All</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">
                                            <div class='dDay_wrap'><span>2</span></div>
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88457" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '신비아파트 특별편: 붉은 눈의 사신');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037508&amp;MOVIE_CD_GROUP=20037257" onclick="gaEventLog('PC_메인', '무비차트_예매하기','신비아파트 특별편: 붉은 눈의 사신')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">신비아파트 특별편: 붉은 눈의 사신</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 1.2%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age18">18</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/18.png" alt="18세">
                                           
                                            
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/imax_white.png" alt="imax"></i>
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88228" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '데드풀과 울버린');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037162&amp;MOVIE_CD_GROUP=20036434" onclick="gaEventLog('PC_메인', '무비차트_예매하기','데드풀과 울버린')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">데드풀과 울버린</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggood.png" alt="Golden Egg good"> 82%</span>
                                        <span>예매율 0.8%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88389/88389_320.jpg" alt="슈퍼배드 4" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc ageAll">All</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">
                                           
                                            
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88389" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '슈퍼배드 4');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037179&amp;MOVIE_CD_GROUP=20036927" onclick="gaEventLog('PC_메인', '무비차트_예매하기','슈퍼배드 4')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">슈퍼배드 4</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 94%</span>
                                        <span>예매율 0.8%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88378/88378_320.jpg" alt="극장판 도라에몽-진구의 지구 교향곡" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc ageAll">All</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">
                                           
                                            
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88378" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '극장판 도라에몽-진구의 지구 교향곡');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20036978&amp;MOVIE_CD_GROUP=20036894" onclick="gaEventLog('PC_메인', '무비차트_예매하기','극장판 도라에몽-진구의 지구 교향곡')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">극장판 도라에몽-진구의 지구 교향곡</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 93%</span>
                                        <span>예매율 0.8%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87864/87864_320.jpg" alt="인사이드 아웃 2" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc ageAll">All</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">
                                           
                                            
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=87864" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '인사이드 아웃 2');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20036833&amp;MOVIE_CD_GROUP=20034989" onclick="gaEventLog('PC_메인', '무비차트_예매하기','인사이드 아웃 2')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">인사이드 아웃 2</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 97%</span>
                                        <span>예매율 0.7%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88287/88287_320.jpg" alt="극장총집편 봇치 더 록! 전편" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age12">12</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">
                                           
                                            
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88287" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '극장총집편 봇치 더 록! 전편');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20036657&amp;MOVIE_CD_GROUP=20036657" onclick="gaEventLog('PC_메인', '무비차트_예매하기','극장총집편 봇치 더 록! 전편')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">극장총집편 봇치 더 록! 전편</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 97%</span>
                                        <span>예매율 0.6%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88452/88452_320.jpg" alt="이오 카피타노" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age15">15</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세">
                                           
                                            
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88452" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '이오 카피타노');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037323&amp;MOVIE_CD_GROUP=20037221" onclick="gaEventLog('PC_메인', '무비차트_예매하기','이오 카피타노')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">이오 카피타노</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 95%</span>
                                        <span>예매율 0.5%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88422/88422_320.jpg" alt="물은 바다를 향해 흐른다" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age12">12</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">
                                           
                                            
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88422" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '물은 바다를 향해 흐른다');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037092&amp;MOVIE_CD_GROUP=20037092" onclick="gaEventLog('PC_메인', '무비차트_예매하기','물은 바다를 향해 흐른다')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">물은 바다를 향해 흐른다</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 87%</span>
                                        <span>예매율 0.4%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88405/88405_320.jpg" alt="조선인 여공의 노래" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc ageAll">All</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">
                                           
                                            
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88405" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '조선인 여공의 노래');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037011&amp;MOVIE_CD_GROUP=20037011" onclick="gaEventLog('PC_메인', '무비차트_예매하기','조선인 여공의 노래')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">조선인 여공의 노래</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 95%</span>
                                        <span>예매율 0.4%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88390/88390_320.jpg" alt="명탐정 코난-100만 달러의 펜타그램" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age12">12</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">
                                           
                                            
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88390" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '명탐정 코난-100만 달러의 펜타그램');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20036928&amp;MOVIE_CD_GROUP=20036928" onclick="gaEventLog('PC_메인', '무비차트_예매하기','명탐정 코난-100만 달러의 펜타그램')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">명탐정 코난-100만 달러의 펜타그램</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 94%</span>
                                        <span>예매율 0.4%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000067/67031/67031_320.jpg" alt="고령가 소년 살인사건" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                           영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age15">15</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세">
                                           
                                            
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=67031" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '고령가 소년 살인사건');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037564&amp;MOVIE_CD_GROUP=20014628" onclick="gaEventLog('PC_메인', '무비차트_예매하기','고령가 소년 살인사건')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">고령가 소년 살인사건</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 93%</span>
                                        <span>예매율 0.3%</span>
                                    </div>
                                </div>
                                

                        </div>
                        <div class="swiper-button-next" tabindex="0" role="button" aria-label="다음 슬라이드" aria-disabled="false"></div>
                        <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>

                    <div class="swiper movieChart_list swiper-container-initialized swiper-container-horizontal" id="movieChart_list_Reser" style="display: none;">
                        <div class="swiper-button-prev swiper-button-disabled" tabindex="0" role="button" aria-label="이전 슬라이드" aria-disabled="true"></div>
                        <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                            
                                <div class="swiper-slide swiper-slide-movie swiper-slide-active" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" tabindex="0" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79108/79108_320.jpg" alt="비포 선셋" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age15">15</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세">
                                            <div class='dDay_wrap'><span>2</span></div>
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=79108" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '비포 선셋');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20010791&amp;MOVIE_CD_GROUP=20010761" onclick="gaEventLog('PC_메인', '무비차트_예매하기','비포 선셋')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">비포 선셋</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 92%</span>
                                        <span>예매율 0.3%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie swiper-slide-next" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" tabindex="0" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88478/88478_320.jpg" alt="세븐틴 투어 ‘팔로우’ 어게인 투 시네마" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc ageAll">All</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">
                                            <div class='dDay_wrap'><span>2</span></div>
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/forDX_white.png" alt="forDX"></i>
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/screenx_white.png" alt="screenx"></i>
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88478" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '세븐틴 투어 ‘팔로우’ 어게인 투 시네마');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037350&amp;MOVIE_CD_GROUP=20037350" onclick="gaEventLog('PC_메인', '무비차트_예매하기','세븐틴 투어 ‘팔로우’ 어게인 투 시네마')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">세븐틴 투어 ‘팔로우’ 어게인 투 시네마</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 22.8%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" tabindex="0" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88454/88454_320.jpg" alt="행복의 나라" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age12">12</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">
                                            <div class='dDay_wrap'><span>2</span></div>
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88454" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '행복의 나라');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037223&amp;MOVIE_CD_GROUP=20037223" onclick="gaEventLog('PC_메인', '무비차트_예매하기','행복의 나라')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">행복의 나라</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 19.4%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" tabindex="0" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88170/88170_320.jpg" alt="에이리언- 로물루스" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age15">15</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세">
                                            <div class='dDay_wrap'><span>2</span></div>
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/imax_white.png" alt="imax"></i>
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/forDX_white.png" alt="forDX"></i>
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/screenx_white.png" alt="screenx"></i>
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88170" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '에이리언- 로물루스');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037604&amp;MOVIE_CD_GROUP=20036237" onclick="gaEventLog('PC_메인', '무비차트_예매하기','에이리언- 로물루스')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">에이리언- 로물루스</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 12.3%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" tabindex="0" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88380/88380_320.jpg" alt="빅토리" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age12">12</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">
                                            <div class='dDay_wrap'><span>2</span></div>
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88380" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '빅토리');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037600&amp;MOVIE_CD_GROUP=20036896" onclick="gaEventLog('PC_메인', '무비차트_예매하기','빅토리')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">빅토리</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 12.1%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88442/88442_320.jpg" alt="트위스터스" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            영상물 등급 노출 변경 2022.08.24
                                            <i class="cgvIcon etc age12">12</i>
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">
                                            <div class='dDay_wrap'><span>2</span></div>
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/imax_white.png" alt="imax"></i>
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/forDX_white.png" alt="forDX"></i>
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/screenx_white.png" alt="screenx"></i>
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88442" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '트위스터스');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037146&amp;MOVIE_CD_GROUP=20037146" onclick="gaEventLog('PC_메인', '무비차트_예매하기','트위스터스')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">트위스터스</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 8.7%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88457/88457_320.jpg" alt="신비아파트 특별편: 붉은 눈의 사신" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc ageAll">All</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">-->
                                            <!--<div class='dDay_wrap'><span>2</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88457" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '신비아파트 특별편: 붉은 눈의 사신');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037508&amp;MOVIE_CD_GROUP=20037257" onclick="gaEventLog('PC_메인', '무비차트_예매하기','신비아파트 특별편: 붉은 눈의 사신')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">신비아파트 특별편: 붉은 눈의 사신</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 1.2%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88506/88506_320.jpg" alt="[마이 아티 필름] 키스 오브 라이프 쥴리, 나띠 : 버튼스" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc ageAll">All</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">-->
                                            <!--<div class='dDay_wrap'><span>2</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88506" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '[마이 아티 필름] 키스 오브 라이프 쥴리, 나띠 : 버튼스');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037506&amp;MOVIE_CD_GROUP=20037506" onclick="gaEventLog('PC_메인', '무비차트_예매하기','[마이 아티 필름] 키스 오브 라이프 쥴리, 나띠 : 버튼스')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">[마이 아티 필름] 키스 오브 라이프 쥴리, 나띠 : 버튼스</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> ?</span>
                                        <span>예매율 0.2%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88487/88487_320.jpg" alt="공드리의 솔루션북" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc age15">15</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세">-->
                                            <!--<div class='dDay_wrap'><span>2</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88487" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '공드리의 솔루션북');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037428&amp;MOVIE_CD_GROUP=20037428" onclick="gaEventLog('PC_메인', '무비차트_예매하기','공드리의 솔루션북')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">공드리의 솔루션북</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 0.1%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88507/88507_320.jpg" alt="러브 달바" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc age15">15</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세">-->
                                            <!--<div class='dDay_wrap'><span>2</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 2">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88507" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '러브 달바');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037513&amp;MOVIE_CD_GROUP=20037513" onclick="gaEventLog('PC_메인', '무비차트_예매하기','러브 달바')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">러브 달바</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 0.0%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88411/88411_320.jpg" alt="10 라이브즈" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc ageAll">All</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">-->
                                            <!--<div class='dDay_wrap'><span>3</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 3">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88411" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '10 라이브즈');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037066&amp;MOVIE_CD_GROUP=20037066" onclick="gaEventLog('PC_메인', '무비차트_예매하기','10 라이브즈')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">10 라이브즈</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> 99%</span>
                                        <span>예매율 2.8%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88503/88503_320.jpg" alt="2024 KBO 리그 - LG 트윈스 vs 한화 이글스" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc ageAll">All</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">-->
                                            <!--<div class='dDay_wrap'><span>3</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 3">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88503" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '2024 KBO 리그 - LG 트윈스 vs 한화 이글스');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037495&amp;MOVIE_CD_GROUP=20037495" onclick="gaEventLog('PC_메인', '무비차트_예매하기','2024 KBO 리그 - LG 트윈스 vs 한화 이글스')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">2024 KBO 리그 - LG 트윈스 vs 한화 이글스</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> ?</span>
                                        <span>예매율 0.2%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88510/88510_320.jpg" alt="그리고 목련이 필때면" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc age12">12</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">-->
                                            <!--<div class='dDay_wrap'><span>3</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 3">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88510" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '그리고 목련이 필때면');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037533&amp;MOVIE_CD_GROUP=20037533" onclick="gaEventLog('PC_메인', '무비차트_예매하기','그리고 목련이 필때면')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">그리고 목련이 필때면</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> ?</span>
                                        <span>예매율 0.1%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88486/88486_320.jpg" alt="1923 간토대학살" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc age12">12</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">-->
                                            <!--<div class='dDay_wrap'><span>3</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 3">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88486" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '1923 간토대학살');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037427&amp;MOVIE_CD_GROUP=20037427" onclick="gaEventLog('PC_메인', '무비차트_예매하기','1923 간토대학살')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">1923 간토대학살</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> ?</span>
                                        <span>예매율 0.0%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88458/88458_320.jpg" alt="쥬라기캅스 극장판-전설의 고대생물을 찾아라" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc ageAll">All</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세">-->
                                            <!--<div class='dDay_wrap'><span>3</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 3">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88458" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '쥬라기캅스 극장판-전설의 고대생물을 찾아라');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037259&amp;MOVIE_CD_GROUP=20037259" onclick="gaEventLog('PC_메인', '무비차트_예매하기','쥬라기캅스 극장판-전설의 고대생물을 찾아라')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">쥬라기캅스 극장판-전설의 고대생물을 찾아라</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> ?</span>
                                        <span>예매율 0.0%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88134/88134_320.jpg" alt="[씨네뮤지엄] 바르셀로나 그리고 영원의 이름, 안토니 가우디" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc age15">15</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세">-->
                                            <!--<div class='dDay_wrap'><span>4</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 4">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88134" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '[씨네뮤지엄] 바르셀로나 그리고 영원의 이름, 안토니 가우디');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20036040&amp;MOVIE_CD_GROUP=20036040" onclick="gaEventLog('PC_메인', '무비차트_예매하기','[씨네뮤지엄] 바르셀로나 그리고 영원의 이름, 안토니 가우디')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">[씨네뮤지엄] 바르셀로나 그리고 영원의 이름, 안토니 가우디</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggreat.png" alt="Golden Egg great"> 93%</span>
                                        <span>예매율 0.0%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88498/88498_320.jpg" alt="[한여름밤의 클래식] 피아니스트: 쇼팽과 리스트, 조성진과 임윤찬" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc age15">15</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세">-->
                                            <!--<div class='dDay_wrap'><span>4</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 4">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88498" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '[한여름밤의 클래식] 피아니스트: 쇼팽과 리스트, 조성진과 임윤찬');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037456&amp;MOVIE_CD_GROUP=20037456" onclick="gaEventLog('PC_메인', '무비차트_예매하기','[한여름밤의 클래식] 피아니스트: 쇼팽과 리스트, 조성진과 임윤찬')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">[한여름밤의 클래식] 피아니스트: 쇼팽과 리스트, 조성진과 임윤찬</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> ?</span>
                                        <span>예매율 0.1%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88517/88517_320.jpg" alt="페인팅 더 트래블" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc age12">12</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">-->
                                            <!--<div class='dDay_wrap'><span>4</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 4">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88517" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '페인팅 더 트래블');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037629&amp;MOVIE_CD_GROUP=20037629" onclick="gaEventLog('PC_메인', '무비차트_예매하기','페인팅 더 트래블')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">페인팅 더 트래블</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> ?</span>
                                        <span>예매율 0.0%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87187/87187_320.jpg" alt="[씨네뮤지엄] 내셔널갤러리, 예술의 흐름을 담다." onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc age15">15</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세">-->
                                            <!--<div class='dDay_wrap'><span>5</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 5">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=87187" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '[씨네뮤지엄] 내셔널갤러리, 예술의 흐름을 담다.');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20033213&amp;MOVIE_CD_GROUP=20033213" onclick="gaEventLog('PC_메인', '무비차트_예매하기','[씨네뮤지엄] 내셔널갤러리, 예술의 흐름을 담다.')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">[씨네뮤지엄] 내셔널갤러리, 예술의 흐름을 담다.</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldenegggood.png" alt="Golden Egg good"> ?</span>
                                        <span>예매율 0.0%</span>
                                    </div>
                                </div>
                                
                                <div class="swiper-slide swiper-slide-movie" style="width: 170.4px; margin-right: 32px;">
                                    <div class="img_wrap" data-scale="false" aria-label="듄-파트2 특별관 상영(IMAX, 4DX, SCREENX), 12세관람가, 에그지수 96%, 예매율 25.9%">
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88516/88516_320.jpg" alt="(연속상영)행복의나라,파일럿,엑시트" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                            <i class="cgvIcon etc age12">12</i>
                                            <!--<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세">-->
                                            <!--<div class='dDay_wrap'><span>5</span></div> -->
                                            <i class="cgvIcon etc ageDay" data-before-text="D - 5">D Day</i>
                                        
                                        </div>
                                        <div class="screenType_wrap">
                                            
                                            <i class="screenType"><img src="https://img.cgv.co.kr/R2014/images/common/logo/sametime_white.png" alt="sametime"></i>
                                            
                                        </div>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=88516" onclick="gaEventLog('PC_메인', '상영예정작_영화상세', '(연속상영)행복의나라,파일럿,엑시트');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20037620&amp;MOVIE_CD_GROUP=20037620" onclick="gaEventLog('PC_메인', '무비차트_예매하기','(연속상영)행복의나라,파일럿,엑시트')" class="btn_movieChart_ticketing">예매하기</a>
                                        
                                        
                                        </div>
                                    </div>
                                    <div class="movie_info_wrap">
                                        <strong class="movieName">(연속상영)행복의나라,파일럿,엑시트</strong>
                                        <span> <img src="https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png" alt="Golden Egg Preegg"> ?</span>
                                        <span>예매율 0.1%</span>
                                    </div>
                                </div>
                                

                        </div>
                        <div class="swiper-button-next" tabindex="0" role="button" aria-label="다음 슬라이드" aria-disabled="false"></div>
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
                                <dt>패키지<a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=1" alt="패키지" class="btn_more">더보기</a></dt>
                               
                                <dd>
                                    <a href="/culture-event/popcorn-store/product-detail.aspx?GG_NO=100439">
                                        <div class="img_wrap" data-scale="false"><img src="https://img.cgv.co.kr/GiftStore/Product/Pc/List/17223927893220.jpg" alt="<10 라이브즈> 얼리버드 관람권"></div>
                                        <div class="giftcon_info_wrap">
                                            <span>&lt;10 라이브즈&gt; 얼리버드 관람권</span>
                                            <strong>14,000원</strong>
                                        </div>
                                    </a>
                                </dd>
                            
                                <dd>
                                    <a href="/culture-event/popcorn-store/product-detail.aspx?GG_NO=100430">
                                        <div class="img_wrap" data-scale="false"><img src="https://img.cgv.co.kr/GiftStore/Product/Pc/List/17170520996180.jpg" alt="우리 패키지"></div>
                                        <div class="giftcon_info_wrap">
                                            <span>우리 패키지</span>
                                            <strong>62,000원</strong>
                                        </div>
                                    </a>
                                </dd>
                            
                                <dd>
                                    <a href="/culture-event/popcorn-store/product-detail.aspx?GG_NO=100429">
                                        <div class="img_wrap" data-scale="false"><img src="https://img.cgv.co.kr/GiftStore/Product/Pc/List/17170513228970.jpg" alt="나랑 너 패키지"></div>
                                        <div class="giftcon_info_wrap">
                                            <span>나랑 너 패키지</span>
                                            <strong>35,000원</strong>
                                        </div>
                                    </a>
                                </dd>
                               
                            </dl>
                        </li>
                        <li>
                            <dl class="giftcon_list">
                                <dt>영화관람권<a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=2" alt="영화관람권" class="btn_more">더보기</a></dt>
                               
                                <dd>
                                    <a href="/culture-event/popcorn-store/product-detail.aspx?GG_NO=100341">
                                        <div class="img_wrap" data-scale="false"><img src="https://img.cgv.co.kr/GiftStore/Product/Pc/List/16777513183750.jpg" alt="CGV 영화관람권"></div>
                                        <div class="giftcon_info_wrap">
                                            <span>CGV 영화관람권</span>
                                            <strong>13,000원</strong>
                                        </div>
                                    </a>
                                </dd>
                            
                                <dd>
                                    <a href="/culture-event/popcorn-store/product-detail.aspx?GG_NO=100254">
                                        <div class="img_wrap" data-scale="false"><img src="https://img.cgv.co.kr/GiftStore/Product/Pc/List/16104445886810.jpg" alt="IMAX 영화관람권"></div>
                                        <div class="giftcon_info_wrap">
                                            <span>IMAX 영화관람권</span>
                                            <strong>18,000원</strong>
                                        </div>
                                    </a>
                                </dd>
                            
                                <dd>
                                    <a href="/culture-event/popcorn-store/product-detail.aspx?GG_NO=100255">
                                        <div class="img_wrap" data-scale="false"><img src="https://img.cgv.co.kr/GiftStore/Product/Pc/List/16105061088530.jpg" alt="4DX 영화관람권"></div>
                                        <div class="giftcon_info_wrap">
                                            <span>4DX 영화관람권</span>
                                            <strong>19,000원</strong>
                                        </div>
                                    </a>
                                </dd>
                               
                            </dl>
                        </li>
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
                                        <strong>1544-1122</strong>
                                        <span>고객센터 운영시간 (평일 09:00~18:00)
                                            <p>업무시간 외 자동응답 안내 가능합니다.</p>
                                        </span>
                                    </dd>
                                </dl>
                                <div class="client_btn_wrap" id="client_btn_wrap">
                                    <a href="${pageContext.request.contextPath}/inquiry/news">공지/뉴스</a>
                                    <a href="${pageContext.request.contextPath}/inquiry/write">1:1 문의</a>
                                    <!--<a href="http://www.cgv.co.kr/support/lost/default.aspx">분실물 문의</a>//-->
                                    <a href="${pageContext.request.contextPath}/inquiry/often">자주찾는 질문</a>
                                </div>
                            </div>
                        </div>

<!--                         <div class="qr_wrap"> -->
<!--                             <strong>앱 다운로드</strong> -->
<!--                             <span>CGV앱에서 더 편리하게 이용하세요</span> -->
<!--                             <div class="img_wrap" data-scale="false"><img src="https://img.cgv.co.kr/R2014/images/common/img_qrcode.gif" alt="QR CODE"></div> -->
<!--                             <p>QR코드를 스캔하고<br>앱설치 페이지로 바로 이동하세요</p> -->
<!--                         </div> -->
                    </div>
                    <div class="noticeClient_banner_wrap">

                        <!-- <div class="event_list_wrap"> -->
                        <div class="swiper noticeClient_banner_list swiper-container-initialized swiper-container-horizontal">
                            <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                                <div class="swiper-slide swiper-slide-active" id="divSpecialDiscountData" style="display: none;">
                                    <a id="bannerType1" href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=36641&amp;menu=006">
                                        <img src="about:blank" alt="카카오페이카드" onerror="onerror=null;javacript:;error_specialDiscountData();">
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
    //<![CDATA[
     //CGV 공지 팝업 주석처리
    //function getCookie(name) {
    //    var nameOfCookie = name + "=";
    //    var x = 0;
    //    while (x <= document.cookie.length) {
    //        var y = (x + nameOfCookie.length);
    //        if (document.cookie.substring(x, y) == nameOfCookie) {
    //            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
    //                endOfCookie = document.cookie.length;
    //            return unescape(document.cookie.substring(y, endOfCookie));
    //        }
    //        x = document.cookie.indexOf(" ", x) + 1;
    //        if (x == 0)
    //            break;
    //    }
    //    return "";
    //}    
    //if (getCookie("cgv_notice") != "done") {
    //    var spcwin = window.open('/popup/1411_personal_popup_1107_v2.html', 'cgv_notice', "height=414,width=280,menubar=no,scrollbars=no,resizeable=no,toolbar=no,left=355,top=100")
    //    spcwin.focus();        
    //}       

    //oms 
    if ("http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=36641&menu=006" == "" || "" == "") { error_specialDiscountData(); }

    //배너이미지가 깨질경우 oms등록 안보이게 처리
    function error_specialDiscountData() {
        $(".noticeClient_banner_list > .swiper-wrapper > .swiper-slide:eq(0)").hide();
        $(".btn_noticeClientBannerControl").click();
        $(".btn_noticeClientBannerControl").hide(); //시작중지 버튼
    }

    (function ($) {
        $(function () {
            var popupData = { 'List': []}; //cgv 공지사항
            var userPopupData= []; //고객개인화 처리

            function getCookie(cName) {
                cName = cName + '=';
                var cookieData = document.cookie;
                var start = cookieData.indexOf(cName);
                var cValue = '';
                if (start != -1) {
                    start += cName.length;
                    var end = cookieData.indexOf(';', start);
                    if (end == -1) end = cookieData.length;
                    cValue = cookieData.substring(start, end);
                }
                return unescape(cValue);
            }

            function setCookie(name, value, expiredays) {
                var todayDate = new Date();
                todayDate.setDate(todayDate.getDate() + expiredays);
                document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
            }

            function setCookie_Main(name, value) {
                var todayDate = new Date();

                todayDate.setSeconds(59);
                todayDate.setMinutes(59);
                todayDate.setHours(23);

                document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
            }

            function openPopup() {
                var cookie = getCookie("mainpopup");

                if (!popupData || !popupData.List || popupData.List.length < 1 || cookie == "true")
                    return;

                /* 전체 template */
                var $std = $('.skipnaiv'),
				options = {
				    '$target': $std,
				    'html': $("#temp_popup").tmpl(popupData)
				};
                app.instWin.add(options);
                /* 위치잡는 스크립트 */
                //var offsetLeft = $('#contaniner').offset().left;
                //$std.next('.layer-wrap').css('left', offsetLeft + 30);

                /* 슬라이더 */
                var popsliderOptions = {
                    //2014.09.15 디마팀 방재현님 요청으로 2초로 (수정 default : 4초), 이지용님 요청으로 3초로 재수정
                    'term'      : 3000,
                    'effect': 'none',
                    'auto': true,
                    callback: function (_index) {
                        $('.noti-num strong').text(_index + 1);
                    }
                };
                $('#mainNoticeSlider').visualMotion(popsliderOptions);
            }

            openPopup();

            //layer 팝업공지 닫기클릭
            $('#open_today').on('click', function () {
                var isChecked = $("#open_today").is(":checked");

                if (isChecked) {
                    setCookie_Main("mainpopup", "true");

                    $('.layer-wrap').remove();
                }

            });

            function OpenSystemPopup() {
                if (userPopupData && userPopupData.length > 0) {
                    for (var i=0;i<userPopupData.length;i++) {
                        var item = userPopupData[i];
                        var popupName = item['CookieName'];

                        if (getCookie(popupName) == 'done') { return; }

                        var option = 'width=' + item['Width'] + ',height=' + item['Height'] + ',toolbar=no,scrollbars=no,status=0,top=' + item['Y'] + ',left=' + item['X'];
                        var url = item['IsUrl'] == 'n' ? '/user/popup/personal-system.aspx?idx=' + item['IDX'] : item['Contents'];

                        var userPopup = window.open(url, popupName, option);
                        userPopup.focus();
                    }
                }
            }
            var uAgent = navigator.userAgent;  
            
            if( uAgent.indexOf("NT 5.1") != -1 ){           
                $.fn.openPopup('pop_supportOS');
            }else if (uAgent.indexOf("MSIE 6") > 0 || uAgent.indexOf("MSIE 7") > 0 || uAgent.indexOf("MSIE 8") > 0 ){       
                $.fn.openPopup('pop_supportBrower');  // IE버전     
            }
         
            OpenSystemPopup();

            /*******************************
            //메인 GA 에널리스틱스 로그 - myilsan 20220113
            *******************************/
            //현재상영작,상영예정작 tab이동
            $(".movieChartBeScreen_btn_wrap > .tabBtn_wrap > h3 > a").on({
                click: function() {
                    gaEventLog('PC_메인', this.text, '');
                }
            });
            $("#btn_allView_Movie").on({
                click: function () {

                    var action = $(".movieChartBeScreen_btn_wrap > .tabBtn_wrap > h3 > .active")[0].innerText;
                     gaEventLog('PC_메인', action +" 더보기", '');
                }
            });
            $("#btn_allView_Event").on({
                click: function () {
                     gaEventLog('PC_메인', "이벤트 더보기", '');
                }
            });
            $("#btn_allView_Special").on({
                click: function () {
                     gaEventLog('PC_메인', "특별관 더보기", '');
                }
            });

            //특별관 이미지 선택
            $(".specialHall_link").on({
                click: function () {
                    var label = $(this).find("img")[0].alt;
                    gaEventLog('PC_메인', "특별관", label);
                }
            });
            //특별관 택스트 선택
            $(".specialHall_list > li > a").on({
                click: function () {
                    gaEventLog('PC_메인', "특별관", this.children[0].innerText);
                }
            });
            

            //기프트 카드 더보기
//             $(".giftcon_list > dt > a").on({
//                 click: function () {
//                     var action = $(this).attr('alt');
//                     gaEventLog('PC_메인', action + " 더보기", '');
//                 }
//             });
            //공지사항 더보기
            $("#notice_more").on({
                click: function () {
                    gaEventLog('PC_메인', '공지사항_더보기', '');
                }
            });

            //기프트 카드 상품선택
            $(".giftcon_list > dd > a").on({
                click: function () {
                    var label = $(this).find('.giftcon_info_wrap > span')[0].innerText;
                    gaEventLog('PC_메인', "상품상세", label);
                }
            });
            //공지사항 클릭
            $(".notice_wrap > .btn_link").on({
                click: function () {
                    gaEventLog('PC_메인', '공지사항', '');
                }
            });
            //FAQ, 1:1문의, 분실물 문의, 대관/단체 문의 클릭
            $("#client_btn_wrap >  a").on({
                click: function () {
                    gaEventLog('PC_메인', this.text, '');
                }
            });
            //하단배너 1
            $("#bannerType1").on({
                click: function () {
                    gaEventLog('PC_메인', '하단배너1', '');
                }
            });
            //하단 iframe 클릭 체크 로직 - 짜증나 ㅋㅋ
            var iframeObject = { adIframeMouseOver: false }
            $("#Branding").bind({
                mouseover: function () {
                    iframeObject.adIframeMouseOver = true;
                }
            });
            $("#Branding").bind({
                mouseout: function () {
                    iframeObject.adIframeMouseOver = false;
                }
            });
            $(window).blur(function () {
                if (iframeObject.adIframeMouseOver) {
                    gaEventLog('PC_메인', '하단배너2', '');
                }
            });
            // end - 하단 iframe 클릭 체크 로직 - 짜증나 ㅋㅋ
            
        });
    })(jQuery);
//]]>
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
    <li><a href="http://corp.cgv.co.kr/company/" target="_blank">회사소개</a></li>
    <li><a href="http://corp.cgv.co.kr/company/sustainabilityStrategy/strategy.aspx" target="_blank">지속가능경영</a></li>
    <li><a href="http://corp.cgv.co.kr/company/ir/financial/financial_list.aspx" target="_blank">IR</a></li>
    <li><a href="http://corp.cgv.co.kr/company/recruit/step/default.aspx" target="_blank">채용정보</a></li>
    <li><a href="http://corp.cgv.co.kr/company/advertize/ad_Default.aspx" target="_blank">광고/제휴/출점문의</a></li>
    <li><a href="http://www.cgv.co.kr/rules/service.aspx">이용약관</a></li>
    <li><a href="http://www.cgv.co.kr/rules/organized.aspx">편성기준</a></li>
    <li><a href="http://www.cgv.co.kr/rules/privacy.aspx"><strong>개인정보처리방침</strong></a></li>
    <li><a href="http://www.cgv.co.kr/rules/disclaimer.aspx">법적고지</a></li>
    <li><a href="http://www.cgv.co.kr/rules/emreject.aspx">이메일주소무단수집거부</a></li>
    <li><a href="http://corp.cgv.co.kr/company/ethicalManagement/ceoMessage.aspx" target="_blank">윤리경영</a></li>
    <li><a href="/company/cyberAudit.aspx" class="empha-red">사이버감사실</a></li>
</ul>
<article class="company_info_wrap">
    <section class="company_info">
        <address>(04377)서울특별시 용산구 한강대로 23길 55, 아이파크몰 6층(한강로동)</address>
        <dl class="company_info_list">
            <dt>대표이사</dt>
            <dd>허민회</dd>
            <dt>사업자등록번호</dt>
            <dd>104-81-45690</dd>
            <dt>통신판매업신고번호</dt>
            <dd>2017-서울용산-0662 <a href="#none" onclick="goFtc()" class="btn_goFtc">사업자정보확인</a><a></a></dd>
        </dl>
        <dl class="company_info_list">
            <dt>호스팅사업자</dt>
            <dd>CJ올리브네트웍스</dd>
            <dt>개인정보보호 책임자</dt>
            <dd>도형구</dd>
            <dt>대표이메일</dt>
            <dd>cjcgvmaster@cj.net</dd>
            
        </dl>
        <p class="copyright">© CJ CGV. All Rights Reserved</p>
    </section>
    <section class="familysite_wrap">
        <label for="familysite">CJ그룹 계열사 바로가기</label>
        <select id="familysite">
            <option value="" class="familysiteTitle">계열사 바로가기</option>
            <optgroup label="CJ그룹">
<option value="http://www.cj.net/">CJ주식회사</option>
</optgroup><optgroup label="식품 &amp; 식품서비스">
<option value="https://www.cj.co.kr/kr/index">CJ제일제당</option>
<option value="https://www.cjfoodville.co.kr/main.asp">CJ푸드빌</option>
<option value="http://www.cjfreshway.com/index.jsp">CJ프레시웨이</option>
</optgroup><optgroup label="생명공학">
<option value="https://www.cj.co.kr/kr/about/business/bio">CJ제일제당 BIO사업부문</option>
<option value="https://www.cj.co.kr/kr/about/business/bio">CJ Feed&amp;Card</option>
</optgroup><optgroup label="물류 &amp; 신유통">
<option value="https://www.cjlogistics.com/ko/main">CJ대한통운</option>
<option value="http://www.cjenc.co.kr/kr/Default.asp">CJ대한통운 건설부문</option>
<option value="https://www.oliveyoung.co.kr/store/company/brandStory.do">CJ올리브영</option>
<option value="https://www.cjolivenetworks.co.kr:449/">CJ올리브네트웍스</option>
<option value="https://www.cjoshopping.com:9002/index.asp">CJ ENM 커머스부문</option>
</optgroup><optgroup label="엔터테인먼트 &amp; 미디어">
<option value="https://www.cjenm.com/ko/">CJ ENM 엔터테인먼트부문</option>
<option value="http://corp.cgv.co.kr/">CJ CGV</option>
</optgroup>

        </select>
        <a href="#none" class="btn_familysite" onclick="goFamilySite()">GO</a>
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
        <script type="text/javascript">            OpenAD();</script>
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
<div class="box-image">
    <a href="/movies/detail-view/?midx=${MovieIdx}" title="${Title} 상세보기 새창">
        <span class="thumb-image">
            <img src="${PosterImage.MiddleImage}" alt="${Title} 포스터" />
            <span class="ico-grade ${MovieGrade.StyleClassName}">${MovieGrade.GradeText}</span>
        </span>
    </a>   
</div>
<div class="box-contents">
    <a href="/movies/detail-view/?midx=${MovieIdx}" title="${Title} 상세보기 새창">
        <strong class="title">${Title}</strong>
    </a>
    <span class="txt-info" style="margin-bottom:2px;">
        <em class="genre">${GenreText}</em>
        <span>
            <i>${OpenDate}</i>
            <strong>${OpenText}</strong>
            {{if D_Day > 0}}
                <em class="dday">D-${D_Day}</em>
            {{/if}}
        </span>
    </span>
{{if IsTicketing }}
    <a class="link-reservation" href="/ticket/?MOVIE_CD=${CGVCode}&MOVIE_CD_GROUP=${CGVCode}">예매</a> 
{{/if}}
</div>
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


</body></html>

</body>
</html>