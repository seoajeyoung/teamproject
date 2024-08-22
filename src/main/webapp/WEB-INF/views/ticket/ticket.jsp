<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<html>
<head>
<title>CGV 빠른예매</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/test.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket/tnb.css">
<script
	src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/script/ticket.js"></script>

</head>

<body>
<!-- 채현메인 모델값 --> 
<div id="movie-data" data-movie-num="${movieNum}"></div>
 <div id="member_num" data-member-num="${member_num}"></div>
	<a name="t"></a>
	<div id="wrap" oncontextmenu="return false" ondragstart="return false"
		onselectstart="return false">
		<!-- 컨텐츠 -->
		<div id="container">
			<!-- 빠른예매 -->
			<div id="ticket" class="ticket ko">

				<!-- 타이틀 -->
				<div class="navi">
					<div class="newsletter"></div>
					<span class="right">
						<a class="button button-reservation-restart" href=""> <span>예매다시하기</span></a>
					</span>

				</div>
				<!-- //타이틀 -->
				<!-- 메인컨텐츠 -->
				<div class="steps">
					<!-- step1 -->
					<div class="step step1" style="height: 600px; display: block;">
						<!-- MOVIE 섹션 -->
						<div class="section section-movie">
							<!-- col-head -->
							<div class="col-head" id="skip_movie_list">
								<h3 class="sreader">영화</h3>
							</div>
							<!-- col-body -->
							<div class="col-body" style="height: 565px;">
								<!-- 영화선택 -->
								<div class="movie-select">
									<div class="tabmenu">
										<span class="side on"></span> <a href="#"
											class="button menu1 selected">전체</a> <span class="side on"></span>
									</div>
									<div class="sortmenu">
										<a href="#" id="movieSortRankBtn"
											class="button btn-rank selected">예매율순</a> <a href="#"
											id="movieSortNameBtn" class="button btn-abc">가나다순</a>

									</div>
									<div class="movie-list nano has-scrollbar has-scrollbar-y"
										id="movie_list">
										<ul class="content scroll-y" id="movie"
											 tabindex="-1"
											style="right: -17px;">
										</ul>




										<div class="pane pane-y"
											style="display: block; opacity: 1; visibility: visible;">
											<div class="slider slider-y" id="slider"
												style="height: 50px; top: 0px;"></div>
										</div>
										<div class="pane pane-x"
											style="display: none; opacity: 1; visibility: visible;">
											<div class="slider slider-x" style="width: 50px;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- THEATER 섹션 -->
						<div class="section section-theater">
							<!-- col-head -->
							<div class="col-head" id="skip_theater_list">
								<h3 class="sreader">극장</h3>

							</div>
							<!-- col-body -->
							<div class="col-body" style="height: 565px;">

								<!-- 극장선택 -->
								<div class="theater-select" style="height: 554px;">
									<div class="tabmenu">
										<span class="side on"></span> <a href="#"
											class="button menu1 selected">전체</a> <span class="side on"></span>
									</div>
									<div class="theater-list" style="height: 513px;">
										<div class="theater-area-list" id="theater_area_list">
											<ul>
												<li class="hidden" style="display: list-item;">
													<!-- 													th_region 들어가는곳  -->

													<div class="area_theater_list nano has-scrollbar">
														<ul class="content scroll-y" tabindex="-1"
															style="right: -17px;"></ul>
														<div class="pane pane-y"
															style="display: none; opacity: 1; visibility: visible;">
															<div class="slider slider-y" style="height: 50px;"></div>
														</div>
														<div class="pane pane-x"
															style="display: none; opacity: 1; visibility: visible;">
															<div class="slider slider-x" style="width: 50px;"></div>
														</div>
													</div>
												</li>

											</ul>
										</div>
										<div class="theater-cgv-list nano has-scrollbar"
											id="theater_cgv_list">
											<ul class="content scroll-y" id="theater" tabindex="-1"
												style="right: -17px;"></ul>
											<div class="pane pane-y"
												style="display: none; opacity: 1; visibility: visible;">
												<div class="slider slider-y" id = "slider2" style="height: 50px;"></div>
											</div>
											<div class="pane pane-x"
												style="display: none; opacity: 1; visibility: visible;">
												<div class="slider slider-x" style="width: 50px;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- DATE 섹션 -->
						<div class="section section-date">
							<div class="col-head" id="skip_date_list">
								<h3 class="sreader">날짜</h3>
								<a href="#" onclick="return false;" class="skip_to_something">날짜
									건너뛰기</a>
							</div>
							<div class="col-body" style="height: 565px;">
								<!-- 날짜선택 -->
								<div class="date-list nano has-scrollbar has-scrollbar-y"
									id="date_list">
									<ul class="content scroll-y" id="date" tabindex="-1"
										style="right: -17px;">
										<div></div>
									</ul>
									<div class="pane pane-y"
										style="display: block; opacity: 1; visibility: visible;">
										<div class="slider slider-y" id= "slider3" style="height: 50px; top: 0px;"></div>
									</div>
									<div class="pane pane-x"
										style="display: none; opacity: 1; visibility: visible;">
										<div class="slider slider-x" style="width: 50px;"></div>
									</div>
								</div>
							</div>
						</div>

						<!-- TIME 섹션 -->
						<div class="section section-time">
							<div class="col-head" id="skip_time_list">
								<h3 class="sreader">시간</h3>
								<a href="#" class="skip_to_something"
									onclick="skipToSomething('tnb_step_btn_right');return false;">시간선택
									건너뛰기</a>
							</div>
							<div class="col-body" style="height: 565px;">
								<!-- 시간선택 -->
								<div class="time-option">
									<span class="morning">모닝</span><span class="night">심야</span>
								</div>
								<div class="placeholder">영화, 극장, 날짜를 선택해주세요.</div>
								<div class="time-list nano has-scrollbar">

									<div id="Mtime" class="content scroll-y" tabindex="-1"
										style="right: -17px;"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- //step1 -->
					<!-- step2 -->
					<div class="step step2" style="display: none;">
						<!-- SEAT 섹션 -->
						<div class="section section-seat">
							<div class="col-head" id="skip_seat_list">
								<h3 class="sreader">
									인원 / 좌석 <span class="sreader">인원/좌석선택은 레이어로 서비스 되기 때문에
										가상커서를 해지(Ctrl+Shift+F12)한 후 사용합니다.</span>
								</h3>
								<a href="#" class="skip_to_something"
									onclick="skipToSomething('tnb_step_btn_right');return false;">인원/좌석선택
									건너뛰기</a>
							</div>
							<div class="col-body">
								<div class="person_screen">
									<!-- NUMBEROFPEOPLE 섹션 -->
									<div class="section section-numberofpeople">
										<div class="col-body">

											<!-- 인접좌석 -->
											<!-- <div class="adjacent_seat_wrap">
											<div class="adjacent_seat" id="adjacent_seat">
												<span class="title">좌석 붙임 설정</span>
												<div class="block_wrap">
													<span class="seat_block block1"><label><input type="radio" name="adjacent_seat" onclick="ftSetAdjacentSeatSelector(1, this);" disabled><span class="box"></span><span class="sreader">1석 좌석붙임</span></label></span>
													<span class="seat_block block2"><label><input type="radio" name="adjacent_seat" onclick="ftSetAdjacentSeatSelector(2, this);" disabled><span class="box"></span><span class="box"></span><span class="sreader">2석 좌석붙임</span></label></span>
													<span class="seat_block block3"><label><input type="radio" name="adjacent_seat" onclick="ftSetAdjacentSeatSelector(3, this);" disabled><span class="box"></span><span class="box"></span><span class="box"></span><span class="sreader">3석 좌석붙임</span></label></span>
													<span class="seat_block block4"><label><input type="radio" name="adjacent_seat" onclick="ftSetAdjacentSeatSelector(4, this);" disabled><span class="box"></span><span class="box"></span><span class="box"></span><span class="box"></span><span class="sreader">4석 좌석붙임</span></label></span>
												</div>
											</div>
										</div> -->

											<div id="nopContainer" class="numberofpeople-select"
												style="min-width: 426px;">
												<!-- 2021.05.25 - 좌석 거리두기 -->
												<!-- 최대 선택 가능 인원 표기 -->
												<div id="maximum_people"
													style="padding-bottom: 5px; text-align: right; font-size: 11px !important; color: red;"></div>
												<div class="group millitary" id="nop_group_millitary">
													<span class="title">군인</span>
													<ul>
														<li data-count="0" class="selected"><a href="#"
															onclick="return false;"><span class="sreader mod">군인</span>0<span
																class="sreader">명</span></a></li>
														<li data-count="1"><a href="#"
															onclick="return false;"><span class="sreader mod">군인</span>1<span
																class="sreader">명</span></a></li>
														<li data-count="2"><a href="#"
															onclick="return false;"><span class="sreader mod">군인</span>2<span
																class="sreader">명</span></a></li>
														<li data-count="3"><a href="#"
															onclick="return false;"><span class="sreader mod">군인</span>3<span
																class="sreader">명</span></a></li>
														<li data-count="4"><a href="#"
															onclick="return false;"><span class="sreader mod">군인</span>4<span
																class="sreader">명</span></a></li>
													</ul>
												</div>
												<!-- 스페셜 권종 '수험표' 추가 -->
												<div class="group event" id="nop_group_event">
													<span class="title">수험표</span>
													<ul>
														<li data-count="0" class="selected"><a href="#"
															onclick="return false;"><span class="sreader mod">수험표</span>0<span
																class="sreader">명</span></a></li>
														<li data-count="1"><a href="#"
															onclick="return false;"><span class="sreader mod">수험표</span>1<span
																class="sreader">명</span></a></li>
														<li data-count="2"><a href="#"
															onclick="return false;"><span class="sreader mod">수험표</span>2<span
																class="sreader">명</span></a></li>
														<li data-count="3"><a href="#"
															onclick="return false;"><span class="sreader mod">수험표</span>3<span
																class="sreader">명</span></a></li>
														<li data-count="4"><a href="#"
															onclick="return false;"><span class="sreader mod">수험표</span>4<span
																class="sreader">명</span></a></li>
														<li data-count="5"><a href="#"
															onclick="return false;"><span class="sreader mod">수험표</span>5<span
																class="sreader">명</span></a></li>
														<li data-count="6"><a href="#"
															onclick="return false;"><span class="sreader mod">수험표</span>6<span
																class="sreader">명</span></a></li>
														<li data-count="7"><a href="#"
															onclick="return false;"><span class="sreader mod">수험표</span>7<span
																class="sreader">명</span></a></li>
														<li data-count="8"><a href="#"
															onclick="return false;"><span class="sreader mod">수험표</span>8<span
																class="sreader">명</span></a></li>
													</ul>
												</div>
												<div class="group adult" id="nop_group_adult">
													<span class="title">일반</span>
													<ul>
														<li data-count="0" class="selected"><a href="#"
															onclick="return false;"><span class="sreader mod">일반</span>0<span
																class="sreader">명</span></a></li>
														<li data-count="1"><a href="#"
															onclick="return false;"><span class="sreader mod">일반</span>1<span
																class="sreader">명</span></a></li>
														<li data-count="2"><a href="#"
															onclick="return false;"><span class="sreader mod">일반</span>2<span
																class="sreader">명</span></a></li>
														<li data-count="3"><a href="#"
															onclick="return false;"><span class="sreader mod">일반</span>3<span
																class="sreader">명</span></a></li>
														<li data-count="4"><a href="#"
															onclick="return false;"><span class="sreader mod">일반</span>4<span
																class="sreader">명</span></a></li>
														<li data-count="5"><a href="#"
															onclick="return false;"><span class="sreader mod">일반</span>5<span
																class="sreader">명</span></a></li>
														<li data-count="6"><a href="#"
															onclick="return false;"><span class="sreader mod">일반</span>6<span
																class="sreader">명</span></a></li>
														<li data-count="7"><a href="#"
															onclick="return false;"><span class="sreader mod">일반</span>7<span
																class="sreader">명</span></a></li>
														<li data-count="8"><a href="#"
															onclick="return false;"><span class="sreader mod">일반</span>8<span
																class="sreader">명</span></a></li>
													</ul>
												</div>
												<div class="group youth" id="nop_group_youth">
													<span class="title">청소년</span>
													<ul>
														<li data-count="0" class="selected"><a href="#"
															onclick="return false;"><span class="sreader mod">청소년</span>0<span
																class="sreader">명</span></a></li>
														<li data-count="1"><a href="#"
															onclick="return false;"><span class="sreader mod">청소년</span>1<span
																class="sreader">명</span></a></li>
														<li data-count="2"><a href="#"
															onclick="return false;"><span class="sreader mod">청소년</span>2<span
																class="sreader">명</span></a></li>
														<li data-count="3"><a href="#"
															onclick="return false;"><span class="sreader mod">청소년</span>3<span
																class="sreader">명</span></a></li>
														<li data-count="4"><a href="#"
															onclick="return false;"><span class="sreader mod">청소년</span>4<span
																class="sreader">명</span></a></li>
														<li data-count="5"><a href="#"
															onclick="return false;"><span class="sreader mod">청소년</span>5<span
																class="sreader">명</span></a></li>
														<li data-count="6"><a href="#"
															onclick="return false;"><span class="sreader mod">청소년</span>6<span
																class="sreader">명</span></a></li>
														<li data-count="7"><a href="#"
															onclick="return false;"><span class="sreader mod">청소년</span>7<span
																class="sreader">명</span></a></li>
														<li data-count="8"><a href="#"
															onclick="return false;"><span class="sreader mod">청소년</span>8<span
																class="sreader">명</span></a></li>
													</ul>
												</div>
												<div class="group child" id="nop_group_child">
													<span class="title">어린이</span>
													<ul>
														<li data-count="0" class="selected"><a href="#"
															onclick="return false;"><span class="sreader mod">어린이</span>0<span
																class="sreader">명</span></a></li>
														<li data-count="1"><a href="#"
															onclick="return false;"><span class="sreader mod">어린이</span>1<span
																class="sreader">명</span></a></li>
														<li data-count="2"><a href="#"
															onclick="return false;"><span class="sreader mod">어린이</span>2<span
																class="sreader">명</span></a></li>
														<li data-count="3"><a href="#"
															onclick="return false;"><span class="sreader mod">어린이</span>3<span
																class="sreader">명</span></a></li>
														<li data-count="4"><a href="#"
															onclick="return false;"><span class="sreader mod">어린이</span>4<span
																class="sreader">명</span></a></li>
														<li data-count="5"><a href="#"
															onclick="return false;"><span class="sreader mod">어린이</span>5<span
																class="sreader">명</span></a></li>
														<li data-count="6"><a href="#"
															onclick="return false;"><span class="sreader mod">어린이</span>6<span
																class="sreader">명</span></a></li>
														<li data-count="7"><a href="#"
															onclick="return false;"><span class="sreader mod">어린이</span>7<span
																class="sreader">명</span></a></li>
														<li data-count="8"><a href="#"
															onclick="return false;"><span class="sreader mod">어린이</span>8<span
																class="sreader">명</span></a></li>
													</ul>
												</div>
												<div class="group senior" id="nop_group_senior">
													<span class="title">경로</span>
													<ul>
														<li data-count="0" class="selected"><a href="#"
															onclick="return false;"><span class="sreader mod">경로</span>0<span
																class="sreader">명</span></a></li>
														<li data-count="1"><a href="#"
															onclick="return false;"><span class="sreader mod">경로</span>1<span
																class="sreader">명</span></a></li>
														<li data-count="2"><a href="#"
															onclick="return false;"><span class="sreader mod">경로</span>2<span
																class="sreader">명</span></a></li>
														<li data-count="3"><a href="#"
															onclick="return false;"><span class="sreader mod">경로</span>3<span
																class="sreader">명</span></a></li>
														<li data-count="4"><a href="#"
															onclick="return false;"><span class="sreader mod">경로</span>4<span
																class="sreader">명</span></a></li>
														<li data-count="5"><a href="#"
															onclick="return false;"><span class="sreader mod">경로</span>5<span
																class="sreader">명</span></a></li>
														<li data-count="6"><a href="#"
															onclick="return false;"><span class="sreader mod">경로</span>6<span
																class="sreader">명</span></a></li>
														<li data-count="7"><a href="#"
															onclick="return false;"><span class="sreader mod">경로</span>7<span
																class="sreader">명</span></a></li>
														<li data-count="8"><a href="#"
															onclick="return false;"><span class="sreader mod">경로</span>8<span
																class="sreader">명</span></a></li>
													</ul>
												</div>
												<div class="group special hide" id="nop_group_special">
													<span class="title">우대</span>
													<ul>
														<li data-count="0" class="selected"><a href="#"
															onclick="return false;"><span class="sreader mod">우대</span>0<span
																class="sreader">명</span></a></li>
														<li data-count="1"><a href="#"
															onclick="return false;"><span class="sreader mod">우대</span>1<span
																class="sreader">명</span></a></li>
														<li data-count="2"><a href="#"
															onclick="return false;"><span class="sreader mod">우대</span>2<span
																class="sreader">명</span></a></li>
														<li data-count="3"><a href="#"
															onclick="return false;"><span class="sreader mod">우대</span>3<span
																class="sreader">명</span></a></li>
														<li data-count="4"><a href="#"
															onclick="return false;"><span class="sreader mod">우대</span>4<span
																class="sreader">명</span></a></li>
														<li data-count="5"><a href="#"
															onclick="return false;"><span class="sreader mod">우대</span>5<span
																class="sreader">명</span></a></li>
														<li data-count="6"><a href="#"
															onclick="return false;"><span class="sreader mod">우대</span>6<span
																class="sreader">명</span></a></li>
														<li data-count="7"><a href="#"
															onclick="return false;"><span class="sreader mod">우대</span>7<span
																class="sreader">명</span></a></li>
														<li data-count="8"><a href="#"
															onclick="return false;"><span class="sreader mod">우대</span>8<span
																class="sreader">명</span></a></li>
													</ul>
												</div>

											</div>
										</div>
									</div>
									<!-- NUMBEROFPEOPLE 섹션 -->
									<div class="section section-screen-select">
										<!-- UI 변경으로 삭제 
									<div class="title">선택하신 상영관<span>/</span>시간</div>
									-->
										<!-- UI 변경
									<div class="screen-time">
										<span class="screen"><b></b></span>
										<span class="seats seat_all"></span>
										<span class="time"></span>
										<span class="seats seat_remain"></span>
									</div>
									-->
										<div id="user-select-info">
											<p class="theater-info">
												<span class="site">CGV 천왕성</span> <span class="screen">11층
													8관 [Business]</span> <span class="seatNum">남은좌석 <b
													class="restNum">100</b>/<b class="totalNum">900</b></span>
											</p>
											<p class="playYMD-info">
												<b>2017.04.10</b><b class="exe">(월)</b><b>00:00 - 00:00</b>
											</p>
										</div>
									</div>
									<a class="change_time_btn" href="#"
										onmousedown="if(event.stopPropagation){event.stopPropagation();}return false;"
										onclick="ticketStep2TimeSelectPopupShow();return false;"><span>상영시간
											변경하기</span></a>
								</div>
								<!-- THEATER -->
								<div class="theater_minimap">
									<div class="theater nano has-scrollbar" id="seat_minimap_nano">
										<div class="content" tabindex="-1"
											style="right: -17px; bottom: -17px;">
											<div class="screen" title="SCREEN">
												<span class="text"></span>
											</div>
											<div class="seats" id="seats_list"></div>
										</div>
										<div class="pane pane-y"
											style="display: none; opacity: 1; visibility: visible;">
											<div class="slider slider-y" style="height: 50px;"></div>
										</div>
										<div class="pane pane-x"
											style="display: none; opacity: 1; visibility: visible;">
											<div class="slider slider-x" style="width: 50px;"></div>
										</div>
									</div>
									<div class="minimap opened" id="minimap">
										<div class="mini_header"
											onclick="ftSeatMinimapToggle();event.preventDefault();">
											Minimap<span></span>
										</div>
										<div class="mini_container">
											<div class="mini_screen">SCREEN</div>
											<div class="mini_seats"></div>
											<div class="mini_exits"></div>
										</div>
										<div class="mini_region">
											<span></span>
										</div>
									</div>
									<div class="legend">
										<div class="buttons">
											<a class="btn-zoom" id="seat_zoom_btn" href="#"
												onclick="ts2SeatZoomClickListener();return false;">크게보기</a>
										</div>
										<div class="seat-icon-desc">
											<span class="icon selected"><span class="icon"></span>선택</span>
											<span class="icon reserved"><span class="icon"></span>예매완료</span>
											<span class="icon notavail"><span class="icon"></span>선택불가</span>
											<!-- 2021.05.25 - 좌석 거리두기 -->
											<!-- 거리두기 좌석 범례 표기 -->
											<span class="icon distanced"><span class="icon"></span>거리두기
												좌석</span>
										</div>
										<div class="seat-type"></div>
									</div>
									<div class="mouse_block"></div>
								</div>
							</div>
						</div>
						<a class="btn-refresh" href="#"> <span>다시하기</span>
						</a>
						<!-- 시간표 변경 -->
						<div class="section_time_popup" id="section_time_popup">
							<div class="canvas">
								<div class="sprite">
									<div class="time-option">
										<span class="morning">모닝</span><span class="night">심야</span>
									</div>
									<div class="time-list nano has-scrollbar" id="time_popup_list">
										<div class="content scroll-y" tabindex="-1"
											style="right: -17px;"></div>
										<div class="pane pane-y"
											style="display: none; opacity: 1; visibility: visible;">
											<div class="slider slider-y" style="height: 50px;"></div>
										</div>
										<div class="pane pane-x"
											style="display: none; opacity: 1; visibility: visible;">
											<div class="slider slider-x" style="width: 50px;"></div>
										</div>
									</div>
								</div>
								<div class="buttons">
									<a href="#" onclick="return false;" class="btn_ok"><span>확인</span></a>
									<a href="#" onclick="return false;" class="btn_cancel"><span>취소</span></a>
									<a href="#" onclick="return false;" class="sreader"
										onfocus="ticketStep2TimeSelectPopupHide();">시간표 변경 팝업 닫기</a>
								</div>
							</div>
							<div class="corner"></div>
						</div>
						<!-- 시간표 변경 -->
					</div>
					<!-- //step2 -->
					<!-- step3 -->
					<div class="step step3" style="display: none;"></div>
					<!-- //step3 -->
					<!-- step4 -->
					<div class="step step4" style="display: none;"></div>
					<!-- //step4 -->
					<noscript>
						<div class="noscript">
							<span>현재 사용중인 환경에서는 스크립트 동작이 활성화되지 않아 예매 서비스를 이용하실 수 없습니다.<br />예매
								서비스를 이용하기 위해서는 <a href='http://www.enable-javascript.com/ko/'
								rel='nofollow'>스크립트 동작을 활성화</a> 해주세요.
							</span>
						</div>
					</noscript>
				</div>
			</div>
			<!-- //빠른예매 -->
		</div>
		<!-- //컨텐츠 @@-->
		<div id="ticket_tnb" class="tnb_container ">
		<div class="tnb step1">
			<!-- btn-left -->
			<div class="info movie">
				<span class="movie_poster"><img src="" alt="영화 포스터" style="display: none;"></span>
				<div class="row movie_title colspan2" style="display: block;">
					<span class="data letter-spacing-min ellipsis-line2"><a href="" target="_blank"  title=""></a></span>
				</div>
				<div class="row movie_type" style="display: block;">
					<span class="data ellipsis-line1" title=""></span>  <!--2D 인곳  -->  
				</div>
				<div class="row movie_rating" style="display: block;">
					<span class="data" title=""></span>
				</div>
				<div class="placeholder" title="영화선택" style="display: inline;"></div>
			</div>
			<div class="info theater">
				<div class="row name" style="display: none;">
					<span class="header">극장</span>
					<span class="data letter-spacing-min ellipsis-line1"><a href="" target="_blank"  title=""></a></span>
				</div>
				<div class="row date" style="display: none;">
					<span class="header">일시</span>
					<span class="data" title=""></span>
				</div>
				<div class="row screen" style="display: none;">
					<span class="header">상영관</span>
					<span class="data" title=""></span>
				</div>
				<div class="placeholder" title="극장선택" style="display: inline;"></div>
			</div>
			<div class="info seat">
				<div class="row seat_name">
					<span class="header">좌석명</span>
					<span class="data">일반석</span>
				</div>
				<div class="row seat_no colspan3">
					<span class="header">좌석번호</span>
					<span class="data ellipsis-line3"></span>
				</div>
				<div class="placeholder" title="좌석선택"></div>
			</div>
			<div class="info path">
				<div class="row colspan4">
					<span class="path-step2" title="좌석선택">&nbsp;</span>
					<span class="path-step3" title="결제">&nbsp;</span>
				</div>
			</div>
			<div class="tnb_step_btn_right_before" id="tnb_step_btn_right_before"></div>
			<a class="btn-right on" id="tnb_step_btn_right" href="#" title="좌석선택"> </a>
			
			
		</div>
	</div>
</body>
</html>