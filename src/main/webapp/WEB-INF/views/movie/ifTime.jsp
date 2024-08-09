<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/module.css" rel="stylesheet">
<script type="text/javascript">
</script>
</head>
<body class="" marginwidth="0" marginheight="0" style="background-color: rgb(255, 255, 255); height: 2000px;">
<!-- Contents Start -->
<div class="showtimes-wrap" style="display: block; height: 2000px;">
<!--     <div class="sect-city"> -->
<!--         <ul> -->
<!--                 <li class="on"> -->
<!--                     <a href="./iframeMovie.aspx?midx=88228&amp;mcode=20036434&amp;areacode=13&amp;date=20240806" title="현재 선택">서울</a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="./iframeMovie.aspx?midx=88228&amp;mcode=20036434&amp;areacode=09&amp;date=20240806">경기</a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="./iframeMovie.aspx?midx=88228&amp;mcode=20036434&amp;areacode=06&amp;date=20240806">인천</a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="./iframeMovie.aspx?midx=88228&amp;mcode=20036434&amp;areacode=07&amp;date=20240806">강원</a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="./iframeMovie.aspx?midx=88228&amp;mcode=20036434&amp;areacode=15,04,05&amp;date=20240806">대전/충청</a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="./iframeMovie.aspx?midx=88228&amp;mcode=20036434&amp;areacode=14&amp;date=20240806">대구</a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="./iframeMovie.aspx?midx=88228&amp;mcode=20036434&amp;areacode=12,16&amp;date=20240806">부산/울산</a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="./iframeMovie.aspx?midx=88228&amp;mcode=20036434&amp;areacode=10,11&amp;date=20240806">경상</a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="./iframeMovie.aspx?midx=88228&amp;mcode=20036434&amp;areacode=08,02,03,01&amp;date=20240806">광주/전라/제주</a> -->
<!--                 </li> -->
<!--         </ul> -->
<!--     </div>  -->
    <div class="sect-schedule">
		<div id="slider" class="slider">
           <div class="item-wrap on"><ul class="item" style="width: 800px; height: 111px;">
                <li class="on">
                    <div class="day">
                        <a href="./iframeMovie.aspx?midx=88228&amp;mcode=20036434&amp;areacode=13&amp;date=20240806" title="현재 선택">
                            <span> 08월</span>
                            <em>화</em>
                            <strong>06</strong>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="day">
                        <a href="./iframeMovie.aspx?midx=88228&amp;mcode=20036434&amp;areacode=13&amp;date=20240807">
                            <span> 08월</span>
                            <em>수</em>
                            <strong>07</strong>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="day">
                        <a href="./iframeMovie.aspx?midx=88228&amp;mcode=20036434&amp;areacode=13&amp;date=20240808">
                            <span> 08월</span>
                            <em>목</em>
                            <strong>08</strong>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="day">
                        <a href="./iframeMovie.aspx?midx=88228&amp;mcode=20036434&amp;areacode=13&amp;date=20240809">
                            <span> 08월</span>
                            <em>금</em>
                            <strong>09</strong>
                        </a>
                    </div>
                </li>
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
<script type="text/javascript">


</script>
    <div class="sect-showtimes">
        <ul>
			<li>
                <div class="col-theater"><a href="/theaters/?theaterCode=P001" target="_top">씨네드쉐프<br>압구정</a></div>
                <div class="col-times">
                    <div class="type-hall">
                        <div class="info-hall">
                            <ul>
                                <li>2D</li>                                
                                <!--<li><span class='screentype'><span class='tempurCinema'>TEMPUR CINEMA</span></span></li>//-->
                                <li><span class="screentype"><span class="tempurCinema">TEMPUR CINEMA</span></span></li>
                                <li>총 30석</li>
                            </ul>
                        </div>
                        <div class="info-timetable">
                            <ul>
                                
                                    <li><em>12:00</em><span>마감</span></li>
                                
                                    <li><a href="/ticket/?MOVIE_CD=20036434&amp;MOVIE_CD_GROUP=20036434&amp;PLAY_YMD=20240806&amp;THEATER_CD=P001&amp;PLAY_START_TM=1450&amp;AREA_CD=13&amp;SCREEN_CD=001" target="_top" data-theatercode="P001" data-playymd="20240806" data-screencode="001" data-playnum="3" data-playstarttime="1450" data-playendtime="1702" data-theatername="씨네드쉐프 압구정" data-seatremaincnt="24" data-screenkorname="템퍼 시네마[CINE de CHEF]"><em>14:50</em><span class="txt-lightblue"><span class="hidden">잔여좌석</span>24석</span></a></li>
                                
                                    <li><a href="/ticket/?MOVIE_CD=20036434&amp;MOVIE_CD_GROUP=20036434&amp;PLAY_YMD=20240806&amp;THEATER_CD=P001&amp;PLAY_START_TM=2005&amp;AREA_CD=13&amp;SCREEN_CD=001" target="_top" data-theatercode="P001" data-playymd="20240806" data-screencode="001" data-playnum="5" data-playstarttime="2005" data-playendtime="2217" data-theatername="씨네드쉐프 압구정" data-seatremaincnt="24" data-screenkorname="템퍼 시네마[CINE de CHEF]"><em>20:05</em><span class="txt-lightblue"><span class="hidden">잔여좌석</span>24석</span></a></li>
                                
                            </ul>
                        </div>
                    </div>
                    
                    <div class="type-hall">
                        <div class="info-hall">
                            <ul>
                                <li>2D</li>                                
                                <!--<li>스트레스리스 시네마[CINE de CHEF]</li>//-->
                                <li>스트레스리스 시네마[CINE de CHEF]</li>
                                <li>총 46석</li>
                            </ul>
                        </div>
                        <div class="info-timetable">
                            <ul>
                                    <li><a href="/ticket/?MOVIE_CD=20036434&amp;MOVIE_CD_GROUP=20036434&amp;PLAY_YMD=20240806&amp;THEATER_CD=P001&amp;PLAY_START_TM=1540&amp;AREA_CD=13&amp;SCREEN_CD=002" target="_top" data-theatercode="P001" data-playymd="20240806" data-screencode="002" data-playnum="3" data-playstarttime="1540" data-playendtime="1752" data-theatername="씨네드쉐프 압구정" data-seatremaincnt="46" data-screenkorname="스트레스리스 시네마[CINE de CHEF]"><em>15:40</em><span class="txt-lightblue"><span class="hidden">잔여좌석</span>46석</span></a></li>
                                    <li><a href="/ticket/?MOVIE_CD=20036434&amp;MOVIE_CD_GROUP=20036434&amp;PLAY_YMD=20240806&amp;THEATER_CD=P001&amp;PLAY_START_TM=2150&amp;AREA_CD=13&amp;SCREEN_CD=002" target="_top" data-theatercode="P001" data-playymd="20240806" data-screencode="002" data-playnum="5" data-playstarttime="2150" data-playendtime="2402" data-theatername="씨네드쉐프 압구정" data-seatremaincnt="46" data-screenkorname="스트레스리스 시네마[CINE de CHEF]"><em>21:50</em><span class="txt-lightblue"><span class="hidden">잔여좌석</span>46석</span></a></li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
            </li>
            
            
        </ul>
    </div>
    <p class="info-noti">* 입장 지연에 따른 관람불편을 최소화하고자 영화는 약 10분 후에 시작됩니다. 관람 에티켓을 위한 사전 입장 부탁드립니다.</p>
</div>

<!--/ Contents End -->


<script type="text/javascript">
    $("html, body, #contaniner, #footer").css("background-color", "#ffffff");
</script>


</body>
</html>