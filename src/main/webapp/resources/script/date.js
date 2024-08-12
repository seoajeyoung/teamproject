// 페이지 로드 시 실행되는 함수
document.addEventListener('DOMContentLoaded', function() {
    initializeDateList();
});

// 날짜 선택 목록을 초기화하는 함수
function initializeDateList() {
    // 날짜 목록을 담을 변수
    var dateListHtml = '';

    // 오늘 날짜를 기준으로 3주치 날짜 생성
    var startDate = new Date();
    var numDays = 21; // 3주치 날짜

    for (var i = 0; i < numDays; i++) {
        var currentDate = new Date(startDate);
        currentDate.setDate(startDate.getDate() + i);

        var year = currentDate.getFullYear();
        var month = padNumber(currentDate.getMonth() + 1); // 월은 0부터 시작하므로 +1
        var day = padNumber(currentDate.getDate());

        var dayOfWeek = getDayOfWeek(currentDate.getDay());

        // 날짜 요소 HTML 생성
        if (i === 0 || day === '01') {
            dateListHtml += '<li class="month dimmed"><div>';
            dateListHtml += '<span class="year">' + year + '</span>';
            dateListHtml += '<span class="month">' + month + '</span>';
            dateListHtml += '</div></li>';
        }

        dateListHtml += '<li data-index="' + i + '" date="' + year + month + day + '" class="day">';
        dateListHtml += '<a href="#" onclick="return false;">';
        dateListHtml += '<span class="dayweek">' + dayOfWeek + '</span>';
        dateListHtml += '<span class="day">' + day + '</span>';
        dateListHtml += '<span class="sreader"></span>';
        dateListHtml += '</a></li>';
    }

    // 날짜 목록을 삽입할 요소 선택 및 HTML 삽입
    var dateListElement = document.querySelector('.date-list .content div');
    if (dateListElement) {
        dateListElement.innerHTML = dateListHtml;
    }
}

// 숫자를 두 자리 문자열로 변환하는 함수
function padNumber(num) {
    return num < 10 ? '0' + num : num;
}

// 요일을 반환하는 함수
function getDayOfWeek(dayIndex) {
    var days = ['일', '월', '화', '수', '목', '금', '토'];
    return days[dayIndex];
}


$(document).on('click', '.date-list .content li.day a', function(event) {
    event.preventDefault();

    // 모든 날짜 항목의 배경색을 투명하게 처리하고 원래 색상으로 되돌림
    $('.date-list .content li.day a').css('background-color', 'transparent');
    $('.date-list .content li.day a .day').css('color', '');
    $('.date-list .content li.day a .dayweek').css('color', '');

    // 클릭된 날짜 항목에 대한 배경색 적용
    $(this).css('background-color', '#393535');
    $(this).find('.day').css('color', '#fff');
    $(this).find('.dayweek').css('color', '#fff'); 
    
    
    // 클릭한 날짜 항목의 day span의 텍스트 값을 변수에 저장
    var dayText = $(this).find('.day').text();
    
    
});

