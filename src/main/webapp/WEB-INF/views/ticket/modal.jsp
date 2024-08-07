<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ticket/modal.css">
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/modal.js"></script>
</head>
<body>
    <button class="btn-open-modal">관 등록</button>
    
    <div class="modal">
        <div class="modal_body">
            <span class="close">&times;</span>
            <form id="register-form">
                <div class="input-container">
                    <label for="theater-name">극장이름:</label>
                    <input type="text" id="theater-name" name="theater-name" required>
                     <select id="theater-select" name="theater-select">
                        <option value="" selected>극장 불러오기</option>
                        <option value="1">극장 1</option>
                        <option value="2">극장 2</option>
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
