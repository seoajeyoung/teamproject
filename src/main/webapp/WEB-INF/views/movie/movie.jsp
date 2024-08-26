<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link href="${pageContext.request.contextPath}/resources/css/movie/preegg.css" rel=stylesheet>
<link href="${pageContext.request.contextPath}/resources/css/movie/content.css" rel="stylesheet">

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
}

function fontbold() {
	// 보여야할 모든 데이터가 출력중이면 더보기 버튼 비활성화
	if($('#chk_nowshow').is(':checked')) {
		if($('.SHOWMOVIE:hidden').length != 0) {
			$(".btn-more-fontbold").show();
		} else {
			$(".btn-more-fontbold").hide();
		}
	} else {
		if($('.chart-box:hidden').length != 0) {
			$(".btn-more-fontbold").show();
		} else {
			$(".btn-more-fontbold").hide();
		}
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
	startPage();
	movieLimit();
	fontbold();
	
	
	// 현재 상영작만 보기 체크박스 상태 변화시
	$("#chk_nowshow").change(function() {
		// #chk_nowshow 현재 상영작만 보기 체크박스 체크 여부에 따라 DB에서 받아온 데이터를 class에 .notShow로 적용된
		// 데이터를 숨길지 말지 판별
		let showChange = 
			$("#chk_nowshow").is(':checked') ? $('.NOTSHOW').hide() : $('.NOTSHOW').show();
		startPage();
		movieLimit();
		fontbold();
	});
	
// 	// 더보기 버튼 클릭 이벤트
	$(".btn-more-fontbold").click(function() {
		$('.chart-box').show();
		fontbold();
	});
	
	
	// GO버튼 클릭시 정렬 이벤트
	$(".sort_btn").click(function() {
		let check = $("#chk_nowshow").is(':checked');
		var val = $('#order_type').val();
		$.ajax({
            type: 'get',
    		url: "${pageContext.request.contextPath}/movie/sortMovies", // select중 어느게 선택되어 있는지 value값을 숫자 1(예매율), 2(평점), 3(관람객)으로 받아옴
    		data: {"SORTSTR" : val},
            dataType: 'json',
            success: function(result) {
            	$('#ol-movie-chart').html('');
                $.each(result, function(index, movieDTO) {
                	var subRating = movieDTO.RATING;
                	if(subRating != null) {
                		subRating = subRating.substring(0, 2);
                		subRating = subRating == '전체' 	? 	'All' 	:
						subRating == '청소' 	? 	18 		: subRating;
                	}
                	
                	$('#ol-movie-chart').append(`
						<li class="\${movieDTO.SHOW} chart-box">
                            <div class="box-image">
                                <strong class="rank"></strong>
                                <a href="${pageContext.request.contextPath}/movie/information?num=\${movieDTO.MOVIE_NUM}">
                                    <span class="thumb-image">
                                        <img src="\${movieDTO.POSTERURL}" alt="???" onerror="errorImage(this)">
                                        <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                         <i class="cgvIcon etc age\${subRating}">\${subRating}</i>
                                        <!-- <span class="ico-grade 12">12</span> -->
                                    </span>
                                </a>
        <!--                         <span class="screentype"> -->
        <!--                                 <a class="imax" href="#" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a> -->
        <!--                         </span> -->
                            </div>
                            
                            <div class="box-contents">
                                <a href="${pageContext.request.contextPath}/movie/information?num=\${movieDTO.MOVIE_NUM}">
                                    <strong class="title">\${movieDTO.TITLE}</strong>
                                </a>

                                <div class="score">
                                    <strong class="percent">예매율<span>\${movieDTO.RATE}</span>%</strong>
                                    <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위1~ 3위)-->
        <!--                             <div class="egg-gage small"> -->
        <!--                                             <span class="sprite_preegg default"></span> -->
        <!--                                             <span class="percent">99%</span> -->
        <!--                             </div> -->
                                </div>
                                <span class="txt-info">
                                    <strong>
                                        \${movieDTO.RELEASEDATE}
                                        <span>개봉</span>
                                        <em class="dday">\${movieDTO.D_DAY > 0 ? 'D-' + movieDTO.D_DAY : ''}</em>
                                    </strong>
                                </span>
                                <span class="like"> 
                                    <a class="link-reservation" href="${pageContext.request.contextPath}/ticket?num=${movieDTO.MOVIE_NUM}">예매하기</a>
                                </span>
                            </div>    
                        </li>
                        `); // $('#ol-movie-chart').append 종료
   	                });
                
            	
	                // 현재 상영작만 보기 체크박스가 체크되어 있으면 현재 상영작만 출력하도록 만들어둔 이벤트 호출
	                $("#chk_nowshow").prop("checked", check);
	        		$("#chk_nowshow").trigger("change");
	        		movieLimit();
	        		startPage();
   	            }, // success
            error: function(e) {
                alert("에러 발생: " + e.responseText);
            }
		});
	}); // $(".sort_btn").click()
	//테스트
	$('.sort_btn').trigger('click');
});


$(function() {
	$('.favorMovie').on('click', function() {
		$.ajax({
			type: 'POST',
    		url: "${pageContext.request.contextPath}/movie/favorMovie",
            dataType: 'json',
            success: function(result) {
            	var text = `<div class="mask" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; z-index: 100; background-color: rgba(0, 0, 0, 0.8);"></div>
            		<div class="layer-wrap stillcut-viewer" style="margin-top: -253px; margin-left: -490px; position: fixed; height: 400px">
        			<div class="layer-contents" style="height:400px;">
        				<div class="slider" id="sliderBox" style="display: flex; align-items: center; justify-content: center;">
        					<button type="button" class="btn-prev">이전 페이지 이동</button>
        					<button type="button" class="btn-next">다음 페이지 이동</button>
        				</div>
        				<button class="btn-close">[팝업제목] 닫기</button>
        			</div>
        		</div>	
            	`
            	$('body').append(text);
            	result.forEach(function(relMovie) {
            		var text = `<div class="item-wrap relPage" style="display: flex; width: 300px; height:350px;">
				       		        <div class="item" style="background:none;">
				       				<div class="img_wrap" style="width: 300px; height:350px; display: flex; align-items: center; justify-content: center;">
				       					<a href="${pageContext.request.contextPath}/movie/information?num=\${relMovie.MOVIE_NUM}" style="position: relative">
					    				<img src="\${relMovie.POSTERURL}" alt=" 사일런트 나잇" style="position: relative">
					    					<i class="cgvIcon etc age${relMovie.RATING}" style="position:absolute; left: 5px; top: 5px;">18</i>
					    				</a>
					    			</div>
				   	     		</div>
				   	     		`
				   	$('.slider').append(text);  		
				});
            	
            	$('.item-wrap').not(':eq(0), :eq(1), :eq(2)').css('display', 'none');
            },
            error: function(e) {
				
			}
		})// ajax 끝
	});// favorMovie 클릭 이벤트 끝
});

//이전 요소
$(document).on('click', '.btn-prev', function() {
	var index = $('.relPage:visible:first').index('.relPage');
	if(index == 0) return;
	index = index - 1;
	$('.relPage').eq(index).show();
	$('.relPage:visible:last').hide();
});

$(document).on('click', '.btn-next', function() {
	var index = $('.relPage:visible:last').index('.relPage');
	var lastIndex = $('.relPage:last').index('.relPage');
	if(index == lastIndex) return;
	index = index + 1;
	$('.relPage').eq(index).show();
	$('.relPage:visible:first').hide();
});

// 회원 영화추천 페이지 닫기
$(document).on('click', '.btn-close', function() {
    $('.mask').remove();
    $('.layer-wrap').remove();
});
</script>
<style type="text/css">
.btn-next {
	position: relative;
	right: 10px;
}

</style>
</head>
<body>
<jsp:include page="../ticket/top.jsp" />


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
                	<c:if test="${sessionScope.id != null}">
                	<li><a class="favorMovie" href="javascript:void(0)">회원추천영화</a></li>
                	</c:if>
                    <li class="on"><a href="${pageContext.request.contextPath}/movie/movie" title="선택">무비차트</a></li>
                    <li class="upcomingMovies"><a href="javascript:void(0)">상영예정작</a></li>
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
				<option title="현재 선택됨" selected="selected" value="SORTRATE">예매율순</option>
                <option value="SORTLIKED">평점순</option>
                <option value="SORTRANK">랭킹순</option>
            </select>
            <button type="button" class="sort_btn round gray"><span>GO</span></button>
        </div>
        <!-- //Sorting -->

	<!-- 상영예정작페이지 경우 page에 값이 있고 그 경우에 서식을 다르게 -->
        <div class="sect-movie-chart">
            <ol id="ol-movie-chart">
<%--             <c:forEach var="movieDTO" items="${movieList}"> --%>
<%-- 				<li class="${movieDTO.show} chart-box"> --%>
<!--                     <div class="box-image"> -->
<!--                         <strong class="rank"></strong> -->
<%--                         <a href="${pageContext.request.contextPath}/movie/information?num=${movieDTO.MOVIE_NUM}"> --%>
<!--                             <span class="thumb-image"> -->
<%--                                 <img src="${movieDTO.posterUrl}" alt="???" style="min-height: 260px;"> --%>
<!--                                 영상물 등급 노출 변경 2022.08.24 -->
<%--                                 <c:set var="subRating" value="${fn:substring(movieDTO.rating, 0, 2)}" /> --%>
<%--                 				<i class="cgvIcon etc age${subRating == '전체' || subRating == '청소'  ? 'All' : subRating}">${movieDTO.rating}</i> --%>
<%--                                 <span class="ico-grade ${movieDTO.rating}">${movieDTO.rating}</span> --%>
<!--                             </span> -->
<!--                         </a> -->
<!--                         <span class="screentype"> -->
<!--                                 <a class="imax" href="#" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a> -->
<!--                          </span> -->
<!--                     </div> -->
                    
<!--                     <div class=""> -->
<%--                         <a href="${pageContext.request.contextPath}/movie/information?num=${movieDTO.MOVIE_NUM}"> --%>
<%--                             <strong class="title">${movieDTO.title}</strong> --%>
<!--                         </a> -->

<!--                         <div class="score"> -->
<!--                             <strong class="percent">예매율<span>26.2%</span></strong> -->
<!--                             2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 (적용 범위1~ 3위) -->
<!-- <!--                             <div class="egg-gage small"> -->
<!-- <!--                                             <span class="sprite_preegg default"></span> -->
<!-- <!--                                             <span class="percent">99%</span> -->
<!-- <!--                             </div> -->
<!--                         </div> -->
<!--                         <span class="txt-info"> -->
<!--                             <strong> -->
<%--                                 ${movieDTO.releaseDate} --%>
<!--                                 <span>개봉</span> -->
<!--                                 <em class="dday"> -->
<!--                                 </em> -->
<!--                             </strong> -->
<!--                         </span> -->
<!--                         <span class="like">  -->
<%--                             <a class="link-reservation" href="${pageContext.request.contextPath}/ticket?num=${movieDTO.MOVIE_NUM}">예매하기</a> --%>
<!--                         </span> -->
<!--                     </div>     -->
<!--                 </li> -->
<%--             </c:forEach> --%>
            </ol>
            <button class="btn-more-fontbold">
            더보기
            <i class="link-more">더보기</i>
            </button>
        </div>
<script type="text/javascript">
$(function() {
	$('.upcomingMovies>a').on('click', function() {
		$('.submenu li').removeClass('on');
		$(this).parent('li').addClass('on');
		
		$.ajax({
			type: 'get',
			url: '${pageContext.request.contextPath}/movie/upcomingMovies',
// 			data: {},
			dataType: 'json',
			success: function(result) {
				$('.sect-movie-chart>ol').html('');
				$('.sect-sorting').remove(); // 정렬 & 현재상작 영역 삭제
				$('.btn-more-fontbold').remove(); // 더보기 버튼 삭제
				
				var movieDTO = result.movieDTO;
				var top3 = result.Top3List;
				
				top3.forEach(function(top3, index) {
					var curr_d_day = top3.D_DAY
					var D_DAY = curr_d_day > 0 ? 'D-'+ curr_d_day : '';
					var subRating = top3.RATING.substring(0, 2);
					subRating = subRating == '전체' 	? 	'All' 	:
								subRating == '청소' 	? 	18 		: subRating;
					var text = `
								<li>
									<div class="box-image">
										<!-- rank 를 숫자 데이터로 -->
										<strong class="rank">이달의 추천영화 ${top3.RANK}</strong>
										<a href="${pageContext.request.contextPath}/movie/information?num=\${top3.MOVIE_NUM}" style="position: relative;">
				<!-- 							<span class="thumb-image"> -->
												<img src="\${top3.POSTERURL}" alt="" style="position:relative">
				                                <i class="cgvIcon etc age\${subRating}" style="position:absolute; top: 5px; left:5px;">\${top3.RATING}</i>
										</a>
									</div>
					                    <div class="box-contents">
					                        <a href="${pageContext.request.contextPath}/movie/information?num=\${top3.MOVIE_NUM}">	                            
					                        	<strong class="title">${top3.TITLE}</strong>
					                        </a>
					
					                        <div class="score">
						                            <strong class="percent">예매율<span>17.8%</span></strong>
					                        </div>
					
					                        <span class="txt-info">
					                            <strong>
					                                \${top3.RELEASEDATE} 
												<span>개봉</span>
											<em class="dday">\${D_DAY}</em>
										</strong>
										</span>
										<span class="like"> 
		                                	<a class="link-reservation" href="${pageContext.request.contextPath}/ticket?num=\${top3.MOVIE_NUM}">예매</a>
		                            	</span>
									</div>    
								</li>
						`;
						debugger;
								$('#ol-movie-chart').append(text);
				}); // top3.forEach
				
				movieDTO.forEach(function(movieDTO, index) {
					if(index == 0 || movieDTO.RELEASEDATE != prevDTO.RELEASEDATE) {
						var text = `<h4><span class="hidden">상영예정작</span> \${movieDTO.RELEASEDATE}</h4><ol></ol>`;
						$('.sect-movie-chart').append(text);
					}
					var text = `<li>
									<div class="box-image">
									<a href="${pageContext.request.contextPath}/movie/information?num=\${movieDTO.MOVIE_NUM}">
										<img src="\${movieDTO.POSTERURL}" alt="" onerror="errorImage(this)">
									</a>
								</div>
				                    <div class="box-contents">
				                        <a href="${pageContext.request.contextPath}/movie/information?num=\${movieDTO.MOVIE_NUM}">
				                            <strong class="title">\${movieDTO.TITLE}</strong>
				                        </a>
				                        <div class="score">
				                            <strong class="percent">예매율<span>17.8%</span></strong>
				                        </div>
			
				                        <span class="txt-info">
				                            <strong>
				                                \${movieDTO.RELEASEDATE}
											<span>개봉</span>
										<em class="dday">D-\${movieDTO.D_DAY}</em>
									</strong>
									</span>
									<span class="like"> 
										<a class="link-reservation" href="${pageContext.request.contextPath}/ticket?num=\${movieDTO.MOVIE_NUM}">예매</a>
									</span>
								</div>    
							</li>
							`;
					$('.sect-movie-chart').find('ol:last').append(text);
					prevDTO = movieDTO;
				});
			}, //success: 종료
			error: function(e) {
				alert('실패');
			}
		});// ajax 종료
	});
})
</script>
</div>
</body>
<link href="${pageContext.request.contextPath}/resources/css/inquiry/customer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/giftstore.css" rel="stylesheet">
</html>