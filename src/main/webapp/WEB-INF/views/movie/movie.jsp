<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie</title>
<link href="${pageContext.request.contextPath}/resources/css/movie/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/module.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie/icon.css" rel=stylesheet>
<link href="${pageContext.request.contextPath}/resources/css/movie/cgv.min.css" rel=stylesheet>

<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript">

function startPage() {
	// 20등까지 등수	
	$(".chart-box:visible").find('.rank').each(function(i) {
		if(i < 20) {
			$(this).text('No.' + (i + 1));
			$(this).css('visibility', 'visible');
		} else {
			$(this).css('visibility', 'hidden');
		}
	});	// each
	
	// 보여야할 모든 데이터가 출력중이면 더보기 버튼 비활성화
	if($(".chart-box:visible").length == ($(".chart-box").length - $('.notShow:hidden').length)) {
		$(".btn-more-fontbold").hide();
	} else {
		$(".btn-more-fontbold").show();
	}
}

//리스트 제한
function movieLimit() {
	$(".chart-box:visible").each(function(i) {
		if(i >= 20) $(this).hide();	
	});	// each
}


$(function() {
	// ready
	let url = new URLSearchParams(window.location.search);
	if(url.get('page') != 2) {
		movieLimit();
		startPage();
	}
	
// 	$(document).ready(function() {
// 		let url = new URLSearchParams(window.location.search);
		
// 		if(url.get('page') != 2) movieLimit();
		
// 		else {
// 			$(".submenu").find('li').removeClass('on');
// 			$('a').parent('li').eq(1).addClass('on');
// 		}
// 		startPage();
// 	});
	
	// 현재 상영작만 보기 체크박스 상태 변화시
	$("#chk_nowshow").change(function() {
// 		if ($("#chk_nowshow").is(':checked')) {
// 			$('.notShow').hide()
// 	    } else {
// 	    	$('.notShow').show()
// 	    }
		// #chk_nowshow 현재 상영작만 보기 체크박스 체크 여부에 따라 DB에서 받아온 데이터를 class에 .notShow로 적용된
		// 데이터를 숨길지 말지 판별
		let showChange = 
			$("#chk_nowshow").is(':checked') ? $('.notShow').hide() : $('.notShow').show();
		
		// 현재 상영작만 볼시 데이터가 줄었다 늘어나면서 20개 이상 출력되는 경우가 있는데
		// 데이터가 전부 출력된 상태면 더보기 버튼을 숨기고 있는 상태기 때문에
		// .btn-more-fontbold 더보기 버튼이 현재 보이는 상태인지 안 보이는 상태인지 판별해서 보이는 상태면
		startPage();
		if($('.btn-more-fontbold').css('display') != 'none') movieLimit();  	
	});
	
// 	// 더보기 버튼 클릭 이벤트
	$(".btn-more-fontbold").click(function() {
		$('.chart-box').show();
		$("#chk_nowshow").trigger("change");
	});
	
	
	// GO버튼 클릭시 정렬 이벤트
	$(".round_gray").click(function() {
		let check = $("#chk_nowshow").is(':checked');
		
		$.ajax({
            type: 'get',
    		url: "${pageContext.request.contextPath}/movie/sortMovies?val=" + $('#order_type').val(), // select중 어느게 선택되어 있는지 value값을 숫자 1(예매율), 2(평점), 3(관람객)으로 받아옴
//     		data: {"val" : $('#order_type').val()} 
            dataType: 'json',
            success: function(result) {
                $.each(result, function(index, movieDTO) {
                	$('#ol-movie-chart').html(`
						<li class="\${movieDTO.show} chart-box">
                            <div class="box-image">
                                <strong class="rank"></strong>
                                <a href="${pageContext.request.contextPath}/resources/img/\${movieDTO.MOVIE_NUM}.jpg">
                                    <span class="thumb-image">
                                        <img src="${pageContext.request.contextPath}/resources/img/0.jpg" alt="???" onerror="errorImage(this)">
                                        <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                         <i class="cgvIcon etc age\${movieDTO.RATING}">\${movieDTO.RATING}</i>
                                        <!-- <span class="ico-grade 12">12</span> -->
                                    </span>
                                </a>
        <!--                         <span class="screentype"> -->
        <!--                                 <a class="imax" href="#" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a> -->
        <!--                         </span> -->
                            </div>
                            
                            <div class="box-contents">
                                <a href="${pageContext.request.contextPath}/movie/information?num=\${movieDTO.MOVIE_NUM}">
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
                                        \${movieDTO.releaseDate}
                                        <span>개봉</span>
                                        <em class="dday">???</em>
                                    </strong>
                                </span>
                                <span class="like"> 
                                    <a class="link-reservation" href="#">예매하기</a>
                                </span>
                            </div>    
                        </li>
                        `); // $('#ol-movie-chart').append 종료
   	                });
            	
            		debugger;
	                // 현재 상영작만 보기 체크박스가 체크되어 있으면 현재 상영작만 출력하도록 만들어둔 이벤트 호출
	                $("#chk_nowshow").prop("checked", check);
	        		$("#chk_nowshow").trigger("change");
	        		if($(".chart-box:visible").length > 20) movieLimit();
	        		startPage();
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
                    <li class="${on1}"><a href="${pageContext.request.contextPath}/movie/movie" title="선택">무비차트</a></li>
                    <li class="${on2}"><a href="${pageContext.request.contextPath}/movie/movie?page=pre_movie">상영예정작</a></li>
                    <!--<li><a href="/movie/?lt=3">CGV아트하우스</a></li>//-->
                </ul>
            </div>
        </div>
        <!-- //Heading Map Multi -->
        <!-- Sorting -->
        <c:if test="${empty page}">
        <div class="sect-sorting">
             <div class="nowshow">
                        <input type="checkbox" id="chk_nowshow">
                <label for="chk_nowshow">현재 상영작만 보기</label>                
            </div>
            <label for="order_type" class="hidden">정렬</label>
            <select id="order_type" name="order-type">
				<option title="현재 선택됨" selected="selected" value="1">예매율순</option>
                <option value="2">평점순</option>
                <option value="3">관람객순</option>
            </select>
            <button type="button" class="round_gray"><span>GO</span></button>
        </div>
        
        </c:if>
        <!-- //Sorting -->


	<!-- 상영예정작페이지 경우 page에 값이 있고 그 경우에 서식을 다르게 -->
	<c:choose>
		<c:when test="${page == null}">
        <div class="sect-movie-chart">
            <ol id="ol-movie-chart">
            <c:forEach var="movieDTO" items="${movieList}">
				<li class="${movieDTO.show} chart-box">
                    <div class="box-image">
                        <strong class="rank"></strong>
                        <a href="${pageContext.request.contextPath}/movie/information?num=${movieDTO.MOVIE_NUM}">
                            <span class="thumb-image">
                                <img src="${movieDTO.posterUrl}" alt="???" onerror="errorImage(this)" style="min-height: 260px;">
                                <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                <i class="cgvIcon etc age${movieDTO.rating}">${movieDTO.rating}</i>
                                <span class="ico-grade ${movieDTO.rating}">${movieDTO.rating}</span>
                            </span>
                        </a>
<!--                         <span class="screentype"> -->
<!--                                 <a class="imax" href="#" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a> -->
<!--                         </span> -->
                    </div>
                    
                    <div class="">
                        <a href="${pageContext.request.contextPath}/movie/information?num=${movieDTO.MOVIE_NUM}">
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
                                ${movieDTO.releaseDate}
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
            
            <button class="btn-more-fontbold">더보기</button>
        </div>
        </c:when>
        
        <c:otherwise>
         <div class="sect-movie-chart"> 
            <ol id="ol-movie-chart"> 
        
	        <c:forEach var="Top3" items="${Top3List}">
	        	<li>
					<div class="box-image">
						<!-- rank 를 숫자 데이터로 -->
						<strong class="rank">이달의 추천영화 ${Top3.rank}</strong>
						<a href="${pageContext.request.contextPath}/movie/information?num=${Top3.MOVIE_NUM}">
<!-- 							<span class="thumb-image"> -->
								<img src="${pageContext.request.contextPath}/resources/img/${Top3.MOVIE_NUM}.jpg" alt="데드풀과 울버린 포스터" onerror="errorImage(this)">
	                               <!-- 영상물 등급 노출 변경 2022.08.24 -->
	                                <i class="cgvIcon etc age${TOP3.rating}">${TOP3.rating}</i>
	                               <!-- <span class="ico-grade 18">18</span> -->
<!-- 	                           </span> -->
						</a>
	<!--                         <span class="screentype"> -->
	<!--                                 <a class="imax" href="#" data-regioncode="07">IMAX</a> -->
	<!--                                 <a class="forDX" href="#" data-regioncode="4D14">4DX</a> -->
	<!--                         </span> -->
					</div>
	                    <div class="box-contents">
	                        <a href="${pageContext.request.contextPath}/movie/information?num=${Top3.MOVIE_NUM}">	                            
	                        	<strong class="title">${Top3.title}</strong>
	                        </a>
	
	                        <div class="score">
		                            <strong class="percent">예매율<span>17.8%</span></strong>
	                            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 -->
<!-- 	                            <div class="egg-gage small "> -->
<!--                                     <span class="sprite_preegg default"></span> -->
<!--                                     <span class="percent">99%</span> -->
<!--                                </div> -->
	                        </div>
	
	                        <span class="txt-info">
	                            <strong>
	                                ${Top3.releaseDate} 
								<span>개봉</span>
							<em class="dday">D-6</em>
						</strong>
						</span>
						<span class="like"> 
							<a class="link-reservation" href="/ticket/?MOVIE_CD=20037162&amp;MOVIE_CD_GROUP=20036434">예매</a>
						</span>
					</div>    
				</li>
	        </c:forEach>
		</ol>
		</div>
		
		
		<div class="sect-movie-chart">
		<c:set var="stepCount" value="0" />		
		<c:forEach var="movieDate" items="${movieDate}">
		<h4>
			<span class="hidden">상영예정작</span> ${movieDate.rDate} 
		</h4>
        	<ol id="ol-movie-chart">
        	<c:forEach var="movieDTO" items="${movieList}" begin="${stepCount}" end="${stepCount + movieDate.COUNT - 1}" step="1">
        	<li>
				<div class="box-image">
					<a href="${pageContext.request.contextPath}/movie/information?num=${movieDTO.MOVIE_NUM}">
						<img src="${pageContext.request.contextPath}/resources/img/0.jpg" alt="" onerror="errorImage(this)">
					</a>
				</div>
                    <div class="box-contents">
                        <a href="${pageContext.request.contextPath}/movie/information?num=${movieDTO.MOVIE_NUM}">
                            <strong class="title">${movieDTO.title}</strong>
                        </a>
                        <div class="score">
                            <strong class="percent">예매율<span>17.8%</span></strong>
<!--                             2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 -->
<!--                             <div class="egg-gage small"> -->
<!--                                             <span class="sprite_preegg default"></span> -->
<!--                                             <span class="percent">99%</span> -->
<!--                                         </div> -->
                        </div>

                        <span class="txt-info">
                            <strong>
                                ${movieDate.rDate}
							<span>개봉</span>
						<em class="dday">D-6</em>
					</strong>
					</span>
					<span class="like"> 
						<a class="link-reservation" href="/ticket/?MOVIE_CD=20037162&amp;MOVIE_CD_GROUP=20036434">예매</a>
					</span>
				</div>    
			</li>
        	</c:forEach> <!-- 상영 예정 영화리스트 개봉일 별 2중 foreach문 끝 -->
		</ol>
		<c:set var="stepCount" value="${stepCount + movieDate.count}" />
		</c:forEach> <!-- 상영 예정 영화리스트 개봉일 별 2중 foreach문 바깥 -->        
		</div>
        </c:otherwise>
        </c:choose>
    </div><!-- .sect-moviechart -->
</div>	

</body>
</html>