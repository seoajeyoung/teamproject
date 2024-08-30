<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- 비디오 -->
<link href="https://vjs.zencdn.net/7.21.0/video-js.css" rel="stylesheet">
<script src="https://vjs.zencdn.net/7.21.0/video.min.js"></script>

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
	
	
	
	// 연령 차트
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
		var percent = $(this).find('.percent').text() * 0.8;
		$(this).css('height', percent + "%");
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
	
};




function pointChart() {
	$.ajax({
		type: 'get',
		url: '${pageContext.request.contextPath}/movie/pointChart',
		data: {'MOVIE_NUM' : movieNum},
		dataType: 'json',
		success: function(result) {
			var charmChart = $('#charm').data('charm');
 			charmChart.감독연출 = result.CP_EFFECT; 
			charmChart.OST = result.CP_OST; 
			charmChart.스토리 = result.CP_STORY;
			charmChart.배우연기 = result.CP_ACTING;
			charmChart.영상미 = result.CP_VISUAL;
			charmChart = JSON.stringify(charmChart);
			$('#charm').attr('data-charm', charmChart);
			
			var emotionChart = $('#emotion').data('emotion');
			emotionChart.스트레스해소 = result.EM_RELSTRESS;
			emotionChart.즐거움 = result.EM_PLEASURE;
			emotionChart.감동 = result.EM_IMPRESS;
			emotionChart.몰입감 = result.EM_IMMERSE;
			emotionChart.긴장감 = result.EM_TENSION;
			emotionChart = JSON.stringify(emotionChart);
			$('#emotion').attr('data-emotion', emotionChart);
			chart();
		},	
		error: function(e) {
			chart();
		}
	});
	
}


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
<jsp:include page="../ticket/top.jsp" />
<!-- 세션 아이디 임시 저장 -->


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
    <h3><strong>${movieDTO.TITLE}</strong>기본정보</h3>
    <div class="box-image">
        <a href="${movieDTO.POSTERURL}" title="포스터 크게 보기 새창" target="_blank">
            <span class="thumb-image"> 
                <img class="poster" src="${movieDTO.POSTERURL}" alt="${movieDTO.TITLE} 새창">
                <span class="ico-posterdetail">포스터 크게 보기</span>
                <c:set var="setRating" value="${fn:substring(movieDTO.RATING, 0, 2)}" />
                <i class="cgvIcon etc age${setRating == '전체' ? 'All' : setRating == '청소' ? 18 	: setRating}">${movieDTO.RATING}</i>
            </span> 
        </a> 
    </div>
    <div class="box-contents">
        <div class="movieTitle title"> 
            <strong id="movieTitle" data-Title="${movieDTO.TITLE}">${movieDTO.TITLE}</strong>
            <c:if test="${movieDTO.SHOW == 'SHOWMOVIE'}">
            <c:choose>
	            <c:when test="${movieDTO.D_DAY > 0}">
		            <em class="round brown"><span>예매중</span></em>
		            <em class="round red"><span>D-${movieDTO.D_DAY}</span></em>
	            </c:when>
	            <c:otherwise>
	            	<em class="round lightblue"><span>현재상영중</span></em>
	            </c:otherwise>
            </c:choose>
            </c:if>
            <p>${movieDTO.TITLEENG}</p>
        </div>
        <div class="score"> 
            <strong class="percent">예매율&nbsp;<span>${movieDTO.RATE}%</span></strong>
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
					<span>${movieDTO.DIRECOTRNM}</span>                    
                </dd>

                <dt>&nbsp;/ 배우 :&nbsp;</dt>
                <dd class="on">
                	<!-- 배우페이지를 별개로 설계하게 된다면 주소를 따로 지정할 방법이 필요해서 for문으로 반복 삽입 -->
                		<span>${movieDTO.ACTORNM}</span>
                </dd>
                <dt>장르&nbsp;:&nbsp;</dt> 
                <!-- 동일한 장르로 영화를 찾아줄 페이지를 설계하게 된다면 위처럼 forEach문 사용 -->
                <dd class="genre">${movieDTO.GENRE}</dd>
                <dt>&nbsp;/ 기본 정보 :&nbsp;</dt>
                <!-- 2023.04.27 영화상세 등급 표기 수정--> 
                <!--<dd class="on">18,&nbsp;상영시간,&nbsp;국가</dd>-->
                <dd class="on">${!empty movieDTO.RATING ? movieDTO.RATING : '연령등급미정'},
                &nbsp;${movieDTO.RUNTIME}분,&nbsp;${movieDTO.NATION}</dd>
                <dt>개봉 :&nbsp;</dt>
                <dd class="on releaseDate">${movieDTO.RELEASEDATE}</dd>
                <c:if test="${movieDTO.SOUNDTRACK != null && SOUNDTRACK.length != 0}">
	                <dt>OST&nbsp;:&nbsp;</dt>
	                <dd>
	                	<c:forEach var="TRACK" items="${movieDTO.SOUNDTRACK}" varStatus="Status">
	                		<c:if test="${Status.index != 0}">/ </c:if>
		                	<a href="https://www.youtube.com/watch?v=${movieDTO.VIDEOID[Status.index]}">
		                		${TRACK}
		                	</a>
	                	</c:forEach>
	                </dd>
                </c:if>
            </dl>
        </div>
<!-- 	프리에그 -> 찜 기능? -->
<!--         <span class="screentype"> -->
<!--                 <a href="#" class="imax" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a> -->
<!--         </span> -->
        <span class="like">
<!--             2020.05.07 영화찜하기 -> 프리에그 선택 변경(조회하여 노출) -->
            <a id="bookmark" class="link-count favor" href="javascript:void (0);"><i class="sprite_preegg btn_md ${BOOKMARK}"></i>찜하기</a>
            <a class="link-reservation" href="${pageContext.request.contextPath}/ticket?num=${movieDTO.MOVIE_NUM}">예매</a> 
        </span>
    </div>
</div><!-- .sect-base -->
<script type="text/javascript">
//전역변수저장
let urlNum
let currentPage
let memberId;
$(function() {
	let url = new URLSearchParams(window.location.search);
	urlNum = parseInt(url.get('num'));
	memberId = $('.sessionId').val();
	
	// 찜하기 기능
	$("#bookmark").on('click', function() {
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/movie/bookmark',
			data: {"MOVIE_NUM": urlNum, "MEMBER_ID": memberId},
			dataType: 'text',
			success: function(result) {
				$('#bookmark>i').removeClass('hate').addClass('favor');
			},
			error: function(e) {
				switch (e.responseText) {
					case "nullId": alert('로그인 후 이용해 주세요.');
				    	break;
					case "delete": $('#bookmark>i').removeClass('favor').addClass('hate');
						break;
				}
			}
		})
	});
});
</script>

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
let url = new URLSearchParams(window.location.search);
let movieNum = url.get("num");
$(function() {
	//차트 호출
	pointChart();
	
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
		if(movieTrailer == null) {
			alert('해당 영화의 트레일러가 존재하지 않습니다')
			return;
		};
// 		$(".col-detail > div").not('.sect-trailer').hide();
		$(".col-detail > *").not('.tab-menu').remove();
		$(".col-detail").append(movieTrailer);
		$('.sect-trailer li').show();
		$(".heading a").hide();
		tabStyle($(this));
	});//트레일러 탭
	
	
	$('.movieStillCut').on('click', function() {
		if(movieStillCut == null) {
			alert('해당 영화의 스틸컷이 존재하지 않습니다')
			return;
		}
		
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
		    // 영역중 가장 낮은 값구하기
		    var $minImgSect = $('.imgSect').toArray().reduce(function(minSect, currentSect) {
		        return $(currentSect).height() < $(minSect).height() ? currentSect : minSect;
		    });
		    
		    $($minImgSect).append(`
		    	    <div class="itemSect" style="display: block; margin-top: 10px;">
		    	        <a class="item" val="${i}" href="javascript:void(0)" style="width:100%;">
		    	            \${text}
		    	        </a>
		    	    </div>
	    	`);
		});
		tabStyle($(this));
	}); // 스틸컷 탭
	
	
	$('.movieReview').on('click', function() {
		$('.col-detail>*').not('.tab-menu').remove();
		$('.col-detail').append(movieReview1);
		$('.col-detail').append(movieReview2);
		//차트 다시 호출
		pointChart();
		tabStyle($(this));
		$('.review_page:first').find('a').trigger('click');
	});
	
	$(".runningTime").on('click', function() {
		$('.day').parent('li').removeClass('on');
		$(this).parents('li').addClass('on');
		
		var text2 =`<iframe id="ifrm_movie_time_table" src="${pageContext.request.contextPath}/movie/ifTime?MOVIE_NUM=\${movieNum}" title="" width="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" style="min-height: 100px; height: 1500px;"></iframe>`;
		
		$('.col-detail>*').not('.tab-menu').remove();
		$('.col-detail').append(text2);
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
						<c:choose>
							<c:when test="${chartData.MALE != null && chartData.FEMALE != null}">
								<span hidden="">
									${chartData.MALE != null ? chartData.MALE : 0},
									${chartData.FEMALE != null ? chartData.FEMALE : 0}
								</span>
							</c:when>
							<c:otherwise>
								<p style="font-size: 18px; font-style: italic; position: relative; bottom: 195px; left: 20px; background-color: white;">
									현재 영화를 예매한 회원이 없습니다.
								</p>	
							</c:otherwise>
						</c:choose>
                    </li>
                    <li class="age_grapth" style="width: 50%; height: 270px;">
                        <strong>연령별 예매 분포</strong>
<!--                         차트영역 -->
<!--                         DB 작성 후 매퍼에서 임시 테이블 만들어서 성비 계산후 변수로 삽입 -->
                        <div style="width: 100%; height: 200px; padding: 0; display: flex; justify-content: center; align-items: flex-end;">
							<div class="bar" style="background-color: #3A3735; transition: all 1s linear; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);">
								<span class="age">청소년</span>
								<span class="percent">${chartData.AGE10S != null ? chartData.AGE10S : 0}</span>
							</div>
							<div class="bar" style="background-color: #A8684C; transition: all 1s linear; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);">
								<span class="age">20대</span>
								<span class="percent">${chartData.AGE20S != null ? chartData.AGE20S : 0}</span>
							</div>
							<div class="bar" style="background-color: #173F3F; transition: all 1s linear; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);">
								<span class="age">30대</span>
								<span class="percent">${chartData.AGE30S != null ? chartData.AGE30S : 0}</span>
							</div>
							<div class="bar" style="background-color: #808080; transition: all 1s linear; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);">
								<span class="age">40대</span>
								<span class="percent">${chartData.AGE40S != null ? chartData.AGE40S : 0}</span>
							</div>
							<div class="bar" style="background-color: #80565A; transition: all 1s linear; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);">
								<span class="age">50세이상</span>
								<span class="percent">${chartData.AGE50SPLUS != null ? chartData.AGE50SPLUS : 0}</span>
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
          
		<c:if test="${not empty movieTrailer[0]}">
		<c:set var="trailerTeaser" value="${trailerTeaser}"/>
            <div id="ctl00_PlaceHolderContent_Section_Trailer" class="sect-trailer">
                <div class="heading">
					<h4>트레일러</h4>
					<span id="ctl00_PlaceHolderContent_TrailerTotalCount" class="count">${trailerTeaser.size()}건</span>
					<a class="link-more linkTrailer" href="javascript:void(0);">더보기</a>
				</div>
                <ul>
                <!-- 사진 동영상 조회 -->
                <c:forEach var="movieTrailer" items="${movieTrailer}" varStatus="Status">
                    <li>
                        <div class="box-image">
                            <!-- TODO : 동영상 팝업 창 작업 후 링크 걸어야 함 //-->
                            <a href="javascript:void(0)" title="새창" class="movie_player_popup">
                                <span class="thumb-image">
                                    <img src="${trailerTeaser[Status.index]}" alt="">
                                    <input class="videoLink" type="hidden" value="${movieTrailer}">
                                    <span class="ico-play">영상보기</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="javascript:void(0)" title="새창" class="movie_player_popup">
                                <strong class="title">
                                    <span class="ico-trailer hd">HD</span>${movieDTO.TITLE}
                                </strong>
                            </a>
                            <span class="txt-info"></span>
                        </div>
                    </li>
				</c:forEach>
                </ul>
            </div>
		</c:if>
			
            <!-- .sect-trailer -->
            
            <!-- 트레일러 새창 -->
<script type="text/javascript">
$(function() {
	$('.linkTrailer').on('click', function() {
		$('.movieTrailer').trigger('click');
	});
	
	
	
	
	var index = [0, 1, 2];
	$('.sect-trailer li').not(':eq(0), :eq(1), :eq(2)').hide();
	$('.item').not(':eq(0)').hide();
	
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
	
	$('.still_link').on('click', function() {
		$('.movieStillCut').trigger('click')
	});
	
	
});

</script>
		<c:if test="${fn:length(stillcutUrl) != 1 && not empty stillcutUrl[0]}">
            <div id="ctl00_PlaceHolderContent_Section_Still_Cut" class="sect-stillcut">
                <div class="heading">
                    <h4>스틸컷</h4><span class="count"><strong id="stillcut_current">1</strong>/<span class="max_stillcut">${fn:length(stillcutUrl)}</span>건</span><a class="link-more still_link" href="javascript:void(0);">더보기</a>
                </div>
                <div class="slider-wrap">
                    <div class="slider" id="still_motion">
						<!-- 배열로 분리해서 갯수만큼? -->
						<c:forEach var="cutImg" items="${stillcutUrl}" varStatus="Status">
							<div class="item-wrap" style=""> <!--  ${Status.index != 0 ? 'display:none;' : ''}} -->
	                            <div class="item" style="width: 800px; height: 450px; text-align: center;">
									<img alt="${movieDTO.title}" onerror="this.src='${cutImg}.jpeg';" src="${cutImg}.jpg" style="min-width:260px; max-width: 90%; height: 100%;">
	                            </div>
	                        </div>
                        </c:forEach>
                        <button type="button" class="btn-prev">이전 페이지 이동</button>
                        <button type="button" class="btn-next">다음 페이지 이동</button>
                    </div>
                </div>
            </div><!-- .sect-stillcut -->
		</c:if>
            
            <!-- ost 영역-->
<!--             <div style="border: 1px solid blue; margin: 20px;"> -->
<!--             	<ul> -->
						
<!--             	</ul> -->
<!--             </div> -->


            <div class="sect-grade" id="sect-grade">   
<!--                 preegg.css 연관 UI -->
                <div class="movie_grade">
<!--                     <a class="info" id="goldenEggAlert" href="javascript:void(0);"> -->
<!-- 	                    <img src="https://img.cgv.co.kr/R2014/images/common/ico/ico-question-mark.png" alt="?"> -->
<!-- 					</a> -->
<!--                     <div class="egg_point"> -->
<!--                         영화요약문구 --> 
<!--                         <div class="title"><br><strong></strong></div> -->
<!--                         <div class="rating"> -->
<!--                             <div class="box"> -->
<!--                                 <span class="sprite_preegg big default"></span> -->
<!--                                 <span class="desc">Pre Egg</span> -->
<!--                                 <span class="percent">99%</span> -->
<!--                                 <span class="tooltip">사전기대지수</span> -->
<!--                             </div> -->
<!--                             <div class="box box_golden"> -->
<!--                                 <span class="sprite_preegg big good"></span> -->
<!--                                 <span class="desc">Golden Egg</span> -->
<!--                                 <span class="percent">?</span> -->
<!--                                 <span class="tooltip">실관람평지수</span> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                    
                    <div class="chart_total" style="position: relative;">
                            <div class="title" style="position: absolute; top: -15px; left: -10px;">매력 포인트</div>
                            <div class="box" style="width: 50%; height:100%; display: flex; justify-content: center; align-items: center;">
	                            <canvas id="charm" data-charm='{"감독연출": "0", "OST":"0", "스토리":"0", "배우연기":"0", "영상미":"0"}'></canvas>
                            </div>
                            <div class="title" style="position: absolute; top: -15px; left: 49%;">감정 포인트</div>
                        	<div class="box" style="width: 50%; height:100%; display: flex; justify-content: center; align-items: center;">
                            	<canvas id="emotion" data-emotion='{"스트레스해소": "0", "감동":"0", "몰입감":"0", "즐거움":"0", "긴장감":"0"}'></canvas>
                        	</div>
                    </div>
                </div>
                
                <div class="real-rating">
                    <p class="title">관람일 포함 7일 이내에 관람평을 남기실 수 있습니다. </p>
                    <p class="desc">현재 <span><em>0</em> 명의 실관람객이 평가해주셨습니다.</span></p>
                    <div class="wrap_btn">
                        <a class="link-gradewrite" href="javascript:void(0);"><span>평점작성</span></a>
                        <a class="link-reviewwrite" href="javascript:void(0);"><span>내 평점</span></a>
                    </div>
                </div>
                <!-- //preegg.css 연관 UI -->
                <ul class="sort" id="sortTab">
                    <li class="sortTab on" value="most"><a href="javascript:void(0);" class="most">최신순<span class="arrow-down"></span></a></li>
                    <li class="sortTab" value="recom"><a href="javascript:void(0);" class="recom">추천순<span class="arrow-down"></span></a></li>
                </ul>
<script type="text/javascript">

// 현재 페이지
currentPage = 1;

//pageBlock 한번에 출력할 페이지 개수
let pageBlock = 10;
$(document).on('click', '.paging-side button', function() {
	// 버튼을 클릭하면 이전, 다음 블록의 페이지 혹은 처음이나 끝 페이지에 접근
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
	
// 리뷰 불러오는 이벤트
$(document).on('click', '.review_page>a', function() {
	let sortTab = $('.sortTab.on').val();
	currentPage = $(this).text();
	$.ajax({
		type: 'get',
		url: '${pageContext.request.contextPath}/movie/review',
		data: {"MOVIE_NUM": urlNum, "currentPage": currentPage, "SORT_TAB" : sortTab},
		dataType: 'json',
		success: function(result) {
			$('.desc em').html(result.length);
			if(result.length == 0) {
				$('#movie_point_list_container').html(`<li style="width: 100%; text-align: center; padding: 30px 0px; border-right: none;">해당 영화에 리뷰가 존재하지 않습니다.</li>`);
				$('.paging').remove();
				return;
			}
			$('#movie_point_list_container').html('');
			
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
								 \${review.MEM_ID}
					            </li>
					            <li class="writer-etc">
					                <span class="day">\${review.REVIEW_DATE}</span>
					                <span class="like point_like" data-rnum="\${review.REVIEW_NUM}">
					                    <a href="javascript:void (0);" class="btn_point_like">
					                        <span><img src="http://img.cgv.co.kr/R2014/images/point/ico_point_default.png" alt="like" class="like_red"></span>
					                        <span id="idLikeValue">\${review.RECOMMEND}</span>
					                    </a>
					                </span>
					            </li>
					            <li class="point_notify">
					                <div class="notify_wrap">
					                    <ul>
					                        <li><a href="javascript:return false;" class="ico_spoiler"><span>스포일러 신고</span></a></li>
					                        <li><a href="javascript:return false;" class="ico_swearword"><span>욕설/비방 신고</span></a></li>
					                    </ul>
					                </div>
					            </li>
					        </ul>
					    </div>
					    <div class="box-comment">
					        <p>\${review.REVIEW_CONTENT}</p>
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
}); // $(document).on('click', '.review_page>a')
	
$(function() {
	// 페이지 로드될때 첫번째 페이지 클릭해서 이벤트 발생시키기
	$(".review_page:first").find("a").trigger('click');
});

// 추천
$(document).on('click', '.btn_point_like', function() {
	let checkedId = $('.sessionId').val();
	if(checkedId == null || checkedId == "") {
		alert('비회원 추천 불가');
		return;
	}
	
	let clickBtn = $(this);
	var reviewNum = $(this).parent('.point_like').data('rnum');

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
});
$(document).on('click', '.sortTab>a', function() {
	$('.sortTab').removeClass('on');
	$(this).parent('.sortTab').addClass('on');
	$('.review_page:first').find('a').trigger('click');
});
</script>
                <div class="wrap-persongrade">
                    <!-- 평점 목록 -->
                    <ul id="movie_point_list_container" class="point_col2">
                    </ul>
                </div>
            </div><!-- .sect-grade -->
            <c:if test="${endPage > 0}">
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
			</c:if>

             
            
            <!-- 관련영화 -->
            <div class="sect-movielist" style="">
                <h3><img src="https://img.cgv.co.kr/R2014/images/title/h3_relation_movie.gif" alt="RELATION MOVIE"></h3>
                <ul>
                <c:forEach var="relMovie" items="${relMovie}">
                    <li>
                        <div class="box-image">
                            <a href="${pageContext.request.contextPath}/movie/information?num=${relMovie.MOVIE_NUM}">
                                <span class="thumb-image">
                                    <img src="${relMovie.POSTERURL}" alt="${relMovie.TITLE} 포스터">
                                    <i class="cgvIcon etc age${relMovie.RATING}">${relMovie.RATING}</i>
                                    <span class="ico-grade ${relMovie.RATING}">${relMovie.RATING}</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                           <a href="/movies/detail-view/?midx=88459"><b>${relMovie.TITLE}</b></a>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
<!--             .sect-movielist -->
            <!-- 연관영화 -->

        </div><!-- .col-detail -->
<!--         <iframe class="layer-wrap review_pop" name="ifrm_movie_time_table1" id="ifrm_movie_time_table1" style="display:none" title="상세리스트" height="993px" width="849px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" allowtransparency="true"></iframe>회원 평점 모아보기 iframe. mwpark_RR2015 -->
        <form method="post" id="frmPointPopup" action="/movies/point/default-irm.aspx" novalidate="novalidate">
            <input type="hidden" name="userid" id="frmPointUserId">
            <input type="hidden" name="nick" id="frmPointNick">
        </form>

        
<div class="col-aside">
    <div class="ad-partner01">
    	<iframe src="${pageContext.request.contextPath}/movie/ad" width="160" height="300" title="영화광고-명탐정 코난: 100만 달러의 펜타그램" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="M_Rectangle" id="M_Rectangle"></iframe>
    </div>
<!--     <div class="ad-external01"> -->
<!--         <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@C_Rectangle" width="160" height="300" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="C_Rectangle" id="C_Rectangle"></iframe> -->
<!--     </div> -->
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
	
	$('#sliderBox img').attr('style', 'vertical-align: middle;');
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
	var videoLink = $(this).parents('li').find('.videoLink').val();
	var movieTitle = $('.movieTitle>strong').text();
	var poster = $('.poster').attr('src');
	var genre = $('.genre').text();
	var releaseDate = $('.releaseDate').text();
	
	var text = `<div class="mask" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; z-index: 100; background-color: rgba(0, 0, 0, 0.8);"></div>
				<div class="layer-wrap" style="margin-top: -355px; margin-left: -510px; position: fixed;" tabindex="0"><div class="popwrap">
				    <div class="sect-layerplayer" style="display: inline-block;">
			        <div class="cols-pop-player">
			            <h1 class="title" id="movie_player_popup_title" style="position: absolute;">
			            <span class="ico-trailer hd">HD</span></h1>
			            <div class="col-pop-player">
			                <div class="warp-pop-player" style="display: inline-block; position: relative;">
			                <iframe id="ifrm_movie_player_popup" width="880" height="560" src="\${videoLink}" scrolling="no" title="" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			                </div>
			                <!-- .warp-pop-player -->
			            </div>
			            <!-- .col-player -->
			            <div class="col-pop-playerinfo" style="position: relative; top: 48px;">
			                <div id="movie_player_popup_movie_info">
			                <div class="box-image">
			                	<a>
				                	<img src="\${poster}" alt="포스터" style="width: 140px; height:200px;">
				                	<span class="ico-grade 15">15</span>
				                	</span>
				                </a>	
			                </div>
		                		<div class="box-contents">
		                			<a href="${pageContext.request.contextPath}/movie/information?num=\${movieNum}" title="">
										<strong class="title">\${movieTitle}</strong>
									</a>
									<span class="txt-info" style="margin-bottom:2px;">
										<em class="genre">\${genre}</em>
									<span>
									<i>\${releaseDate}</i><strong>개봉</strong>
									<br>
									<a class="link-reservation" href="${pageContext.request.contextPath}/ticket?num=\${movieNum}">예매</a> 
								</div>
							</div>
			            </div>
			            <!-- .col-playerinfo -->
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

// 평점 작성 버튼 클릭
$(document).on('click', '.link-gradewrite', function() {
	if(memberId == null || memberId == "") {
		alert('비회원은 평점 작성 불가');
		return;
	};
	let reviewUser
	if($('#reviewCk').val() == "alReview") {
		reviewUser = confirm("이미 리뷰를 작성한 영화입니다. 내 평점 수정 페이지로 이동 하시겠습니까?");
	} else if($('#reviewCk').val() == "notShowChecked") {
		alert('평점은 7일 이내에 관람 기록이 있는 회원만 작성 가능합니다.')
		return;
	}
	
	if(reviewUser) {
		$('.link-reviewwrite').trigger('click');
		return;	
	} else {
		return;
	}
	
	
	var title = $('.movieTitle>strong').text();
	
	var text = `<div class="layer-wrap" style="margin-top: -207px; margin-left: -355px; position: fixed; height: 410px;" tabindex="0">
				<div class="layer-contents on-shadow" style="width:710px; height: 410px;">
					<div class="popup-general" style="height: 410px;">
					<div class="popwrap">
						<h1>평점작성</h1>
						<div class="pop-contents write-mygrade">
							<div class="mygrade-cont">
								<div class="movietit"><strong id="regTitle">\${title}</strong></div>
								<div class="likeornot">
									<div class="writerinfo">
										<div class="box-image">
											<span class="thumb-image">   
												<img id="regUserPro" src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})">                                            
												
			                                    <span class="profile-mask"></span>
											</span>
										</div>
										<span class="round red on"><span class="position"><em class="see">\${memberId}</em></span></span>
										<span class="writer-name" id="regUserName"></span>
									</div>
		
									<div class="likebox t1" id="defaultEggPoint">
										<div class="likebox-inner">
											<label for="likeornot1-1">
												<span class="egg-icon good">
													<input type="radio" name="likeornot" id="likeornot1-1" value="true">
												</span>
												<span class="txt">좋았어요! 추천합니다.</span>
											</label>
										</div>
									</div>
									<div class="likebox t2 on" id="notEggPoint">
										<div class="likebox-inner">
											<label for="likeornot1-2">
												<span class="egg-icon">
													<input type="radio" name="likeornot" id="likeornot1-2" value="false">
												</span>
												<span class="txt">좀 아쉬워요.</span>
											</label>
										</div>
									</div>
								</div>
		
								<div class="textbox">
			                        <textarea id="textReviewContent" name="textReviewContent" title="영화평점 입력" cols="70" rows="2" maxlength="200" placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다."></textarea>
								</div>
		
								<div class="footbox">
									<div class="rbox">
										<span class="count"><strong id="text_count">0</strong>/200(byte)</span>
										<button type="button" class="round red on" id="regBtn"><span>계속</span></button>
									</div>
								</div>
		
							</div>
						</div>
						<button type="button" class="btn-close" id="regLayerClose">평점작성 팝업 닫기</button>
					</div>
				</div>
			</div>`
	$('body').append(text);
	$('.likebox-inner').eq(0).find('label').trigger('click');
});

// 리뷰 페이지 글자 길이
$(document).on('input', '#textReviewContent', function() {
	$('#text_count').html($(this).val().length);
});
// 영화 추천 비추천 박스 클릭
$(document).on('click', '.likebox-inner>label', function() {
	$('.likebox').removeClass('on');
	$(this).parents('.likebox').addClass('on');
	$(this).find('input[type="radio"]').prop('checked', true);
});


let content;
let likeOrNot;
//다음 평점 페이지
$(document).on('click', '#regBtn', function() {
	content = $('#textReviewContent').val();
	likeOrNot = $('input[name="likeornot"]:checked').val() == 'true' ? 1 : 0;
	
	$('.layer-wrap').html(`
	        <div class="popwrap" style="width:710px;">
	            <h1>관람 포인트 선택</h1>
	            <div class="pop-contents">
	                <div class="movie-emotion-select">
	                    <div class="header">
	                        <p class="main">이 영화의 관람 포인트를 선택해주세요! </p>
	                        <p class="sub"><span>중복선택</span>이 가능합니다.</p>
	                    </div>
	                    <div class="box">
	                        <div class="name">매력 포인트</div>
	                        <div class="wrap_input">
	                            <label><input type="checkbox" name="charm" id="effect"><span>감독연출</span></label>
	                            <label><input type="checkbox" name="charm" id="story"><span>스토리</span></label>
	                            <label><input type="checkbox" name="charm" id="visual"><span>영상미</span></label>
	                            <label><input type="checkbox" name="charm" id="acting"><span>배우연기</span></label>
	                            <label><input type="checkbox" name="charm" id="ost"><span>OST</span></label>
	                        </div>
	                    </div>
	                    <div class="box">
	                        <div class="name">감정 포인트</div>
	                        <div class="wrap_input">
	                            <label><input type="checkbox" name="emotion" id="immerse"><span>몰입감</span></label>
	                            <label><input type="checkbox" name="emotion" id="impress"><span>감동</span></label>
	                            <label><input type="checkbox" name="emotion" id="relStress"><span>스트레스 해소</span></label>
	                            <label><input type="checkbox" name="emotion" id="Pleasure"><span>즐거움</span></label>
	                            <label><input type="checkbox" name="emotion" id="tension"><span>긴장감</span></label>
	                        </div>
	                    </div>
	                </div>
	                <div class="set-btn fix-width">
	                    <button type="javascript:void(0)" id="charmRegBtn" class="round inred"><span>확인</span></button>
	                </div>
	            </div>
	            <button type="button" class="btn-close" id="regCharmCloseBtn">관람 포인트 선택 팝업 닫기</button>
	        </div> 
	    `)
});


$(document).on('click', '.set-btn>button', function() {
	let ckMap = {};
	$('.wrap_input').find('input[type="checkbox"]').each(function() {
		ckMap[$(this).attr('id').toUpperCase()] = $(this).is(':checked') == true ? 1 : 0;
	});
	
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/movie/insertReview',
		data: $.param(ckMap) + '&MOVIE_NUM=' + urlNum + "&REVIEW_CONTENT=" + content + "&MOVIE_LIKED=" + likeOrNot + "&MEMBER_ID=" + memberId,
		success: function() {
			alert('리뷰 저장 완료');
			$('.tab-menu>li.on').find('a').trigger('click');
		},
		error: function() {
			alert('리뷰 저장 실패(이미 리뷰를 작성한 영화입니다)');
		}
	});
	
	$('.btn-close').trigger('click');
});

var reviewNum;
$(document).on('click', '.link-reviewwrite', function() {
	if(memberId == null || memberId.trim() == "") {
		alert('로그인 후 이용해주세요')
		return;
	}
	
	$.ajax({
		type: 'GET',
		url: '${pageContext.request.contextPath}/movie/getMemberReview',
		data: {"MOVIE_NUM":urlNum, "MEMBER_ID":memberId},
		success: function(result) {
			reviewNum = result.REVIEW_NUM;
			var title = $("#movieTitle").data("title");
			var text = `<div class="layer-wrap" style="margin-top: -207px; margin-left: -355px; position: fixed; height: 410px;" tabindex="0">
							<div class="layer-contents on-shadow" style="width:710px; height: 410px;">
							<div class="popup-general" style="height: 410px;">
							<div class="popwrap">
								<h1>평점수정</h1>
								<div class="pop-contents write-mygrade">
									<div class="mygrade-cont">
										<div class="movietit"><strong id="regTitle">\${title}</strong></div>
										<div class="likeornot">
											<div class="writerinfo">
												<div class="box-image">
													<span class="thumb-image">   
														<img id="regUserPro" src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})">                                            
														<span class="profile-mask"></span>
													</span>
												</div>
												<span class="round red on"><span class="position"><em class="see">\${result.MEM_ID}</em></span></span>
												<span class="writer-name" id="regUserName"></span>
											</div>
										</div>
			
										<div class="textbox">
											<textarea id="textReviewContent" name="textReviewContent" title="영화평점 입력" cols="70" rows="2" maxlength="280">\${result.REVIEW_CONTENT}</textarea>
										</div>
			
										<div class="footbox">
											<div class="rbox">
												<span class="count"><strong id="text_count">\${result.REVIEW_CONTENT.length}</strong>/280(byte)</span>
												<button type="button" class="round red on" id="regUpBtn"><span>작성완료!</span></button>
											</div>
										</div>
									</div>
								</div>
								<button type="button" class="btn-close" id="regLayerClose">평점작성 팝업 닫기</button>
							</div>
						</div>
					</div>`
			$('body').append(text);
			
					
		},
		error: function(e, a, b, c) {
			if(e.responseJSON.error == "noReview") {
				alert('해당 영화에 작성한 리뷰가 없습니다')
			} else {
				alert('오류 발생');
			}
		}
	});
});

$(document).on('click', '#regUpBtn', function() {
	var content = $('#textReviewContent').val();
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/movie/updateReview',
		data: {"REVIEW_NUM":reviewNum, "REVIEW_CONTENT": content},
		success: function() {
			alert('리뷰 수정 완료');
			$('.tab-menu>li.on').find('a').trigger('click');
		},
		error: function(str) {
			if(str.responseText == "notOK"){
				alert('업데이트실패')
			}
		}
	});
	
	$('.btn-close').trigger('click');
});
</script>


<input type="hidden" class="sessionId" value="${sessionScope.member_id}">
<input type="hidden" id="reviewCk" value="${REVIEWCHECK}">

</body>
</html>