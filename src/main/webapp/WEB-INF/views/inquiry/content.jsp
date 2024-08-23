<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry/mycontent.jsp</title>
<link
	href="${pageContext.request.contextPath}/resources/css/inquiry/customer.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/inquiry/content.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/layout.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/module.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/reset.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/ticket/top.jsp" />
	<div id="contaniner" class="">
		<!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->

		<!-- Contents Area -->
		<div id="contents" class="">


			<!-- Contents Start -->

			<!-- Contents Area -->
			<div id="contents">
				<!-- Contents Start -->
				<div class="cols-content">

					<div class="col-aside">
						<h2>고객센터 메뉴</h2>
						<div class="snb">
							<ul>
								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/Imain">고객센터
										메인<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/often">자주찾는
										질문<i></i>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/news">공지/뉴스<i></i></a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/inquiry/write">1 :
										1 문의하기<i></i>
								</a></li>

								<li class="on"><a
									href="${pageContext.request.contextPath}/inquiry/list"
									title="현재선택">문의/답변<i></i></a></li>



							</ul>
						</div>
						<div class="ad-area">
							<div class="ad-partner01">
								<iframe
									src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@C_Rectangle"
									width="160" height="300" title="기업광고-하나TV쇼핑" frameborder="0"
									scrolling="no" marginwidth="0" marginheight="0"
									name="C_Rectangle" id="C_Rectangle"></iframe>
							</div>
							<div class="ad-partner02">
								<iframe
									src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@Image_text"
									width="160" height="35" title="영화광고-꾸뻬씨의행복여행" frameborder="0"
									scrolling="no" marginwidth="0" marginheight="0"
									name="Image_text" id="Image_text"></iframe>
							</div>
						</div>
					</div>

					<div class="col-detail">
						<div class="customer_top">
							<h2 class="tit">나의 문의 내역</h2>
							<p class="stit">문의해주신 내용과 답변을 확인하실 수 있습니다.</p>
						</div>
						<div class="board_view_area">
							<ul class="top_title_faq">
								<li class="title">${inquiryDTO.INQUIRY_NAME}</li>
								<li class="stit_area"><span>등록일<em
										class="regist_day">${inquiryDTO.INQUIRY_DATE_FORMAT}<span><em
												class="regist_day"></em></span></em></span> <span class="check_tit_area">닉네임<em
										class="check_num">${inquiryDTO.MEMBER_NICKNAME}</em></span></li>
							</ul>
							<div class="view_area">
								<p></p>
								<p style="line-height: 1.8;">
									<span style="font-family: arial;"><b>${inquiryDTO.INQUIRY_DETAIL}</b><br>
									<img alt="" src="${pageContext.request.contextPath}/resources/upload/${inquiryDTO.INQUIRY_PICTURE}" width="200">
									</span>
								</p>
							</div>

							<tbody>
								<tr>

									<th scope="row"><label for="inp_textbox">답변 <em><img
												src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png"
												alt="필수"></em></label></th>
									<td colspan="3"><textarea cols="60" rows="5"
											id="inp_textbox" name="AS_DETAIL" class="inp_txtbox01"
											style="height: 94px !important;" placeholder="답글달기" readonly>${inquiryDTO.AS_DETAIL}
								   </textarea></td>
								</tr>
							</tbody>

							<div class="customer_btn">
								<button type="button" class="round inblack" id="btn_list">
									<span>목록으로</span>
								</button>
							</div>
							<!-- 이전글,다음글 (s) -->
							<div class="btm_sup_list">
								<ul class="line_sup_next">
									<li class="stit">이전글</li>

									<c:choose>
										<c:when test="${empty next}">
											<li class="name">이전글이 없습니다.</li>
										</c:when>
										<c:otherwise>
											<li class="name"><a
												href="${pageContext.request.contextPath}/inquiry/content?search=${param.search}&inquiry_num=${next.INQUIRY_NUM}"
												class="txt">${next.INQUIRY_NAME}</a></li>
										</c:otherwise>
									</c:choose>

								</ul>
								<ul class="line_sup_prev">
									<li class="stit">다음글</li>
									<c:choose>
										<c:when test="${empty prev}">
											<li class="name">다음글이 없습니다.</li>
										</c:when>
										<c:otherwise>
											<li class="name"><a
												href="${pageContext.request.contextPath}/inquiry/content?search=${param.search}&inquiry_num=${prev.INQUIRY_NUM}"
												class="txt">${prev.INQUIRY_NAME}</a></li>
										</c:otherwise>
									</c:choose>


								</ul>
							</div>
							<!-- 이전글,다음글 (e) -->
						</div>
					</div>
				</div>
				<!-- //Contents End -->
			</div>
			<!-- //Contents Area -->
			<script type="text/javascript">
				//<![CDATA[

				(function($) {
					$(function() {
						$('#btn_list').on('click', function() {
							Search();
						});

						function Search() {
							location.href = "${pageContext.request.contextPath}/inquiry/list";
							//@@@@@@@@@@@페이지가 많을때 목록이동하면서 현제 페이지로 이동하게 하고싶음
							//location.href = "/support/news/default.aspx?searchtext=" + escape("") + "&page=1&type=1&searchfield=0";
							return false;
						}

					});
				})(jQuery);

				//     $(document).ready(function(){
				//     	var datePart = "${inquiryDTO.inquiry_date}".split(" ")[0];
				//     	 $('.regist_day').text(datePart);

				//     	 var result = "${inquiryDTO.inquiry_type}";
				//     	 if(result == 'T'){
				//     		 $('.check_num').text("전체공개");
				//     	 }else{
				//     		 $('.check_num').text("비공개");
				//     	 }

				//     });

				//]]>
			</script>


			<!--/ Contents End -->
		</div>
		<!-- /Contents Area -->
	</div>
</body>
</html>