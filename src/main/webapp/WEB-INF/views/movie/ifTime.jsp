<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/movie/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/module.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/eggupdate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/preegg.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/cgv.min.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>

</head>

<body class="" marginwidth="0" marginheight="0" style="background-color: rgb(255, 255, 255); height: 2000px;">
<!-- Contents Start -->
<div class="showtimes-wrap" style="display: block; height: 2000px;">
    <div class="sect-city">
        <ul>
        <c:if test="${region != null && !empty region}">
        <c:forEach var="region" items="${region}">
			<li>
				<a href="javascript:void(0)" class="regionLink" title="">${region.TH_REGION}</a>
			</li>
		</c:forEach>
		</c:if>
        </ul>
    </div> 
<script type="text/javascript">
// 다른곳에서도 현재 thRegion값을 사용할수 있도록 선언
let thRegion;
let movieNum;

$(function() {
	var url = new URLSearchParams(window.location.search);
	movieNum = url.get("MOVIE_NUM");
	
	
	
	
	$('.regionLink').on('click', function() {
		thRegion = $(this).text();

		$('.region>li').removeClass('on')
		$(this).parents('li').addClass('on');
		$.ajax({
			type: 'get',
			url: '${pageContext.request.contextPath}/movie/runningDate',
			data: {"TH_REGION": thRegion, "MOVIE_NUM" : movieNum},
			dataType: 'json',
			success: function(result) {
				$('.item').html('')
				result.forEach(function(result) {
					var date = result.DATE.split('-');
					var text = `<li>
						             <div class="day">
				                        <a href="javascript:void(0)" title="현재 선택">
				                            <span> \${date[1]}월</span>
				                            <em>\${result.dayWeek}</em>
				                            <strong>\${date[2]}</strong>
				                            <input type="hidden" value="\${result.DATE}">
				                        </a>
				                    </div>
				                </li>`;
					
					$('.item').append(text);
					
					
					$('.day:first>a').trigger('click');
				});
			},
			error: function(e) {
			}
		});// ajax 종료
	});// function 종료
	
	
	$('.regionLink:first').trigger('click');
});
$(document).on('click', '.day>a', function() {
	var currDate = $(this).find('input').val();
	
	$.ajax({
		type: 'get',
		url: '${pageContext.request.contextPath}/movie/thMovies',
		data: {"TH_REGION": thRegion, "MOVIE_NUM": movieNum, "C_DATE" : currDate},
		dataType: 'json',
		success: function(result) {
			var prevList;
			$('#movieShowtimes>ul').html('');
			result.forEach(function(thList, index) {
				if(index == 0 || thList.TH_NAME != prevList.TH_NAME) {
					var text = `<li>
					                <div class="col-theater"><a href="javascript:return false;" target="_top">\${thList.TH_NAME}</a></div>
					                <div class="col-times">
					                </div>
					                </div>
					            </li>
					            `;
					            
					$('#movieShowtimes>ul').append(text);
				} // $('.sect-showtimes>ul').append;
				
				if(index == 0 || thList.TH_NUMBER != prevList.TH_NUMBER || thList.TH_NAME != prevList.TH_NAME) {
					$('.col-times:last').append(`
							<div class="type-hall">
		                        <div class="info-hall">
		                            <ul>
		                                <li>2D</li>                                
		                                <li><span class='screentype'>\${thList.TH_NUMBER}</span></li>
		                                <li>총 30석</li>
		                            </ul>
		                        </div>
		                    </div>
		                    <div class="info-timetable">
								<ul>
								</ul>
							</div>
						`);
				}// $('.col-times:last').append;
				
				
				$('.info-timetable:last>ul').append(`
							<li>
							  <a href="">
							    <em>\${thList.SC_TIME}</em>
							    <span class="txt-lightblue">
							      <span class="hidden">잔여좌석</span>24석
							    </span>
							  </a>
							</li>
						`)
				prevList = thList;
			});
		},
		error: function(e) {
			debugger;
		}
	});//ajax 종료
});// $('.day>a').on('click)

</script>
    <div class="sect-schedule">
		<div id="slider" class="slider">
           <div class="item-wrap on">
            <ul class="item" style="width: 800px; height: 111px;">
            	<!-- 스크립트로 데이터 추가 변경 -->
            </ul>
            </div>
			<button type="button" class="btn-prev">이전 날자보기</button>
			<button type="button" class="btn-next">다음 날자보기</button>
		</div>
    </div>
    <div class="sect-guide">
        <div class="descri-timezone">
            <ul>
                <li><span class="early">모닝</span></li>
                <li><span class="midnight">심야</span></li>
            </ul>
            <p>* 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.</p>
        </div>
    </div>


    <div id="movieShowtimes" class="sect-showtimes">
        <ul>
        	<!-- 스크립트로 데이터 추가 -->
        </ul>
    </div>
    <p class="info-noti">* 입장 지연에 따른 관람불편을 최소화하고자 영화는 약 10분 후에 시작됩니다. 관람 에티켓을 위한 사전 입장 부탁드립니다.</p>
</div>
<script type="text/javascript">
// $(document).on('click', '.day>a', function() {
	
// });
</script>

<!--/ Contents End -->


<script type="text/javascript">
//     $("html, body, #contaniner, #footer").css("background-color", "#ffffff");
</script>


</body>
</html>