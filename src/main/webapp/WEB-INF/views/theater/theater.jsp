<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>theater</title>

<link href="${pageContext.request.contextPath}/resources/css/movie/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/layout.css" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">


<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>


<style type="text/css">
#fav_theater {
  font-family: "Jua", sans-serif;
  font-style: italic;
}


</style>
</head>
<body>
<input id="sessionId" type="hidden" value="${sessionScope.member_id}">

<jsp:include page="../ticket/top.jsp" />
	<!-- Contaniner -->
	<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
		<!-- Contents Area -->
		 <div id="contents" class="">
            <!-- Contents Start -->
			
<div class="sect-common">
    <div class="favorite-wrap">
        <div class="sect-favorite">
            <h4 style="z-index: 999; font-size: 24px; color: white; font-weight: 900; top: 20px;"><i id="fav_theater">자주가는 극장</i></h4>
            <ul id="favoriteTheaters">
	           	<c:forEach begin="0" end="4" varStatus="Status">
	           	<c:set var="favTH" value="${Status.index < favTheater.size() ? favTheater.get(Status.index) : ''}" />
					<li>
						<a href="javascript:void(0)" data-th="${favTH}">
							<span>${Status.count}</span>
							<em>
								${favTH}
							</em>
						</a>
					</li>
				</c:forEach>
            </ul>
            <button id="btn_set_my_favorite" type="button" title="새창">자주가는 극장 설정</button>
        </div>
        
<script type="text/javascript">
let sessionId;

$(function() {
	$('#favoriteTheaters a').on('click', function() {
		$('.sect-city').find('li').removeClass('on');
		document.getElementById('wrapEvent').scrollIntoView({ behavior: 'smooth' });
        var dataTh = $(this).data('th');
        $('.area-link').trigger('click', [dataTh]);
        $('#ulcontent>li').removeClass('on');
	});
});



</script>
        <div class="sect-city" style="display: flex; height: auto">
	        <ul>
			<c:forEach var="region" items="${regionList}">
				<li>
					<a href="javascript:void(0)" class="region">${region.TH_REGION}</a>
				</li>
			</c:forEach>
	        </ul>
	        <div class="area" style="position:absolute; top: 220px;">
				<ul id="ulcontent">
				</ul>
			</div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function() {
	sessionId = $('#sessionId').val();
	$('#btn_set_my_favorite').on('click', function() {
		if(sessionId == null || sessionId == '') {
			alert('로그인 후 이용해주세요')
			return;
		}
		
		var regionList = $('.region').map(function() {
		    return $(this).text();
		}).get();
		
		
		var text = `
			<div class="layer-wrap" style="margin-top: -253px; margin-left: -320px; position: fixed;">
		    <div class="popwrap" style="width:633px;">
		        <h1>자주 가는 극장 설정</h1>
		        <div class="pop-contents fav-cgv">
		        <!-- Contents Addon -->
		            <div class="sect-cgv-control">
		                <h2 class="hidden">선호하는 지역 및 영화관 선택</h2>
		                <p>영화관을 선택하여 등록해주세요. <strong>최대 5개까지</strong> 등록하실 수 있습니다.</p>
		                <p>
		                    <select id="select_region" name="" title="자주가는 지역선택">                        
		                    	<option value="" selected="selected">지역선택</option>
		                    </select>	
		                    <select id="select_theater" name="" title="자주가는 극장선택">                        
		                    	<option value="" selected="selected">극장선택</option>
	                    	</select> 
		                    <button id="btn_add_favorite_theater" type="button" class="round inblack on"><span>선호하는 극장 추가</span></button>
		                </p>
		            </div>
		            <div class="sect-favorite-control">
		                <h2><strong>${sessionScope.member_id}</strong>님이 자주 가는 극장</h2>
		                <div class="theater-choice">
		                    <ul>
		                    </ul>
		                </div>
		            </div>
					<div class="set-btn fix-width">
		                <button type="submit" id="btnSave" class="round inred"><span>등록하기</span></button> 
		            </div>
	
		        <!-- //Contents Addon -->
		        </div>
		        <button id="btn_close" type="button" class="btn-close">자주가는 극장 팝업 닫기</button>
		    </div>
		</div>
		`
		$('body').append(text);
		
		regionList.forEach(function(list) {
			$('#select_region').append(`<option value="\${list}">\${list}</option>`);
		})
		
		
 		var favth = regionList = $('#favoriteTheaters').find('em').map(function() {
 		    return $(this).text();
 		}).get();
		
		for(var i = 0; i < 5; i++) {
			var myTheater = favth[i] != null ? favth[i] : '';
			
			$('.theater-choice>ul').append(`
				<li class="none" style="margin:5px;">
                    <div class="box-polaroid">
                        <div class="box-inner">
                            <div class="theater" style="font-size:13px; text-align: center;">\${myTheater}</div>
                            <button type="button" data-theater="\${myTheater}" style="background: #e2e2e0 url(https://img.cgv.co.kr/R2014/images/common/ico/ico_close.png) no-repeat 6px 50%;">삭제</button>
                        </div>
                    </div>
                </li>
			`);
		}
		
	});
});

$(document).on('click', '#btnSave', function() {
	$('.btn-close').trigger('click');
})

$(document).on('click', '.box-inner>button', function() {
	var thList = $('.box-inner>button').not($(this)).map(function() {
        return $(this).data('theater'); // data-theater 속성 값 가져오기
    }).get();
	
	var deleteTh = thList.join(',');
	
	$.ajax({
		type : 'POST',
		url : "${pageContext.request.contextPath}/theater/myFavTheater",
		data : {'DELETE_TH': deleteTh , "MEM_ID":sessionId},
		success: function(result) {
			$('.theater-choice>ul').html('');
			for(var i = 0; i < 5; i++) {
				var myTheater = thList[i] != null ? thList[i] : '';
				$('.theater-choice>ul').append(`
					<li class="none" style="margin:5px;">
	                    <div class="box-polaroid">
	                        <div class="box-inner">
	                            <div class="theater" style="font-size:13px; text-align: center;">\${myTheater}</div>
	                            <button type="button" data-theater="\${myTheater}" style="background: #e2e2e0 url(https://img.cgv.co.kr/R2014/images/common/ico/ico_close.png) no-repeat 6px 50%;">삭제</button>
	                        </div>
	                    </div>
	                </li>
				`);
			}
			
		},
		error: function(e) {
			
		}
	});
});

let selectRegion;

// 자주가는 극장 추가할때 사용
$(document).on('change', '#select_region', function() {
	selectRegion = $('#select_region').val();
	$.ajax({
		type : 'get',
		url : "${pageContext.request.contextPath}/theater/getArea",
		data : {'TH_REGION': selectRegion},
		dataType: 'json',
		success: function(areaList) {
			$('#select_theater').html(`<option value="" selected="selected">극장선택</option>`);
			areaList.forEach(function(area) {
				$('#select_theater').append(`<option value="\${area.TH_NAME}">\${area.TH_NAME}</option>`)
			});
		},
		error: function() {
			alert('오류')
		}
	});//ajax 종료	
});

$(document).on('click', '#btn_add_favorite_theater', function() {
	var selectArea = $('#select_theater').val();
	
	$.ajax({
		type : 'post',
		url : "${pageContext.request.contextPath}/theater/myFavTheater",
		data : {'MEM_ID':sessionId, 'TH_NAME': selectArea},
		success: function() {
			var currtheater = $('.box-inner>.theater').filter(function() {
		        return $(this).text().trim() != '';
		    })
		    .map(function() {
		        return $(this).text().trim();
		    })
		    .get();
			
			$('.theater-choice>ul').html('');
			
			currtheater.push(selectArea);
			
			var setTheater = new Set(currtheater);
			currtheater = Array.from(setTheater);
			for(var i = 0; i < 5; i++) {
				var myTheater = currtheater[i] != null ? currtheater[i] : '';
				$('.theater-choice>ul').append(`
					<li class="none" style="margin:5px;">
	                    <div class="box-polaroid">
	                        <div class="box-inner">
	                            <div class="theater" style="font-size:13px; text-align: center;">\${myTheater}</div>
	                            <button type="button" data-theater="\${myTheater}" style="background: #e2e2e0 url(https://img.cgv.co.kr/R2014/images/common/ico/ico_close.png) no-repeat 6px 50%;">삭제</button>
	                        </div>
	                    </div>
	                </li>
				`);
			}
			
		},
		error: function(e) {
			if(e.responseText == "sizeOver") {
				alert('등록 할 수 있는 최대개수 초과')
			} else if(e.responseText == "notUpdate"){
				alert('이미 등록된 극장입니다');	
			}
		}
	});
});	



let region;
$(function() {
	// 특정 지역 선택시 극장을 띄우기 위해 사용 
	$('.region').on('click', function() {
		region = $(this).text();
		$('.sect-city li').removeClass();
		$(this).parent('li').addClass('on');
		
		$.ajax({
			type : 'get',
			url : "${pageContext.request.contextPath}/theater/getArea",
			data : {'TH_REGION': region},
			dataType: 'json',
			success: function(areaList) {
				$('#ulcontent').html('');
				
				areaList.forEach(function(area) {
					var text = `
						<li>
		                    <a style="padding: 0 5px;" href="javascript:void(0);" class="area-link" title="\${area.TH_NAME}">
			                    \${area.TH_NAME}
			                    <span hidden="hidden">\${area.TH_NUM}</span>
			                    <input type="hidden" value="\${area.TH_ADDR}">
			                </a>
			            </li>
			            `
		            $('.txt-info').html(area.TH_ADDR);
					$('#ulcontent').append(text);	
				});
				
				$('.area-link:first').trigger('click');
			},
			error: function() {
				alert('오류')
			}
		});
	});
})

</script>

<!-- 실컨텐츠 시작 -->
<script type="text/javascript">
var addr;
var thName;
var thNum;
//극장의 특정 지점 클릭시
$(document).on('click', '.area-link', function(event, eventText) {
	thNum = $(this).find('span').text();
	if(eventText == null) {
		thName = $(this).attr('title');
	} else {
		thName = eventText;
	}
	
	$('.sect-showtimes>ul').html('')
	$('.theater-tit span').text(thName + '점');
	
	$('#ulcontent>li').removeClass('on');	
	$(this).parent('li').addClass('on');
	
	addr = $(this).find('input').val();
	$('.title>span').text(addr);
	
	$.ajax({
		type: 'GET',
		url: '${pageContext.request.contextPath}/theater/runningDate',
	    data: {'TH_NAME': thName},
	    datatype: 'JSON',
	    success: function(result) {
			$('.item').html('');
			result.forEach(function(resultDate, index) {
	    		var date = resultDate.DATE.split('-');
	    		var dayWeek = resultDate.DAYWEEK
	    		var text = `		
                    <li style="margin-top: 15px">
                    <div class="day">
                        <a href="javascript:void(0)" title="현재 선택">
                        	<input type="hidden" value="\${resultDate.DATE}">
                            <span>\${date[1]}월</span> 
                            <em>\${dayWeek}</em>
                            <strong>\${date[2]}</strong>
                        </a>
                    </div>
                	</li>`;
              	$('.item').append(text);
              	if(index >= 8) $('.day:last').hide();
			});
			$('.day:visible').eq(0).find('a').trigger('click');
	    },
	    error: function(error) {
	    	
		}
	});// ajax 끝
	
	
});
</script>
<div class="wrap-theater">
    <h3 id="wrapEvent"><img src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif" alt="THEATER"></h3>
    <div class="sect-theater ">
        <h4 class="theater-tit"><span></span></h4>
<!--         <a href="/support/lease/default.aspx" class="round inred btn_lease"><span style="padding:0 14px;">단체/대관문의</span></a> -->
        
        <div class="wrap-theaterinfo">
            <div class="box-image">
                <div id="theater_img_container" class="thumb-image"><img src="https://img.cgv.co.kr/Theater/Theater/2014/1211/CGVgangnam.jpg"></div>
            </div>
            <div class="box-contents">
                <div class="theater-info">
                    <span class="txt-info">
<!--                         <em></em> -->
<!--                         <em></em> -->
                        <span></span>
                    </span>
                    <!-- 최대 10개까지만 보여집니다 2 -->
<!--                     <span class="screentype"> -->
<!--                             <a href="/theaters/special/?regioncode=SCX&amp;theaterCode=0056" class="screenX">SCREENX</a> -->
<!--                     </span> -->
                </div>
                <div class="noti-theater">
                    <h5>공지사항</h5>
                    <ul>
                    	
                    </ul>
                    <a class="link-more" href="${pageContext.request.contextPath}/inquiry/news" target="" title="새창 열림">공지사항 더보기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- .sect-theater -->
    <div class="theater-ad">
        <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@SponsorBar_980" width="980" height="90" title="광고-파일럿" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="SponsorBar_980" id="SponsorBar_980"></iframe>
    </div>
    <div class="cols-content">
        <!-- 상영시간표 UserControl -->
        
<div class="col-detail"> 
<!-- 탭메뉴 class="on" 에따라서 아래 h4 내용을 바꿔주세요 -->                
<h4 class="hidden"> + [상영시간표]</h4>
            
<!-- Showtimes Start -->
<div class="showtimes-wrap">
        <div class="sect-schedule">
            <div id="slider" class="slider" style="width: 100%; padding:0; height: 100%">
				<div class="item-wrap on" style="height: 100%;">
					<ul class="item" style="width: 800px; height: 111px;">
					</ul>
				</div>
				<button type="button" class="btn-prev">이전 날자보기</button>
               	<button type="button" class="btn-next">다음 날자보기</button>
               	<div class="descri-info theater" style="display: block;">
				    <ul>
				        <li>
				        	<a href="javascript:void(0)" id="viewgrade" class="viewgrade">관람등급 안내</a>
			        	</li>
				    </ul>
				</div>
			</div>
			<!-- sect-schedule -->
<!-- 탭메뉴 class="on" 에따라서 아래 h4 내용을 바꿔주세요 -->                
<h4 class="hidden"> + [상영시간표]</h4>
            
<!-- Showtimes Start -->
<!-- Contents Start -->
			<!-- sect-schedule -->
<script type="text/javascript">
$(document).on('click', '.day>a', function() {
	$('.day').parent('li').removeClass();
	$(this).parents('li').addClass('on');
	
	var scDate = $(this).find('input').val();
	
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath}/theater/runningMovie',
		    data: {'TH_NAME': thName, 'DATE': scDate, 'TH_REGION':region},
		    datatype: 'JSON',
		    success: function(result) {
		    	var pre;
		    	$('.sect-showtimes>ul').html('');
		    	
		    	result.forEach(function(scList, index) {
		    		if(index == 0 || pre.MOVIE_NUM != scList.MOVIE_NUM) {
		    			var rating = scList.RATING.substr(0, 2);
		    			rating = rating == '전체' 	? 'All' 	:
		    					 rating == '청소' 	? 18 		:
		    					 rating == '미정' 	? 'Notyet' 	:
		    					 rating > 18		? 18 		: rating;
		    					 
			            // 받아온 날자값 변환    		
			            var rDate = scList.D_DAY <= 0 ? '상영중' : '예매중';
			            
			    		var text = `
		 		    	<li>
		 		    	<div class="col-times">
		 		    		<div class="info-movie">
		 		    			<i class="cgvIcon etc age\${rating}">\${rating}</i>
		 		    			<a href="${pageContext.request.contextPath}/movie/information?num=\${scList.MOVIE_NUM}" target="_parent">
									<strong>\${scList.TITLE}</strong>
								</a>
		 		    			<span class="round">
		 		    				<em>\${rDate}</em>
		 		    			</span>
		 		    			<span class="round">
		 		    				<em>${D_DAY > 0 ? D_DAY : null}</em>
		 		    			</span>
								<i>\${scList.GENRE}</i> / <i>\${scList.RUNTIME}분</i> / <i>\${scList.RELEASEDATE} 개봉</i>
		 		    		</div>
		 		    	</div>
		 		    	</li>
						`;
						$('.sect-showtimes>ul').append(text);
						
						if(rDate == '예매중') {
							$('.col-times:last').find('.round').eq(0).addClass('brown').eq(1).addClass('red');
						} else {
							$('.col-times:last').find('.round').eq(0).addClass('round lightblue');
						}
		    		};
		    		
		    		var text = `<div class="type-hall">
	    							<div class="info-hall">
		 		    					<ul>
		 		    						<li>2D</li>
		 		    						<li>\${scList.TH_NUMBER}</li>
		 		    						<li>총 \${scList.SE_COUNT}석</li>
		 		    					</ul>
	  		    					<div class="info-timetable">
		                                <ul>
	    	                            </ul>
	                             	</div>
	  		    				</div>
	  		    				</div>`
	  		    				
		  		    if(index == 0 || scList.MOVIE_NUM != pre.MOVIE_NUM || scList.TH_NUMBER != pre.TH_NUMBER) {
		  		    	$('.col-times:last').append(text);
		  		    }
		    		
		    		// 상영시작시각 변환
		    		var timeTable = `<li style="padding: 5px 0 0;">
						    		    <a href="${pageContext.request.contextPath}/ticket?num=\${scList.MOVIE_NUM}" target="">
							    	        <em>\${scList.SC_TIME}</em>
							    	        <span class="txt-lightblue">
							    	            <span class="hidden">잔여좌석</span>113석
							    	        </span>
							    	    </a>
							    	</li>`
							    	
		    		$('.info-timetable:last').find('ul').append(timeTable);
	     		
		    		// 값 저장해서 다음 루프에서 값을 비교할때 사용
		    		pre = scList;	
				});
		    	
		    },// success 종료
		    error: function(error) {
// 		    	alert('에러');
			}
		});
});

// 페이지 표시 함수
function pageCount(num) {
	$('.day').hide();
		$('.day').filter(index => index >= (pageSize * num) && index < pageSize * (num + 1)).show();
}

// 보이는 첫 페이지 클릭

$(function() {
	var pageSize = 8;
	// 날자 클릭시
	//이전날짜
	$('.btn-prev').on('click', function() {
		if($('.day:first').is(':visible')) return;
		$('.day:visible:last').hide();
		var firstIndex = 	$('.day').index($('.day:visible:first'));
		$('.day').eq(firstIndex - 1).show();
		
	});
	
	//다음 페이지
	$('.btn-next').on('click', function() {
		if($('.day:last').is(':visible')) return;
		
		$('.day:visible:first').hide();
		var lastIndex =	$('.day').index($('.day:visible:last'));
		
		$('.day').eq(lastIndex + 1).show();
	});
	
});

$(document).ready(function() {
	$('.region:first').trigger('click');
// 	$('.area-link:visible:first').trigger('click');
	pageCount(0);
});

</script>
        <div class="sect-guide">
            <div class="descri-timezone">
<!--                 <ul> -->
<!--                     <li><span class="early">모닝</span></li> -->
<!--                     <li><span class="midnight">심야</span></li> -->
<!--                 </ul> -->
                <p>* 입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.</p>
            </div>
        </div>

        <div class="sect-showtimes">
            <ul>
            </ul>
        </div>
      
        <p class="info-noti">
            </p><p></p>
        <p></p>
    </div>
<!--/ Contents End -->
<!-- /Showtimes End -->

</div>
        </div>
        <div class="col-aside">
            <div class="ad-partner01"> 
            	<iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@M_Rectangle" width="160" height="300" title="영화광고-파일럿" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="M_Rectangle" id="M_Rectangle"></iframe>
            </div>
            <div class="ad-partner02">
            	<iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@C_Rectangle" width="160" height="300" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="C_Rectangle" id="C_Rectangle"></iframe>
            </div>
    </div>
</div>
<!-- 실컨텐츠 끝 --> 

            
            <!--/ Contents End -->
		 </div>
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
	<!-- E Footer -->

    
</div>
</body>
<script type="text/javascript">
$(function() {
	$('#viewgrade').on('click', function() {
		var text = `<div class="layer-wrap" style="">
						<div class="layer-contents" style="width:650px;">
					    <div class="popwrap">
				        <h5>관람 등급 안내</h5>
				        <div class="pop-contents">
				            <div class="tbl-list">
				                <table summary="CGV 등급별 관람 안내">
				                    <caption>CGV 관람 등급 안내</caption>
				                    <colgroup>
				                        <col width="136">
				                        <col width="*">
				                    </colgroup>
				                    <thead>
				                        <tr>
				                            <th scope="col">구분</th>
				                            <th scope="col">성명</th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                        <tr>
				                            <!--<th scope="row"><span class="ico-grade grade-all">전체 관람가</span>전체 관람가</th>
				                            <td>모든 연령의 고객님께서 관람하실 수 있습니다.</td>-->
				                            <th scope="row"><i class="cgvIcon etc ageAll">ALL</i>전체 관람가</th>
				                            <td>모든 연령의 고객님께서 관람하실 수 있습니다.</td>
				                        </tr>
				                        <tr>
				                            <th scope="row"><i class="cgvIcon etc age12">12</i>12세 관람가</th>
				                            <td>만 12세 미만의 고객님은 보호자를 동반하셔야 관람하실 수 있습니다.</td>
				                        </tr>
				                        <tr>
				                            <th scope="row"><i class="cgvIcon etc age15">15</i>15세 관람가</th>
				                            <td>만 15세 미만의 고객님은 보호자를 동반하셔야 관람하실 수 있습니다.</td>
				                        </tr>
				                        <tr>
				                            <th scope="row"><i class="cgvIcon etc age18">18</i>청소년관람불가</th>
				                            <td>만 19세 미만(영/유아 포함)은 보호자가 동반하여도 관람이 불가합니다.<br>
				                                (단, 만19세가 되는 해의 1월 1일을 맞이한 사람은 제외) <br>
				                                - 입장 시 신분증을 꼭 지참하시기 바랍니다<br>
				                                - 신분증(사진/캡쳐 불가)<br>
				                                &nbsp;&nbsp;주민등록증, 운전면허증, 여권, 모바일신분증(PASS, 정부24등)
				                            </td>
				                        </tr>
				                        <tr>
				                            <th scope="row"><i class="cgvIcon etc ageNotyet">미정</i>미정</th>
				                            <td>등급 미정 영화입니다.</td>
				                        </tr>
				                    </tbody>
				                </table>
				            </div>
				        </div>
				    </div>
			
				    <button type="button" class="btn-close">관람 등급 안내 닫기</button>
				</div></div>`
				
				$(this).parent('li').append(text);
	});
});
$(document).on('click', '.btn-close', function() {
	$('.layer-wrap').remove();
	location.reload();
});
</script>
</head>
<link href="${pageContext.request.contextPath}/resources/css/movie/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/module.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/eggupdate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/preegg.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/cgv.min.css" rel="stylesheet">
 </html>