$(document).ready(function() {
    var hideTimer;

    // 모든 .nav_overMenu 요소에 대해 슬라이드 애니메이션 적용
    function showNavOverMenu() {
        clearTimeout(hideTimer); // 기존 숨기기 타이머를 지움
        $('.nav_overMenu').stop(true, true).slideDown(300); // 슬라이드 다운으로 표시
    }

    function hideNavOverMenu() {
        hideTimer = setTimeout(function() {
            $('.nav_overMenu').stop(true, true).slideUp(300); // 슬라이드 업으로 숨김
        }, 500); // 0.5초 후에 숨기기
    }

    // li 태그에 마우스를 오버하면 모든 .nav_overMenu를 inline으로 표시
    $('.nav_menu li').hover(
        function() {
            showNavOverMenu();
        }
    );

    // nav_overMenu와 그 자식 요소들에 마우스를 오버하면 표시 유지
    $('.nav_overMenu').add('.nav_menu li').hover(
        function() {
            clearTimeout(hideTimer); // 숨기기 타이머를 지움
            $(this).stop(true, true).slideDown(300); // 슬라이드 다운으로 유지
        },
        function() {
            hideNavOverMenu();
        }
    );
});
