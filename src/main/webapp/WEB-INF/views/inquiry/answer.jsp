<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry/answer.jsp</title>
<link href="${pageContext.request.contextPath}/resources/css/inquiry/customer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/module.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/inquiry/reset.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
</head>
<body>
<div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->

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
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/Imain">고객센터 메인<i></i></a></li>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/often">자주찾는 질문<i></i></a></li>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/news">공지/뉴스<i></i></a></li>
            <li class=""><a href="${pageContext.request.contextPath}/inquiry/write">1 : 1 문의하기<i></i></a></li>
            
            <li class="on"><a href="${pageContext.request.contextPath}/inquiry/list" title="현재선택">문의/답변<i></i></a></li>            
            
            
          
        </ul>
    </div>
    <div class="ad-area">
        <div class="ad-partner01">
            <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@C_Rectangle" width="160" height="300" title="기업광고-하나TV쇼핑" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="C_Rectangle" id="C_Rectangle"></iframe>
        </div>
        <div class="ad-partner02">
            <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@Image_text" width="160" height="35" title="영화광고-꾸뻬씨의행복여행" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Image_text" id="Image_text"></iframe>
        </div>
    </div>
</div>

		<div class="col-detail">
			<div class="customer_top">
				<h2 class="tit">회원 문의 내역</h2>
				<p class="stit">답변 플리즈</p>
			</div>
			<div class="board_view_area">
				<ul class="top_title_faq">
					<li class="title">${inquiryDTO.INQUIRY_NAME}</li>
					<li class="stit_area">
						<span>등록일<em class="regist_day">${inquiryDTO.INQUIRY_DATE_FORMAT}<span><em class="regist_day"></em></span></em></span>
						<span class="check_tit_area">닉네임<em class="check_num">${inquiryDTO.MEMBER_NICKNAME}</em></span>
					</li>
				</ul>
				<div class="view_area">
					<p></p><p style="line-height: 1.8;"><span style="font-family: arial;"><b>${inquiryDTO.INQUIRY_DETAIL}</b></span></p>
				</div>
				
				<form id="form1" name="form1"  method="post" novalidate="novalidate" enctype="multipart/form-data">
				<% String num = request.getParameter("inquiry_num");%>
				<input type="hidden" name="IQ_NUM" value="<%= num %>"/>
				<input type="hidden" name="AS_NUM" value="${AS_NUM}" />
				 <input type="hidden" id="hIsTemp" name="hIsTemp" value="N"> 
                    <input type="hidden" id="hIdx" name="hIdx" value="">
                    <fieldset>
						<legend>이메일 문의</legend>
						<div class="tbl_area">

							<table cellspacing="0" cellpadding="0" class="tbl_notice_list tbl_left">
								<caption>목록</caption>
								<colgroup>
									<col style="width:96px">
                                    <col style="width:303px">
                                    <col style="width:96px">
                                    <col style="width:303px">
								</colgroup>
								<tbody>
									<tr>
										<button type="button" onclick="confirmDelete('${pageContext.request.contextPath}/inquiry/deletelist?num=${inquiryDTO.INQUIRY_NUM}')" class="round inblack" >
										<span>글삭제</span></button>
										<th scope="row"><label for="inp_textbox">답글 <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수"></em></label></th>
										<td colspan="3">
											
											<textarea cols="60" rows="5" id="inp_textbox" name="AS_DETAIL" class="inp_txtbox01" 
													  style=" height:94px !important;" 
													  placeholder="답글달기"

													  >${inquiryDTO.AS_DETAIL}</textarea>
													   
											<p class="byte_info"><span id="sp_ad_content_size_1">0</span>/5000BYTE <span>(<span id="sp_ad_content_size_2">0</span>/2500자)</span></p>
										  	<c:if test="${AS_NUM eq null}">
											 	<button style="width:80px" onclick="setFormAction('${pageContext.request.contextPath}/inquiry/answerPro')" class="round inred" type="submit" id="emailsubmit"><span>등록하기</span></button>
											</c:if>
                          				    <c:if test="${AS_NUM ne null}">
                            					<button style="width:80px" onclick="setFormAction('${pageContext.request.contextPath}/inquiry/updateAsPro')" class="round inred" type="submit" id="emailsubmit"><span>수정하기</span></button></a>
											</c:if>
										</td>
									</tr>
									
								</tbody>
							</table>
						</div>
						<c:if test="${AS_NUM ne null}">
						<div class="box-btn qna_email">
							<a style="margin-left:5px" href="#" onclick="deleteItem('${pageContext.request.contextPath}/inquiry/deleteAs', '${AS_NUM}');" class="round gray"><span style="padding:0 14px;">답글삭제</span></a>
						</div>
						</c:if>
					</fieldset>
				</form>
				
				<div class="customer_btn"><button type="button" class="round inblack" id="btn_list"><span>목록으로</span></button></div>
				<!-- 이전글,다음글 (s) -->
				<div class="btm_sup_list">
				<!-- 					@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					<ul class="line_sup_next">
                        <li class="stit">이전글</li>
                        <c:choose>  
							<c:when test="${empty next}"> 
								<li class="name">이전글이 없습니다.</li>
							</c:when> 
							<c:otherwise>
								<li class="name"><a href="${pageContext.request.contextPath}/inquiry/content?inquiry_num=${next.INQUIRY_NUM}" class="txt" >${next.INQUIRY_NAME}</a></li> 
							</c:otherwise> 
						</c:choose>
					</ul>
<!-- 					@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
				
					<ul class="line_sup_prev">
						<li class="stit">다음글</li>
						
                        <c:choose>  
							<c:when test="${empty prev}"> 
								<li class="name">다음글이 없습니다.</li>
							</c:when> 
							<c:otherwise>
								<li class="name"><a href="${pageContext.request.contextPath}/inquiry/content?inquiry_num=${prev.INQUIRY_NUM}" class="txt" >${prev.INQUIRY_NAME}</a></li> 
							</c:otherwise> 
						</c:choose>
						  
					</ul>
<!-- 					@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<!-- 					<ul class="line_sup_next"> -->
<!--                         <li class="stit">다음글</li> -->
<%--                         <c:choose>   --%>
<%-- 							<c:when test="${empty next}">  --%>
<!-- 								<li class="name">다음글이 없습니다.</li> -->
<%-- 							</c:when>  --%>
<%-- 							<c:otherwise> --%>
<%-- 								<li class="name"><a href="${pageContext.request.contextPath}/inquiry/content?inquiry_num=${next.INQUIRY_NUM}" class="txt" >${next.INQUIRY_NAME}</a></li>  --%>
<%-- 							</c:otherwise>  --%>
<%-- 						</c:choose> --%>
<!-- 					</ul> -->
<!-- 					@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
				</div>
				<!-- 이전글,다음글 (e) -->
			</div>
		</div>
	</div>
	<!-- //Contents End -->
</div>
<!-- //Contents Area -->
<script type="text/javascript">

function setFormAction(action) {
    var form = document.getElementById('form1');
    form.action = action;
}

function confirmDelete(url) {
    if (confirm("삭제하시겠습니까?")) {
        window.location.href = url; // 삭제 확인창 띄운후 확인누르면 URL로 이동/삭제
    }
}

function deleteItem(url, AS_NUM) {
    if (confirm('정말로 삭제하시겠습니까?')) { // 사용자 확인
        var form = document.createElement('form');
        form.method = 'POST';
        form.action = url;

        var hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = 'AS_NUM';
        hiddenField.value = AS_NUM;
        form.appendChild(hiddenField);

        document.body.appendChild(form);
        form.submit();
    }
}

$(function () {     
	$('#inp_textbox').on('keyup', checkByte);
});

function checkByte() {
	let maxByte = 5000;
	
    var sString = $('#inp_textbox').val();
    var setBytes = getBytes(sString);
    if (setBytes > maxByte) {
        alert("최대 " + maxByte + "Bytes(한글 " + (maxByte / 2) + "자/영문 " + maxByte + "자)까지만 입력하실 수 있습니다.");
        cutOverText(obj, maxByte, viewAreaID1);
    }

    $('#sp_ad_content_size_1').html(setBytes);
    $('#sp_ad_content_size_2').html(Number(setBytes) / 2);
}

function getBytes(sString) {
    var c = 0;
    for (var i = 0; i < sString.length; i++) {
        c += parseInt(getByte(sString.charAt(i)));
    }
    return c;
}

function getByte(sChar) {
    var c = 0;
    var u = escape(sChar);
    if (u.length < 4) { // 반각문자 : 기본적인 영문, 숫자, 특수기호
        c++; // + 1byte
    } else {
        var s = parseInt(sChar.charCodeAt(0));
        if (((s >= 65377) && (s <= 65500)) || ((s >= 65512) && (s <= 65518))) // 반각문자 유니코드 10진수 범위 : 한국어, 일본어, 특수문자
            c++; // + 1byte
        else // 전각문자 : 위 조건을 제외한 모든 문자
            c += 2; // + 2byte
    }
    return c;
}

function cutOverText(obj, maxByte, viewAreaID) {
    var sString = obj.value;
    var c = 0;
    for (var i = 0; i < sString.length; i++) {
        c += parseInt(getByte(sString.charAt(i)));
        if (c > maxByte) {
            obj.value = sString.substring(0, i);
            break;
        }
    }
}



//<![CDATA[

    (function ($) {
        $(function () {
            $('#btn_list').on('click', function () {
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
    
    
     
    

//]]>
</script>

            
            <!--/ Contents End -->
		 </div>
		<!-- /Contents Area -->
	</div>
</body>
</html>