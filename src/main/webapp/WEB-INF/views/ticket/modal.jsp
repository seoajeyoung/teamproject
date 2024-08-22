<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ticket/modal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/.css">
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/modal.js"></script>
</head>
<body>
<jsp:include page = "/WEB-INF/views/admin/inc/sidebar.jsp"/>
		<select id="region" name="region">
			<option value="" disabled selected>지역 선택해주세요</option>
            <c:forEach var="region" items="${th_region}">
                <c:forEach var="region" items="${region}">
                    <option value="${region.value}">${region.value}</option>
                </c:forEach>
            </c:forEach>
        </select>
        
        <select id="th_name" name="th_name">
			<option value="" disabled selected>극장 이름 선택해주세요</option>
        </select>
        <select id="theater-insert" class="theater-select">
                        <option value="" disabled selected>등록할관 선택해주세요</option>
        </select>
        
        
        
    <button class="btn-open-modal">관 등록</button>
    
    <div class="modal">
        <div class="modal_body">
            <span class="close">&times;</span>
            <form id="register-form">
                <div class="input-container">
                    <label id = "namecinema" class= "namecinema"></label>
                     <select id="theater-select" class="theater-select">
                    </select>
                </div>
                <div class="input-container">
                    <label for="rows">세로</label>
                    <button type="button" id="decrease-rows" class="mbutton">-</button>
                    <input type="number" id="rows" name="rows" value="15" min="1" readonly>
                    <button type="button" id="increase-rows" class="mbutton">+</button>
                    <label for="cols">가로</label>
                    <button type="button" id="decrease-cols" class="mbutton">-</button>
                    <input type="number" id="cols" name="cols" value="15" min="1" readonly>
                    <button type="button" id="increase-cols" class="mbutton">+</button>
                </div>
                <button type="button" id="btn-create-seats" class="mbutton">생성</button>
            </form>
            <div id="seat-container">
                <div class="seat-table" id="seat-table"></div>
                <div class="button-container">
                     <button type="button" id="onetouch" class="hidden">마우스 올리면 삭제</button>
                    <button type="button" id="btn-save" class="hidden">저장</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
