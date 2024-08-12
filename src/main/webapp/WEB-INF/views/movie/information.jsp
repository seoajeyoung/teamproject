<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>information</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/module.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function() {
	
// 	$(".sort").change(function() {
// 		debugger;
// 		if($("#rck1").is(':checked')) {
			
// 		} else if ($("#rck2").is(':checked')) {
			
// 		}
			
		
		
		
// 	});// $(".sort").change
	
})
</script>
</head>
<body>

<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        

		<!-- Contents Area -->
		 <div id="contents" class="">
        
            
            <!-- Contents Start -->
			

<!-- 실컨텐츠 시작 -->
<div class="wrap-movie-detail" id="select_main">

    
<!--
<div class="tit-heading-wrap">
    <h3>영화상세</h3>
</div>
    //-->
<div class="sect-base-movie">
    <h3><strong>데드풀과 울버린</strong>기본정보</h3>
    <div class="box-image">
        <a href="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_1000.jpg" title="포스터 크게 보기 새창" target="_blank">
            <span class="thumb-image"> 
                <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터 새창" onerror="errorImage(this)">
                <span class="ico-posterdetail">포스터 크게 보기</span>
                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                <i class="cgvIcon etc age18">18</i>
                <!--<span class="ico-grade 18"> 18</span> -->
            </span> 
        </a> 
    </div>
    <div class="box-contents">
        <div class="title"> 
            <strong>${movieDTO.title}</strong>
<!--             <em class="round brown"><span>예매중</span></em> -->
<!--             <em class="round red"><span>D-8</span></em> -->
            <p>DEADPOOL &amp; WOLVERIN</p>
        </div>
        <div class="score"> 
            <strong class="percent">예매율&nbsp;<span>14.6%</span></strong>
            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 -->            
            <div class="egg-gage small">
                                            <span class="sprite_preegg default"></span>
                                            <span class="percent">99%</span>
                                        </div>
        </div>
        <!-- 떨어지는 얘 이전 요소에 class=on을 넣는다 -->
        <div class="spec">
            <dl>
                <dt>감독 :&nbsp;</dt>
                <dd>
                        <a href="/movies/persons/?pidx=23513">${movieDTO.direcotrNm}</a>                    
                </dd>
                
                <dd>
                    
                </dd>

                <dt>&nbsp;/ 배우 :&nbsp;</dt>
                <dd class="on">
                        
                        <a href="/movies/persons/?pidx=15250">라이언 레이놀즈</a>                    
                        ,&nbsp;
                        <a href="/movies/persons/?pidx=1076">휴 잭맨</a>                    
                        
                        ,&nbsp;
                        <a href="/movies/persons/?pidx=124635">엠마 코린</a>                    
                        
                        ,&nbsp;
                        <a href="/movies/persons/?pidx=38863">모레나 바카린</a>                    
                        
                        ,&nbsp;
                        <a href="/movies/persons/?pidx=119585">롭 딜레이니</a>                    
                        
                        ,&nbsp;
                        <a href="/movies/persons/?pidx=69342">레슬리 우감스</a>                    
                        
                        ,&nbsp;
                        <a href="/movies/persons/?pidx=119584">카란 소니</a>                    
                        
                        ,&nbsp;
                        <a href="/movies/persons/?pidx=66413">매튜 맥퍼딘</a>                    
                        
                </dd>

                <dt>장르 :&nbsp;액션,&nbsp;코미디,&nbsp;SF</dt> 
                <dd></dd>
                <dt>&nbsp;/ 기본 정보 :&nbsp;</dt>
                <!-- 2023.04.27 영화상세 등급 표기 수정--> 
                <!--<dd class="on">18,&nbsp;127분,&nbsp;미국</dd>-->
                <dd class="on">청소년관람불가,&nbsp;127분,&nbsp;미국</dd>
                <dt>개봉 :&nbsp;</dt>
                <dd class="on">2024.07.24</dd>


            

            </dl>
        </div>
        <span class="screentype">
        
                <a href="#" class="imax" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a>
            
        </span>

        <span class="like">
            <!-- 2020.05.07 영화찜하기 -> 프리에그 선택 변경(조회하여 노출) -->
            <a class="link-count" href="javascript:void (0);"><i class="sprite_preegg btn_md default"></i>프리에그</a>
        
            <a class="link-reservation" href="/ticket/?MOVIE_CD=20037162&amp;MOVIE_CD_GROUP=20036434">예매</a> 
        
        </span>

    </div>
</div><!-- .sect-base -->

<!-- 프리에그 팝업 -->
<div class="layer-wrap" id="movie-pre-select" style="top:100px;display:none">
    <div class="popwrap" style="width:516px;margin-top:0px;margin-left:-268px">
        <h1>프리에그 선택</h1>
        <div class="pop-contents">
            <!-- Contents Addon -->
            <div class="movie-pre-select">
                <div class="header">
                    <p class="main"></p>
                </div>
                <div class="box">
                    <div class="desc">
                        <div class="main">이 영화가 기대되시나요?</div>
                        <div class="sub"><em>'기대돼요!'</em>를 선택하시면 <em>'기대되는 영화'에 추가</em>됩니다.</div>
                    </div>
                    <div class="wrap_btn">
                        <a href="javascript:void(0);" class="btn good">
                            <span class="sprite_preegg big favor"></span>
                            <span>기대돼요!</span>
                        </a>
                        <a href="javascript:void(0);" class="btn bad">
                            <span class="sprite_preegg big hate"></span>
                            <span>글쎄요..</span>
                        </a>
                        <input type="hidden" id="preegg_useyn" value="">
                    </div>
                </div>
            </div>
            <!-- //Contents Addon -->
            <div class="set-btn fix-width">
                <button type="submit" id="btnSave" class="round inred"><span>확인</span></button>
            </div>
        </div>
        <button type="button" class="btn-close">프리에그 팝업 닫기</button>
    </div>
</div>
<!-- //프리에그 팝업 -->
<script>
    // 기대돼요, 글쎄요 클릭시 css 변경
    $('.movie-pre-select .wrap_btn .btn').on('click', function () {
        if ($(this).hasClass("selected") == true) {
            $(this).removeClass('selected');
        }
        else {
            $(this).addClass('selected').siblings().removeClass('selected');
        }
    });

    // 프리에그 투표팝업 열기
    $(".link-count").on('click', function () {
        var isLogin = app.config('isLogin');
        if (isLogin) {

            // 프리에그 팝업 노출시 선택된 프리에그 표시
            if ($("#preegg_useyn").val() == "Y") 
                $(".wrap_btn .good").addClass("selected");
            else if ($("#preegg_useyn").val() == "W") 
                $(".wrap_btn .bad").addClass("selected");

            $("#movie-pre-select").css("display", "block");
        }
        else 
            app.goLogin();
    });

    // 프리에그 투표팝업 닫기
    $(".btn-close").on('click', function () {
        $("#movie-pre-select").css("display", "none");
    });

    // 확인 버튼 클릭시
    $("#btnSave").on('click', function () {
        var movieIdx = "88228";
        var selectvalue = "";                 // 이미 선택된 값(비교대상)
      
        if ($(".wrap_btn .good").hasClass("selected") == true) {
            selectvalue = "Y";
        }
        if ($(".wrap_btn .bad").hasClass("selected") == true) {
            selectvalue = "W";
        }

        if ($("#preegg_useyn").val() == selectvalue) {
            if ($("#preegg_useyn").val() == "" && selectvalue == "") {
                alert("프리에그를 선택하지 않았습니다.\n'기대돼요!'를 선택하시면 '기대되는 영화'에 추가됩니다.");
            }
            else { 
                alert("수정된 내용이 없습니다.");
            }
            $("#movie-pre-select").css("display", "none");      // 기존값과 동일하면 저장하지 않고 팝업창 닫음
        }
        else {
            $.ajax({
                type: "POST",
                url: '/common/ajax/movies.aspx/AddPreEggMovie',
                data: "{'movieIdx':'" + movieIdx + "', 'useYN':'" + selectvalue + "', 'title':'데드풀과 울버린'}",
                contentType: "application/json; charset=utf-8",
                async: false,
                dataType: 'json',
                success: function (result) {
                    var JObject = JSON.parse(result.d.toString());

                    switch (JObject["resultCode"]) {
                        case "-1": // 로그인 필요
                            app.goLogin();
                            break;
                        case "1":
                            // 성공
                            if ($("#preegg_useyn").val() == "Y" && (selectvalue == "W" || selectvalue == "")) {
                                alert("'기대되는 영화'에서 삭제되었습니다.");
                            }
                            else if (selectvalue == "Y") {
                                if (confirm("'기대되는 영화'에 등록되었습니다.\n'기대되는 영화'로 이동하시겠습니까?") == true) {
                                    location.href = "/user/movielog/";
                                }
                            }
                            else if ($("#preegg_useyn").val() == "" && selectvalue == "W") {
                                alert("'글쎄요'로 등록되었습니다.");
                            }
                            else if ($("#preegg_useyn").val() == "W" && selectvalue == "") {
                                alert("프리에그를 선택하지 않았습니다.\n'기대돼요!'를 선택하시면 '기대되는 영화'에 추가됩니다.");
                            }
                            else if ($("#preegg_useyn").val() == "" && selectvalue == "") {
                                alert("프리에그를 선택하지 않았습니다.\n'기대돼요!'를 선택하시면 '기대되는 영화'에 추가됩니다.");
                            }

                            $("#preegg_useyn").val(selectvalue);
                            $(".like .link-count").removeClass("favor").removeClass("hate");

                            if(selectvalue == "Y")
                                $(".like .link-count").addClass("favor").html("<i class=\"sprite_preegg btn_md favor\"></i>프리에그");
                            else if (selectvalue == "W")
                                $(".like .link-count").addClass("hate").html("<i class=\"sprite_preegg btn_md hate\"></i>프리에그");
                            else 
                                $(".like .link-count").html("<i class=\"sprite_preegg btn_md default\"></i>프리에그");

                            $("#movie-pre-select").css("display", "none");

                            break;
                        default:
                            //   alert('Error result Value : ' + result);                    
                            break;
                    }
                }
            });
        }
    });
</script>

<script type="text/javascript">
    _TRK_PNC = "88228";
    _TRK_PNC_NM = "데드풀과 울버린";
    _TRK_PNG = "영화";
    _TRK_PI = "PDV";
    _TRK_CP = "/영화/영화상세/{0}/데드풀과 울버린";
</script>


    <div class="cols-content" id="menu">
        <div class="col-detail">
            <!-- 메뉴가 선택되면 a 에 title="선택" 이라고 넣는다 -->
            <ul class="tab-menu">
                <li class="on"><a title="현재 선택됨" href="/movies/detail-view/?midx=88228#menu">주요정보 </a></li>             
                <li><a href="/movies/detail-view/trailer.aspx?midx=88228#menu">트레일러</a></li>
                <li><a href="/movies/detail-view/still-cut.aspx?midx=88228#menu">스틸컷</a></li>
                <li><a href="/movies/detail-view/?midx=88228#commentReg">평점/리뷰</a></li>               
                <li class="last"><a href="/movies/detail-view/show-times.aspx?midx=88228#menu">상영시간표</a></li>
            </ul>
            <div class="sect-story-movie">
                히어로 생활에서 은퇴한 후,<br>
평범한 중고차 딜러로 살아가던&nbsp;‘데드풀’이<br>
예상치 못한 거대한 위기를 맞아<br>
모든 면에서 상극인&nbsp;‘울버린’을 찾아가게 되며 펼쳐지는<br>
도파민 폭발 액션 블록버스터
            </div>
            <!-- .sect-story -->
            <!-- 2020.05.07 성별예매분포, 연령별예매분포 UI 변경 -->
            <div id="ctl00_PlaceHolderContent_Section_Chart" class="sect-graph sect-graph-emotion">
                <ul class="graph">
                    <li>
                        <strong>성별 예매 분포</strong>
                        <div id="jqplot_sex" class="chart jqplot-target" style="position: relative;"><canvas width="400" height="192" class="jqplot-base-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas><div class="jqplot-title" style="height: 0px; width: 0px;"></div><canvas width="400" height="192" class="jqplot-grid-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas><canvas width="380" height="159" class="jqplot-series-shadowCanvas" style="position: absolute; left: 10px; top: 10px;"></canvas><canvas width="380" height="159" class="jqplot-series-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas><canvas width="380" height="159" class="jqplot-donutRenderer-highlight-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas><span class="jqplot-donut-series jqplot-data-label" style="position: absolute; left: 93px; top: 115px;">남 69.4%</span><span class="jqplot-donut-series jqplot-data-label" style="position: absolute; left: 254px; top: 48px;">여 30.6%</span><canvas width="380" height="159" class="jqplot-event-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas></div>
                    </li>
                    <li>
                        <strong>연령별 예매 분포</strong>
                        <div id="jqplot_age" class="chart jqplot-target" style="position: relative;"><canvas width="400" height="192" class="jqplot-base-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas><div class="jqplot-title" style="height: 0px; width: 0px;"></div><div class="jqplot-axis jqplot-xaxis" style="position: absolute; width: 400px; height: 14px; left: 0px; bottom: 0px;"><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 36px;">10대</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 112px;">20대</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 188px;">30대</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 264px;">40대</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 340px;">50대</div></div><div class="jqplot-axis jqplot-yaxis" style="position: absolute; height: 192px; width: 0px; left: 0px; top: 0px;"></div><canvas width="400" height="192" class="jqplot-grid-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas><canvas width="380" height="158" class="jqplot-series-shadowCanvas" style="position: absolute; left: 10px; display: block; top: 10px;"></canvas><canvas width="380" height="158" class="jqplot-series-canvas" style="position: absolute; left: 10px; display: block; top: 10px;"></canvas><div class="jqplot-point-label jqplot-series-0 jqplot-point-4" style="position: absolute; left: 342.5px; top: 114.292px; display: block;">11.3</div><div class="jqplot-point-label jqplot-series-0 jqplot-point-3" style="position: absolute; left: 266.5px; top: 67.208px; display: block;">26.2</div><div class="jqplot-point-label jqplot-series-0 jqplot-point-2" style="position: absolute; left: 190.5px; top: 29.288px; display: block;">38.2</div><div class="jqplot-point-label jqplot-series-0 jqplot-point-1" style="position: absolute; left: 114.5px; top: 72.896px; display: block;">24.4</div><div class="jqplot-point-label jqplot-series-0 jqplot-point-0" style="position: absolute; left: 45.5px; top: 150px; display: block;">0</div><canvas width="380" height="158" class="jqplot-barRenderer-highlight-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas><canvas width="380" height="158" class="jqplot-event-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas></div>
                    </li>
                </ul>
            </div>
            <!-- .sect-graph -->

            <div class="movie-detail-ad">
                <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@SponsorBar_800" width="800" height="90" title="명탐정 코난: 100만 달러의 펜타그램" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="SponsorBar_800" id="SponsorBar_800"></iframe>
            </div>
            <!-- .sect-staff -->
            <div id="ctl00_PlaceHolderContent_Section_Trailer" class="sect-trailer">
                <div class="heading">
                    <h4>트레일러</h4><span id="ctl00_PlaceHolderContent_TrailerTotalCount" class="count">2건</span><a class="link-more" href="trailer.aspx?midx=88228">더보기</a>
                </div>
                <ul>
                <!-- 사진 동영상 조회 -->
                
                    <li>
                        <div class="box-image">
                            <!-- TODO : 동영상 팝업 창 작업 후 링크 걸어야 함 //-->
                            <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="226059">
                                <span class="thumb-image">
                                    <img src="https://img.cgv.co.kr/Movie/Thumbnail/Trailer/88228/88228226059_1024.jpg" alt="[데드풀과 울버린]도파민 '풀' 충전 예고편(순한 맛)" onerror="errorImage(this, {'type':'landscape'})">
                                    <span class="ico-play">영상보기</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="226059">
                                <strong class="title">
                                    
                                    <span class="ico-trailer hd">HD</span>
                                    도파민 '풀' 충전 예고편(순한 맛)
                                </strong>
                            </a>
                            <span class="txt-info">2024.05.24</span>
                        </div>
                    </li>
                    
                    <li>
                        <div class="box-image">
                            <!-- TODO : 동영상 팝업 창 작업 후 링크 걸어야 함 //-->
                            <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="225288">
                                <span class="thumb-image">
                                    <img src="https://img.cgv.co.kr/Movie/Thumbnail/Trailer/88228/88228225288_1024.jpg" alt="[데드풀과 울버린]티저 예고편(순한 맛)" onerror="errorImage(this, {'type':'landscape'})">
                                    <span class="ico-play">영상보기</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="225288">
                                <strong class="title">
                                    
                                    <span class="ico-trailer hd">HD</span>
                                    티저 예고편(순한 맛)
                                </strong>
                            </a>
                            <span class="txt-info">2024.04.26</span>
                        </div>
                    </li>
                    
                </ul>
            </div><!-- .sect-trailer -->
            <div id="ctl00_PlaceHolderContent_Section_Still_Cut" class="sect-stillcut">
                <div class="heading">
                    <h4>스틸컷</h4><span class="count"><strong id="stillcut_current">1</strong>/8건</span><a class="link-more" href="still-cut.aspx?midx=88228">더보기</a>
                </div>
                <div class="slider-wrap">
                    <div class="slider" id="still_motion">
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px;">
                                <img data-src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226943_727.jpg" alt="데드풀과 울버린" onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226943_727.jpg" style="height: 100%;">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226942_727.jpg" alt="데드풀과 울버린" onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226942_727.jpg" style="margin-top: 22.5px;">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226941_727.jpg" alt="데드풀과 울버린" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226940_727.jpg" alt="데드풀과 울버린" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226939_727.jpg" alt="데드풀과 울버린" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226058_727.jpg" alt="데드풀과 울버린" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228225287_727.jpg" alt="데드풀과 울버린" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228225286_727.jpg" alt="데드풀과 울버린" onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228225286_727.jpg" style="height: 100%;">
                            </div>
                        </div>
                        
                        <button type="button" class="btn-prev">이전 페이지 이동</button>
                        <button type="button" class="btn-next">다음 페이지 이동</button>
                    </div>
                </div>
            </div><!-- .sect-stillcut -->


              
    
            <div class="sect-grade">   
                <!-- preegg.css 연관 UI -->
                <div class="movie_grade">
                    <a class="info" id="goldenEggAlert" href="javascript:void(0);"><img src="https://img.cgv.co.kr/R2014/images/common/ico/ico-question-mark.png" alt="?"></a>
                    <div class="egg_point">
                        <!-- 영화요약문구 -->
                        <div class="title">등록된 실관람평이 아직 없습니다.<br><strong>첫번째 작성자가 되어주세요!</strong></div>
                        <div class="rating">
                            <div class="box">
                                <span class="sprite_preegg big default"></span>
                                <span class="desc">Pre Egg</span>
                                <span class="percent">99%</span>
                                <span class="tooltip">사전기대지수</span>
                            </div>
                            <div class="box box_golden">
                                <span class="sprite_preegg big good"></span>
                                <span class="desc">Golden Egg</span>
                                <span class="percent">?</span>
                                <span class="tooltip">실관람평지수</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="chart_total">
                        <div class="box">
                            <div class="title">매력 포인트</div>
                            <div class="radar-graph" id="chart2">
                                <div id="charm" style="width: 350px; height: 250px; margin: 0px auto; overflow: hidden; text-align: left;"><div class="amcharts-main-div" style="position: relative;"><div class="amcharts-chart-div" style="overflow: hidden; position: relative; text-align: left; width: 350px; height: 250px; padding: 0px;"><svg version="1.1" style="position: absolute; width: 350px; height: 250px; top: 0.34375px; left: 0px;"><g><path cs="100,100" d="M0.5,0.5 L349.5,0.5 L349.5,249.5 L0.5,249.5 Z" fill="#FFFFFF" stroke="#000000" fill-opacity="0" stroke-width="1" stroke-opacity="0"></path></g><g><g transform="translate(175,125)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,-86.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="middle" transform="translate(0,-102)"><tspan y="6" x="0">감독연출</tspan></text><path cs="100,100" d="M0.5,0.5 L83.5,-26.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="start" transform="translate(98,-30)"><tspan y="6" x="0">스토리</tspan></text><path cs="100,100" d="M0.5,0.5 L51.5,71.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="start" transform="translate(62,79)"><tspan y="6" x="0">영상미</tspan></text><path cs="100,100" d="M0.5,0.5 L-50.5,71.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-62,79)"><tspan y="6" x="0">배우연기</tspan></text><path cs="100,100" d="M0.5,0.5 L-82.5,-26.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-98,-30)"><tspan y="6" x="0">OST</tspan></text></g></g><g><g transform="translate(175,125)" visibility="visible"><g><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-16.5 L17.5,-4.5 L10.5,14.5 L-9.5,14.5 L-16.5,-4.5 L0.5,-16.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-33.5 L33.5,-10.5 L20.5,28.5 L-19.5,28.5 L-32.5,-10.5 L0.5,-33.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-51.5 L50.5,-15.5 L31.5,42.5 L-30.5,42.5 L-49.5,-15.5 L0.5,-51.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-68.5 L66.5,-20.5 L41.5,56.5 L-40.5,56.5 L-65.5,-20.5 L0.5,-68.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-86.5 L83.5,-26.5 L51.5,71.5 L-50.5,71.5 L-82.5,-26.5 L0.5,-86.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-7.5 L-0.5,-7.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><path cs="100,100" d="M0.5,-7.5 L8.5,-2.5 L5.5,7.5 L-4.5,7.5 L-7.5,-2.5 L0.5,-7.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,1.5 L-0.5,1.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-7.5 L8.5,-2.5 L5.5,7.5 L-4.5,7.5 L-7.5,-2.5 L0.5,-7.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 Z" fill="#000000" stroke="#000000" fill-opacity="0.1" stroke-width="0.01" stroke-opacity="0.1"></path></g></g></g><desc>JavaScript chart by amCharts 3.21.8</desc><g></g><g></g><g></g><g></g><g><g transform="translate(175,125)"><g></g><g><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 M0,0 L0,0" fill="none" stroke-width="1" stroke-opacity="1" stroke="#fb8c43" stroke-linejoin="round"></path><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 Z" fill="#fb8c43" stroke="#000" fill-opacity="0.1" stroke-width="1" stroke-opacity="0"></path></g><g></g></g></g><g></g><g></g><g></g><g><g transform="translate(175,125)"><circle r="3.5" cx="0" cy="0" fill="rgb(255,133,179)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(0,0)" aria-label=" 감독연출 0"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(254,196,70)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(0,0)" aria-label=" 스토리 0"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(142,189,255)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(0,0)" aria-label=" 영상미 0"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(100,169,178)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(0,0)" aria-label=" 배우연기 0"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(178,103,183)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(0,0)" aria-label=" OST 0"></circle></g></g><g><g></g></g><g><g transform="translate(175,125)" visibility="visible"><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-4,-8)"><tspan y="6" x="0"></tspan></text><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-4,1)"><tspan y="6" x="0"></tspan></text></g></g><g></g><g></g><g></g><g></g></svg></div></div></div>
                            </div>
                        </div>
                        <div class="box">
                            <div class="title">감정 포인트</div>
                            <div class="radar-graph" id="chart3">
                                <div id="emotion" style="width: 350px; height: 250px; margin: 0px auto; overflow: hidden; text-align: left;"><div class="amcharts-main-div" style="position: relative;"><div class="amcharts-chart-div" style="overflow: hidden; position: relative; text-align: left; width: 350px; height: 250px; padding: 0px;"><svg version="1.1" style="position: absolute; width: 350px; height: 250px; top: 0.34375px; left: -0.5px;"><g><path cs="100,100" d="M0.5,0.5 L349.5,0.5 L349.5,249.5 L0.5,249.5 Z" fill="#FFFFFF" stroke="#000000" fill-opacity="0" stroke-width="1" stroke-opacity="0"></path></g><g><g transform="translate(175,125)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,-86.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="middle" transform="translate(0,-102)"><tspan y="6" x="0">스트레스 해소</tspan></text><path cs="100,100" d="M0.5,0.5 L83.5,-26.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="start" transform="translate(98,-30)"><tspan y="6" x="0">유쾌함</tspan></text><path cs="100,100" d="M0.5,0.5 L51.5,71.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="start" transform="translate(62,79)"><tspan y="6" x="0">공감</tspan></text><path cs="100,100" d="M0.5,0.5 L-50.5,71.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-62,79)"><tspan y="6" x="0">몰입감</tspan></text><path cs="100,100" d="M0.5,0.5 L-82.5,-26.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-98,-30)"><tspan y="6" x="0">감동</tspan></text></g></g><g><g transform="translate(175,125)" visibility="visible"><g><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-16.5 L17.5,-4.5 L10.5,14.5 L-9.5,14.5 L-16.5,-4.5 L0.5,-16.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-33.5 L33.5,-10.5 L20.5,28.5 L-19.5,28.5 L-32.5,-10.5 L0.5,-33.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-51.5 L50.5,-15.5 L31.5,42.5 L-30.5,42.5 L-49.5,-15.5 L0.5,-51.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-68.5 L66.5,-20.5 L41.5,56.5 L-40.5,56.5 L-65.5,-20.5 L0.5,-68.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-86.5 L83.5,-26.5 L51.5,71.5 L-50.5,71.5 L-82.5,-26.5 L0.5,-86.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-7.5 L-0.5,-7.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><path cs="100,100" d="M0.5,-7.5 L8.5,-2.5 L5.5,7.5 L-4.5,7.5 L-7.5,-2.5 L0.5,-7.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,1.5 L-0.5,1.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-7.5 L8.5,-2.5 L5.5,7.5 L-4.5,7.5 L-7.5,-2.5 L0.5,-7.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 Z" fill="#000000" stroke="#000000" fill-opacity="0.1" stroke-width="0.01" stroke-opacity="0.1"></path></g></g></g><desc>JavaScript chart by amCharts 3.21.8</desc><g></g><g></g><g></g><g></g><g><g transform="translate(175,125)"><g></g><g><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 M0,0 L0,0" fill="none" stroke-width="1" stroke-opacity="1" stroke="#FB4357" stroke-linejoin="round"></path><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 Z" fill="#FB4357" stroke="#000" fill-opacity="0.1" stroke-width="1" stroke-opacity="0"></path></g><g></g></g></g><g></g><g></g><g></g><g><g transform="translate(175,125)"><circle r="3.5" cx="0" cy="0" fill="rgb(255,133,179)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(0,0)" aria-label=" 스트레스 해소 0"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(254,196,70)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(0,0)" aria-label=" 유쾌함 0"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(142,189,255)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(0,0)" aria-label=" 공감 0"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(100,169,178)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(0,0)" aria-label=" 몰입감 0"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(178,103,183)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(0,0)" aria-label=" 감동 0"></circle></g></g><g><g></g></g><g><g transform="translate(175,125)" visibility="visible"><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-4,-8)"><tspan y="6" x="0"></tspan></text><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-4,1)"><tspan y="6" x="0"></tspan></text></g></g><g></g><g></g><g></g><g></g></svg></div></div></div>
                            </div>
                        </div>
                    </div>

                    <!-- Chart code -->
                    <script>
   
                        // 2020.05.07 매력포인트 차트
                        var chart = AmCharts.makeChart("charm", {
                            "type": "radar",
                            "radius": "35%", //넓이

                            "dataProvider": [{
                                "key": "감독연출",
                                "value": 0,
                                "color": "rgb(255,133,179)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "스토리",
                                "value": 0,
                                "color": "rgb(254,196,70)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "영상미",
                                "value": 0,
                                "color": "rgb(142,189,255)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "배우연기",
                                "value": 0,
                                "color": "rgb(100,169,178)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "OST",
                                "value": 0,
                                "color": "rgb(178,103,183)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }],
                            "valueAxes": [{
                                "axisTitleOffset": 10,
                                "minimum": 0,
                                "maximum": 100,
                                "axisAlpha": 0.15,
                                "unitPosition": "right",
                                "gridColor": "#000000",
                                "autoGridCount": false,
                                "gridCount": 5,
                                "labelsEnabled" : false,
                                "tickLength" : 1
                            }],
                            "guides": [
                                {
                                    "fillAlpha": 0.10,
                                    "value": 0,
                                    "toValue": 10,
                                    "color": "#060"
                                }
                            ],
                            "balloon": {
                                "enabled": false
                            },
                            "startDuration": 0,
                            "graphs": [{
                                "bullet": "round",
                                "bulletSize": 7,
                                "bulletBorderAlpha": "1",
                                "bulletBorderColor": "rgb(255,255,255)",
                                "bulletBorderThickness": "1",
                                "lineThickness": 1,
                                "lineColor": "#fb8c43",
                                "fillAlphas": 0.1,
                                "valueField": "value",
                                "lineColorField": "color"
                            }],
                            "categoryField": "key",
                            "export": {
                                "enabled": false
                            },
                            "autoResize": false,
                            "color": "rgb(0,0,0)",
                            "fontSize": 12,
                            "fontFamily": "CJONLYONENEW",
                            "tapToActivate": false,
                            "rollOverGraphItem": function () {
                                console.log('rollOverGraphItem')

                            }
                        });

                        // 2020.05.07 감정포인트 차트(7시방향 1번째, 12시 방향이 3번째 순서로 3번째항목부터 데이터 셋팅)
                        var chart = AmCharts.makeChart("emotion", {
                            "type": "radar",
                            "radius": "35%", //넓이

                            "dataProvider": [{
                                "key": "스트레스 해소",
                                "value": 0,
                                "color": "rgb(255,133,179)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "유쾌함",
                                "value": 0,
                                "color": "rgb(254,196,70)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "공감",
                                "value": 0,
                                "color": "rgb(142,189,255)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "몰입감",
                                "value": 0,
                                "color": "rgb(100,169,178)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "감동",
                                "value": 0,
                                "color": "rgb(178,103,183)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }],
                            "valueAxes": [{
                                "axisTitleOffset": 10,
                                "minimum": 0,
                                "maximum": 100,
                                "axisAlpha": 0.15,
                                "unitPosition": "right",
                                "gridColor": "#000000",
                                "autoGridCount": false,
                                "gridCount": 5,
                                "labelsEnabled" : false,
                                "tickLength" : 1
                            }],
                            "guides": [
                                {
                                    "fillAlpha": 0.10,
                                    "value": 0,
                                    "toValue": 10,
                                    "color": "#060"
                                }
                            ],
                            "balloon": {
                                "enabled": false
                            },
                            "startDuration": 0,
                            "graphs": [{
                                "bullet": "round",
                                "bulletSize": 7,
                                "bulletBorderAlpha": "1",
                                "bulletBorderColor": "rgb(255,255,255)",
                                "bulletBorderThickness": "1",
                                "lineThickness": 1,
                                "lineColor": "#FB4357",
                                "fillAlphas": 0.1,
                                "valueField": "value",
                                "lineColorField": "color"
                            }],
                            "categoryField": "key",
                            "export": {
                                "enabled": false
                            },
                            "autoResize": false,
                            "color": "rgb(0,0,0)",
                            "fontSize": 12,
                            "fontFamily": "CJONLYONENEW",
                            "tapToActivate": false,
                            "rollOverGraphItem": function () {
                                console.log('rollOverGraphItem')
                            }
                        });
                    </script>

                </div>
                <div class="real-rating">
                    <p class="title">관람일 포함 7일 이내 관람평을 남기시면 <strong>CJ ONE 20P</strong>가 적립됩니다. </p>
                    <p class="desc"><span><em>0</em> 명의 실관람객이 평가해주셨습니다.</span></p>
                    <div class="wrap_btn">
                        <a class="link-gradewrite" href="javascript:void(0);"><span>평점작성</span></a><a class="link-reviewwrite" href="/movies/point/my-list.aspx"><span>내 평점</span></a>
                    </div>
                </div>
                <!-- //preegg.css 연관 UI -->
                <ul class="sort" id="sortTab">
                    <li class="sortTab on" data-order-type="0" id="test"><a href="javascript:void(0);" title="현재선택">최신순<span class="arrow-down"></span></a></li>
                    <li class="sortTab" data-order-type="3"><a href="javascript:void(0);">추천순<span class="arrow-down"></span></a></li>
                </ul>
                                
                <div class="wrap-persongrade">
                    <!-- 평점 목록 -->
                    <ul id="movie_point_list_container" class="point_col2"><li style="width: 100%; text-align: center; padding: 30px 0px; border-right: none;">해당 조건에 데이터가 존재하지 않습니다.</li></ul>
                </div>
            </div><!-- .sect-grade -->
                      
            <div class="paging">
				<ul id="paging_point"></ul>
			</div>

             
            
            <!-- 연관영화 -->
            <div class="sect-movielist" style="display :none">
                <h3><img src="https://img.cgv.co.kr/R2014/images/title/h3_relation_movie.gif" alt="RELATION MOVIE"></h3>
                <ul>
                
                    <li>
                        <div class="box-image">
                            <a href="/movies/detail-view/?midx=88459">
                                <span class="thumb-image">
                                    <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88459/88459_126.jpg" alt="글래디에이터 Ⅱ 포스터">
                                    <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                    <i class="cgvIcon etc ageNotyet">미정</i>
                                    <!-- <span class="ico-grade Notyet">미정</span> -->
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="/movies/detail-view/?midx=88459"><strong>글래디에이터 Ⅱ</strong></a>
                        </div>
                    </li>
                    
                    <li>
                        <div class="box-image">
                            <a href="/movies/detail-view/?midx=88457">
                                <span class="thumb-image">
                                    <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88457/88457_126.jpg" alt="신비아파트 특별편: 붉은 눈의 사신 포스터">
                                    <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                    <i class="cgvIcon etc ageNotyet">미정</i>
                                    <!-- <span class="ico-grade Notyet">미정</span> -->
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="/movies/detail-view/?midx=88457"><strong>신비아파트 특별편: 붉은 눈의 사신</strong></a>
                        </div>
                    </li>
                    
                    <li>
                        <div class="box-image">
                            <a href="/movies/detail-view/?midx=88445">
                                <span class="thumb-image">
                                    <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88445/88445_126.jpg" alt="[대만영화주간] 돼지와 뱀과 비둘기 포스터">
                                    <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                    <i class="cgvIcon etc age18">18</i>
                                    <!-- <span class="ico-grade 18">18</span> -->
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="/movies/detail-view/?midx=88445"><strong>[대만영화주간] 돼지와 뱀과 비둘기</strong></a>
                        </div>
                    </li>
                    
                    <li>
                        <div class="box-image">
                            <a href="/movies/detail-view/?midx=88442">
                                <span class="thumb-image">
                                    <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88442/88442_126.jpg" alt="트위스터스 포스터">
                                    <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                    <i class="cgvIcon etc age12">12</i>
                                    <!-- <span class="ico-grade 12">12</span> -->
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="/movies/detail-view/?midx=88442"><strong>트위스터스</strong></a>
                        </div>
                    </li>
                    
                    <li>
                        <div class="box-image">
                            <a href="/movies/detail-view/?midx=88441">
                                <span class="thumb-image">
                                    <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88441/88441_126.jpg" alt="플라이 미 투 더 문 포스터">
                                    <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                    <i class="cgvIcon etc age12">12</i>
                                    <!-- <span class="ico-grade 12">12</span> -->
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="/movies/detail-view/?midx=88441"><strong>플라이 미 투 더 문</strong></a>
                        </div>
                    </li>
                    
                    <li>
                        <div class="box-image">
                            <a href="/movies/detail-view/?midx=88437">
                                <span class="thumb-image">
                                    <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88437/88437_126.jpg" alt="파일럿 포스터">
                                    <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                    <i class="cgvIcon etc age12">12</i>
                                    <!-- <span class="ico-grade 12">12</span> -->
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="/movies/detail-view/?midx=88437"><strong>파일럿</strong></a>
                        </div>
                    </li>
                    
                </ul>
            </div><!-- .sect-movielist -->
            <!-- 연관영화 -->

        </div><!-- .col-detail -->
        <iframe class="layer-wrap review_pop" name="ifrm_movie_time_table1" id="ifrm_movie_time_table1" style="display:none" title="상세리스트" height="993px" width="849px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" allowtransparency="true"></iframe><!--회원 평점 모아보기 iframe. mwpark_RR2015-->
        <form method="post" id="frmPointPopup" action="/movies/point/default-irm.aspx" novalidate="novalidate">
            <input type="hidden" name="userid" id="frmPointUserId">
            <input type="hidden" name="nick" id="frmPointNick">
        </form>

        
<div class="col-aside">
    <div class="ad-partner01">
        <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@M_Rectangle" width="160" height="300" title="영화광고-명탐정 코난: 100만 달러의 펜타그램" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="M_Rectangle" id="M_Rectangle"></iframe>
    </div>
    <div class="ad-external01">
        <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@C_Rectangle" width="160" height="300" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="C_Rectangle" id="C_Rectangle"></iframe>
    </div>
    <!-- 영화검색어주석 : 20211208
    <div class="sect-moviesearch">
        <div class="searchrank">
            <h3>인기 영화 검색어</h3>
            <ol>
                
            </ol>
        </div>
    </div>
    //-->
</div>

<!--<div class="sect-sns">
    <ul>                	
        <li><a class="link-facebook" href="#" id="link_facebook">FaceBook</a></li>
        <li><a class="link-twitter" href="#" id="link_twitter">Twitter</a></li>
    </ul>
    <div class="share">
        <div id="fb-root"></div>
        <script>
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&appId=341385562539159&version=v2.0";
                fjs.parentNode.insertBefore(js, fjs);
            } (document, 'script', 'facebook-jssdk'));
        </script>

        <div class="fb-like" style="z-index:2" data-href="http%3a%2f%2fwww.cgv.co.kr%2fmovies%2fdetail-view%2fdefault.aspx%3fmidx%3d88228" data-layout="button_count" data-action="like" data-show-faces="false" data-share="false"></div>
    </div>-->


       

</div>

    </div>
    <span style="display:none" class="modifyCommentDummy"></span>
</div>
<!-- 실컨텐츠 끝 -->
<script type="text/javascript">
    _TRK_CP = _TRK_CP.replace("{0}", "주요정보");
</script>

<!-- CGVian 리뷰 사용안함 --> 


<!-- 평점 작성 -->
<script type="text/template" id="writeGrade">
	<div class="layer-contents on-shadow" style="width:710px;">
		<div class="popup-general">
			<div class="popwrap">
				<h1>평점작성</h1>
				<div class="pop-contents write-mygrade">

					<div class="mygrade-cont">
						<div class="movietit"><strong id="regTitle">데드풀과 울버린</strong></div>
						<div class="likeornot">
							<div class="writerinfo">
								<div class="box-image">
									<span class="thumb-image">   
										<img id="regUserPro" src="" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})">                                            
										
                                        <span class="profile-mask"></span>
									</span>
								</div>
							
								<span class="round red on"><span class="position"><em class="see">실관람객</em></span></span>
								<span class="writer-name" id="regUserName"></span>
							</div>

							<div class="likebox t1" id="defaultEggPoint">
								<div class="likebox-inner">
									<label for="likeornot1-1">
										<span class="egg-icon good">
											<input type="radio" name="likeornot1" id="likeornot1-1" value="2" />
										</span>
										<span class="txt">좋았어요~^^</span>
									</label>
								</div>
							</div>
							<div class="likebox t2" id="notEggPoint">
								<div class="likebox-inner">
									<label for="likeornot1-2">
										<span class="egg-icon">
											<input type="radio" name="likeornot1" id="likeornot1-2" value="1" />
										</span>
										<span class="txt">흠~좀 별로였어요;;;</span>
									</label>
								</div>
							</div>
						</div>

						<div class="textbox">
                            <textarea id="textReviewContent" name="textReviewContent" title="영화평점 입력" cols="70" rows="2" maxlength="280" placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다."></textarea>
						</div>

						<div class="footbox">
							<span class="role">
								<a id="viewpopup" title="새창" href="javascript:void(0);" target="_blank">운영원칙 <img src="http://img.cgv.co.kr/R2014/images/common/ico/ico-question-mark.png" alt="?"></a>
							</span>
							
							<div class="rbox">
								<span class="count"><strong id="text_count">0</strong>/280(byte)</span>
								<button type="button" class="round red on" id="regBtn"><span>작성완료!</span></button>
							</div>
						</div>

					</div>
					
				</div>
				<button type="button" class="btn-close" id="regLayerClose">평점작성 팝업 닫기</button>
			</div>
		</div>
	</div>
</script>

<!-- 평점 작성/수정시 하단에 운영원칙 버튼 클릭시 노출 -->
<script id="temp_view" type="text/template">
<div class="layer-contents on-shadow" style="width:633px;">
    <div class="popwrap sect-operation-rule">
        <h1>운영원칙</h1>
        <div class="pop-contents">
            <p>
                CGV는 올바른 커뮤니티를 지향하기 위하여 몇 가지 운영원칙을 마련하고 있습니다.<br/>
                운영원칙에 어긋나는 게시물로 판단되는 글은 적발 시, 경고 없이 삭제되며 아이디 중지 등의<br/>
                제재 조치를 받을 수 있습니다.<br/>
                <br/>
                CGV는 보다 건전한 인터넷 문화를 지향합니다.
            </p>
            <div class="box-info"> 
                <strong>게시물 삭제 기준</strong>
                <ul>
                    <li> - 개인정보(실명, 상호명, 사진, 전화번호, 주민등록번호 등) 유포</li>
                    <li> - 동일 내용의 게시글/덧글 반복(도배)</li>
                    <li> - 특정인 대상의 <span class="txt-red">비방/욕설</span> 등의 표현으로 불쾌감을 주는 내용</li>
                    <li> - 음란성 또는 청소년에게 부적합한 내용</li>
                    <li> - 서비스 취지(성격)에 맞지 않은 내용</li>
                    <li> - <span class="txt-red">비방/허위사실 유포</span> 등의 명예훼손 관련 게시물</li>
                    <li> - 저작권 관련 게시물 등 기타 관련 법률에 위배되는 글</li>
                </ul>
            </div>
        </div>

        <button type="button" class="btn-close">운영원칙 닫기</button>
    </div>
</div>
</script>

<!-- 2020.05.07 추가 실관람평 > 관람 포인트 선택 등록 -->
<script id="charmPoint" type="text/template">
    <div class="layer-wrap" id="movie-emotion-select" style="width:0px; top:0px;">
    <div class="popwrap" style="width:516px;margin-top:0px;margin-left:-268px">
        <h1>관람 포인트 선택</h1>
        <div class="pop-contents">
            <!-- Contents Addon -->
            <div class="movie-emotion-select">
                <div class="header">
                    <p class="main">이 영화의 관람 포인트를 선택해주세요! </p>
                    <p class="sub"><span>중복선택</span>이 가능합니다.</p>
                </div>
                <div class="box">
                    <div class="name">
                        매력 포인트
                    </div>
                    <div class="wrap_input">
                        <label><input type="checkbox" name="charm1" id="effect" /><span>감독연출</span></label>
                        <label><input type="checkbox" name="charm2" id="story" /><span>스토리</span></label>
                        <label><input type="checkbox" name="charm3" id="visual" /><span>영상미</span></label>
                        <label><input type="checkbox" name="charm4" id="acting" /><span>배우연기</span></label>
                        <label><input type="checkbox" name="charm5" id="ost" /><span>OST</span></label>
                    </div>
                </div>

                <div class="box">
                    <div class="name">
                        감정 포인트
                    </div>
                    <div class="wrap_input">
                        <label><input type="checkbox" name="emotion1" id="emotion1" /><span>${Emotion1Text}</span></label>
                        <label><input type="checkbox" name="emotion2" id="emotion2" /><span>${Emotion2Text}</span></label>
                        <label><input type="checkbox" name="emotion3" id="emotion3" /><span>${Emotion3Text}</span></label>
                        <label><input type="checkbox" name="emotion4" id="emotion4" /><span>${Emotion4Text}</span></label>
                        <label><input type="checkbox" name="emotion5" id="emotion5" /><span>${Emotion5Text}</span></label>
                    </div>
                </div>
            </div>
            <!-- //Contents Addon -->
            <div class="set-btn fix-width">
                <button type="submit" id="charmRegBtn" class="round inred"><span>확인</span></button>
            </div>

            <input type="hidden" id="charmGenre_SMS1" value="${Genre_SMS1}" />
            <input type="hidden" id="RegCommentIdx" value="${CommentIdx}" />
        </div>
        <button type="button" class="btn-close" id="regCharmCloseBtn">관람 포인트 선택 팝업 닫기</button>
    </div>
</div>
<!-- //관람 포인트 선택 팝업 팝업 -->
</script>


<script type="text/javascript">
    $(function () { 
        // 관람 포인트 등록 팝업 닫기 버튼 클릭시
        $(document.body).on("click", "#regCharmCloseBtn", function () {
            location.reload();
            $('.layer-wrap').remove();
        });

        // 관람 포인트 등록 확인 버튼 클릭시   
        $(document.body).on("click", "#charmRegBtn", function () {
            var commentIdx = $("#RegCommentIdx").val();
            var movieIdx = 88228;
            if(commentIdx == ""){
                return; 
            }
            
            var acting = 'N';
            var story = 'N';
            var visual = 'N';
            var ost = 'N';
            var effect = 'N';
            var emotion1 = 'N';
            var emotion2 = 'N';
            var emotion3 = 'N';
            var emotion4 = 'N';
            var emotion5 = 'N';
            var genre_sms1 = $("#charmGenre_SMS1").val();
        
            if ($('#acting').prop("checked")) {
                acting = 'Y';
            }
            if ($('#story').prop("checked")) {
                story = 'Y';
            }
            if ($('#visual').prop("checked")) {
                visual = 'Y';
            }
            if ($('#ost').prop("checked")) {
                ost = 'Y';
            }
            if ($('#effect').prop("checked")) {
                effect = 'Y';
            }
            if ($('#emotion1').prop("checked")) {
                emotion1 = 'Y'
            }
            if ($('#emotion2').prop("checked")) {
                emotion2 = 'Y'
            }
            if ($('#emotion3').prop("checked")) {
                emotion3 = 'Y'
            }
            if ($('#emotion4').prop("checked")) {
                emotion4 = 'Y'
            }
            if ($('#emotion5').prop("checked")) {
                emotion5 = 'Y'
            }
            if(acting == 'N' && story == 'N' && visual == 'N' && ost == 'N' && effect == 'N'){
                alert("매력 포인트를 1개 이상 선택해주세요.");
                return;
            }

            if (emotion1 == "N" && emotion2 == "N" && emotion3 == "N" && emotion4 == "N" && emotion5 == "N") {
                alert("감정 포인트를 1개 이상 선택해주세요.");
                return;
            }  

            // 관람 포인트 선택 저장
            var pointObj = app.movie();
            if (!pointObj.setCharmEdit) {
                pointObj.setCharmEdit = function (data, callback, error) {
                    var url = '/common/ajax/point.aspx/setCharm_AddEmotion';
                    app.ajax().set({ dataType: 'json', url: url, data: data, contentType: "application/json; charset=utf-8", successHandler: callback });
                }

            };
            pointObj.setCharmEdit(JSON.stringify({ 'commentIdx': commentIdx
                                                    , 'movieIdx' : movieIdx
                                                    , 'acting': acting
                                                    , 'story': story
                                                    , 'visual': visual
                                                    , 'ost': ost
                                                    , 'effect': effect
                                                    , 'genre_sms1': genre_sms1
                                                    , 'emotion1': emotion1
                                                    , 'emotion2': emotion2
                                                    , 'emotion3': emotion3
                                                    , 'emotion4': emotion4
                                                    , 'emotion5': emotion5
                                                    }), resultCharmingCallback);
                   
            //결과
            function resultCharmingCallback(result) {
                switch (result.resultCode) {
                    case "1":
                        alert("관람 포인트가 등록되었습니다.");
                        $('.layer-wrap').remove();
                        location.reload();
                        break;
                    case "-1":
                        alert("등록 중 오류가 발생 되었습니다.");
                        break;
                    default:

                        break;
                }
            }
        });
    });

    // 2020.05.07 관람 포인트 등록 레이어팝업
    function charmPointPop(commentIdx) {
        // 관람 포인트 항목 조회
        var charmObj = app.movie();
        if (!charmObj.GetCharmPoint) {
            charmObj.GetCharmPoint = function (data, callback, error) {
                var url = '/common/ajax/point.aspx/GetCharmPoint_AddEmotion';
                app.ajax().set({ dataType: 'json', url: url, data: data, contentType: "application/json; charset=utf-8", successHandler: callback });
            }
        };
        charmObj.GetCharmPoint(JSON.stringify({ 'commentIdx': commentIdx }), resultCharmCallback);

        //결과
        function resultCharmCallback(result) {
            var $std = $(this),
	        options = {
		        '$target': $std,
		        'type': 'center',
		        'html': $('#charmPoint').tmpl(result),
                'independence': true,
		        'mask': 'none'
            };
            app.instWin.add(options);
        };
    }   
</script>

<!-- 내가 쓴 평점 -->
<script id="movie_my_point" type="text/x-jquery-tmpl">
<li class="user_my_point_list" id="liCommentFirst${CommentIdx}">
    <div class="box-image">
        <span class="thumb-image">     
            <img src="${UserSmallImage}"  alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})"/>                                            
            <span class="profile-mask"></span>                                                        
            <div class="theater-sticker">
				{{if MediaTypeCode.indexOf("412") > -1  }} <span class="imax">IMAX</span> {{/if}}
                {{if MediaTypeCode.indexOf("1969") > -1  }} <span class="fourdx">4DX</span> {{/if}}
                {{if MediaTypeCode.indexOf("2202") > -1  }} <span class="screenx">SCREENX</span> {{/if}}
			</div>
        </span>
    </div>
    <div class="box-contents">
        <ul class="writerinfo">                                        
            
            <li class="writer-name">                
                <span class="{{if EggPoint == 0 && Point > 0 }}  {{else  EggPoint == 1 }} egg-icon {{else  EggPoint == 2 }} egg-icon good {{else}} {{/if}}"></span>${UserIdNicName}
            </li>
            <li class="writer-etc">
                			
				<span class="day">${RegistDate}</span>
				<span class="like point_like" id="${CommentIdx}" data-isMyGood="${IsMyGOOD}" data-CommentIdx="${CommentIdx}">
					<a href="javascript:return false;" class="btn_point_like"><span><img {{if IsMyGOOD }}src="http://img.cgv.co.kr/R2014/images/point/ico_point_like.png"{{else}}src="http://img.cgv.co.kr/R2014/images/point/ico_point_default.png"{{/if}} alt="like" class="like_red" /></span><span id='idLikeValue'>${GOODCNT}</span></a>
				</span>
			</li>

            <li class="point_edit">
                <a href="" class="btn_edit">평점 수정/삭제 하기</a>
                <div class="edit_wrap">
                    <ul>
                        <li><a href="javascript:return false;" class="ico_edit" data-CommentIdx="${CommentIdx}" data-MovieIdx="${MovieIdx}" data-MovieTitle="${MovieTitle}"><span>평점수정</span></a></li>
                        <li><a href="javascript:return false;" class="ico_delete" data="${CommentIdx}"><span>평점삭제</span></a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
    <div class="box-comment">
        <p id="pCommentText${CommentIdx}">${CommentText}</p>
    </div>
                            
</li>
</script>
<script id="movie_point_template" type="text/x-jquery-tmpl">

<li class={{if (SPOILERCNT >= 2 && REPORTCNT >= 2) }} "user_spolierswear"
            {{else (SPOILERCNT >= 2)}} "user_spolier"
            {{else (REPORTCNT >= 2)}} "user_swearword"
            {{else}} "" {{/if}}
    id="liCommentFirst${CommentIdx}"
    data-SPOILERCNT="${SPOILERCNT}"
    data-REPORTCNT="${REPORTCNT}"
>

    <a href="javascript:return false;" class="screen_spoiler">&nbsp;</a>
    <div class="box-image">
        <span class="thumb-image">   
                <img src="${UserSmallImage}"  alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})"/>                                            
                <span class="profile-mask">
                </span>
                <div class="theater-sticker">
				    {{if MediaTypeCode.indexOf("412") > -1  }} <span class="imax">IMAX</span> {{/if}}
                    {{if MediaTypeCode.indexOf("1969") > -1  }} <span class="fourdx">4DX</span> {{/if}}
                    {{if MediaTypeCode.indexOf("2202") > -1  }} <span class="screenx">SCREENX</span> {{/if}}
			    </div>
            </a>   
                                    
        </span>
    </div>

    <div class="box-contents">
        <ul class="writerinfo">     
        <li class="writer-name">            
            <span class="{{if EggPoint == 0 && Point > 0 }}  {{else  EggPoint == 1 }} egg-icon {{else  EggPoint == 2 }} egg-icon good {{else}} {{/if}}"></span>${UserIdNicName}
        </li>
        <li class="writer-etc">
              
				<span class="day">${RegistDate}</span>
				<span class="like point_like" id="${CommentIdx}" data-isMyGood="${IsMyGOOD}" data-CommentIdx="${CommentIdx}">
					<a href="javascript:return false;" class="btn_point_like"><span><img {{if IsMyGOOD }}src="http://img.cgv.co.kr/R2014/images/point/ico_point_like.png"{{else}}src="http://img.cgv.co.kr/R2014/images/point/ico_point_default.png"{{/if}} alt="like" class="like_red" /></span><span id='idLikeValue'>${GOODCNT}</span></a>
				</span>
			</li>   
           
            {{if UserID == "" }}
            <li class="point_edit">
                <a href="##" class="btn_edit">평점 수정/삭제 하기</a>
                <div class="edit_wrap">
                    <ul>
                        <li><a href="javascript:return false;" class="ico_edit"><span>평점수정</span></a></li>
                        <li><a href="javascript:return false;" class="ico_delete" data="${CommentIdx}" ><span>평점삭제</span></a></li>
                    </ul>
                </div>
            </li>
            {{else}}
            <li class="point_notify">
                <a href="" class="btn_notify">스포일러, 욕설/비방 신고</a>
                <div class="notify_wrap">
                    <ul>
                        <li><a href="javascript:return false;" class="ico_spoiler" data-CommentIdx="${CommentIdx}" data-isMySpoiler="${IsMySPOILER}" data-SPOILERCNT="${SPOILERCNT}" ><span>{{if IsMySPOILER }}스포일러 신고 취소{{else}}스포일러 신고{{/if}}</span></a></li>
                        <li><a href="javascript:return false;" class="ico_swearword" data-CommentIdx="${CommentIdx}" data-IsMyREPORT="${IsMyREPORT}" data-REPORTCNT="${REPORTCNT}" ><span>{{if IsMyREPORT }}욕설/비방 신고 취소{{else}}욕설/비방 신고{{/if}}</span></a></li>
                    </ul>
                </div>
            </li>
            {{/if}}
            
        </ul>
    </div>
    <div class="box-comment">
        <p>${CommentText}</p>
    </div>
                            
</li>
</script>
<script type="text/javascript">
//<![CDATA[
var commentOptions;
    (function ($) {
        $(function () {
            //골든 에그 지수 add_css82
            $("#goldenEggAlert").on("click", function () {
                // 2020.05.07 프리에그 문구 추가
                alert("Pre Egg는 개봉 전 영화에 대한\n기대 평가 입니다.\n\nGolden Egg는 실관람객의\n영화 관람 후 평가 입니다.");
             });
            var myPointPage = 0;    
            var mypointYN = false;    
            var mypointPaneltyYN = false;    
            var mypointShowViewYN = false;    

            // 성별/연령별 예매분포 차트 추가
            var data = {
                    
                    age: [
                ["10대", 0],["20대", 24.4],["30대", 38.2],["40대", 26.2],["50대", 11.3]
                    ],
                    sex: [
                 ["남 69.4%", 69.4],["여 30.6%", 30.6]
                    ]

                };
                            
            $('#jqplot_sex').graphChart({ 'type': 'donut', 'data': data.sex });
            $('#jqplot_age').graphChart({ 'type': 'bar', 'data': data.age });
            // 성별/연령별 예매분포 차트 추가

            //첫 로딩시 호출, 첫 로딩시는 "실관람객"탭이 디폴트여서 실관람객 평이 있냐 여부를 따져야 리스트 갯수가 맞게 나온다. "setMypointAttribute()"함수로 대처시 callback이 setMyPointBuild() 함수와 겹쳐 오락가락 하게 된다%>
            setMypointAttributeFirstLoding();
            searchPointList(1, true, 1, 0);              // 첫 로딩시 평점 조회    
   
            var $stillCut = $('#still_motion'),
                $stillCutCurrent = $('#stillcut_current'),
                stillOptions = { 'type': 'photo', 'onBeforeHandler': onBeforeHandler };

            function onBeforeHandler(_index) {
                $stillCutCurrent.text(_index + 1);
            }
            $stillCut.visualMotion(stillOptions);

            //$('.btn-admit').on('click', function (e) {
            //    addMovieReviewCommunityAdmit($(this));
            //});

            //$('.view_review_detail_popup').on('click', function () {
            //    getReviewDetail($(this));
            //    return false;
            //});

            //function getReviewDetail(obj) {
            //    var reviewIdx = obj.attr('data');
            //    app.movie().getReviewDetail({'reviewIdx': parseInt(reviewIdx)}, callback);

            //    function callback(result) {
            //        var html = '';
            //        if(!result || result.length < 1) {
            //            return false;
            //        }

            //        var title = result['Title'];
            //        var content = result['Content'];
             
            //        html += '<div class="layer-contents">';
            //        html += '        <div class="popwrap">';
            //        html += '            <h5>' + title + '</h5>';
            //        html += '            <div class="pop-contents">';
            //        html += result['ContentsImage'] == "" ? "" : "<div><img width='100%' src='" + result['ContentsImage'] + "'></div>";
            //        html +=                 content;
            //        html += '            </div>';
            //        html += '        </div>';
            //        html += '    <button type="button" class="btn-close">' + title + '닫기</button></div>';
            //        html += '</div>';


            //        var $std = obj,
				        //options = {
				        //    '$target': $std,
				        //    'html': html,
				        //    'position': 'fixed',
				        //    'mask': 'none'
				        //};
          
            //        app.instWin.add(options);
            //    }
            //}

            //function addMovieReviewCommunityAdmit(obj) {
            //    var reviewIdx = obj.attr('data');
            //    var em = obj.find('em');

            //    app.movie().addMovieReviewCommunityAdmit(JSON.stringify({'idx': parseInt(reviewIdx)}), callback);

            //    function callback(result) {
            //        var resultCode = result.resultCode;

            //        switch(resultCode)
            //        {
            //            case "-1":
            //                app.goLogin();
            //                break;
            //            case "0":
            //                alert("인정하였습니다.");
            //                em.text(parseInt(em.text()) + 1);
            //                break;
            //            case "":
            //                alert("오류가 발생 되었습니다");
            //                break;
            //            default:
            //                alert(resultCode);
            //                break;
            //        }
            //    }
            //}
                        
            /*내가 작성한 평점 보여주기*/
            function setMyPointBuild() {
                var movieIdx = "88228";
                app.movie().getCommentMy({'movieIdx': parseInt(movieIdx)}, callback);                
            
                function callback(result) 
                {
                    if(!result || result.length < 1) {
                        return false;
                    }

                    $("#movie_my_point").tmpl(result).prependTo("#movie_point_list_container");
                    $('.user_my_point_list .point').point();                    
                }
            }


            //add_css82 평점삭제
            function removePointComment(obj) {

                var commentIdx = obj.attr('data');
                var movieIdx = "88228";
                app.movie().removePointCheck(JSON.stringify({ 'commentIdx': parseInt(commentIdx), 'mIdx': parseInt(movieIdx) }), callback_pc);
                
                function callback_pc(result) {
                    var resultCode = result.resultCode;
                    switch (resultCode) {
                         case "-1":
                            app.goLogin();
                            break;
                        default:
                            var msg = "작성한 관람평을 삭제하시겠습니까?"
                            var onePointMsg = "";
                            if(parseInt(resultCode) > 0 ){
                                onePointMsg = "관람평을 삭제하실 경우\n지급된 포인트는 차감됩니다.\n삭제하시겠습니까?";
                                msg = onePointMsg;
                            }
                            if (confirm(msg))
                            {
                                app.movie().removePoint(JSON.stringify({ 'commentIdx': parseInt(commentIdx), 'mIdx': parseInt(movieIdx), 'pointCode': parseInt(resultCode) }), callback);
                            }
                            break;                        
                    }
                }

                function callback(result) {
                    var resultCode = result.resultCode;

                    switch (resultCode) {
                        case "-1":
                            app.goLogin();
                            break;
                        case "0":
                             deleteAfterList();
                            if (confirm("삭제가 완료되었습니다.\n새로 작성하시겠습니까?")){
                                $('.link-gradewrite').click();
                            }else{
                                location.reload();
                            }
                            break;
                        case "":
                            alert("삭제 중 오류가 발생 되었습니다");
                            break;
                        default:
                            alert(resultCode);
                            break;
                    }
                }
            }
            function deleteAfterList(){
                mypointYN = false;
                var order = $('.sort>li.on').data('order-type');
                searchPointList(1, true, 1, order);
                var cgvEggCountTxt = $('#cgvEggCountTxt').text();

                cgvEggCountTxt = cgvEggCountTxt.split(",").join("");

                var cnt = parseInt(cgvEggCountTxt);
                cnt = cnt -1;
                
                if(cnt < 100){
                    var eggIconDiv = $('#eggIconDiv');
                    $('#eggIconDiv').empty() ;
                    $('#eggIconDiv').html('<span class="egg good"></span><span class="percent"><strong></strong>?</span>');
                }
                cnt = cnt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                $('#cgvEggCountTxt').html(cnt);
               
                
            }
            // 평점 리스트 조회
            function searchPointList(page, isGetTotalCount, filterType, orderType) {
                myPointPage = page;
                
                filterType= 1;
                if(!orderType) {
                    orderType = $('.sort>li.on').data('order-type');
                }                

                // 첫로딩후 페이지 이동시 IsGetTotalCount = false 처리됨
                // 첫로딩시 setPointListBuild()에서 result.TotalCount:전체평점갯수, 페이지 이동시 result.TotalCount:0
                if(!isGetTotalCount) { isGetTotalCount = false; }

                var isMyPageIndex = 6;
                var isMyPoint = false;
                if(mypointYN) {        //내가 쓴 평점이 있다면(첫페이지만 5개 가져온다, 이후는 6개씩) 
                    if (filterType == "1" && mypointShowViewYN) {      //추가 : 실관람객탭이면서 실관람객인지
                        isMyPoint = true;
                    }else if (filterType == "2" && mypointPaneltyYN) {//추가 :  패널티탭이면서 패널티회원인지
                        isMyPoint = true;
                    }else if (filterType == "0") {                          //추가 :  전체탭
                        isMyPoint = true;
                    }
                }
                                
	            $.ajax({
	                type: "POST",
	                url: '/common/ajax/point.aspx/GetMoviePointVariableList',
	                data: "{ 'movieIdx': 88228, 'pageIndex': " + page + ", 'pageSize': " + isMyPageIndex + ", 'orderType': " + orderType + ", 'filterType': 1, 'isTotalCount' : " + isGetTotalCount + ", 'isMyPoint' : '" + isMyPoint + "' }",
	                contentType: "application/json; charset=utf-8",
	                dataType: 'json',
	                success: function (result) {
						setPointListBuild($.parseJSON(result.d));
	                }
	            });                                
            }

            // 평점 리스트 ajax를 통해 호출한 데이터 노출
            function setPointListBuild(result) {                
                if(result == null || result.List == null || result.TotalCount  == null) return;

                $("#movie_point_list_container").empty();
                $("#movie_point_template").tmpl(result.List).appendTo("#movie_point_list_container");
                
                $('.box-contents .point').point();
                $('.btn-delete').on('click', function () {
                    removePointComment($(this));
                });

                // result.List:내가쓴평점 제외한 한페이지에 노출될 평점 목록
                // result.TotalCount : 10자 이상 평점 총 갯수                
                var ListCount = result.List.length;
                var TotalCount = result.TotalCount;                              

                //1페이지 이면서 내가 쓴 평점이 있다면 보여 준다 : 상단 탭 "실관람객", "패널티" "전체" 여부 체크는 "setMyPointBuild()"안에서 체크 한다
                if(mypointYN && myPointPage == 1 ) {                   
                    ListCount++;                    // 1페이지는 내가쓴평점 추가

                    if(TotalCount == 0)
                        TotalCount++;   
                          
                    setMyPointBuild();
                }

                // 첫 페이징 로딩후 result.TotalCount가 0처리되어 타지 않음
                if(ListCount <= TotalCount) {
                    setPagingNavigation(TotalCount, 6, '#paging_point', '#movie_point_list_container', searchPointList);
				
					// 실관람평 건수
					$(".real-rating .desc span em").html(TotalCount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                }

                if(result.List.length == 0) {
                    $("#movie_point_list_container li").css("border-right", "none");
                }
            }

            /* 첫로딩시 1번만 호출, 내가 쓴평점이 있는지 전영변수 세팅 및 체크 하는 함수 */            
            function setMypointAttributeFirstLoding() {
                if ("False" == "True" || "False" == "true") {
                    mypointYN = true;
                }
                
                if ("False" == "True" || "False" == "true") {
                    mypointPaneltyYN = true;
                }

                if ("False" == "True" || "False" == "true") {
                    mypointShowViewYN = true;
                }                                
            }
                        
            /* 내가 쓴평점이 있는지 전영변수 세팅 및 체크 하는 함수 */
            function setMypointAttribute() {                
                var movieIdx = "88228";
                app.movie().getCommentMy({'movieIdx': parseInt(movieIdx)}, callback);

                function callback(result) 
                {                    
                    if(!result || result.length < 1) {
                        mypointYN = false;
                        return false;
                    }

                    //패널티 회원인지 여부
                    if (result["IsViewer"] && result["IsShowView"] && !result["IsNormal"]) {
                        mypointPaneltyYN = true;     //내평점 패널티
                    }else {
                        mypointPaneltyYN = false;     //내평점 패널티
                    }

                    //실관람객인지 여부
                    if (result["IsShowView"]) {
                        mypointShowViewYN = true;     //실관람객
                    }else {
                        mypointShowViewYN = false;     //비실관람객
                    }

                    mypointYN = true;
                }
            }
            
            //2014.12 스포일러 신고 ico_spoiler
             $(document).on("click", ".ico_spoiler", function() {
                var obj = $(this);
                var objLiComment = $("li[id*='liCommentFirst" + obj.attr('data-CommentIdx') + "']");

                var nowSPOILERCNTValue = objLiComment.attr('data-SPOILERCNT');
                var movieIdx = "88228";

                if (obj.attr('data-isMySpoiler') == "True" || obj.attr('data-isMySpoiler') == "true") {   
                    /* 스포일러 신고 취소 */

                    if( confirm("스포일러 신고를 취소하시겠습니까?") ) 
                    {
                        app.movie().setCommentSpoilerDelete(JSON.stringify({ 'commentIdx': parseInt(obj.attr('data-CommentIdx')), 'movieIdx':parseInt(movieIdx) }), callbackSpoilerDelete);
                        function callbackSpoilerDelete(result) {
                            var resultCode = result.resultCode;
                            switch(resultCode)
                            {
                                case "-1":
                                    app.goLogin();
                                    break;
                                case "0":   
                                    alert("시스템 오류 입니다.");
                                    break;
                                case "1":
                                    alert("신고가 취소되었습니다.");           
                                    obj.find('span').html('스포일러 신고');
                                    obj.attr('data-isMySpoiler', 'Fales');   
                            
                                    objLiComment.attr('data-SPOILERCNT', Number(nowSPOILERCNTValue) - 1);
                                    if (  Number(objLiComment.attr('data-SPOILERCNT')) >= 2 ) {
                                        objLiComment.children('a').addClass("hide");
                                        objLiComment.attr("class", "user_spolier");
                                    }else {
                                        objLiComment.attr("class", ""); 
                                
                                    }
                                                                                                  
                                    break;
                                default:
                                    alert(resultCode);
                                    break;
                            }
                        }
                    }
                }else {
                    /* 스포일러 신고 */
                    if( confirm("평점 내용에 스포일러가 포함되어 있습니까?") ) 
                    {
                        app.movie().setCommentSpoilerInsert(JSON.stringify({ 'commentIdx': parseInt(obj.attr('data-CommentIdx')), 'movieIdx':parseInt(movieIdx) }), callbackSpoilerInsert);
                
                        function callbackSpoilerInsert(result) {
                            var resultCode = result.resultCode;
                            switch(resultCode)
                            {
                                case "-1":
                                    app.goLogin();
                                    break;
                                case "0":   
                                    alert("시스템 오류 입니다.");
                                    break;
                                case "1":
                                    alert("신고가 접수되었습니다.\n내용 확인 후 반영하도록 하겠습니다.");                            
                                    obj.find('span').html('스포일러 신고 취소');
                                    obj.attr('data-isMySpoiler', 'True');
                                    objLiComment.attr('data-SPOILERCNT', Number(nowSPOILERCNTValue) + 1);
                                    if (  Number(objLiComment.attr('data-SPOILERCNT')) >= 2 && Number(objLiComment.attr('data-REPORTCNT')) >= 2  ) {
                                        objLiComment.children('a').removeClass("hide");
                                        objLiComment.attr("class", "user_spolierswear") 
                                    }else if (  Number(objLiComment.attr('data-SPOILERCNT')) >= 2 ) {
                                        objLiComment.children('a').removeClass("hide");
                                        objLiComment.attr("class", "user_spolier") 
                                    }else if (  Number(objLiComment.attr('data-REPORTCNT')) >= 2 ) {
                                        objLiComment.children('a').removeClass("hide");
                                        objLiComment.attr("class", "user_swearword") 
                                    }
                                    break;
                                case "-2":
                                    alert("이미 신고 하였습니다.");
                                    break;
                                default:
                                    alert(resultCode);
                                    break;
                            }
                        }
                    }
                }
            
            });


            //2014.12 욕설/비방 신고 ico_swearword
             $(document).on("click", ".ico_swearword", function() {
                var obj = $(this);
                var objLiComment = $("li[id*='liCommentFirst" + obj.attr('data-CommentIdx') + "']");
            
                var nowREPORTCNTValue = objLiComment.attr('data-REPORTCNT');
                var movieIdx = "88228";

                if (obj.attr('data-IsMyREPORT') == "True" || obj.attr('data-IsMyREPORT') == "true") {   
                    /* 욕설/비방 신고 취소 */
                    if( confirm("욕설/비방 신고를 취소하시겠습니까?") ) 
                    {
                        app.movie().setCommentReportDelete(JSON.stringify({ 'commentIdx': parseInt(obj.attr('data-CommentIdx')), 'movieIdx':parseInt(movieIdx) }), callbackReportDelete);
                        function callbackReportDelete(result) {
                            var resultCode = result.resultCode;
                            switch(resultCode)
                            {
                                case "-1":
                                    app.goLogin();
                                    break;
                                case "0":   
                                    alert("시스템 오류 입니다.");
                                    break;
                                case "1":
                                    alert("신고가 취소되었습니다.");           
                                    obj.find('span').html('욕설/비방 신고');
                                    obj.attr('data-IsMyREPORT', 'Fales');   
                            
                                    objLiComment.attr('data-REPORTCNT', Number(nowREPORTCNTValue) - 1);
                                    if (  Number(objLiComment.attr('data-REPORTCNT')) >= 2 ) {
                                        objLiComment.children('a').addClass("hide");
                                        objLiComment.attr("class", "user_swearword");
                                    }else {
                                        objLiComment.attr("class", ""); 
                                
                                    }
                                                                                                  
                                    break;
                                default:
                                    alert(resultCode);
                                    break;
                            }
                        }
                    }
                }else {
                    /* 욕설/비방 신고 */
                    if( confirm("평점 내용에 욕설/비방성 내용이 포함되어 있습니까?") ) 
                    {
                        app.movie().setCommentReportInsert(JSON.stringify({ 'commentIdx': parseInt(obj.attr('data-CommentIdx')), 'movieIdx':parseInt(movieIdx) }), callbackReportInsert);
                
                        function callbackReportInsert(result) {
                            var resultCode = result.resultCode;
                            switch(resultCode)
                            {
                                case "-1":
                                    app.goLogin();
                                    break;
                                case "0":   
                                    alert("시스템 오류 입니다.");
                                    break;
                                case "1":
                                    alert("신고가 접수되었습니다.\n내용 확인 후 반영하도록 하겠습니다.");                            
                                    obj.find('span').html('욕설/비방 신고 취소');
                                    obj.attr('data-IsMyREPORT', 'True');
                                    objLiComment.attr('data-REPORTCNT', Number(nowREPORTCNTValue) + 1);

                                    if (  Number(objLiComment.attr('data-SPOILERCNT')) >= 2 && Number(objLiComment.attr('data-REPORTCNT')) >= 2  ) {
                                        objLiComment.children('a').removeClass("hide");
                                        objLiComment.attr("class", "user_spolierswear") 
                                    }else if (  Number(objLiComment.attr('data-SPOILERCNT')) >= 2 ) {
                                        objLiComment.children('a').removeClass("hide");
                                        objLiComment.attr("class", "user_spolier") 
                                    }else if (  Number(objLiComment.attr('data-REPORTCNT')) >= 2 ) {
                                        objLiComment.children('a').removeClass("hide");
                                        objLiComment.attr("class", "user_swearword") 
                                    }
                                    break;
                                case "-2":
                                    alert("이미 신고 하였습니다.");
                                    break;
                                default:
                                    alert(resultCode);
                                    break;
                            }
                        }
                    }                                           
                }
            
            });                                         

            //2014.12 좋아요버튼 n
            $(document).on("click", ".point_like", function() {
                
                var obj = $(this);
                
                var nowLikeValue = obj.find('#idLikeValue').html();
                var movieIdx = "88228";
                
                if (obj.attr('data-isMyGood') == "True" || obj.attr('data-isMyGood') == "true") {   
                    /*추천 제거 하기 */
                    app.movie().setCommentGoodDelete(JSON.stringify({ 'commentIdx': parseInt(obj.attr('data-CommentIdx')) }), callbackDelete);
                    function callbackDelete(result) {
                        var resultCode = result.resultCode;

                        switch(resultCode)
                        {
                            case "-1":
                                app.goLogin();
                                break;
                            case "0":   
                                alert("시스템 오류 입니다.");
                                break;
                            case "1":
                                alert("추천을 취소하였습니다.");

                                // 1page이면 0 또는 1 값이 온다
                                if (myPointPage == "0" || myPointPage == "1") {                 
                                    $("span[id*='" + obj.attr('id') + "']").find('#idLikeValue').html(Number(nowLikeValue) - 1);
                                    $("span[id*='" + obj.attr('id') + "']").find('img').attr('src', 'http://img.cgv.co.kr/R2014/images/point/ico_point_default.png');
                                    $("span[id*='" + obj.attr('id') + "']").attr('data-isMyGood', 'False');    
                                }else {
                                    obj.find('#idLikeValue').html(Number(nowLikeValue) - 1);
                                    obj.find('img').attr('src', 'http://img.cgv.co.kr/R2014/images/point/ico_point_default.png');
                                    obj.attr('data-isMyGood', 'False');
                                }
                            
                                break;
                            case "-2":
                                alert("추천 하지 않은 글 입니다.");
                                break;
                            default:
                                alert(resultCode);
                                break;
                        }
                    }
                }else {                         
                    /*추천 하기 */
                    app.movie().setCommentGoodInsert(JSON.stringify({ 'commentIdx': parseInt(obj.attr('data-CommentIdx')), 'movieIdx':parseInt(movieIdx) }), callbackInsert);
                    function callbackInsert(result) {
                        var resultCode = result.resultCode;

                        switch(resultCode)
                        {
                            case "-1":
                                app.goLogin();
                                break;
                            case "0":   
                                alert("시스템 오류 입니다.");
                                break;
                            case "1":
                                alert("추천하였습니다.");
                                
                                // 1page이면 0 또는 1 값이 온다
                                if (myPointPage == "0" || myPointPage == "1") {                 
                                    $("span[id*='" + obj.attr('id') + "']").find('#idLikeValue').html(Number(nowLikeValue) + 1);
                                    $("span[id*='" + obj.attr('id') + "']").find('img').attr('src', 'http://img.cgv.co.kr/R2014/images/point/ico_point_like.png');
                                    $("span[id*='" + obj.attr('id') + "']").attr('data-isMyGood', 'True');                                  
                                }else {
                                    obj.find('#idLikeValue').html(Number(nowLikeValue) + 1);
                                    obj.find('img').attr('src', 'http://img.cgv.co.kr/R2014/images/point/ico_point_like.png');
                                    obj.attr('data-isMyGood', 'True');
                                }
                                break;
                            case "-2":
                                alert("이미 추천하였습니다.");
                                break;
                            case "-3":
                                alert("'좋아요'는 영화를 관람하신\n고객님께 제공되는 기능입니다.");
                                break;
                            default:
                                alert(resultCode);
                                break;
                        }
                    }
                }
            });

            //2014.12 삭제버튼 n
            $(document).on("click", ".ico_delete", function() {
                removePointComment($(this));
            });
        
            
            $(document).on("click", ".btn_edit", function() {
                $('.btn_edit').removeClass('on');
                $(this).toggleClass('on');
                $('.btn_notify').removeClass('on');
                return false;
            });

            
            $(document).on("click", ".btn_notify", function() {
                $(this).toggleClass('on');
                $('.btn_edit').removeClass('on');
                return false;
            });

            
            $(document).on("click", ".screen_spoiler", function() {
                $(this).addClass('hide');
                return false;
            });

            
            $(document).click(function() {
                $('.btn_edit').removeClass('on');
                $('.btn_notify').removeClass('on');
            });                
            
            //평점목록 Filtering
            $('#sortTab .sortTab').on('click', function () {
                if(!$(this).hasClass("on")){
                   $('#sortTab').find('.sortTab').removeClass("on");
                    $(this).addClass("on");
                    var orderType = $(this).attr('data-order-type');
                    searchPointList(1, true, 1, orderType);
                } 
                
            });
            
            //모바일버전 가기
            $('.go-mobile').on('click', function() {
                location.replace(updateQueryStringParameter(location.href, "IsMobile", "N"));
                return false;
            });

			// 회원 평점 모아보기 레이어팝업
			$('.writerinfo .writer-name a').on('click', function () {
				return;
                var $std = $(this),
				options = {
					'$target': $std,
					'type': 'center',
					'html': $('#view_memberGrade').html(),
					'mask': 'none'
				};
				app.instWin.add(options);
                return false;
			});
            
			// 평점 작성하기 레이어팝업
			$('.link-gradewrite').on('click', function () {
                var movObj = app.movie();
                
                if (!movObj.GetWatchingMovieCheck) {
                    movObj.GetWatchingMovieCheck = function (data, callback, error) {
                        var url = '/common/ajax/point.aspx/GetWatchingMovieCheck';
                        app.ajax().set({ dataType: 'json', url: url, data: data, contentType: "application/json; charset=utf-8", successHandler: callback });
                    }
                };
               
                movObj.GetWatchingMovieCheck(JSON.stringify({ 'MovieIdx': 88228 }), GetWatchingMovieCheckCallback);
          
				return false;
                
			});
            
            function GetWatchingMovieCheckCallback(result){
                var resultCode = result.resultCode;
                    //0:영화 인덱스 없을때, 1:이미 등록회원, 2:실관람객, 3 : 실관람객이 아닌때
                    switch (resultCode) {
                        case "-1":
                            app.goLogin();
                            break;
                        case "0":
                            //addData(isChecked);
                            app.goLogin();
                            break;
                        case "1":
                            if( confirm("이미 관람평 작성을 완료하셨습니다.\n관람평을 수정하시겠습니까?") ) {
                                if($(".modifyCommentDummy").length == 1) {
                                    $(".modifyCommentDummy").click();
                                }
                            }
                            break;
                        case "2":
                            var $std = $(this);
				            commentOptions = {
					            '$target': $std,
					            'type': 'center',
					            'html': $('#writeGrade').html(),
					            'independence': true,
					            'mask': 'none'
				            };
                            var isLogin = app.config('isLogin');
                            if(isLogin){
                                app.instWin.add(commentOptions);
                                likeOrNot() ;
                                RegPop();
                            }else{
                                app.goLogin();
                            }
                            break;
                        case "3":
                            if( confirm("실관람객에 한하여 관람평 작성이 가능합니다.\n실관람객 등록 페이지로 이동하시겠습니까?") ) {
                                location.href="/user/movielog/watched.aspx";
                            }
                            
                            break;
                        default:
                            alert(resultCode);
                            break;
                    }
            }
            
            function RegPop(){
                $('#textReviewContent').count({
                    useMember: true,
                    callback: function (c) {
                        $('#text_count').text(c);
                    }
                });
                $('#regTitle').html('데드풀과 울버린');
                
                $('#defaultEggPoint').addClass('on');
                $('#regBtn').on('click', function () {
                    
                    var textReviewContent = $('#textReviewContent').val();

                    textReviewContent = textReviewContent.replace(/^\s+/, "");
                    textReviewContent = textReviewContent.replace(/\s+$/g, "");
                    textReviewContent = textReviewContent.replace(/\n/g, "");
                    textReviewContent = textReviewContent.replace(/\r/g, "");

                    if (textReviewContent == "") {
                        alert("내용을 입력하지 않았습니다.");
                        $('#textReviewContent').focus();
                        return;
                    }

                    // 2018.04.26 박인선 실관람평 10자 미만 등록불가
                    if (textReviewContent.replace(/\s*/g,"").length < 10) {
                        alert("문자를 포함하여 10자 이상(공백 제외) 작성하셔야 등록됩니다.");
                        $('#textReviewContent').focus();
                        return;
                    }

                    // [2015-12-08]평점 개편 이후 실관람객 공개 체크 삭제(무조건 true)
                    var isChecked = true;                                                            

                    app.movie().getViewUser({ 'movieIdx': '88228', 'isOpenView': isChecked }, callback); /*[2015-12-09]실관람객여부 체크 시 진짜 인지를 확인 & 이미 평점을 작성한 적이 있는지 확인. : upt_mwpark*/

                    function callback(result) {
                        var resultCode = result.resultCode;
                        if(resultCode.indexOf("이미 작성하셨습니다") > 0) {
                            resultCode = "해당 영화에 대한 관람평을 이미 작성하셨습니다.\n관람평은 영화당 1회만 작성할 수 있습니다.\n수정을 원하는 경우 관람평수정 기능을 이용해주시기 바랍니다.";
                           
                        }
                        switch (resultCode) {
                            case "-1":
                                alert("로그인이 필요한 서비스 입니다");
                                break;
                            case "0":
                                addData(isChecked);
                                break;
                            case "1":
                                if( confirm("실관람객에 한하여 관람평 작성이 가능합니다.\n실관람객 등록 페이지로 이동하시겠습니까? ") ) {
                                    location.href="/user/movielog/watched.aspx";
                                }
                                break;
                            default:
                                alert(resultCode);
                                break;
                        }
                    }
                   
                    return false;
                });
            }

            
			function likeOrNot() {
				$('.likebox label').on('click', function () {
					var $wrap = $(this).parents('.likebox');
					$wrap.siblings().removeClass('on');
					$wrap.addClass('on');
				});

				$('.likebox input').on('focusin', function() {
					var $wrap = $(this).parents('.likebox');
					$wrap.siblings().removeClass('on');
					$wrap.addClass('on');
				});

				$('#viewpopup').on('click', function () {
					var $std = $(this),
					options = {
						'$target': $std,
						'type': 'center',
						'html': $('#temp_view').html(),
						'independence': true,
						'mask': 'none'
					};
					app.instWin.add(options);
                    
					return false;
				});
                $("#regLayerClose").on("click", function () {                    
                    $('.layer-wrap').remove();
                 });
               
			}
            
            /*[2015-12-09]평점 등록 로직. start : upt_mwpark*/
        //평점 등록
        function addData(isChecked) {
           
            var isCJOneMember = "False";
            if (isCJOneMember == "False") {
                if (confirm("고객님은 CJONE 온라인 통합회원이 아니십니다.\n'실관람객 리뷰' 포인트 적립을 원하시면\nCJ ONE 온라인통합회원으로 전환부탁드립니다.") == true) {
                    window.open("https://www.cjone.com/cjmweb/join.do?coopco_cd=7010&brnd_cd=1000", "_newtab");
                    return false;
                }
            }

            //이벤트가 있을 시 eventIdx 에 Event Idx  값 넣기
            
            var EggPoints = 0;
            if($('#defaultEggPoint').hasClass("on")){
               EggPoints = 2;
            }
            if($('#notEggPoint').hasClass("on")){
               EggPoints = 1;
            }
            
            var defaults = {
                'flag': 'M',
                'idx': '88228',
                'textReviewContent': $('#textReviewContent').val(),
                'open_info': true,     // [2015-12-09] 평점 개편 이후 isCheked 는 항상 true
                'chk_facebook': false,      // 페이스북 연동 기능 삭제
                'chk_twitter': false,       // 트위터 연동 기능 삭제
                'rdo_User': 1,
                'addUserType': '',
                'point': '',  /*[2015-12-08]평점 개편 이후 point 사용 안함 : del_mwpark*/
                'eventIdx': 0,
                'url': escape(location.href),
                'eggPoint' : EggPoints /*[2015-12-08]등록시 eggPoint 파라미터 추가. : add_mwpark*/
            };

            app.movie().setPointReview(JSON.stringify(defaults), resultCallback);   /*[2015-12-09] 평점 등록 프로시저. : upt_mwpark*/
            setMypointAttribute();            
            function resultCallback(result) {
                switch (result.resultCode) {
                    case "-1":
                        app.goLogin();
                        break;
                    case "-2":
                        alert("올바르게 데이타가 입력되지 않았습니다.");
                        break;
                    case "-3":
                        alert(result.resultTitle);
                        break;
                    case "0":
                        if (confirm("관람평이 등록되었습니다.\n임직원의 경우 실관람평 작성 포인트는 지급되지 않습니다.\n관람하신 영화의 [관람 포인트]를\n선택하시겠습니까?") ){    //확인
                            $('.layer-wrap').remove();
                            charmPointPop(result.resultIndex);
                        }else{   //취소
                            $('.layer-wrap').remove();
                            location.reload();
                        }
                        break;
                    case "01":/*[2015-12-09]평점 개편 이후 지급 포인트 및 관람일로부터 14일 => 7일 로 변경. start : upt_mwpark*/
                        if (confirm("관람일 포함 7일 이내 관람평이 등록되어\nCJ ONE 20P가 지급되었습니다.\n관람하신 영화의 관람 포인트를\n선택해주시면 30P를 추가 지급해드립니다.\n\n포인트는 최초 1회만 지급됩니다.") ){    //확인
                            $('.layer-wrap').remove();
                            charmPointPop(result.resultIndex);
                        }else{   //취소
                            $('.layer-wrap').remove();
                            location.reload();
                        }
                        break;
                    //아트하우스
                    case "02":
                        if (confirm("관람일 포함 7일 이내 관람평이 등록되어\nCJ ONE 30P가 지급되었습니다.\n(아트하우스 Club 회원 추가 10P 적립 포함)\n관람하신 영화의 관람 포인트를\n선택해주시면 30P를 추가 지급해드립니다.\n\n포인트는 최초 1회만 지급됩니다.") ){    //확인
                            $('.layer-wrap').remove();
                            charmPointPop(result.resultIndex);
                        }else{   //취소
                            $('.layer-wrap').remove();
                            location.reload();
                        }                       
                        break;
                    case "3":if (confirm("관람평이 등록되었습니다.\n임직원의 경우 실관람평 작성 포인트는 지급되지 않습니다.\n관람하신 영화의 [관람 포인트]를\n선택하시겠습니까?")){
                            $('.layer-wrap').remove();
                            charmPointPop(result.resultIndex);
                        }else{   //취소
                            $('.layer-wrap').remove();
                            location.reload();
                        }                        
                        break;
                    case "4":
                        alert("작성글이 등록 되었습니다.\n고객님은 최초 1회 <" + result.resultTitle + "> 실관램객 리뷰 작성이 " + result.resultData  + " 에 이미 참여 하셨습니다.");                       
                        break;
                    case "":
                        alert("등록 중 오류가 발생 되었습니다.");
                        break;
                    default:
                        alert(result.resultCode);
                        break;
                }
            }
        }       
        });
    })(jQuery);
//]]>
</script>
<!--[2015-12-15] 평점 수정 레이어 팝업 템플릿 start : add_mwpark-->
<script type="text/x-jquery-tmpl" id="Script2">
	<div class="layer-contents on-shadow" style="width:710px;" id="my-list-uptLayer">
		<div class="popup-general">
			<div class="popwrap">
				<h1>평점수정</h1>
				<div class="pop-contents write-mygrade">
					<div class="mygrade-cont">
						<div class="movietit"><strong>${MovieTitle}</strong></div>
						<div class="likeornot">
							<div class="writerinfo">
								<div class="box-image">
									<span class="thumb-image">   
										<img src="${UserSmallImage}" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})">                                            
										<span class="profile-mask"></span>
									</span>
								</div>
							
								<span class="round red on"><span class="position"><em class="see">실관람객</em></span></span>
								<span class="writer-name">${UserIdNicName}</span>
							</div>
                            
                            <div class="likebox t1{{if EggPoint == 2}} on{{/if}}">
								<div class="likebox-inner">
									<label for="likeornot1-1">
										<span class="egg-icon good">
                                            <input type="radio" name="likeornot1" id="likeornot1-1" value="2"{{if EggPoint == 2}} checked{{/if}}/>
										</span>
										<span class="txt">좋았어요~^^</span>
									</label>
								</div>
							</div>
                            
                            <div class="likebox t2{{if EggPoint == 1}} on{{/if}}">                            
								<div class="likebox-inner">
									<label for="likeornot1-2">
										<span class="egg-icon">
											<input type="radio" name="likeornot1" id="likeornot1-2" value="1"{{if EggPoint == 1}} checked{{/if}}/>
										</span>
										<span class="txt">흠~좀 별로였어요;;;</span>
									</label>
								</div>
							</div>
						</div>

						<div class="textbox">
							<textarea cols="" rows="" id="my-list-commentTextArea" maxlength="280" required="required" data-title="평점" data-message="작성글이 입력되지 않았습니다.">${CommentText}</textarea>
						</div>

						<div class="footbox">
							<span class="role">
								<a id="viewpopup" title="새창" href="#" target="_blank">운영원칙 <img src="http://img.cgv.co.kr/R2014/images/common/ico/ico-question-mark.png" alt="?"></a>
							</span>
							
							<div class="rbox">
								<span class="count"><strong id="text_count">0</strong>/280(byte)</span>
								<button type="button" class="round red on" id="my-list-uptBtn"><span>작성완료!</span></button>
							</div>
						</div>

					</div>
					
				</div>
				<button type="button" class="btn-close" id="my-list-uptCloseBtn">평점수정 팝업 닫기</button>
			</div>
		</div>
        <input type="hidden" id="my-list-commentIdx" value="${CommentIdx}"/>
        <input type="hidden" id="my-list-movieIdx" value="${MovieIdx}"/>
        <input type="hidden" id="my-list-withviewcnt" value="${withviewcnt}"/>
        <input type="hidden" id="my-list-withviewer" value="${withviewer}"/>
	</div>
</script>
<!--[2015-12-15] 평점 수정 레이어 팝업 템플릿 end : add_mwpark-->

<!-- 2020.05.07 추가 실관람평 > 관람 포인트 선택 수정 -->
<script id="Script4" type="text/x-jquery-tmpl">
<div class="layer-wrap" id="my-list-charmLayer" style="width:0px; top:0px;">
    <div class="popwrap" style="width:516px;margin-top:0px;margin-left:-268px">
        <h1>관람 포인트 선택</h1>
        <div class="pop-contents">
            <!-- Contents Addon -->
            <div class="movie-emotion-select">
                <div class="header">
                    <p class="main">이 영화의 관람 포인트를 선택해주세요!</p>
                    <p class="sub"><span>중복선택</span>이 가능합니다.</p>
                </div>
                <div class="box">
                    <div class="name">
                        매력 포인트
                    </div>
                    <div class="wrap_input">
                        <label><input type="checkbox" name="charm1" id="effect" {{if Effect == "Y"}} checked {{/if}}><span>감독연출</span></label>
                        <label><input type="checkbox" name="charm2" id="story" {{if Story == "Y"}} checked {{/if}}><span>스토리</span></label>
                        <label><input type="checkbox" name="charm3" id="visual" {{if Visual == "Y"}} checked {{/if}}><span>영상미</span></label>
                        <label><input type="checkbox" name="charm4" id="acting" {{if Acting == "Y"}} checked {{/if}}><span>배우연기</span></label>
					    <label><input type="checkbox" name="charm5" id="ost" {{if OST == "Y"}} checked {{/if}}><span>OST</span></label>
                    </div>
                </div>
                <div class="box">
                    <div class="name">
                        감정 포인트
                    </div>
                    <div class="wrap_input">
                        <label><input type="checkbox" name="emotion1" id="emotion1"{{if Emotion1 == "Y"}} checked {{/if}}><span>${Emotion1Text}</span></label>
                        <label><input type="checkbox" name="emotion2" id="emotion2"{{if Emotion2 == "Y"}} checked {{/if}}><span>${Emotion2Text}</span></label>
                        <label><input type="checkbox" name="emotion3" id="emotion3"{{if Emotion3 == "Y"}} checked {{/if}}><span>${Emotion3Text}</span></label>
                        <label><input type="checkbox" name="emotion4" id="emotion4"{{if Emotion4 == "Y"}} checked {{/if}}><span>${Emotion4Text}</span></label>
                        <label><input type="checkbox" name="emotion5" id="emotion5"{{if Emotion5 == "Y"}} checked {{/if}}><span>${Emotion5Text}</span></label>
                    </div>
                </div>
            </div>
            <!-- //Contents Addon -->
            <div class="set-btn fix-width">
                <button type="submit" id="my-list-charmBtn" class="round inred"><span>확인</span></button>
            </div>
            <input type="hidden" id="charmGenre_SMS1" value="${Genre_SMS1}" />
            <input type="hidden" id="my-list-charmMovieIdx" value="${MovieIdx}" />
        </div>
        <button type="button" class="btn-close" id="my-list-charmCloseBtn">관람 포인트 선택 팝업 닫기</button>
    </div>
</div>
<!-- //관람 포인트 선택 팝업 -->
</script>

<script type="text/javascript">
// 2020.05.07 관람 포인트 선택시 기존값 조회(수정)
function GetCharm(commentIdx) {
    var charmObj = app.movie();
    if (!charmObj.GetCharmPoint) {
        charmObj.GetCharmPoint = function (data, callback, error) {
            var url = '/common/ajax/point.aspx/GetCharmPoint_AddEmotion';
            app.ajax().set({ dataType: 'json', url: url, data: data, contentType: "application/json; charset=utf-8", successHandler: callback });
        }

    };
    charmObj.GetCharmPoint(JSON.stringify({ 'commentIdx': commentIdx }), resultCharmCallback);
    //결과
    function resultCharmCallback(result) {
        charmPointPop2(result);
    };
};

// 2020.05.07 관람 포인트 선택 수정 팝업 노출
function charmPointPop2(result) {
    result.MovieIdx = 88228;
    var $std = $(this),
    options = {
        '$target': $std,
        'type': 'center',
        'html': $('#Script4').tmpl(result),
        'mask': 'none'
    };
    app.instWin.add(options);
    charmLayerSetting(result.CommentIdx);
    return false;
}

// 2020.05.07 관람 포인트 선택 팝업 셋팅
function charmLayerSetting(commentIdx) {
    var comIdx = commentIdx;
    //관람 포인트 수정 버튼.
    $("#my-list-charmBtn").on("click", function () {
        var charmObj = {};
        charmObj.acting = "N";
        charmObj.story = "N";
        charmObj.visual = "N";
        charmObj.ost = "N";
        charmObj.effect = "N";
        charmObj.emotion1 = "N";
        charmObj.emotion2 = "N";
        charmObj.emotion3 = "N";
        charmObj.emotion4 = "N";                    
        charmObj.emotion5 = "N";
        charmObj.genre_sms1 = $("#charmGenre_SMS1").val();

        if (charmObj.genre_sms1 == "") {
            alert("관람 포인트를 다시 등록해 주세요.");
            return false;
        }

        if ($("#effect").prop("checked")) {
            charmObj.effect = "Y";
        }
        if ($("#story").prop("checked")) {
            charmObj.story = "Y";
        }
        if ($("#visual").prop("checked")) {
            charmObj.visual = "Y";
        }
        if ($("#acting").prop("checked")) {
            charmObj.acting = "Y";
        }
        if ($("#ost").prop("checked")) {
            charmObj.ost = "Y";
        }
        if ($("#emotion1").prop("checked")) {
            charmObj.emotion1 = "Y";
        }
        if ($("#emotion2").prop("checked")) {
            charmObj.emotion2 = "Y";
        }
        if ($("#emotion3").prop("checked")) {
            charmObj.emotion3 = "Y";
        }
        if ($("#emotion4").prop("checked")) {
            charmObj.emotion4 = "Y";
        }
        if ($("#emotion5").prop("checked")) {
            charmObj.emotion5 = "Y";
        }

        if(charmObj.effect == 'N' && charmObj.story == 'N' && charmObj.visual == 'N' && charmObj.acting == 'N' && charmObj.ost == 'N'){
            alert("매력 포인트를 1개 이상 선택해주세요.");
            return;
        }

        if (charmObj.emotion1 == "N" && charmObj.emotion2 == "N" && charmObj.emotion3 == "N" && charmObj.emotion4 == "N" && charmObj.emotion5 == "N") {
            alert("감정 포인트를 1개 이상 선택해주세요.");
            return;
        }  
        
        charmingEdit(comIdx, charmObj);
    });

    // 영화매력 레이어 팝업 닫기버튼.
    $("#my-list-charmCloseBtn").on("click", function () {
        location.reload();
        $("#my-list-charmLayer").remove();
    });
};

/* 2020.05.07 관람 포인트 선택 팝업 수정*/
function charmingEdit(commentIdx, charmObj) {
    var movObj = app.movie();
    if (!movObj.setCharmEdit) {
        movObj.setCharmEdit = function (data, callback, error) {
            var url = '/common/ajax/point.aspx/setCharm_AddEmotion';
            app.ajax().set({ dataType: 'json', url: url, data: data, contentType: "application/json; charset=utf-8", successHandler: callback });
        }

    };
    movObj.setCharmEdit(JSON.stringify({ 'commentIdx': commentIdx
                                                        , 'movieIdx': Number($("#my-list-charmMovieIdx").val())
                                                        , 'acting': charmObj.acting
                                                        , 'story': charmObj.story
                                                        , 'visual': charmObj.visual
                                                        , 'ost': charmObj.ost
                                                        , 'effect': charmObj.effect
                                                        , 'genre_sms1': charmObj.genre_sms1
                                                        , 'emotion1': charmObj.emotion1
                                                        , 'emotion2': charmObj.emotion2
                                                        , 'emotion3': charmObj.emotion3
                                                        , 'emotion4': charmObj.emotion4
                                                        , 'emotion5': charmObj.emotion5
    }), resultCharmingCallback);

    //결과
    function resultCharmingCallback(result) {
        switch (result.resultCode) {
            case "1":
                alert("수정이 완료되었습니다.");
                layerAllClose();
                location.reload();
                break;
            case "-1":
                alert("등록 중 오류가 발생 되었습니다.");
                break;
            default:
                alert(result.resultCode);
                break;
        }
    }
}

    //레이어 팝업 전체 닫기
    function layerAllClose() {
        $("#my-list-uptLayer").remove();
        $("#my-list-charmLayer").remove();
    };

</script>

<script type="text/javascript">
//<![CDATA[
//     (function ($) {
//         $(function () {
//             var isLogin = app.config('isLogin');

//             // 평점 삭제하기 클릭 event
//             $('.btn-delete').on('click', function () {
//                 removePointComment($(this).attr('data'), $(this).attr('midx'));
//                 return false;
//             });

//             // 실관람평 수정(작성하기를 클릭하였으나, 이미 작성한 관람평이 있을경우)
//             $(document).on("click", ".modifyCommentDummy", function () {
//                 var movieIdx = 88228;
//                 var $std = $(this);
//                 app.movie().getCommentMy({ 'movieIdx': parseInt(movieIdx) }, getCommentResult);
                
//                 function getCommentResult(result) {

//                     options = {
//                         '$target': $std,
//                         'type': 'center',
//                         'html': $("#Script2").tmpl(result),
//                         'independence': true,
//                         'mask': 'none'
//                     };
//                     app.instWin.add(options);
//                     updateLayerSetting();
//                     return false;
//                 }
//             });

//             /*[2015-12-15] 평점 수정 레이어 팝업 start : add_mwpark*/
//             $(document).on("click", ".ico_edit", function () {
                
//                 var movieIdx = 88228;
//                 var $std = $(this);
//                 app.movie().getCommentMy({ 'movieIdx': parseInt(movieIdx) }, getCommentResult);
                
//                 function getCommentResult(result) {
//                     options = {
//                         '$target': $std,
//                         'type': 'center',
//                         'html': $("#Script2").tmpl(result),
//                         'independence': true,
//                         'mask': 'none'
//                     };
//                     app.instWin.add(options);
//                     updateLayerSetting();
//                     return false;
//                 }
//             });
//             /*[2015-12-15] 평점 수정 레이어 팝업 end : add_mwpark*/

//             /*[2015-12-15]레이어 팝업 띄운 후 이벤트 및 각종 설정 처리. start : add_mwpark*/
//             function updateLayerSetting() {
//                 // 가져온 comment text 의 바이트 수 보이기.
//                 $('#text_count').text(fnTextLength($("#my-list-commentTextArea").val()));

//                 //글자 입력시 바이트 수 반영. 
//                 $('#my-list-commentTextArea').count({
//                     useMember: true,
//                     callback: function (c) {
//                         $('#text_count').text(c);
//                     }
//                 });
               
//                 // 평점 수정 버튼 클릭
//                 $("#my-list-uptBtn").on("click", function () {

//                     var textReviewContent = $('#my-list-commentTextArea').val();

//                     textReviewContent = textReviewContent.replace(/^\s+/, "");
//                     textReviewContent = textReviewContent.replace(/\s+$/g, "");
//                     textReviewContent = textReviewContent.replace(/\n/g, "");
//                     textReviewContent = textReviewContent.replace(/\r/g, "");

//                     if (textReviewContent == "") {
//                         alert("내용을 입력하지 않았습니다.");
//                         $('#my-list-commentTextArea').focus();
//                         return;
//                     }

//                     // 2018.04.26 박인선 실관람평 10자 미만 등록불가
//                     if (textReviewContent.replace(/\s*/g,"").length < 10) {
//                         alert("문자를 포함하여 10자 이상(공백 제외) 작성하셔야 등록됩니다.");
//                         $('#my-list-commentTextArea').focus();
//                         return;
//                     } 

//                     if (confirm("작성한 관람평을 수정하시겠습니까?")) {
//                         if (isLogin) {
//                             editData();
//                         } else {
//                             app.goLogin();
//                         }
//                     }
                    
//                     return false;
//                 });
                                
//                 /*[2015-12-15]평점 수정 start : add_mwpark*/
//                 function editData() {
//                     var eggValue = $("input:radio[name='likeornot1']:checked").val();
//                     var textReviewContent = $('#my-list-commentTextArea').val();
                
//                     textReviewContent = textReviewContent.replace(/^\s+/, "");
//                     textReviewContent = textReviewContent.replace(/\s+$/g, "");
//                     textReviewContent = textReviewContent.replace(/\n/g, "");
//                     textReviewContent = textReviewContent.replace(/\r/g, "");

//                     app.movie().setCommentEdit(JSON.stringify({ 'commentIdx': Number($("#my-list-commentIdx").val())
//                                                                                 , "commentText": textReviewContent
//                                                                                 , 'movieIdx': Number($("#my-list-movieIdx").val())
//                                                                                 , 'isShowView': "Y"
//                                                                                 , 'withViewCnt': Number($("#my-list-withviewcnt").val())
//                                                                                 , 'withViewer': $("#my-list-withviewer").val()
//                                                                                 , 'eggPoint': Number(eggValue)
//                     }), resultCallback);

//                     function resultCallback(result) {
//                         switch (result.resultCode) {
//                             case "1":
//                                 if (confirm("관람평이 수정되었습니다.\n관람하신 영화의 관람 포인트를\n선택하시겠습니까?") == false) {
//                                     $("#my-list-uptLayer").remove();
//                                     location.reload()
//                                     return;
//                                 } else {
//                                     $("#my-list-uptLayer").remove();
//                                     GetCharm(result.resultIndex);
//                                 }
//                                 break;
//                             case "0":
//                                 alert("등록 중 오류가 발생 되었습니다.");
//                                 break;
//                             case "2":
//                                 alert("문자를 포함하여 10자 이상(공백 제외) 작성하셔야 등록됩니다.");
//                                 break;
//                             case "-9999":
//                                 alert("잘못된 접근 입니다.");
//                                 break;
//                             default:
//                                 alert(result.resultCode);
//                                 break;
//                         }
//                     }
//                 } 

//                 //좋아요 , 별로에요 클릭시 빨간 테두리 on
//                 $('.likebox label').on('click', function () {
//                     var $wrap = $(this).parents('.likebox');
//                     $wrap.siblings().removeClass('on');
//                     $wrap.addClass('on');
//                 });

//                 //좋아요 , 별로에요 클릭시 빨간 테두리 on
//                 $('.likebox input').on('focusin', function () {
//                     var $wrap = $(this).parents('.likebox');
//                     $wrap.siblings().removeClass('on');
//                     $wrap.addClass('on');
//                 });

//                 //운영원칙 ? 클릭시 팝업.
//                 $('#viewpopup').on('click', function () {
//                     var $std = $(this),
// 					options = {
// 					    '$target': $std,
// 					    'type': 'center',
// 					    'html': $('#temp_view').html(),
// 					    'independence': true,
// 					    'mask': 'none'
// 					};
//                     app.instWin.add(options);
//                     return false;
//                 });

//                 /*[2015-12-15]레이어팝업 "닫음" 버튼 클릭 처리.: add_mwpark*/
//                 $("#my-list-uptCloseBtn").on("click", function () {
//                     $("#my-list-uptLayer").remove();
//                 });
//             }
//             /*[2015-12-15]레이어 팝업 띄운 후 이벤트 및 각종 설정 처리. end : add_mwpark*/

//             /*[2015-12-15]입력 글자 바이트 check start : add_mwpark*/
//             function fnTextLength(content) {
//                 var cnt = 0;
//                 var ch = '';
//                 for (var i = 0; i < content.length; i++) {
//                     ch = content.charAt(i);
//                     if (escape(ch).length > 4) {
//                         cnt += 2;
//                     } else {
//                         cnt += 1;
//                     }
//                 }
//                 return cnt;
//             }
//             /*[2015-12-15]입력 글자 바이트 end : add_mwpark*/
//         });
//     })(jQuery);

//     //2014.12 추가
//     //내가 작성한 평점 내용 불러오기 현재 now
//     function getCommentEditResult(movieIdx) {
//         app.movie().getCommentMy({ 'movieIdx': parseInt(movieIdx) }, callback);

//         function callback(result) {
//             if (!result || result.length < 1) {
//                 return false;
//             }

//             var commentText = result['CommentText'];
//             var registDate = result['registDate'];
//             var commentIdx = result['CommentIdx'];
//             var pointDb = result['Point'];
//             var isShowView = result['IsShowView'];

//             $("div[id*='" + commentIdx + "']").find('.point-on').attr('style', "width: " + pointDb + "0%;");
//             $("em[id*='" + commentIdx + "']").html(pointDb);
//             $("p[id*='" + commentIdx + "']").html(commentText);
            
//             if (isShowView) {
//                 $("li[id*='" + commentIdx + "']").find(".vr").attr('style', "display:");
//             } else {
//                 $("li[id*='" + commentIdx + "']").find(".vr").attr('style', "display:none");
//             }
//         }
//     }

//     /*회원 평점 모아보기. mwpark_RR2015*/
//     /**
//     function getPopList1(userid, nick) {

//         // 2017.07.11 화면 호출 시 POST 방식 호출 변경
//         $("#frmPointPopup").attr("target", "ifrm_movie_time_table1");
//         $("#frmPointUserId").val(userid);
//         $("#frmPointNick").val(escape(nick));
//         $("#frmPointPopup").submit();

//         $("#ifrm_movie_time_table1").show();
//     }
//     **/

//     function resizeTopIframe() {

//         $("#ifrm_movie_time_table1").hide();
//     }
//     function resizeTop(height) {
//         document.getElementById("ifrm_movie_time_table1").height = parseInt(height) + 10;
//     }
	    /*페이징 처리 추가. mwpark_RR2015 2016-02-17*/
    //function searchReviewList(page, isGetTotalCount) {
	//    if(!isGetTotalCount) { isGetTotalCount = false; }

	//    app.movie().getReviewSearchList({ 'movieIdx': 88228, 'pageIndex': page, 'pageSize': 5, 'isTotalCount' : isGetTotalCount}, setReviewListBuild);
    //}

    //function setReviewListBuild(result) {
	   // if(result == null || result.List == null || result.TotalCount  == null) {
		  //  return;
	   // }
 
	   // $("#movie_review_list_container").empty();
	   // $("#movie_review_template").tmpl(result.List).appendTo("#movie_review_list_container");
 
	    //if(result.List.length <= result.TotalCount) {
	    //	setPagingNavigation(result.TotalCount, 5, '#paging_review', '#movie_review_list_container', searchReviewList);
	    //}

	    //$('.view_review_detail_popup').on('click', function () {
	    //	getReviewDetail($(this));
	    //	return false;
	    //});

	    //$('.btn-admit').on('click', function () {
	    //	addMovieReviewCommunityAdmit($(this));
	    //});
    //}
</script>


            
            <!--/ Contents End -->
		 </div>

</body>
</html>