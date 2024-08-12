<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>information</title>
<link href="${pageContext.request.contextPath}/resources/css/movie/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/module.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/eggupdate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/preegg.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/cgv.min.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.3/dist/chart.umd.min.js"></script>

<script type="text/javascript">
function chart() {
	/* 매력차트 */
	let charm = $('#charm')[0].getContext('2d');
	var cStr = $('#charm').attr('data-charm');
	let charmData = JSON.parse(cStr);
	const charmChart = new Chart(charm, {
		 type: 'radar',
		    data: {
		        labels: Object.keys(charmData),
		        datasets: [{
		            data: Object.values(charmData),
		            backgroundColor: 'rgba(255, 99, 132, 0.2)',
		            borderColor: 'black',
		            borderWidth: 1,
		        }]
		    },
		    options: {
		        scales: {
		            r: {
		            	pointLabels: {
		                    font: {
		                        size: 14, // 레이블 폰트 크기
		                        weight: 'bold' // 폰트 두께
		                    },
// 		                    color: '#000',
		                    padding: 10
		                },
		            	ticks: {
		                    display: false
		                }
		            }
		        },
		        elements: {
		            line: {
		                tension: 0.1
		            }
		        },
		        plugins: {
		            legend: {
		                display: false
		            }
		        }
		    }
	});
	
	
	/* 감정 */
	let emotion = $('#emotion')[0].getContext('2d');
	var eStr = $('#emotion').attr('data-emotion');
	let emotionData = JSON.parse(eStr);
	const emotionChart = new Chart(emotion, {
		 type: 'radar',
		    data: {
		        labels: Object.keys(emotionData),
		        datasets: [{
		            data: Object.values(emotionData),
		            backgroundColor: 'rgba(255, 99, 132, 0.2)',
		            borderColor: 'black',
		            borderWidth: 1,
		        }]
		    },
		    options: {
		        scales: {
		            r: {
		            	pointLabels: {
		                    font: { // 레이블 폰트
		                        size: 14,
		                        weight: 'bold'
		                    },
		                    padding: 10
		                },
		            	ticks: {
		                    display: false
		                }
		            }
		        },
		        elements: {
		            line: {
		                tension: 0.1
		            }
		        },
		        plugins: {
		            legend: {
		                display: false
		            }
		        }
		    }
	});
};



$(function() {
	let num = $('.gender_graph').find('span:hidden').text().split(',');
	/* 성별 그래프 */
	var data = {
		labels: ['남', '여'],
		datasets: [{
			data: num,
			backgroundColor: ['rgb(54, 162, 235)', 'rgb(255, 99, 132)'],
			borderColor: 'white',
			borderWidth: 2
		}]
	};
	var options = {
		responsive: false,
		maintainAspectRatio: false
	};
	
	var chartDate = $('#gender')[0].getContext('2d');
	var Chartgender = new Chart(chartDate, {
			type: 'pie',
			data: data,
			options: options
	});
	/* 성별 그래프 끝 */
	
	/* 연령 그래프 */
	$('.bar').each(function() {
		$(this).css('height', $(this).find($('.percent')).text() + '%');
// 		var height = $(this).height() + 10;
// 		var height2 = $(this).height() + 5;
// 		$(this).find($('.age')).css('top', height + 'px');
// 		$(this).find($('.percent')).css('bottom', height2 + 'px');
	});
	
	$('.bar').on('transitionend', function() {
		$('.bar').each(function() {
			var height = $(this).height() + 10;
			var height2 = $(this).height() + 5;
			$(this).find($('.age')).css('top', height + 'px');
			$(this).find($('.percent')).css('bottom', height2 + 'px');
			$('.bar').find('*').show();
		});
	});
	/* 연령 그래프 끝 */
	
	//리뷰탭 차트 호출
	chart();
	
});




</script>
<style type="text/css">
.bar {
	width: 8%;
	height: 0;
	margin: 0 4% 10px;
	padding: 0;
	text-align: center;
	position: relative;
	display: flex;
	max-height: 100%;
	bottom: 10px;
}

.bar>.age, .bar>.percent {
	position: absolute;
	transform: translateX(-50%);
	left: 50%;
	padding: 0;
	margin: 0;
	color: #666;
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    display: none;
}
.bar>.age {
	font-size: 1em;
	white-space: nowrap;
	max-height: 100%;
}
.bar>.percent {
	font-size: 10.5px;
	white-space: nowrap;
}

.item>img {
	max-height: 100%;
}

.itemSect>a>img {
	width: 100%;
};



</style>



</head>
<body>
<!-- 세션 아이디 임시 저장 -->
<input hidden="" class="sessionId" value="${sessionScope.id}">


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
<!--     <h3><strong>데드풀과 울버린</strong>기본정보</h3> -->
    <div class="box-image">
        <a href="${movieDTO.posterUrl}" title="포스터 크게 보기 새창" target="_blank">
            <span class="thumb-image"> 
                <img src="${movieDTO.posterUrl}" alt="${movieDTO.title} 새창" onerror="errorImage(this)">
                <span class="ico-posterdetail">포스터 크게 보기</span>
                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                <i class="cgvIcon etc age18">${movieDTO.rating}</i>
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
<!--             <div class="egg-gage small"> -->
<!-- 		    	<span class="sprite_preegg default"></span> -->
<!-- 				<span class="percent">99%</span> -->
<!-- 			</div> -->
        </div>
        <div class="spec">
            <dl>
                <dt>감독 :&nbsp;</dt>
                <dd>
					<a href="/movies/persons/?pidx=23513">${movieDTO.direcotrNm}</a>                    
                </dd>

                <dt>&nbsp;/ 배우 :&nbsp;</dt>
                <dd class="on">
                	<!-- 배우페이지를 별개로 설계하게 된다면 주소를 따로 지정할 방법이 필요해서 for문으로 반복 삽입 -->
<%--                 	<c:forEach var="actor" items="${actorList}" varStatus="index"> --%>
                		<a href="">${movieDTO.actorNm}
<%-- 	                		<c:if test="${!index.last}"> --%>
<!-- 	                        	,&nbsp; -->
<%-- 	                        </c:if> --%>
                        </a>
<%--                     </c:forEach> --%>
                </dd>
                <dt>장르 :</dt> 
                <!-- 동일한 장르로 영화를 찾아줄 페이지를 설계하게 된다면 위처럼 forEach문 사용 -->
                <dd>${movieDTO.genre}</dd>
                <dt>&nbsp;/ 기본 정보 :&nbsp;</dt>
                <!-- 2023.04.27 영화상세 등급 표기 수정--> 
                <!--<dd class="on">18,&nbsp;상영시간,&nbsp;국가</dd>-->
                <dd class="on">${movieDTO.rating},&nbsp;${movieDTO.runtime},&nbsp;${movieDTO.nation}</dd>
                <dt>개봉 :&nbsp;</dt>
                <dd class="on">${movieDTO.releaseDate}</dd>
            </dl>
        </div>
<!-- 	프리에그 -> 찜 기능? -->
        <span class="screentype">
                <a href="#" class="imax" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a>
        </span>
        <span class="like">
<!--             2020.05.07 영화찜하기 -> 프리에그 선택 변경(조회하여 노출) -->
            <a class="link-count" href="javascript:void (0);"><i class="sprite_preegg btn_md default"></i>프리에그</a>
            <a class="link-reservation" href="/ticket/?MOVIE_CD=20037162&amp;MOVIE_CD_GROUP=20036434">예매</a> 
        </span>
    </div>
</div><!-- .sect-base -->


    <div class="cols-content" id="menu">
        <div class="col-detail">
            <ul class="tab-menu">
                <li class="on"><a href="javascript:void(0)" class="movieInfo">주요정보</a></li>            
                <li><a href="javascript:void(0)" class="movieTrailer">트레일러</a></li>
                <li><a href="javascript:void(0)" class="movieStillCut">스틸컷</a></li>
                <li><a href="javascript:void(0)" class="movieReview">평점/리뷰</a></li>               
                <li><a class="runningTime" href="javascript:void(0)">상영시간표</a></li>
            </ul>
            <div class="sect-story-movie" id="sect-story-movie">
            	${movieDTO.plot}
			</div>
            <!-- .sect-story -->
<!-- 탭 -->            
<script type="text/javascript">
$(function() {
// 	let hrefUrl = $(location).attr('href');
	
	let movieTrailer = $('.sect-trailer').prop('outerHTML');
	let movieReview1 = $('#sect-grade').prop('outerHTML');
	let movieReview2 = $('.paging').prop('outerHTML');
	let movieStillCut = $('.sect-stillcut').prop('outerHTML');
	
	var imgMap = $('.item img').map(function() {
		return $(this).clone();
	});
	
	function tabStyle(tab) {
		$('.tab-menu').find('li').removeClass();
		tab.parent('li').addClass('on');
	}
	
	// 주요정보 => 새로고침 후 줄거리로
	$('.movieInfo').on('click', function() {
		location.reload();
		location.href = "#sect-story-movie";
	});
	
	// 트레일러
	$('.movieTrailer').on('click', function() {
// 		$(".col-detail > div").not('.sect-trailer').hide();
		$(".col-detail > *").not('.tab-menu').remove();
		$(".col-detail").append(movieTrailer);
		$('.sect-trailer li').show();
		$(".heading a").hide();
		tabStyle($(this));
	});
	
	
	$('.movieStillCut').on('click', function() {
// 		$(".col-detail > div").not('.sect-stillcut').hide();
		$(".col-detail > *").not('.tab-menu').remove();
		$('.col-detail').append(movieStillCut);
// 		$('.sect-stillcut').show();
// 		$('#still_motion').hide();
// 		$('#still_motion').css('width', '100%');
		
// 		$('.slider-wrap').css({'dispaly': 'flex', 'flex-wrap': 'wrap'});
		$('.slider-wrap').css({'display': 'inline-block', 'overflow': 'visible', 'white-space': 'nowrap'});
		$('.slider').remove();

		var repo = 3;
		for(var i = 0; i < repo; i++) {
	    	$('.slider-wrap').append(`<div class="imgSect" style="display: inline-block; width: 260px; vertical-align: top; margin-right: 10px;"></div>`);
	    };
	    
	    
		$(imgMap).each(function(i) {
		    var text = $(this).prop('outerHTML'); // 추출한 이미지 html
		    
		    var $minImgSect = $('.imgSect').toArray().reduce(function(minSect, currentSect) {
		        return $(currentSect).height() < $(minSect).height() ? currentSect : minSect;
		    });
		    
		    
		    $($minImgSect).append(`
				<div class="itemSect" style="display: block; margin-top: 10px;">
					<a class="item" val="\${i}" href="javascript:void(0)" style="width:100%;">
						\${text}
					</a>
				</div>
			`);
		});
		
		tabStyle($(this));
	}); // 스틸컷 탭
	
	
	$('.movieReview').on('click', function() {
// 		$(".col-detail>div").not('#sect-grade').hide();
		$('.col-detail>*').not('.tab-menu').remove();
		$('.col-detail').append(movieReview1).append(movieReview2);
		//차트 다시 호출
		chart();
// 		$('#sect-grade').show();
		tabStyle($(this));
	});
	
	
	
	$(".runningTime").on('click', function() {
		var text1 = `<div class="descri-info movie-detail">
				            <ul>
				            <li><a href="#" id="viewgrade" class="viewgrade" target="_blank" title="새창">관람등급 안내</a></li>
				        </ul>
						</div>
					<div class="sect-movie-type" style="padding-top: 40px;">
				        <h4>영화선택</h4>
				        <ul>
				                <li class="on"><a href="#menu" data-midx="88228" data-koreatitle="데드풀과 울버린" data-cgvcode="20036434" title="현재 선택됨 데드풀과 울버린">데드풀과 울버린</a></li>
				        </ul>
				    </div>
				    `
		$('.col-detail').append(text1)
		
		
		
		
		var text2 =`<iframe id="ifrm_movie_time_table" src="${pageContext.request.contextPath}/movie/ifTime" title="" width="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" style="min-height: 100px; height: 6000px;">
			</iframe>`;
		
		$('.col-detail>*').not('.tab-menu').remove();
		$('.col-detail').append(text2);
		
		
		let url = new URLSearchParams(window.location.search);
		
		$('#ifrm_movie_time_table')[0].contentWindow.postMessage(url.get("num"), '*');
// 		debugger;
	});// runningTime 끝
});
</script>
           <!-- .sect-graph 성별연령 -->
            <div id="ctl00_PlaceHolderContent_Section_Chart" class="sect-graph sect-graph-emotion"
            	style="width: 800px; height: 260px">
                <ul class="graph">
                    <li class="gender_graph" style="width: 50%; height: 270px; border-right: 1px solid #cccccc;">
                    	<strong>성별 예매 분포</strong>
						<canvas id="gender" style="display: block;" width="400" height="200"></canvas>
<!-- 						<span hidden="gender">남, 여</span> -->
						<span hidden="">66.7, 33.3</span>
                    </li>
                    <li class="age_grapth" style="width: 50%; height: 270px;">
                        <strong>연령별 예매 분포</strong>
<!--                         차트영역 -->
<!--                         DB 작성 후 매퍼에서 임시 테이블 만들어서 성비 계산후 변수로 삽입 -->
                        <div style="width: 100%; height: 200px; padding: 0; display: flex; justify-content: center; align-items: flex-end;">
							<div class="bar" style="background-color: #3A3735; transition: all 1s linear;">
								<span class="age">10대</span>
								<span class="percent">10.5</span>
							</div>
							<div class="bar" style="background-color: #A8684C; transition: all 1s linear;">
								<span class="age">20대</span>
								<span class="percent">20</span>
							</div>
							<div class="bar" style="background-color: #173F3F; transition: all 1s linear;">
								<span class="age">30대</span>
								<span class="percent">30</span>
							</div>
							<div class="bar" style="background-color: #808080; transition: all 1s linear;">
								<span class="age">40대</span>
								<span class="percent">30</span>
							</div>
							<div class="bar" style="background-color: #80565A; transition: all 1s linear;">
								<span class="age">50대</span>
								<span class="percent">20</span>
							</div>
						</div>
                    </li> 
                    <!-- 연령별 차트 종료 -->
                </ul>
                <!-- 차트영역 종료 -->
            </div>
            <!-- .sect-graph 종료 -->
            
            <!-- 광고 -->
<!--             <div class="movie-detail-ad"> -->
<!--                 <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@SponsorBar_800" width="800" height="90" title="명탐정 코난: 100만 달러의 펜타그램" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="SponsorBar_800" id="SponsorBar_800"></iframe> -->
<!--             </div> -->
            
            
            <!-- .sect-staff -->
            <div id="ctl00_PlaceHolderContent_Section_Trailer" class="sect-trailer">
                <div class="heading">
					<h4>트레일러</h4>
					<span id="ctl00_PlaceHolderContent_TrailerTotalCount" class="count">2건</span>
					<a class="link-more" href="trailer.aspx?midx=88228">더보기</a>
				</div>
                <ul>
                <!-- 사진 동영상 조회 -->
                <c:forEach begin="1" end="5" step="1">
                    <li>
                        <div class="box-image">
                            <!-- TODO : 동영상 팝업 창 작업 후 링크 걸어야 함 //-->
                            <a href="javascript:void(0)" title="새창" class="movie_player_popup" data-gallery-idx="226059">
                                <span class="thumb-image">
                                    <img src="https://img.cgv.co.kr/Movie/Thumbnail/Trailer/88228/88228226059_1024.jpg" alt="[데드풀과 울버린]도파민 '풀' 충전 예고편(순한 맛)" onerror="errorImage(this, {'type':'landscape'})">
                                    <span class="ico-play">영상보기</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="javascript:void(0)" title="새창" class="movie_player_popup" data-gallery-idx="226059">
                                <strong class="title">
                                    <span class="ico-trailer hd">HD</span>
                                    도파민 '풀' 충전 예고편(순한 맛)
                                </strong>
                            </a>
                            <span class="txt-info">2024.05.24</span>
                        </div>
                    </li>
				</c:forEach>
                </ul>
            </div>
            <!-- .sect-trailer -->
            <!-- 트레일러 새창 -->
<script type="text/javascript">
$(function() {
	var index = [0, 1, 2];
	$('.sect-trailer li').not(':eq(0), :eq(1), :eq(2)').hide();
	
	$('.btn-prev').click(function() {
		var current = parseInt($("#stillcut_current").text());
		var prevCut = current - 1 > 0 ? current - 1 : $('.max_stillcut').text();
		
		$("#stillcut_current").html(prevCut);
		$('.item-wrap').find('.item').hide();
		$('.item-wrap').eq(prevCut - 1).find('.item').show();
	})
	
	$('.btn-next').click(function() {
		var current = parseInt($("#stillcut_current").text());
		var nextCut = current + 1 > $('.max_stillcut').text() ? 1 : current + 1;
		$("#stillcut_current").html(nextCut);
		$('.item-wrap').find('.item').hide();
		$('.item-wrap').eq(nextCut - 1).find('.item').show();
	});
});

</script>
            <div id="ctl00_PlaceHolderContent_Section_Still_Cut" class="sect-stillcut">
                <div class="heading">
                    <h4>스틸컷</h4><span class="count"><strong id="stillcut_current">1</strong>/<span class="max_stillcut">8</span>건</span><a class="link-more" href="still-cut.aspx?midx=88228">더보기</a>
                </div>
                <div class="slider-wrap">
                    <div class="slider" id="still_motion">
						<!-- 배열로 분리해서 갯수만큼? -->
						<div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px;">
								<img alt="타이틀" onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226943_727.jpg" style="height: 100%;">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226942_727.jpg">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226941_727.jpg">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226940_727.jpg">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226939_727.jpg">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img alt="데드풀과 울버린" onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228226058_727.jpg">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img alt="데드풀과 울버린" onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228225287_727.jpg">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img alt="데드풀과 울버린" onerror="errorImage(this)" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88228/88228225286_727.jpg" style="height: 100%;">
                            </div>
                        </div>                 
                        
                        <button type="button" class="btn-prev">이전 페이지 이동</button>
                        <button type="button" class="btn-next">다음 페이지 이동</button>
                    </div>
                </div>
            </div><!-- .sect-stillcut -->
            
            
            <!-- ost 영역-->
<!--             <div style="border: 1px solid blue; margin: 20px;"> -->
<!--             	<ul> -->
						
<!--             	</ul> -->
<!--             </div> -->
			<div class="sect-recommendMovie" style="display: flex; white-space: nowrap;">
<%-- 				<c:forEach var="" items=""> --%>
				
<%-- 				</c:forEach> --%>
			</div>



            <div class="sect-grade" id="sect-grade">   
<!--                 preegg.css 연관 UI -->
                <div class="movie_grade">
                    <a class="info" id="goldenEggAlert" href="javascript:void(0);"><img src="https://img.cgv.co.kr/R2014/images/common/ico/ico-question-mark.png" alt="?"></a>
                    <div class="egg_point">
<!--                         영화요약문구 -->
                        <div class="title"><br><strong></strong></div>
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
                    
                    <div class="chart_total" style="position: relative;">
                            <div class="title" style="position: absolute; top: -15px; left: -10px;">매력 포인트</div>
                            <div class="box" style="width: 50%; height:100%; display: flex; justify-content: center; align-items: center;">
	                            <canvas id="charm" data-charm='{"감독연출": "0", "OST":"0", "스토리":"0", "배우연기":"0", "영상미":"0"}'></canvas>
                            </div>
                            
                            <div class="title" style="position: absolute; top: -15px; left: 49%;">감정 포인트</div>
                        	<div class="box" style="width: 50%; height:100%; display: flex; justify-content: center; align-items: center;">
                            	<canvas id="emotion" data-emotion='{"스트레스 해소": "0", "유쾌함":"0", "공감":"0", "몰입감":"0", "감동":"0"}'></canvas>
                        	</div>
                    </div>
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
<script type="text/javascript">
// 리뷰값 가져오기
$(function() {
	let url = new URLSearchParams(window.location.search);
	let urlNum = parseInt(url.get('num'));
	// 현재 페이지
	let currentPage = 1;
	
	//pageBlock 한번에 출력할 페이지 개수
	let pageBlock = 10;
	
	
	// 버튼을 클릭하면 이전, 다음 블록의 페이지 혹은 처음이나 끝 페이지에 접근  
	$(".paging-side button").on('click', function() {
		// 클릭한 버튼의 클래스명에 접근해서 비교
		let btn_class = $(this).attr('class');
		
		// 현재 보여주고 있는 페이지의 시작하는 페이지 인덱스에 접근
		var calPage = parseInt((currentPage - 1) / pageBlock) * pageBlock
		
		switch (btn_class) {
			case 'btn-paging first':
				$(".review_page:first").find("a").trigger('click');
				break;
			case 'btn-paging prev':
				let prevPage = calPage - 1;
				$(".review_page").find("a").eq(prevPage).trigger('click');
				break;
			case 'btn-paging next':
				let nextPage = calPage + pageBlock;
				$(".review_page").find("a").eq(nextPage).trigger('click');
				break;
			case 'btn-paging end':
				$(".review_page:last").find("a").trigger('click');
				break;
		}	
	});
	
	
	
	
	$("#paging_point li").find("a").on("click", function() {
		currentPage = $(this).text();
		$.ajax({
			type: 'get',
			url: '${pageContext.request.contextPath}/movie/review',
			data: {"MOVIE_NUM": urlNum, "currentPage": currentPage},
			dataType: 'json',
			success: function(result) {
				$('#movie_point_list_container').html("")
				if(result == "") {
					$('#movie_point_list_container').append('<li style="width: 100%; text-align: center; padding: 30px 0px; border-right: none;">해당 조건에 데이터가 존재하지 않습니다.</li>');
				};
				$.each(result, function(index, review) {
					$('#movie_point_list_container').append(`
						    <li class="" id="liCommentFirst36060374" data-spoilercnt="0" data-reportcnt="0">
						    <a href="javascript:return false;" class="screen_spoiler">&nbsp;</a>
						    <div class="box-image">
						        <span class="thumb-image">
						            <img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})">
						            <span class="profile-mask"></span>
						            <div class="theater-sticker"></div>
						        </span>
						    </div>
						    <div class="box-contents">
						        <ul class="writerinfo">
						            <li class="writer-name">
					<!-- <span class="egg-icon"></span>--> \${review.member_id} 
						            </li>
						            <li class="writer-etc">
						                <span class="day">\${review.REVIEW_DATE}</span>
						                <span class="like point_like" id="\${review.review_num}">
						                    <a href="javascript:void (0);" class="btn_point_like">
						                        <span><img src="http://img.cgv.co.kr/R2014/images/point/ico_point_default.png" alt="like" class="like_red"></span>
						                        <span id="idLikeValue">\${review.RECOMMEND}</span>
						                    </a>
						                </span>
						            </li>
						            <li class="point_notify">
						                <a href="javascript:void (0);" class="btn_notify">스포일러, 욕설/비방 신고</a>
						                <div class="notify_wrap">
						                    <ul>
						                        <li><a href="javascript:return false;" class="ico_spoiler" data-commentidx="36060374" data-ismyspoiler="false" data-spoilercnt="0"><span>스포일러 신고</span></a></li>
						                        <li><a href="javascript:return false;" class="ico_swearword" data-commentidx="36060374" data-ismyreport="false" data-reportcnt="0"><span>욕설/비방 신고</span></a></li>
						                    </ul>
						                </div>
						            </li>
						        </ul>
						    </div>
						    <div class="box-comment">
						        <p>\${review.REVIEW_CONTENT} \${review.REVIEW_NUM}</p>
						    </div>
						</li>
					`)
				});
			},
			error: function() {
				alert('실패');
			}
		}); // $.ajax 끝
		
		// currentPage => 현재 페이지 번호에서 시작하는 페이지 startPage구하기
		let startPage = parseInt((currentPage - 1) / pageBlock) * pageBlock;
		// 끝나는 페이지 번호
		let endPage = startPage + pageBlock;
		
		// 후처리
		// li의 on클래스 옮겨서 현재 활성화된 페이지에 css 적용 
		$(".review_page").removeClass("on");
		$(this).parent("li").addClass("on");
		// li 조건에 맞는 데이터만 출력
		$(".review_page").hide();
		for(var i = startPage; i < endPage; i++) {
			$(".review_page").eq(i).show();
		};
		
		
		// 현재 페이지 상태에 따라 버튼 보여줄지 말지 설정
		btn_prev = $(".review_page:first").is(':visible') ? $('.prev').hide() : $('.prev').show();
		btn_next = $(".review_page:last").is(':visible') ? $('.next').hide() : $('.next').show();
		btn_first = $('.prev').is(':visible') ? $('.first').show() : $('.first').hide();
		btn_end = $('.next').is(':visible')	? $('.end').show() :  $('.end').hide();
	}); //("#movie_point_list_container").find("li").onclick(function())
	
	// 페이지 로드될때 첫번째 페이지 클릭해서 이벤트 발생시키기
	$(".review_page:first").find("a").trigger('click');
	
});
// 추천
$(document).on('click', '.btn_point_like', function() {
	let checkedId = $('.sessionId').val();
	if(checkedId == null) {
		alert('비회원은 추천 불가');
		return;
	}
	
	let clickBtn = $(this);
	var reviewNum = $(this).parent('.point_like').attr('id');

	$.ajax({
	    type: 'POST',
	    url: '${pageContext.request.contextPath}/movie/recommend',
	    data: {'REVIEW_NUM': reviewNum, 'MEMBER_ID' : checkedId},
	    success: function(result) {
	    	clickBtn.find('#idLikeValue').html(result);
	    }, // SUCCESS
	    error: function(errorMsg) {
	        alert('중복 추천 불가');
	    }
	});
	// ajax가 끝난 후 쿠키를 저장
// 	Cookies.set(checkName, 'ture', 15);
	// 세션 스토리지에 저장
// 	localStorage.setItem(checkName, 'true');
});
</script>
                <div class="wrap-persongrade">
                    <!-- 평점 목록 -->
                    
                    <ul id="movie_point_list_container" class="point_col2">
<%--                     <c:forEach var="review" items="${review}"> --%>
<!--                     	<li class="" id="liCommentFirst36060374" data-spoilercnt="0" data-reportcnt="0"> -->
<!-- 					    <a href="javascript:return false;" class="screen_spoiler">&nbsp;</a> -->
<!-- 					    <div class="box-image"> -->
<!-- 					        <span class="thumb-image"> -->
<!-- 					            <img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})"> -->
<!-- 					            <span class="profile-mask"></span> -->
<!-- 					            <div class="theater-sticker"></div> -->
<!-- 					        </span> -->
<!-- 					    </div> -->
<!-- 					    <div class="box-contents"> -->
<!-- 					        <ul class="writerinfo"> -->
<!-- 					            <li class="writer-name"> -->
<%-- 				<!-- <span class="egg-icon"></span>--> ${review.member_id} --%>
<!-- 					            </li> -->
<!-- 					            <li class="writer-etc"> -->
<%-- 					                <span class="day">${review.reviewDate}</span> --%>
<!-- 					                <span class="like point_like" id="36060374" data-ismygood="false" data-commentidx="36060374"> -->
<!-- 					                    <a href="javascript:return false;" class="btn_point_like"> -->
<!-- 					                        <span><img src="http://img.cgv.co.kr/R2014/images/point/ico_point_default.png" alt="like" class="like_red"></span> -->
<%-- 					                        <span id="idLikeValue">${review.recommend}</span> --%>
<!-- 					                    </a> -->
<!-- 					                </span> -->
<!-- 					            </li> -->
<!-- 					            <li class="point_notify"> -->
<!-- 					                <a href="javascript:return false;" class="btn_notify">스포일러, 욕설/비방 신고</a> -->
<!-- 					                <div class="notify_wrap"> -->
<!-- 					                    <ul> -->
<!-- 					                        <li><a href="javascript:return false;" class="ico_spoiler" data-commentidx="36060374" data-ismyspoiler="false" data-spoilercnt="0"><span>스포일러 신고</span></a></li> -->
<!-- 					                        <li><a href="javascript:return false;" class="ico_swearword" data-commentidx="36060374" data-ismyreport="false" data-reportcnt="0"><span>욕설/비방 신고</span></a></li> -->
<!-- 					                    </ul> -->
<!-- 					                </div> -->
<!-- 					            </li> -->
<!-- 					        </ul> -->
<!-- 					    </div> -->
<!-- 					    <div class="box-comment"> -->
<%-- 					        <p>${review.reveiewContent} ${review.review_num}</p> --%>
<!-- 					    </div> -->
<!-- 						</li> -->
<%-- 					</c:forEach> --%>
                    </ul>
                </div>
            </div><!-- .sect-grade -->
            <div class="paging">
				<ul id="paging_point">
				<li class="paging-side"><button class="btn-paging first" type="button">처음</button></li>
				<li class="paging-side"><button class="btn-paging prev" type="button">이전 10개</button></li>
					<c:forEach begin="1" end="${endPage}" step="1" varStatus="index">
						<li class=review_page><a href="javascript:return false">${index.count}</a></li>
					</c:forEach>
				<li class="paging-side"><button class="btn-paging next" type="button">다음 10개</button></li>
				<li class="paging-side"><button class="btn-paging end" type="button">끝</button></li>
				</ul>
			</div>

             
            
            <!-- 연관영화 -->
<!--             <div class="sect-movielist" style="display :none"> -->
<!--                 <h3><img src="https://img.cgv.co.kr/R2014/images/title/h3_relation_movie.gif" alt="RELATION MOVIE"></h3> -->
<!--                 <ul> -->
                
<!--                     <li> -->
<!--                         <div class="box-image"> -->
<!--                             <a href="/movies/detail-view/?midx=88459"> -->
<!--                                 <span class="thumb-image"> -->
<!--                                     <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88459/88459_126.jpg" alt="글래디에이터 Ⅱ 포스터"> -->
<!--                                     영상물 등급 노출 변경 2022.08.24 -->
<!--                                     <i class="cgvIcon etc ageNotyet">미정</i> -->
<!--                                     <span class="ico-grade Notyet">미정</span> -->
<!--                                 </span> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <div class="box-contents"> -->
<!--                             <a href="/movies/detail-view/?midx=88459"><strong>글래디에이터 Ⅱ</strong></a> -->
<!--                         </div> -->
<!--                     </li> -->
                    
<!--                     <li> -->
<!--                         <div class="box-image"> -->
<!--                             <a href="/movies/detail-view/?midx=88457"> -->
<!--                                 <span class="thumb-image"> -->
<!--                                     <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88457/88457_126.jpg" alt="신비아파트 특별편: 붉은 눈의 사신 포스터"> -->
<!--                                     영상물 등급 노출 변경 2022.08.24 -->
<!--                                     <i class="cgvIcon etc ageNotyet">미정</i> -->
<!--                                     <span class="ico-grade Notyet">미정</span> -->
<!--                                 </span> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <div class="box-contents"> -->
<!--                             <a href="/movies/detail-view/?midx=88457"><strong>신비아파트 특별편: 붉은 눈의 사신</strong></a> -->
<!--                         </div> -->
<!--                     </li> -->
                    
<!--                     <li> -->
<!--                         <div class="box-image"> -->
<!--                             <a href="/movies/detail-view/?midx=88445"> -->
<!--                                 <span class="thumb-image"> -->
<!--                                     <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88445/88445_126.jpg" alt="[대만영화주간] 돼지와 뱀과 비둘기 포스터"> -->
<!--                                     영상물 등급 노출 변경 2022.08.24 -->
<!--                                     <i class="cgvIcon etc age18">18</i> -->
<!--                                     <span class="ico-grade 18">18</span> -->
<!--                                 </span> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <div class="box-contents"> -->
<!--                             <a href="/movies/detail-view/?midx=88445"><strong>[대만영화주간] 돼지와 뱀과 비둘기</strong></a> -->
<!--                         </div> -->
<!--                     </li> -->
                    
<!--                     <li> -->
<!--                         <div class="box-image"> -->
<!--                             <a href="/movies/detail-view/?midx=88442"> -->
<!--                                 <span class="thumb-image"> -->
<!--                                     <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88442/88442_126.jpg" alt="트위스터스 포스터"> -->
<!--                                     영상물 등급 노출 변경 2022.08.24 -->
<!--                                     <i class="cgvIcon etc age12">12</i> -->
<!--                                     <span class="ico-grade 12">12</span> -->
<!--                                 </span> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <div class="box-contents"> -->
<!--                             <a href="/movies/detail-view/?midx=88442"><strong>트위스터스</strong></a> -->
<!--                         </div> -->
<!--                     </li> -->
                    
<!--                     <li> -->
<!--                         <div class="box-image"> -->
<!--                             <a href="/movies/detail-view/?midx=88441"> -->
<!--                                 <span class="thumb-image"> -->
<!--                                     <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88441/88441_126.jpg" alt="플라이 미 투 더 문 포스터"> -->
<!--                                     영상물 등급 노출 변경 2022.08.24 -->
<!--                                     <i class="cgvIcon etc age12">12</i> -->
<!--                                     <span class="ico-grade 12">12</span> -->
<!--                                 </span> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <div class="box-contents"> -->
<!--                             <a href="/movies/detail-view/?midx=88441"><strong>플라이 미 투 더 문</strong></a> -->
<!--                         </div> -->
<!--                     </li> -->
                    
<!--                     <li> -->
<!--                         <div class="box-image"> -->
<!--                             <a href="/movies/detail-view/?midx=88437"> -->
<!--                                 <span class="thumb-image"> -->
<!--                                     <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88437/88437_126.jpg" alt="파일럿 포스터"> -->
<!--                                     영상물 등급 노출 변경 2022.08.24 -->
<!--                                     <i class="cgvIcon etc age12">12</i> -->
<!--                                     <span class="ico-grade 12">12</span> -->
<!--                                 </span> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <div class="box-contents"> -->
<!--                             <a href="/movies/detail-view/?midx=88437"><strong>파일럿</strong></a> -->
<!--                         </div> -->
<!--                     </li> -->
                    
<!--                 </ul> -->
<!--             </div>.sect-movielist -->
            <!-- 연관영화 -->

        </div><!-- .col-detail -->
<!--         <iframe class="layer-wrap review_pop" name="ifrm_movie_time_table1" id="ifrm_movie_time_table1" style="display:none" title="상세리스트" height="993px" width="849px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" allowtransparency="true"></iframe>회원 평점 모아보기 iframe. mwpark_RR2015 -->
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
</div>

</div>

    </div>
    <span style="display:none" class="modifyCommentDummy"></span>
</div>
<!-- 실컨텐츠 끝 -->
            <!--/ Contents End -->


<!-- 이미지 클릭시 이미지 보여주는 페이지 구현 -->
<script type="text/javascript">
$(document).on('click', '.imgSect .item:visible', function() {
	var clickImg = $(this).closest('.itemSect').index('.itemSect');
	
	var imgMap = $('.item:visible img').map(function() {
		return $(this).clone();
	});
	
	$('body').append(`
		<div class="mask" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; z-index: 100; background-color: rgba(0, 0, 0, 0.8);"></div>
		<div class="layer-wrap stillcut-viewer" style="margin-top: -253px; margin-left: -490px; position: fixed;">
			<div class="layer-contents">
				<div class="slider" id="sliderBox">
					<button type="button" class="btn-prev">이전 페이지 이동</button>
					<button type="button" class="btn-next">다음 페이지 이동</button>
				</div>
				<button class="btn-close">[팝업제목] 닫기</button>
			</div>
		</div>
	`);
	
	$(imgMap).each(function(index) {
		var text = $(this).prop('outerHTML');
		
		$('#sliderBox').append(`
			<div class="item-wrap">
		        <div class="item" style="width: 980px; height: 506px; display: none;">
		        	\${text}
		        </div>
	     	</div>
		`);
	});
	
	$('#sliderBox img').attr('style', '');
	$('#sliderBox .item').eq(clickImg).show();
// 	$('.item-wrap').eq(clickImg).find('.item').show();
	
	
	
	//이전
	$('.btn-prev').click(function() {
		var maxNum = $('#sliderBox .item-wrap').length - 1;
		
// 		var current = parseInt($("#stillcut_current").text());
		var prevCut = clickImg - 1 > 0 ? clickImg - 1 : maxNum;
		
		$('#sliderBox .item').hide();
		$('#sliderBox .item').eq(prevCut).show();
		
		clickImg = prevCut;
	})
	
	$('.btn-next').click(function() {
		var maxNum = $('#sliderBox .item-wrap').length - 1;
		
		var nextCut = clickImg + 1 > maxNum ? 0 : clickImg + 1;
		$('#sliderBox').find('.item').hide();
		$('#sliderBox .item').eq(nextCut).show();
		
		clickImg = nextCut;
	});
	 
});
	



</script>

<!-- 트레일러 클릭시 트레일러 보여주는 페이지 구현하는 스크립트 -->            
<script type="text/javascript">
$(document).on('click', '.movie_player_popup', function() {
	var text = `<div class="mask" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; z-index: 100; background-color: rgba(0, 0, 0, 0.8);"></div>
				<div class="layer-wrap" style="margin-top: -355px; margin-left: -510px; position: fixed;" tabindex="0"><div class="popwrap">
				    <div class="sect-layerplayer">
			        <div class="cols-pop-player">
			            <h1 class="title" id="movie_player_popup_title"><span class="ico-trailer hd">HD</span>[데드풀과 울버린]도파민 '풀' 충전 예고편(순한 맛)</h1>
			            <div class="col-pop-player">
			                <div class="warp-pop-player" style="position: relative;">
			<!--                     <iframe src="/http://h.vod.cgv.co.kr:80/vodCGVa/88228/88228_226059_1200_128_960_540.mp4" style="width:800px;height:450px;" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe> -->
			                    <video id="ifrm_movie_player_popup" width="800" height="450" controls autoplay>
								  <source src="http://h.vod.cgv.co.kr:80/vodCGVa/88228/88228_226059_1200_128_960_540.mp4" type="video/mp4">
// 								  <source src="http://h.vod.cgv.co.kr:80/vodCGVa/88228/88228_226059_1200_128_960_540.mp4" deletecommandtype="video/mp4">
								</video>
								<div class="sect-replay" style="display:none" id="pop_player_relation_wrap">
									<button class="btn-replay movie_player_inner_popup" type="button" data-gallery-idx="226059" id="btn_movie_replay">다시보기</button>
									<!-- 없어지는 영역 -->
									<div class="wrap-relationmovie" id="pop_player_relation_item_wrap">
										<strong class="title">관련영상</strong>
										<ul id="pop_player_relation_movie"><li>     <div class="box-image">         <a href="#" title="티저 예고편(순한 맛) 영상보기" class="movie_player_inner_popup" data-gallery-idx="225288">             <span class="thumb-image">                 <img src="https://img.cgv.co.kr/Movie/Thumbnail/Trailer/88228/88228225288_1024.jpg" alt="티저 예고편(순한 맛)_트레일러">                 <span class="ico-play">영상보기</span>             </span>         </a>     </div> </li></ul>
									</div><!-- .wrap-relationmovie -->
								</div><!-- .sect-replay -->
								
			                </div><!-- .warp-pop-player -->
			                <div class="descri-trailer">
			                    <strong class="title">영상설명</strong>
			                    <textarea readonly="readonly" id="movie_player_popup_caption"></textarea>
			                </div>
			            </div><!-- .col-player -->
			            <div class="col-pop-playerinfo">
			                <div id="movie_player_popup_movie_info"><div class="box-image">     <a href="/movies/detail-view/?midx=88228" title="데드풀과 울버린 상세보기 새창">         <span class="thumb-image">             <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_185.jpg" alt="데드풀과 울버린 포스터">             <span class="ico-grade 18">18</span>         </span>     </a>    </div> <div class="box-contents">     <a href="/movies/detail-view/?midx=88228" title="데드풀과 울버린 상세보기 새창">         <strong class="title">데드풀과 울버린</strong>     </a>     <span class="txt-info" style="margin-bottom:2px;">         <em class="genre">액션,&nbsp;코미디,&nbsp;SF</em>         <span>             <i>2024.07.24</i>             <strong>개봉</strong>                      </span>     </span>      <a class="link-reservation" href="/ticket/?MOVIE_CD=20037162&amp;MOVIE_CD_GROUP=20037162">예매</a>   </div></div>
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
			</div>`
		$('body').append(text);
});

$(document).on('click', '.btn-close', function() {
    $('.mask').remove();
    $('.layer-wrap').remove();
});
</script>

</body>
</html>