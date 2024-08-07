<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>theater2</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/layout.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/module.css"
	rel="stylesheet">
<script	src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
</head>
<body>
	<div id="contaniner" class="">
		<!-- Contents Area -->
		<div id="contents" class="">
			<!-- Contents Start -->
			<div class="sect-common">
				<div class="favorite-wrap">
					<div class="sect-favorite">
						<h4>
							<img
								src="https://img.cgv.co.kr/R2014/images/title/h4_favorite_cgv.png"
								alt="자주가는 CGV">
						</h4>
						<ul id="favoriteTheaters">
							<li><a href="#" data-regioncode="" data-theatercode=""
								data-selecteddate="20240715"><span>1<em>순위</em></span></a></li>
							<li><a href="#" data-regioncode="" data-theatercode=""
								data-selecteddate="20240715"><span>2<em>순위</em></span></a></li>
							<li><a href="#" data-regioncode="" data-theatercode=""
								data-selecteddate="20240715"><span>3<em>순위</em></span></a></li>
							<li><a href="#" data-regioncode="" data-theatercode=""
								data-selecteddate="20240715"><span>4<em>순위</em></span></a></li>
							<li><a href="#" data-regioncode="" data-theatercode=""
								data-selecteddate="20240715"><span>5<em>순위</em></span></a></li>
						</ul>
						<button id="btn_set_my_favorite" type="button" title="새창">자주가는
							CGV 설정</button>
					</div>
					<div class="sect-city">
						<ul>
							<li class="on"><a href="#">서울</a>
								<div class="area">
									<ul>
										<!-- DB에서 가져온걸로 foreach -->
										<li class="on">
										<a title="CGV강남" href="/theaters/?areacode=01&amp;theaterCode=0056&amp;date=20240715">CGV강남</a>
										</li>
									</ul>
								</div>
								</li>
								<li>
								<a href="#">경기</a>
								<div class="area">
									<ul>
										<li>
										<a title="CGV경기광주" href="/theaters/?areacode=02&amp;theaterCode=0260&amp;date=20240715">CGV경기광주</a>
										</li>
									</ul>
								</div>
								</li>
								<li>
								<a href="#">인천</a>
								<div class="area">
									<ul>
										<li>
										<a title="CGV계양" href="/theaters/?areacode=202&amp;theaterCode=0043&amp;date=20240715">CGV계양</a>
										</li>
									</ul>
								</div>
								</li>
							<li>
							<a href="#">강원</a>
								<div class="area">
									<ul>
										<li>
										<a title="CGV강릉" href="/theaters/?areacode=12&amp;theaterCode=0139&amp;date=20240715">CGV강릉</a>
										</li>
									</ul>
								</div>
								</li>
							<li>
							<a href="#">대전/충청</a>
								<div class="area">
									<ul>
										<li>
										<a title="CGV논산" href="/theaters/?areacode=03%2C205&amp;theaterCode=0261&amp;date=20240715">CGV논산</a>
										</li>
									</ul>
								</div>
								</li>
							<li>
							<a href="#">대구</a>
								<div class="area">
									<ul>
										<li>
										<a title="CGV대구" href="/theaters/?areacode=11&amp;theaterCode=0345&amp;date=20240715">CGV대구</a>
										</li>
									</ul>
								</div>
								</li>
							<li>
							<a href="#">부산/울산</a>
								<div class="area">
									<ul>
										<li><a title="CGV대연" href="/theaters/?areacode=05%2C207&amp;theaterCode=0061&amp;date=20240715">CGV대연</a>
										</li>

									</ul>
								</div>
								</li>
							<li>
							<a href="#">경상</a>
								<div class="area">
									<ul>
										<li>
										<a title="CGV거제" href="/theaters/?areacode=204&amp;theaterCode=0263&amp;date=20240715">CGV거제</a>
										</li>

									</ul>
								</div>
								</li>
							<li>
							<a href="#">광주/전라/제주</a>
								<div class="area">
									<ul>
										<li>
										<a title="CGV광양" href="/theaters/?areacode=206%2C04%2C06&amp;theaterCode=0220&amp;date=20240715">CGV광양</a>
										</li>

									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- Contents End -->

			<!-- 실컨텐츠 시작 -->
			<div class="wrap-theater">
				<h3>
					<img src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif" alt="THEATER">
				</h3>
				<div class="sect-theater ">

					<div class="d-flex justify-content-between mb-3">
						<div class="p-2 bg-info">
							<h4 class="theater-tit">
								<span>CGV강남</span>
							</h4>
						</div>

					</div>
				</div>
				<a href="/support/lease/default.aspx" class="round inred btn_lease"><spanstyle="padding: 0 14px;">단체/대관문의</span></a>

				<div class="wrap-theaterinfo">
					<div class="box-image">
						<div id="theater_img_container" class="thumb-image">
							<img src="https://img.cgv.co.kr/Theater/Theater/2014/1211/CGVgangnam.jpg" alt="CGV강남 극장이미지">
						</div>
					</div>
					<div class="box-contents">
						<div class="theater-info">
							<strong class="title">서울특별시 강남구 역삼동 814-6 스타플렉스<br>서울특별시
								강남구 강남대로 438 (역삼동)<a
								href="./?page=location&amp;theaterCode=0056#menu">위치/주차 안내&gt;</a></strong>
							 <span class="txt-info"> 
								 <em>1544-1122</em> <em>6관/ 874석</em> <span></span>
							</span>
							<!-- 최대 10개까지만 보여집니다 2 -->
							<span class="screentype"> 
								<a href="/theaters/special/?regioncode=SCX&amp;theaterCode=0056" class="screenX">SCREENX</a>
							</span>
						</div>
						<div class="noti-theater">
							<h5>공지사항</h5>
							<ul>

							</ul>
							<a class="link-more" href="/support/news/Default.aspx?type=2" 
								target="_blank" title="새창 열림">공지사항 더보기</a>
						</div>
					</div>
				</div>
			</div>
			<!-- 위치 주차 안내 페이지 까지   -->			
		
			
			<!-- sect-theater  -->

			<div class="theater-ad">
				<iframe
					src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@SponsorBar_980"
					width="980" height="90" title="광고-명탐정 코난: 100만 달러의 펜타그램"
					frameborder="0" scrolling="no" marginwidth="0" marginheight="0"
					name="SponsorBar_980" id="SponsorBar_980">
				</iframe>
			</div>


			<ul class="tab-menu" id="menu">
				<li class="on">
					<a href="./?areacode=01&amp;theaterCode=0056&amp;date=20240715#menu" title="현재 선택됨">상영시간표</a>
				</li>
				<li class="last">
					<a href="./?page=location&amp;theaterCode=0056#menu">위치/주차안내</a>
				</li>
				<!--<li class='last'><a href="./?page=price&theaterCode=0056#menu" >관람료안내</a></li>-->
			</ul>
			<body class="" marginwidth="0" marginheight="0"
				style="background-color: rgb(255, 255, 255);">


				
			
			<body class="" marginwidth="0" marginheight="0"
				style="background-color: rgb(255, 255, 255);">


				<!-- Contents Start -->

				<div class="showtimes-wrap">
					<div class="sect-schedule">
						<div id="slider" class="slider">

							<div class="item-wrap on">
								<ul class="item" style="width: 800px; height: 111px;">
									<li class="on">
										<div class="day">
											<a
												href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20240716&amp;screencodes=&amp;screenratingcode=&amp;regioncode="
												title="현재 선택"> <span> 07월</span> <em> 화</em> <strong>
													16</strong>
											</a>
										</div>
									</li>



									<li>
										<div class="day">
											<a
												href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20240717&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
												<span> 07월</span> <em> 수</em> <strong> 17</strong>
											</a>
										</div>
									</li>



									<li>
										<div class="day">
											<a
												href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20240718&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
												<span> 07월</span> <em> 목</em> <strong> 18</strong>
											</a>
										</div>
									</li>



									<li>
										<div class="day">
											<a
												href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20240719&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
												<span> 07월</span> <em> 금</em> <strong> 19</strong>
											</a>
										</div>
									</li>



									<li>
										<div class="day">
											<a
												href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20240720&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
												<span> 07월</span> <em> 토</em> <strong> 20</strong>
											</a>
										</div>
									</li>



									<li>
										<div class="day">
											<a
												href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20240721&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
												<span> 07월</span> <em> 일</em> <strong> 21</strong>
											</a>
										</div>
									</li>



									<li>
										<div class="day">
											<a
												href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20240724&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
												<span> 07월</span> <em> 수</em> <strong> 24</strong>
											</a>
										</div>
									</li>



									<li>
										<div class="day">
											<a
												href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20240731&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
												<span> 07월</span> <em> 수</em> <strong> 31</strong>
											</a>
										</div>
									</li>
								</ul>
							</div>

							<div class="item-wrap on">
								<ul class="item"
									style="width: 800px; height: 111px; display: none;">
									<li>
										<div class="day">
											<a
												href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20240801&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
												<span> 08월</span> <em> 목</em> <strong> 01</strong>
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


					<div class="sect-showtimes">
						<ul>

							<li>
								<div class="col-times">
									<div class="info-movie">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age15">15</i>
										<!-- <span class="ico-grade 15">
                                        15</span>-->
										<a href="/movies/detail-view/?midx=88384" target="_parent"><strong>
												탈출-프로젝트 사일런스</strong></a> <span class="round lightblue"> <em>
												상영중</em>
										</span><span class=""> <em> </em>
										</span><i> 스릴러</i>/ <i> 96분</i>/ <i> 2024.07.12 개봉</i>
									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D</li>
												<li>4관 8층</li>
												<li>총 124석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><a
													href="/ticket/?MOVIE_CD=20036906&amp;MOVIE_CD_GROUP=20036906&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1125&amp;AREA_CD=13&amp;SCREEN_CD=004"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="004"
													data-playnum="2" data-playstarttime="1125"
													data-playendtime="1311" data-theatername="CGV 강남"
													data-seatremaincnt="115" data-screenkorname="4관 8층"><em>11:25</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>115석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036906&amp;MOVIE_CD_GROUP=20036906&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1330&amp;AREA_CD=13&amp;SCREEN_CD=004"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="004"
													data-playnum="3" data-playstarttime="1330"
													data-playendtime="1516" data-theatername="CGV 강남"
													data-seatremaincnt="114" data-screenkorname="4관 8층"><em>13:30</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>114석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036906&amp;MOVIE_CD_GROUP=20036906&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1535&amp;AREA_CD=13&amp;SCREEN_CD=004"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="004"
													data-playnum="4" data-playstarttime="1535"
													data-playendtime="1721" data-theatername="CGV 강남"
													data-seatremaincnt="121" data-screenkorname="4관 8층"><em>15:35</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>121석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036906&amp;MOVIE_CD_GROUP=20036906&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1740&amp;AREA_CD=13&amp;SCREEN_CD=004"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="004"
													data-playnum="5" data-playstarttime="1740"
													data-playendtime="1926" data-theatername="CGV 강남"
													data-seatremaincnt="115" data-screenkorname="4관 8층"><em>17:40</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>115석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036906&amp;MOVIE_CD_GROUP=20036906&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1945&amp;AREA_CD=13&amp;SCREEN_CD=004"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="004"
													data-playnum="6" data-playstarttime="1945"
													data-playendtime="2131" data-theatername="CGV 강남"
													data-seatremaincnt="116" data-screenkorname="4관 8층"><em>19:45</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>116석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036906&amp;MOVIE_CD_GROUP=20036906&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=2150&amp;AREA_CD=13&amp;SCREEN_CD=004"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="004"
													data-playnum="7" data-playstarttime="2150"
													data-playendtime="2336" data-theatername="CGV 강남"
													data-seatremaincnt="122" data-screenkorname="4관 8층"><em>21:50</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>122석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036906&amp;MOVIE_CD_GROUP=20036906&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=2400&amp;AREA_CD=13&amp;SCREEN_CD=004"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="004"
													data-playnum="8" data-playstarttime="2400"
													data-playendtime="2546" data-theatername="CGV 강남"
													data-seatremaincnt="124" data-screenkorname="4관 8층"><em>24:00</em><span
														class="midnight txt-lightblue"><span class="hidden">잔여좌석</span>124석</span></a></li>


											</ul>
										</div>


									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D</li>
												<li>5관 10층 (Laser)</li>
												<li>총 172석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><a
													href="/ticket/?MOVIE_CD=20036906&amp;MOVIE_CD_GROUP=20036906&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1630&amp;AREA_CD=13&amp;SCREEN_CD=005"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="005"
													data-playnum="4" data-playstarttime="1630"
													data-playendtime="1816" data-theatername="CGV 강남"
													data-seatremaincnt="170"
													data-screenkorname="5관 10층 (Laser)"><em>16:30</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>170석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036906&amp;MOVIE_CD_GROUP=20036906&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=2050&amp;AREA_CD=13&amp;SCREEN_CD=005"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="005"
													data-playnum="6" data-playstarttime="2050"
													data-playendtime="2236" data-theatername="CGV 강남"
													data-seatremaincnt="170"
													data-screenkorname="5관 10층 (Laser)"><em>20:50</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>170석</span></a></li>


											</ul>
										</div>


									</div>




								</div>
							</li>

							<li>
								<div class="col-times">
									<div class="info-movie">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age12">12</i>
										<!-- <span class="ico-grade 12">
                                        12</span>-->
										<a href="/movies/detail-view/?midx=88267" target="_parent"><strong>
												탈주</strong></a> <span class="round lightblue"> <em> 상영중</em>
										</span><span class=""> <em> </em>
										</span><i> 액션</i>/ <i> 94분</i>/ <i> 2024.07.03 개봉</i>
									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D</li>
												<li>5관 10층 (Laser)</li>
												<li>총 172석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><a
													href="/ticket/?MOVIE_CD=20036553&amp;MOVIE_CD_GROUP=20036553&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=2310&amp;AREA_CD=13&amp;SCREEN_CD=005"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="005"
													data-playnum="7" data-playstarttime="2310"
													data-playendtime="2454" data-theatername="CGV 강남"
													data-seatremaincnt="171"
													data-screenkorname="5관 10층 (Laser)"><em>23:10</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>171석</span></a></li>


											</ul>
										</div>


									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D</li>
												<li>6관 10층 (Laser)</li>
												<li>총 124석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><em>09:45</em><span>마감</span></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036553&amp;MOVIE_CD_GROUP=20036553&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1150&amp;AREA_CD=13&amp;SCREEN_CD=006"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="006"
													data-playnum="2" data-playstarttime="1150"
													data-playendtime="1334" data-theatername="CGV 강남"
													data-seatremaincnt="122"
													data-screenkorname="6관 10층 (Laser)"><em>11:50</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>122석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036553&amp;MOVIE_CD_GROUP=20036553&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1400&amp;AREA_CD=13&amp;SCREEN_CD=006"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="006"
													data-playnum="3" data-playstarttime="1400"
													data-playendtime="1544" data-theatername="CGV 강남"
													data-seatremaincnt="115"
													data-screenkorname="6관 10층 (Laser)"><em>14:00</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>115석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036553&amp;MOVIE_CD_GROUP=20036553&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1610&amp;AREA_CD=13&amp;SCREEN_CD=006"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="006"
													data-playnum="4" data-playstarttime="1610"
													data-playendtime="1754" data-theatername="CGV 강남"
													data-seatremaincnt="99" data-screenkorname="6관 10층 (Laser)"><em>16:10</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>99석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036553&amp;MOVIE_CD_GROUP=20036553&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1815&amp;AREA_CD=13&amp;SCREEN_CD=006"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="006"
													data-playnum="5" data-playstarttime="1815"
													data-playendtime="1959" data-theatername="CGV 강남"
													data-seatremaincnt="105"
													data-screenkorname="6관 10층 (Laser)"><em>18:15</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>105석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036553&amp;MOVIE_CD_GROUP=20036553&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=2020&amp;AREA_CD=13&amp;SCREEN_CD=006"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="006"
													data-playnum="6" data-playstarttime="2020"
													data-playendtime="2204" data-theatername="CGV 강남"
													data-seatremaincnt="100"
													data-screenkorname="6관 10층 (Laser)"><em>20:20</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>100석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036553&amp;MOVIE_CD_GROUP=20036553&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=2225&amp;AREA_CD=13&amp;SCREEN_CD=006"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="006"
													data-playnum="7" data-playstarttime="2225"
													data-playendtime="2409" data-theatername="CGV 강남"
													data-seatremaincnt="122"
													data-screenkorname="6관 10층 (Laser)"><em>22:25</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>122석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036553&amp;MOVIE_CD_GROUP=20036553&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=2430&amp;AREA_CD=13&amp;SCREEN_CD=006"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="006"
													data-playnum="8" data-playstarttime="2430"
													data-playendtime="2614" data-theatername="CGV 강남"
													data-seatremaincnt="124"
													data-screenkorname="6관 10층 (Laser)"><em>24:30</em><span
														class="midnight txt-lightblue"><span class="hidden">잔여좌석</span>124석</span></a></li>


											</ul>
										</div>


									</div>




								</div>
							</li>

							<li>
								<div class="col-times">
									<div class="info-movie">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i>
										<!-- <span class="ico-grade All">
                                        All</span>-->
										<a href="/movies/detail-view/?midx=87864" target="_parent"><strong>
												인사이드 아웃 2</strong></a> <span class="round lightblue"> <em>
												상영중</em>
										</span><span class=""> <em> </em>
										</span><i> 애니메이션</i>/ <i> 96분</i>/ <i> 2024.06.12 개봉</i>
									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D(자막)</li>
												<li>3관 8층</li>
												<li>총 172석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><a
													href="/ticket/?MOVIE_CD=20034989&amp;MOVIE_CD_GROUP=20034989&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1105&amp;AREA_CD=13&amp;SCREEN_CD=003"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="003"
													data-playnum="2" data-playstarttime="1105"
													data-playendtime="1251" data-theatername="CGV 강남"
													data-seatremaincnt="167" data-screenkorname="3관 8층"><em>11:05</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>167석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20034989&amp;MOVIE_CD_GROUP=20034989&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1310&amp;AREA_CD=13&amp;SCREEN_CD=003"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="003"
													data-playnum="3" data-playstarttime="1310"
													data-playendtime="1456" data-theatername="CGV 강남"
													data-seatremaincnt="163" data-screenkorname="3관 8층"><em>13:10</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>163석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20034989&amp;MOVIE_CD_GROUP=20034989&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1520&amp;AREA_CD=13&amp;SCREEN_CD=003"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="003"
													data-playnum="4" data-playstarttime="1520"
													data-playendtime="1706" data-theatername="CGV 강남"
													data-seatremaincnt="147" data-screenkorname="3관 8층"><em>15:20</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>147석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20034989&amp;MOVIE_CD_GROUP=20034989&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1730&amp;AREA_CD=13&amp;SCREEN_CD=003"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="003"
													data-playnum="5" data-playstarttime="1730"
													data-playendtime="1916" data-theatername="CGV 강남"
													data-seatremaincnt="156" data-screenkorname="3관 8층"><em>17:30</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>156석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20034989&amp;MOVIE_CD_GROUP=20034989&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1940&amp;AREA_CD=13&amp;SCREEN_CD=003"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="003"
													data-playnum="6" data-playstarttime="1940"
													data-playendtime="2126" data-theatername="CGV 강남"
													data-seatremaincnt="144" data-screenkorname="3관 8층"><em>19:40</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>144석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20034989&amp;MOVIE_CD_GROUP=20034989&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=2200&amp;AREA_CD=13&amp;SCREEN_CD=003"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="003"
													data-playnum="7" data-playstarttime="2200"
													data-playendtime="2346" data-theatername="CGV 강남"
													data-seatremaincnt="172" data-screenkorname="3관 8층"><em>22:00</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>172석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20034989&amp;MOVIE_CD_GROUP=20034989&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=2410&amp;AREA_CD=13&amp;SCREEN_CD=003"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="003"
													data-playnum="8" data-playstarttime="2410"
													data-playendtime="2556" data-theatername="CGV 강남"
													data-seatremaincnt="170" data-screenkorname="3관 8층"><em>24:10</em><span
														class="midnight txt-lightblue"><span class="hidden">잔여좌석</span>170석</span></a></li>


											</ul>
										</div>


									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D(자막)</li>
												<li>5관 10층 (Laser)</li>
												<li>총 172석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><a
													href="/ticket/?MOVIE_CD=20034989&amp;MOVIE_CD_GROUP=20034989&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1420&amp;AREA_CD=13&amp;SCREEN_CD=005"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="005"
													data-playnum="3" data-playstarttime="1420"
													data-playendtime="1606" data-theatername="CGV 강남"
													data-seatremaincnt="165"
													data-screenkorname="5관 10층 (Laser)"><em>14:20</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>165석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20034989&amp;MOVIE_CD_GROUP=20034989&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1840&amp;AREA_CD=13&amp;SCREEN_CD=005"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="005"
													data-playnum="5" data-playstarttime="1840"
													data-playendtime="2026" data-theatername="CGV 강남"
													data-seatremaincnt="162"
													data-screenkorname="5관 10층 (Laser)"><em>18:40</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>162석</span></a></li>


											</ul>
										</div>


									</div>




								</div>
							</li>

							<li>
								<div class="col-times">
									<div class="info-movie">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age12">12</i>
										<!-- <span class="ico-grade 12">
                                        12</span>-->
										<a href="/movies/detail-view/?midx=88271" target="_parent"><strong>
												하이재킹</strong></a> <span class="round lightblue"> <em> 상영중</em>
										</span><span class=""> <em> </em>
										</span><i> 범죄,&nbsp;액션</i>/ <i> 100분</i>/ <i> 2024.06.21 개봉</i>
									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D</li>
												<li>1관 6층</li>
												<li>총 158석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><a
													href="/ticket/?MOVIE_CD=20036607&amp;MOVIE_CD_GROUP=20036607&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1930&amp;AREA_CD=13&amp;SCREEN_CD=001"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="001"
													data-playnum="5" data-playstarttime="1930"
													data-playendtime="2120" data-theatername="CGV 강남"
													data-seatremaincnt="131" data-screenkorname="1관 6층"><em>19:30</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>131석</span></a></li>


											</ul>
										</div>


									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D</li>
												<li>2관[LCK관] 6층 (Laser)</li>
												<li>총 124석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><a
													href="/ticket/?MOVIE_CD=20036607&amp;MOVIE_CD_GROUP=20036607&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1240&amp;AREA_CD=13&amp;SCREEN_CD=002"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="002"
													data-playnum="2" data-playstarttime="1240"
													data-playendtime="1430" data-theatername="CGV 강남"
													data-seatremaincnt="118"
													data-screenkorname="2관[LCK관] 6층 (Laser)"><em>12:40</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>118석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036607&amp;MOVIE_CD_GROUP=20036607&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1700&amp;AREA_CD=13&amp;SCREEN_CD=002"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="002"
													data-playnum="4" data-playstarttime="1700"
													data-playendtime="1850" data-theatername="CGV 강남"
													data-seatremaincnt="107"
													data-screenkorname="2관[LCK관] 6층 (Laser)"><em>17:00</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>107석</span></a></li>


											</ul>
										</div>


									</div>




								</div>
							</li>

							<li>
								<div class="col-times">
									<div class="info-movie">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age15">15</i>
										<!-- <span class="ico-grade 15">
                                        15</span>-->
										<a href="/movies/detail-view/?midx=88227" target="_parent"><strong>
												핸섬가이즈</strong></a> <span class="round lightblue"> <em> 상영중</em>
										</span><span class=""> <em> </em>
										</span><i> 코미디</i>/ <i> 101분</i>/ <i> 2024.06.26 개봉</i>
									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D</li>
												<li>2관[LCK관] 6층 (Laser)</li>
												<li>총 124석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><em>10:30</em><span>마감</span></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036432&amp;MOVIE_CD_GROUP=20036432&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1450&amp;AREA_CD=13&amp;SCREEN_CD=002"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="002"
													data-playnum="3" data-playstarttime="1450"
													data-playendtime="1641" data-theatername="CGV 강남"
													data-seatremaincnt="104"
													data-screenkorname="2관[LCK관] 6층 (Laser)"><em>14:50</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>104석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036432&amp;MOVIE_CD_GROUP=20036432&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1910&amp;AREA_CD=13&amp;SCREEN_CD=002"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="002"
													data-playnum="5" data-playstarttime="1910"
													data-playendtime="2101" data-theatername="CGV 강남"
													data-seatremaincnt="96"
													data-screenkorname="2관[LCK관] 6층 (Laser)"><em>19:10</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>96석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036432&amp;MOVIE_CD_GROUP=20036432&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=2120&amp;AREA_CD=13&amp;SCREEN_CD=002"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="002"
													data-playnum="6" data-playstarttime="2120"
													data-playendtime="2311" data-theatername="CGV 강남"
													data-seatremaincnt="120"
													data-screenkorname="2관[LCK관] 6층 (Laser)"><em>21:20</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>120석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036432&amp;MOVIE_CD_GROUP=20036432&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=2330&amp;AREA_CD=13&amp;SCREEN_CD=002"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="002"
													data-playnum="7" data-playstarttime="2330"
													data-playendtime="2521" data-theatername="CGV 강남"
													data-seatremaincnt="120"
													data-screenkorname="2관[LCK관] 6층 (Laser)"><em>23:30</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>120석</span></a></li>


											</ul>
										</div>


									</div>




								</div>
							</li>

							<li>
								<div class="col-times">
									<div class="info-movie">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i>
										<!-- <span class="ico-grade All">
                                        All</span>-->
										<a href="/movies/detail-view/?midx=88378" target="_parent"><strong>
												극장판 도라에몽-진구의 지구 교향곡</strong></a> <span class="round lightblue"> <em>
												상영중</em>
										</span><span class=""> <em> </em>
										</span><i> 애니메이션</i>/ <i> 115분</i>/ <i> 2024.07.10 개봉</i>
									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D(자막)</li>
												<li>1관 6층</li>
												<li>총 158석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><a
													href="/ticket/?MOVIE_CD=20036894&amp;MOVIE_CD_GROUP=20036894&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1200&amp;AREA_CD=13&amp;SCREEN_CD=001"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="001"
													data-playnum="2" data-playstarttime="1200"
													data-playendtime="1405" data-theatername="CGV 강남"
													data-seatremaincnt="152" data-screenkorname="1관 6층"><em>12:00</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>152석</span></a></li>


											</ul>
										</div>


									</div>




								</div>
							</li>

							<li>
								<div class="col-times">
									<div class="info-movie">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age15">15</i>
										<!-- <span class="ico-grade 15">
                                        15</span>-->
										<a href="/movies/detail-view/?midx=88367" target="_parent"><strong>
												만천과해</strong></a> <span class="round lightblue"> <em> 상영중</em>
										</span><span class=""> <em> </em>
										</span><i> 범죄,&nbsp;스릴러</i>/ <i> 106분</i>/ <i> 2024.07.03 개봉</i>
									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D</li>
												<li>1관 6층</li>
												<li>총 158석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><a
													href="/ticket/?MOVIE_CD=20036868&amp;MOVIE_CD_GROUP=20036868&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1430&amp;AREA_CD=13&amp;SCREEN_CD=001"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="001"
													data-playnum="3" data-playstarttime="1430"
													data-playendtime="1626" data-theatername="CGV 강남"
													data-seatremaincnt="154" data-screenkorname="1관 6층"><em>14:30</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>154석</span></a></li>


												<li><a
													href="/ticket/?MOVIE_CD=20036868&amp;MOVIE_CD_GROUP=20036868&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=2345&amp;AREA_CD=13&amp;SCREEN_CD=001"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="001"
													data-playnum="7" data-playstarttime="2345"
													data-playendtime="2541" data-theatername="CGV 강남"
													data-seatremaincnt="158" data-screenkorname="1관 6층"><em>23:45</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>158석</span></a></li>


											</ul>
										</div>


									</div>




								</div>
							</li>

							<li>
								<div class="col-times">
									<div class="info-movie">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i>
										<!-- <span class="ico-grade All">
                                        All</span>-->
										<a href="/movies/detail-view/?midx=88214" target="_parent"><strong>
												극장판 하이큐!! 쓰레기장의 결전</strong></a> <span class="round lightblue"> <em>
												상영중</em>
										</span><span class=""> <em> </em>
										</span><i> 애니메이션</i>/ <i> 85분</i>/ <i> 2024.05.15 개봉</i>
									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D</li>
												<li>5관 10층 (Laser)</li>
												<li>총 172석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><em>10:10</em><span>마감</span></li>


											</ul>
										</div>


									</div>




								</div>
							</li>

							<li>
								<div class="col-times">
									<div class="info-movie">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i>
										<!-- <span class="ico-grade All">
                                        All</span>-->
										<a href="/movies/detail-view/?midx=88404" target="_parent"><strong>
												2024 박은빈 팬 콘서트 &lt;은빈노트 - 디바&gt;</strong></a> <span
											class="round lightblue"> <em> 상영중</em>
										</span><span class=""> <em> </em>
										</span><i> </i>/ <i> 126분</i>/ <i> 2024.07.10 개봉</i>
									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D(STAGE)</li>
												<li>1관 6층</li>
												<li>총 158석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><a
													href="/ticket/?MOVIE_CD=20037010&amp;MOVIE_CD_GROUP=20037010&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1650&amp;AREA_CD=13&amp;SCREEN_CD=001"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="001"
													data-playnum="4" data-playstarttime="1650"
													data-playendtime="1906" data-theatername="CGV 강남"
													data-seatremaincnt="157" data-screenkorname="1관 6층"><em>16:50</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>157석</span></a></li>


											</ul>
										</div>


									</div>




								</div>
							</li>

							<li>
								<div class="col-times">
									<div class="info-movie">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age15">15</i>
										<!-- <span class="ico-grade 15">
                                        15</span>-->
										<a href="/movies/detail-view/?midx=88335" target="_parent"><strong>
												콰이어트 플레이스-첫째 날</strong></a> <span class="round lightblue"> <em>
												상영중</em>
										</span><span class=""> <em> </em>
										</span><i> 스릴러</i>/ <i> 99분</i>/ <i> 2024.06.26 개봉</i>
									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D</li>
												<li>1관 6층</li>
												<li>총 158석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><a
													href="/ticket/?MOVIE_CD=20036774&amp;MOVIE_CD_GROUP=20036774&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=2140&amp;AREA_CD=13&amp;SCREEN_CD=001"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="001"
													data-playnum="6" data-playstarttime="2140"
													data-playendtime="2329" data-theatername="CGV 강남"
													data-seatremaincnt="151" data-screenkorname="1관 6층"><em>21:40</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>151석</span></a></li>


											</ul>
										</div>


									</div>




								</div>
							</li>

							<li>
								<div class="col-times">
									<div class="info-movie">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age12">12</i>
										<!-- <span class="ico-grade 12">
                                        12</span>-->
										<a href="/movies/detail-view/?midx=88270" target="_parent"><strong>
												존 오브 인터레스트</strong></a> <span class="round lightblue"> <em>
												상영중</em>
										</span><span class=""> <em> </em>
										</span><i> 드라마</i>/ <i> 105분</i>/ <i> 2024.06.05 개봉</i>
									</div>

									<div class="type-hall">
										<div class="info-hall">
											<ul>
												<li>2D</li>
												<li>5관 10층 (Laser)</li>
												<li>총 172석</li>
											</ul>
										</div>
										<div class="info-timetable">
											<ul>

												<li><a
													href="/ticket/?MOVIE_CD=20036605&amp;MOVIE_CD_GROUP=20036605&amp;PLAY_YMD=20240716&amp;THEATER_CD=0056&amp;PLAY_START_TM=1205&amp;AREA_CD=13&amp;SCREEN_CD=005"
													target="_top" data-theatercode="0056"
													data-playymd="20240716" data-screencode="005"
													data-playnum="2" data-playstarttime="1205"
													data-playendtime="1400" data-theatername="CGV 강남"
													data-seatremaincnt="146"
													data-screenkorname="5관 10층 (Laser)"><em>12:05</em><span
														class="txt-lightblue"><span class="hidden">잔여좌석</span>146석</span></a></li>


											</ul>
										</div>


									</div>




								</div>
							</li>


						</ul>
					</div>



					<p class="info-noti"></p>
					<p>ㆍ입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.</p>
					<p></p>
				</div>
				<script type="text/template" id="temp_priceinfo">
<div class="layer-contents" style="width:650px; height:647px;">
        <div class="popwrap" id="wrap_theater_price">
            <h1>CGV 강남 관람 가격 안내</h1>
            <div class="pop-contents">
                <div class="wrap-priceinfo">
                  <div class="sect-discount">
						<h4>할인안내</h4>
						<div class="table-dotline">
							<table cellpadding="0" cellspacing="0" summary="극장 할인안내 테이블입니다.">
								<caption>경로우대, 학생할인, 국가유공자할인. 장애우대할인, 심야할인 안내 입니다.</caption>
								<colgroup>
									<col class="col1" />
									<col class="col2" />
								</colgroup>
								<tbody>
								<tr>
									<th scope="row">경로우대</th>
									<td>만 65세 이상을 증명할 수 있는 신분증 제시</td>
								</tr>
								<tr>
									<th scope="row">학생할인</th>
									<td>만18세 이하를 증명할 수 있는 신분증 제시<em>(만 4세이상 ~ 만 18세 이하의 학생 또는 청소년(어린이)에 한함)</em></td>
								</tr>
								<tr>
									<th scope="row">국가유공자할인</th>
									<td>국가 유공자증 소지자 본인에 한함</td>
								</tr>
								<tr>
									<th scope="row">장애우대할인</th>
									<td>현장에서 복지카드를 소지한 장애인<em>(장애 1~3등급 : 동반 1인까지 적용/ 4~6등급 : 본인만 적용)</em></td>
								</tr>
								<tr>
									<th scope="row">심야할인</th>
									<td>극장별 심야 할인 이벤트는 각 극장에 문의</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>					
                     <div class="sect-price"> 
                        <h4>관람 가격안내</h4>
                        <ul class="tab-menu-round">
                            <li class="on" data-screen-type="cgv"><a href="#">일반관</a></li>
                            <li data-screen-type="special"><a href="#">특별관</a></li>
                        </ul>
                        <div class="tbl-list">
                            
                                <div class="tbl-list cgv" style="display:"">
                                    <h5 class="hidden">
                                        <i>일반관</i> 관람가격안내
                                    </h5>
                                    
                                </div>
                            
                                <div class="tbl-list special" style="display:none"">
                                    <h5 class="">
                                        <a href="/theaters/special/?regioncode=SCX" target="_top" title="SCREENX 상세정보 바로가기"><span class="screentype"><span class="screenX">SCREENX</span></span>SCREENX</a>
                                    </h5>
                                    <div class="tbl-lst">
    <table summary="">
        <caption></caption>
        <colgroup>
            <col width="25%" />
            <col width="25%" />
            <col width="25%" />
            <col width="25%" />
        </colgroup>
        <thead>
            <tr>
                <th scope="col">요일구분</th>
                <th scope="col">시간대 구분</th>
                <th scope="col">일반</th>
                <th scope="col">청소년</th>
            </tr>
        </thead>
SCREENX Standard Zone 이용요금 안내</BR>
        <tbody>
            <tr>
                <th scope="row" rowspan="2">주중(월~목)</th>
                <th scope="row">조조</th>
                <td>9,000</td>
                <td>8,000</td>
            </tr>
            <tr>
                <th scope="row">2회차 이상</th>
                <td>12,000</td>
                <td>9,000</td>
            </tr>

            <tr>
                <th scope="row" rowspan="2">주말(금~일)</th>
                <th scope="row">조조</th>
                <td>9,000</td>
                <td>8,000</td>
            </tr>
            <tr>
                <th scope="row">2회차 이상</th>
                <td>13,000</td>
                <td>9,000</td>
        </tbody>
</table>
</div>

<div class="tbl-lst">
    <table summary="">
        <caption></caption>
        <colgroup>
            <col width="25%" />
            <col width="25%" />
            <col width="25%" />
            <col width="25%" />
        </colgroup>
        <thead>
            <tr>
                <th scope="col">요일구분</th>
                <th scope="col">시간대 구분</th>
                <th scope="col">일반</th>
                <th scope="col">청소년</th>
            </tr>
        </thead></BR></BR>
SCREENX PrimeZone 이용요금 안내</BR>
        <tbody>
            <tr>
                <th scope="row" rowspan="2">주중(월~목)</th>
                <th scope="row">조조</th>
                <td>10,000</td>
                <td>9,000</td>
            </tr>
            <tr>
                <th scope="row">2회차 이상</th>
                <td>13,000</td>
                <td>10,000</td>
            </tr>

            <tr>
                <th scope="row" rowspan="2">주말(금~일)</th>
                <th scope="row">조조</th>
                <td>10,000</td>
                <td>9,000</td>
            </tr>
            <tr>
                <th scope="row">2회차 이상</th>
                <td>14,000</td>
                <td>10,000</td>
        </tbody>
</table>
</div>
 </BR>
- 콘텐츠에 따라 프로모션 할인 가격이 적용될 수 있습니다. </BR>
- ScreenX 효과는 부분 적용됩니다.</BR></BR>
                                </div>
                            
                        </div>
                        <div id="priceinfo_online">
                            
                            <h4 class="marginT30">온라인 특별요금제</h4>
                            <div class="tbl-specialfare">                            
	                            <table summary="Family 요금제 및 FrontSeat 요금제에 대한 정보">
		                            <caption>온라인 특별요금제</caption>
		                            <colgroup>
			                            <col width="20%" />
			                            <col width="*" />
		                            </colgroup>
		                            <tbody>
			                            <tr>
				                            <th scope="row">Family 요금제</th>
				                            <td>4인 이상 온라인 예매 시 인하(주중 10% / 주말 5%)</td>
			                            </tr>
			                            <tr>
				                            <th scope="row">FrontSeat 요금제</th>
				                            <td>주말 상영영화 최전방열 온라인 예매 시 10% 인하</td>
			                            </tr>
		                            </tbody>
	                            </table>
                            </div>

                            <ul class="marginT10">
                                <li>* 온라인(홈페이지, 모바일) 예매 시 적용되며, 2D 일반관/일반좌석에 대해 적용됩니다.(단, 모닝 제외)</li>
                                <li>* 온라인 특별 요금제는 IMAX, 4DX, 골드클래스 등 특별관 예매시 적용이 되지 않습니다.</li>
                                <li>* 시간대 안내 : 모닝 '10시 이전', 프라임 '16시 ~ 23시 이전', 심야 '23시 이후'에 해당됩니다.</li>
                                <li>* Veatbox영화는 2D, 3D 요금에서 1천원 추가 적용</li>
                                 <li style="display:none;"> * 시간대 안내 : 모닝은 1회차 영화에만 해당됩니다.
                            </ul>
                        </div>
					</div><!-- .sect-price -->
				</div><!-- .wrap-priceinfo -->
            </div>
        </div>

    <button type="button" class="btn-close">관람 등급 안내 닫기</button>
</div>
    </script>
				<script type="text/template" id="temp_priceinfo_online">
 <h4 class="marginT30">온라인 특별요금제</h4>
 <div class="tbl-specialfare">    
	<table summary="Family 요금제 및 FrontSeat 요금제에 대한 정보">
		<caption>온라인 특별요금제</caption>
		<colgroup>
			<col width="20%" />
			<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">Family 요금제</th>
				<td>4인 이상 온라인 예매 시 인하(주중 10% / 주말 5%)</td>
			</tr>
			<tr>
				<th scope="row">FrontSeat 요금제</th>
				<td>주말 상영영화 최전방열 온라인 예매 시 10% 인하</td>
			</tr>
		</tbody>
	</table>
</div>
<ul class="marginT10">
    <li>* 온라인(홈페이지, 모바일) 예매 시 적용되며, 2D 일반관/일반좌석에 대해 적용됩니다.(단, 모닝 제외)</li>
    <li>* 온라인 특별 요금제는 IMAX, 4DX, 골드클래스 등 특별관 예매시 적용이 되지 않습니다.</li>
    <li>* 시간대 안내 : 모닝 '10시 이전', 프라임 '16시 ~ 23시 이전', 심야 '23시 이후'에 해당됩니다.</li>
    <li>* Veatbox영화는 2D, 3D 요금에서 1천원 추가 적용</li>
     <li style="display:none;"> * 시간대 안내 : 모닝은 1회차 영화에만 해당됩니다.
</ul>
    </script>

				<script type="text/javascript">
//<![CDATA[
    (function ($) {
        $(function () {
            var sliderOptions = { 'effect': 'none', 'offset': 0 };
            $('#slider').visualMotion(sliderOptions);

            try {
                var container = window.parent.document.iFrame;
                container.resize(); // 갱신될때마다 iFrame 높이값 재조정.
            }
            catch(e) {
                //ToDO : iframe 순서로 인한 예외 처리
                setTimeout(function(){
                    var container = window.parent.document.iFrame;
                    container.resize(); // 갱신될때마다 iFrame 높이값 재조정.
                },500);
            }

            //모바일 체크하여 남은좌석표 미니맵 노출안함 hover이벤트
            if(mobileChk()){                
                $('.info-timetable > ul > li').each( function() {
                   
                    if( $(this).children("a") != null ) {
                        var child_atag = $(this).children("a");
                       if(child_atag.attr("data-theatercode") != undefined){
                        var theatercode = child_atag.attr("data-theatercode");
                        var playymd = child_atag.attr("data-playymd");
                        var screencode  = child_atag.attr("data-screencode");
                        var playnum  = child_atag.attr("data-playnum");
                        var playstarttime  = child_atag.attr("data-playstarttime");
                        var playendtime  = child_atag.attr("data-playendtime");
                        var theatername  = child_atag.attr("data-theatername");
                        var seatremaincnt  = child_atag.attr("data-seatremaincnt");
                        var screenkorname  = child_atag.attr("data-screenkorname");

                        $(this).hover(function(evt){
                            GetCJ002_AllData($(this), theatercode, playymd , screencode , playnum , playstarttime , playendtime , theatername , seatremaincnt, screenkorname);

                        },function(evt) {                         
                                $('.cgv_minimap', window.parent.document).each(function() {
                                $(this).hide();
                                $(this).remove();
                            });
                        });
                      }
                    } //end if
                }); //end each
            }
        });
    })(jQuery);
    
    function  GetCJ002_AllData(liTag, TheaterCode , PlayYMD, ScreenCode, PlayNum ,StartTime,  EndTime, TheaterName,  Cnt , ScreenName) 
    {
        $.ajax({
            type: "POST",
            url: "/common/showtimes/iframeTheater.aspx/GetSeatList",
            data: "{theatercode: '" +  TheaterCode + "',  palyymd : '" + PlayYMD + "', screencode : '" + ScreenCode + "' , playnum : '" + PlayNum + "', starttime : '" + StartTime + "', endtime : '" + EndTime + "', theatername : '" + TheaterName + "', cnt : '" + Cnt + "', screenname : '" + ScreenName + "'}",                                        
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            //async: true,
            success: function (data) {
                var rst = $.parseJSON(data.d);
                if($.trim(rst) != "") {
                    $('.cgv_minimap',window.parent.document).each(function() {
                        $(this).hide();
                        $(this).remove();
                    });
                    
                    var pobj = $(".col-detail", window.parent.document);

                    //li tag position
                    var parent_li = liTag.offset();                                                                                                                                                              
                    pobj.append("<div class=\"cgv_minimap\" style=\"display:block;position:absolute\">" + rst + "</div>");                                        
                    pobj.show(function(){
                        var boxWidth = pobj.find('.cgv_minimap .theater_minimap').outerWidth();
                        var boxHeight = pobj.find('.cgv_minimap .theater_minimap').height();          
                        var posX = parent_li.left + $('.info-timetable > ul > li').outerWidth() / 2 - boxWidth / 2;
                        var posY = parent_li.top - boxHeight - 20;                              
                        pobj.find('.cgv_minimap').css({top:posY,left:posX});
                    });          

                }
            },
            error: function(request, error)
		    {
			    //alert("code:" + request.statusText + request.readyState + "\n" + "error:" + error);
		    }
        });
    }
    
    // 모바일 체크(모바일일때 false 반환)
    function mobileChk()
    {
        var re = true;
        var ua = window.navigator.userAgent.toLowerCase();
    
        var arrList = new Array("iphone", "android", "opera", "bada", "ipad");
        for (var i = 0; i < arrList.length; i++) {
            if (ua.indexOf(arrList[i]) != -1) { 
                re = false; //alert('모바일 브라우저입니다'); break;
            }
        }

        //사파리가 있고 ,크롬이 없다면
        if (ua.indexOf("safari") != -1 && ua.indexOf("chrome") == -1) {                        
            re = false; //alert('사파리 브라우져');
        }
        return re;
    }
//]]>
    </script>

				<!--/ Contents End -->


				<script type="text/javascript">
    //배경색 스타일 적용: 20211015
    $("html, body, #contaniner, #footer").css("background-color", "#ffffff");

//<![CDATA[
    
//]]>
</script>


			</body>
			<!-- 실컨텐츠 끝 -->
			<div class="theater-ad">
				<iframe
					src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@SponsorBar_980"
					width="980" height="90" title="광고-명탐정 코난: 100만 달러의 펜타그램"
					frameborder="0" scrolling="no" marginwidth="0" marginheight="0"
					name="SponsorBar_980" id="SponsorBar_980"></iframe>
			</div>
			<!--/ Contents End -->
		</div>
	<!-- /Contents Area -->
	</div>
	<!-- E Contaniner -->
	<!-- S Popup -->
</body>
</html>