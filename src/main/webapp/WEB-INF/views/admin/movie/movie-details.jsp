<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>영화 상세 정보</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function () {
        // URL에서 영화 코드(moiveCd)를 추출
        var urlParams = new URLSearchParams(window.location.search);
        var movieCd = urlParams.get('id');

        if (movieCd) {
            $.ajax({
                type: 'GET',
                url: 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml',
                data: {
                    key: '6a0692634ee3580edc52c38d43334960', // API 키
                    movieCd: movieCd
                },
                dataType: 'xml',
                contentType: 'application/json; charset=utf-8',
            }).done(function (res) {
                var movieInfo = $(res).find('movieInfo');
                var movieNm = movieInfo.find('movieNm').text();
                var movieNmEn = movieInfo.find('movieNmEn').text();
                var prdtYear = movieInfo.find('prdtYear').text();
                var openDt = movieInfo.find('openDt').text();
                var typeNm = movieInfo.find('typeNm').text();
                var prdtStatNm = movieInfo.find('prdtStatNm').text();
                var nationAlt = movieInfo.find('nationAlt').text();
                var genreAlt = movieInfo.find('genreAlt').text();
                var repNationNm = movieInfo.find('repNationNm').text();
                var repGenreNm = movieInfo.find('repGenreNm').text();
                var directors = movieInfo.find('directors').text();
                var peopleNm = movieInfo.find('peopleNm').text();
                var companys = movieInfo.find('companys').text();
                var companyCd = movieInfo.find('companyCd').text();
                var companyNm = movieInfo.find('companyNm').text();

                // 영화 정보를 페이지에 표시
                $('#movie-name').text(movieNm);
                $('#movie-name-en').text(movieNmEn);
                $('#production-year').text(prdtYear);
                $('#release-date').text(openDt);
                $('#movie-type').text(typeNm);
                $('#production-status').text(prdtStatNm);
                $('#production-country').text(nationAlt);
                $('#movie-genre').text(genreAlt);
                $('#representative-country').text(repNationNm);
                $('#representative-genre').text(repGenreNm);
                $('#directors').text(directors);
                $('#director-name').text(peopleNm);
                $('#production-companies').text(companys);
                $('#company-code').text(companyCd);
                $('#company-name').text(companyNm);
            }).fail(function (error) {
                alert('영화 정보를 불러오는 데 실패했습니다.');
            });
        } else {
            alert('영화 ID가 없습니다.');
        }
    });
    </script>
</head>
<body>
    <h1>영화 상세 정보</h1>
    <div>
        <body>
    <h1>영화 상세 정보</h1>
    <div>
        <p><strong>영화명:</strong> ${movie.movieNm}</p>
        <p><strong>영화명 (영문):</strong> ${movie.movieNmEn}</p>
        <p><strong>제작 연도:</strong> ${movie.prdtYear}</p>
        <p><strong>개봉일:</strong> ${movie.openDt}</p>
        <p><strong>영화 유형:</strong> ${movie.typeNm}</p>
        <p><strong>제작 상태:</strong> ${movie.prdtStatNm}</p>
        <p><strong>제작 국가:</strong> ${movie.nationAlt}</p>
        <p><strong>영화 장르:</strong> ${movie.genreAlt}</p>
        <p><strong>대표 제작 국가:</strong> ${movie.repNationNm}</p>
        <p><strong>대표 장르:</strong> ${movie.repGenreNm}</p>
        <p><strong>영화 감독:</strong> ${movie.directors}</p>
        <p><strong>감독명:</strong> ${movie.peopleNm}</p>
        <p><strong>제작사:</strong> ${movie.companys}</p>
        <p><strong>제작사 코드:</strong> ${movie.companyCd}</p>
        <p><strong>제작사명:</strong> ${movie.companyNm}</p>
    </div>
</body>
    </div>
</body>
</html>
