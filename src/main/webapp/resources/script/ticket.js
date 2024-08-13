document.addEventListener('DOMContentLoaded', function() {
    initializeDateList();
    fetchMovies(''); // 영화 목록 초기값 호출

    var selectMovieTitle = '';
    var selectRegionName = '';
    var selectTheaterName = '';
    var selectDate = '';
    var fullDate = '';
    var regionvalue = '';
	var languagetype = '';
	var truetime = '';
	
	var topPosition =0;
    var isTHRegionInProgress = false; // TH_REGION 호출 진행 상태 플래그
    
    
    // 영어 버튼 눌렀을때 클릭 이벤트 
       $('.button-english').click(function(e) {
      e.preventDefault();
      let $span = $(this).find('span');
      let currentText = $span.text();
      
      if (currentText === "ENGLISH") {
        $('#ticket').removeClass('ko').addClass('english');
        languagetype = "en";
        fetchMovies("", languagetype);
        initializeDateList();
        $span.text("한국어");
        $('#ticket_tnb').removeClass('tnb_container').addClass('tnb_container english');
        $('.info.theater .row.name .header').text('Theater');
        $('.info.theater .row.date .header').text('Date');
        $('.info.theater .row.screen .header').text('Screen');
        $('.button.menu1.selected').text('All');
	    $('#movieSortRankBtn').text('Most Popular');
    	$('#movieSortNameBtn').text('English Subtitle');
        
        return;
      }
      
      // currentText가 "한국어"일 경우
      $('#ticket').removeClass('english').addClass('ko');
      languagetype = "kr";
      fetchMovies("", languagetype);
      initializeDateList();
      $span.text("ENGLISH");
      $('#ticket_tnb').removeClass('tnb_container english').addClass('tnb_container');
      $('.info.theater .row.name .header').text('극장');
      $('.info.theater .row.date .header').text('일시');
      $('.info.theater .row.screen .header').text('상영관');
      $('.button.menu1.selected').text('전체');
      $('#movieSortRankBtn').text('예매율순');
      $('#movieSortNameBtn').text('가나다순');
      
    });
    

    // 모두 체크했을때 영화 시간 보여주는 함수 
    function CallMovieTimes() {
        if (selectMovieTitle && selectRegionName && selectTheaterName && selectDate && fullDate) {
            MovieTimes();
        }
    }

    // 극장 지역 가져오는 AJAX
    function TH_REGION() {
        if (isTHRegionInProgress) return; // 이미 진행 중인 경우 중지
        isTHRegionInProgress = true;

        $.ajax({
            url: '/myweb/TH_REGION',
            type: 'GET',
            dataType: 'json',
            data: {
                selectMovieTitle: selectMovieTitle,
                type: languagetype
            },
            success: function(data) {
                var th_regionHtml = '';
                $.each(data, function(index, th_region) {
                    th_regionHtml +=
                        `<li class="selected">
                            <a href="#" data-region="${th_region.TH_REGION}">
                                <span class="name">${th_region.TH_REGION}</span>
                                <span class="count">(${th_region.COUNT})</span>
                            </a>
                            <div class="area_theater_list nano has-scrollbar has-scrollbar-y">
                                <ul class="content scroll-y" tabindex="-1" style="right: -17px;" data-region="${th_region.TH_REGION}"></ul>
                                <div class="pane pane-y" style="display: block; opacity: 1; visibility: visible;">
                                    <div class="slider slider-y" style="height: 50px; top: 0px;"></div>
                                </div>
                                <div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
                                    <div class="slider slider-x" style="width: 50px;"></div>
                                </div>
                            </div>
                        </li>`;
                });

                $('.theater-area-list > ul').empty().append(th_regionHtml); // 초기화 

                // 초기값 설정
                $('.theater-area-list > ul > li > a').css('background-color', '#e6e4d9');
                $('.theater-area-list > ul > li.selected:first').find('a').css('background-color', 'transparent');

                // th_Region 초기값에 클릭 이벤트
                $('.theater-area-list > ul > li.selected:first').find('a').trigger('click');

                isTHRegionInProgress = false;
            },
        });
    }

    // 영화 예매순, 가나다순 클릭 시 order 값 주입
    $(document).off('click', '#movieSortRankBtn, #movieSortNameBtn').on('click', '#movieSortRankBtn, #movieSortNameBtn', function() {
        var order = $(this).attr('id') === 'movieSortRankBtn' ? '' : 'TITLE';
        fetchMovies(order,languagetype);
        $('#movieSortRankBtn, #movieSortNameBtn').removeClass('selected');
        $(this).addClass('selected');
    });

    // 영화 목록을 초기화하고 가져오는 함수
    function fetchMovies(order,languagetype = "kr") {
        var requestData = {};
        if (order) requestData.order = order;
        requestData.type = languagetype;
        $.ajax({
            url: '/myweb/MovieTicket',
            type: 'GET',
            dataType: 'json',
            data: requestData,
            success: function(data) {
                var movieListHtml = '';
                $.each(data, function(index, movie) {
                    movieListHtml +=
                        `<li data-index="${movie.MOVIE_NUM}"  data-post-url="${movie.posterUrl}">
                            <a href="#"  title="${movie.title}" alt="${movie.title}">
                                <i class="cgvIcon etc age${movie.rating}">${movie.rating}</i>
                                <span class="text">${movie.title}</span>
                                <span class="sreader"></span>
                            </a>
                        </li>`;
                });
                $('#movie').html(movieListHtml);
                TH_REGION(); // 극장 호출
                movieupdateScrollbar();
            },
        });
    }

    // 영화 update 투명도처리 
    function updateMovie() {
        $.ajax({
            url: '/myweb/UPDATE_MOVIE',
            type: 'GET',
            dataType: 'json',
            data: {
                fullDate: fullDate,
                selectTheaterName: selectTheaterName,
                region: regionvalue,
                type: languagetype
            },
            success: function(data) {
                var movieTitlesFromUpdate = data.filter(function(movie) {
            		return movie !== null; // null 값 제외
        		})
        		.map(function(movie) {
            		return movie.title; // title 값만 추출
        		});


                // 전체 영화 목록을 HTML 문서에서 가져옴
                $('#movie li').each(function() {
                    var movieTitle = $(this).find('a').attr('title');
                    if (movieTitlesFromUpdate.includes(movieTitle)) {
                        $(this).css('opacity', '1');
                    } else {
                        $(this).css('opacity', '0.25').appendTo($(this).parent());
                    }
                });
            },
        });
    }

    // 영화 시간  투명도 처리 
    function updateTime() {
        $.ajax({
            url: '/myweb/UPDATE_TIME',
            type: 'GET',
            dataType: 'json',
            data: {
                selectMovieTitle: selectMovieTitle,
                selectTheaterName: selectTheaterName,
                region: regionvalue
            },
            success: function(data) {
                // 날짜를 저장할 Set을 생성하여 중복된 날짜를 제거
                var availableDatesSet = new Set();

                // 데이터에서 날짜 부분만 추출하고 중복을 제거하여 Set에 추가
                data.forEach(function(item) {
                    if (item && item.SC_TIME) {
                        // item.SC_TIME이 배열일 때 날짜 형식으로 변환
                        var year = item.SC_TIME[0];
                        var month = padNumber(item.SC_TIME[1]); // 월은 1~12이므로 2자리로 맞춤
                        var day = padNumber(item.SC_TIME[2]); // 일도 2자리로 맞춤


                        var date = `${year}${month}${day}`;

                        availableDatesSet.add(date);
                    }
                });

                // Set을 배열로 변환
                var availableDates = Array.from(availableDatesSet);


                $('.date-list .content li.day').each(function() {
                    var date = $(this).attr('date');
                    if (availableDates.includes(date)) {
                        $(this).css('opacity', '1');
                    } else {
                        $(this).css('opacity', '0.25');
                    }
                });
            },

        });
    }

    // 두 자리 숫자로 맞추기 위한 보조 함수
    function padNumber(num) {
        return num < 10 ? '0' + num : num;
    }


    // 요일을 반환하는 함수
    function getDayOfWeek(dayIndex) {
        var days = ['일', '월', '화', '수', '목', '금', '토'];
        return days[dayIndex];
    }

    // 상영등급 필터링
    function getRatingText(rating) {
        switch (rating) {
            case "12세 이상 관람가":
                return '12';
            case "15세 이상 관람가":
                return '15';
            case "19세 이상 관람가":
                return '18';
            case "전체관람가":
                return 'ageAll';
            default:
                return '';
        }
    }

    // 지역별 극장 이름 가져오기
    function th_name(region) {
        regionvalue = region;
        var $ul = $(`ul[data-region="${region}"]`);

        $.ajax({
            url: '/myweb/TH_NAME',
            type: 'GET',
            dataType: 'json',
            data: {
                region: region,
                type: languagetype
            },
            success: function(data) {
                var TH_NAME = '';
                $.each(data, function(index, th_name) {
                    TH_NAME +=
                        `<li class="" data-index="0" areaindex="1" theater_cd="0056"
                        rating_cd="undefined" style="display: list-item;">
                        <a href="#">${th_name.TH_NAME}</a></li>`;
                });

                $ul.html(TH_NAME);
                if (selectMovieTitle === '' && fullDate === '') {} else {
                    updateTheaterList(); // 선택불가한 애들 회색처리
                }
                $('li[date=fullDate] a').trigger('click');
                updateMovie();
                updateTime();

            },
        });
    }

    // 영화 선택시 극장 비교 
    function updateTheaterList() {
        $.ajax({
            url: '/myweb/UPDATE_TH_NAME',
            type: 'GET',
            dataType: 'json',
            data: {
                selectMovieTitle: selectMovieTitle,
                region: regionvalue,
                fullDate: fullDate,
                type:languagetype
            },
            success: function(data) {
                var theatersForMovie = data.map(function(theater) {
                    return theater.TH_NAME;
                });


                var $selectedTheater = null;
                var $firstSelectableTheater = null;

                $('ul[data-region="' + regionvalue + '"] li').each(function() {
                    var theaterName = $(this).find('a').text().trim();
                    if (theatersForMovie.length === 0 && selectMovieTitle === '' && fullDate === '') {
                        $(this).css('opacity', '0.25');
                    } else if (!theatersForMovie.includes(theaterName)) {
                        var $aTag = $(this).find('a');
                        if ($aTag.hasClass('selected-theater')) {
                            $aTag.css({
                                'border': '',
                                'height': '',
                                'line-height': '',
                                'margin': '',
                                'color': '',
                                'background-color': ''
                            });
                        }
                        $(this).css('opacity', '0.25').appendTo($(this).parent());
                    } else {
                        $(this).css('opacity', '1');
                    }
                });
            },
        });
    }

    // 관, 시간 가져오는 ajax
   function MovieTimes() {
    $.ajax({
        url: '/myweb/MTIME',
        type: 'GET',
        dataType: 'json',
        data: {
            selectMovieTitle: selectMovieTitle,
            selectTheaterName: selectTheaterName,
            fullDate: fullDate,
            region: regionvalue
        },
        success: function(response) {
            var mtime = response.mtime;
            var mcinema = response.mcinema;

            var MtimeHtml = '';

            // 현재 시간 가져오기
            var now = new Date();
            var nowDay = now.getDate();
            var nowHours = now.getHours().toString().padStart(2, '0');
            var nowMinutes = now.getMinutes().toString().padStart(2, '0');
            var nowTimeStr = `${nowHours}:${nowMinutes}`;


			
            $.each(mcinema, function(index, cinema) {
                var cinemaHtml =
                    `<div class="theater">
                    <span class="title">
                        <span class="floor">${cinema.TH_NUMBER}</span>
                        <span class="seatcount">(총218석)</span>
                    </span>
                    <ul>`;

                $.each(mtime, function(index, time) {
                    if (time.TH_NUMBER === cinema.TH_NUMBER) {
                        var showTime = time.SC_TIME;
						
                        // 현재 시간이 상영 시간보다 늦은 경우, 해당 <li> 태그를 숨기기
                        if (nowDay > selectDate || (nowDay === selectDate && nowTimeStr > showTime)) {
                            return; // 해당 시간에 맞는 <li> 태그를 건너뛰기
                        }
                        
                        cinemaHtml +=
                            `<li>
                            <a class="button" data-id="${time.TH_NUMBER}" href="#">
                                <span class="time">
                                    <span>${time.SC_TIME}</span>
                                </span>
                                <span class="count">
                                    102석
                                </span>
                                <div class="sreader">
                                    종료시간 20:57
                                </div>
                                <span class="sreader mod"></span>
                            </a>
                        </li>`;
                    }
                });

                cinemaHtml += `</ul></div>`;
                MtimeHtml += cinemaHtml;
            });

            $('#Mtime').html(MtimeHtml);
            updatetruetime();

        },
    });
}
	// 영화 시간 update 
	function updatetruetime() {
        if (truetime) {
        $('.col-body .placeholder').css('display', 'none');
        $('#Mtime').css('display', 'block'); // Mtime 요소를 보이기
    } else {
        $('.col-body .placeholder').css('display', 'block');
        $('#Mtime').css('display', 'none'); // Mtime 요소를 숨기기
    }
}

    // 시간 클릭 함수    @click@
    $(document).off('click', '.button').on('click', '.button', function(event) {
    event.preventDefault();
    
	 
	// 초기화
	$('.button span.time').css({
        'border': '',
        'background-color': '',
        'color': ''
    });
	
	$(this).find('span.time').css({
        'border': '1px solid #5c5c5c',
        'background-color': 'rgb(57, 53, 53)',
        'color': '#fff'
    });
    updatetimebottom($(this).data('id'),$(this).find('span.time').text().trim(),fullDate);
});



    // 하단 시간 정보 표시 함수 
    function updatetimebottom(TH_NUMBER, SC_TIME, fullDate) {
    
    var $dateSpan = $('.info.theater').find('span.data').eq(1); 
    $dateSpan.attr('title', fullDate + ' ' + SC_TIME); 
    $dateSpan.text(fullDate + ' ' + SC_TIME); 

    var $ciNumberSpan = $('.info.theater').find('span.data').eq(2); 
    $ciNumberSpan.attr('title', TH_NUMBER); 
    $ciNumberSpan.text(TH_NUMBER); 
        
}
    
    

    // 극장 클릭 시 CSS 처리, 극장이름 초기화 후 th_name 호출  @click@
    $(document).off('click', '.theater-area-list > ul > li > a').on('click', '.theater-area-list > ul > li > a', function(event) {
        event.preventDefault();
        $('.theater-area-list > ul > li').removeClass('selected');
        $(this).parent().addClass('selected');
        var region = $(this).data('region');
        $('.theater-area-list > ul > li > a').css('background-color', '#e6e4d9');
        $(this).css('background-color', 'transparent');
        selectRegionName = $(this).find('.name').text();
        th_name(region);
        $('li[date=fullDate] a').trigger('click');
        truetime = false; 
    	updatetruetime(); 
    });

    // 날짜 선택 목록을 초기화하는 함수
    function initializeDateList() {
    var dateListHtml = '';
    var startDate = new Date();
    var numDays = 21; // 3주치 날짜

    // 요일을 한국어와 영어로 정의
    const daysOfWeek = {
        KR: ['일', '월', '화', '수', '목', '금', '토'],
        EN: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
    };

    // languagetype이 "en"일 경우 영어 요일을 사용하고, 그렇지 않으면 한국어 요일을 사용
    const dayLabels = daysOfWeek[languagetype === 'en' ? 'EN' : 'KR'];

    for (var i = 0; i < numDays; i++) {
        var currentDate = new Date(startDate);
        currentDate.setDate(startDate.getDate() + i);

        var year = currentDate.getFullYear();
        var month = padNumber(currentDate.getMonth() + 1); // 월은 0부터 시작하므로 +1
        var day = padNumber(currentDate.getDate());

        var dayOfWeek = dayLabels[currentDate.getDay()];

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

    var dateListElement = document.querySelector('.date-list .content div');
    if (dateListElement) {
        dateListElement.innerHTML = dateListHtml;
    }
}

    // 클릭한 극장이름 배경색 변경   @click@
    $(document).off('click', '.area_theater_list ul[data-region] li a').on('click', '.area_theater_list ul[data-region] li a', function(event) {
        event.preventDefault();
        
        var currentTheater = $(this);
	    var parentLi = currentTheater.closest('li');

	    if (parentLi.css('opacity') == 0.25) {
        	 if (confirm("선택한 극장에 원하시는 상영스케줄이 없습니다.\n계속하시겠습니까? (선택한 영화 및 날짜가 해제됩니다.)")) {
	    		$('.area_theater_list ul[data-region] li').css('opacity', 1);
       
       			 parentLi.parent().prepend(parentLi); // ul의 가장 상단으로 이동
      			  resetMovies();
        		  resetDates();
        		  }else {
        		  return;
        		  }
        }
        		
        $('.area_theater_list ul[data-region] li').css('background-color', 'transparent');
        $('.area_theater_list ul[data-region] li a').removeClass('selected-theater').css({
            'border': '',
            'height': '',
            'line-height': '',
            'margin': '',
            'color': '',
            'background-color': ''
        });

        $(this).addClass('selected-theater').css({
            'border': '1px solid #5c5c5c',
            'height': '25px',
            'line-height': '25px',
            'margin': '1px',
            'color': '#fff',
            'background-color': '#393535'
        });

        selectTheaterName = $(this).text().trim(); // 극장 이름 저장
        CallMovieTimes(); // 모든 값이 설정되었는지 확인 후 호출
        updateTime();
		updatetheaterbottom(selectTheaterName);
		updateMovie();
		if (selectMovieTitle && fullDate) {
         	truetime = true;
       		 MovieTimes();
   		 } else {
        		truetime = false;
        		updateTrueTime();
   		 }  

    });
    
    // 하단 극장정보 표시 함수 
    function updatetheaterbottom(selectTheaterName) {
       $('.info.theater .placeholder').css('display', 'none');
       $('.row').css('display', 'block');
 	   const $theaterLink = $('.info.theater .data.letter-spacing-min.ellipsis-line1 a');
       $theaterLink.attr('title', selectTheaterName);
	   $theaterLink.text(selectTheaterName);        
        
}
    	
    

    // 영화 선택 CSS  @clcick@
    $(document).off('click', '#movie li a').on('click', '#movie li a', function(event) {
        event.preventDefault();
        
        var currentMovie = $(this);
	    var movieli = currentMovie.closest('li');

	    if (movieli.css('opacity') == 0.25) {
        	 if (confirm("선택한 영화에 원하시는 상영스케줄이 없습니다.\n계속하시겠습니까? (선택한 날짜 및 극장이 해제됩니다.)")) {
	    		  $('#movie li').css('opacity', 1);
       
       			  movieli.parent().prepend(movieli);
        		  resetDates();
       			  resetTheaters();
        		  }else {
        		  return;
        		  }
        } 
        
        
        
        $('#movie li a').css('background-color', 'transparent');
        $('#movie li a .text').css('color', '#333333');

        $(this).css('background-color', '#393535');
        $(this).find('.text').css('color', '#fff');

        selectMovieTitle = $(this).attr('title');
        CallMovieTimes();
        updateTheaterList();
        updateTime();
        updatemoviebottom(selectMovieTitle,$(this).find('i.cgvIcon').text(),  $(this).closest('li').data('post-url'));
         if (selectTheaterName && fullDate) {
         	truetime = true;
       		 MovieTimes();
   		 } else {
        		truetime = false;
        		updateTrueTime();
   		 }  
    });
    
    
    
    // 하단 영화 정보 표시 함수 
    function updatemoviebottom(selectMovieTitle, selectMovieRating , selectMovieUrl) {
    
    // 영화 제목 업데이트
    const $movieLink = $('.row.movie_title.colspan2 .data.letter-spacing-min.ellipsis-line2 a');
    $movieLink.text(selectMovieTitle);
    $movieLink.attr('title', selectMovieTitle);

    // 영화 등급 업데이트
    const $movieRatingSpan = $('.row.movie_rating .data');
    $movieRatingSpan.text(selectMovieRating);
    $movieRatingSpan.attr('title', selectMovieRating);
    
    // 포스터 URL 업데이트
    const $moviePosterImg = $('.info.movie .movie_poster img');
    $moviePosterImg.attr('src', selectMovieUrl);
    
    $moviePosterImg.css('display', 'inline');
    $('.info.movie .placeholder').css('display', 'none');
    
}
    //좌석 버튼 선택 버튼 클릭 이벤트  @click@
     $(document).off('click', '#tnb_step_btn_right').on('click', '#tnb_step_btn_right', function(event) {
        event.preventDefault();

        var movieTitle = $('.info.movie .data.letter-spacing-min.ellipsis-line2 a').attr('title');
        var theaterTitle = $('.info.theater .data.letter-spacing-min.ellipsis-line1 a').attr('title');

        var dateSpan = $('.info.theater .data').eq(2).attr('title'); 
			
		 if (!movieTitle) {
        alert("영화를 선택해주세요");
        return; 
    }

    if (!theaterTitle) {
        alert("극장을 선택해주세요");
        return; 
    }

    if (!dateSpan) {
        alert("시간을 선택해주세요");
        return; 
    }
	var params = new URLSearchParams({
           movieTitle: encodeURIComponent(movieTitle),
           theaterTitle: encodeURIComponent(theaterTitle),
           dateSpan: encodeURIComponent(dateSpan)
           })
           debugger;
		   window.location.href = '/myweb/결제TEST?' + params.toString();


    // 모든 값이 유효한 경우
     var sessionId = sessionStorage.getItem('id');

 //       if (!sessionId) {	
 //        var confirmLogin = confirm('로그인이 필요한 서비스입니다.\n로그인 하시겠습니까?');
 //       	 if (confirmLogin) {
 //           	window.location.href = 'login'; // 로그인 페이지로 이동
 //       	}
 //       } else {
 //         var params = new URLSearchParams({
 //           movieTitle: encodeURIComponent(movieTitle),
 //           theaterTitle: encodeURIComponent(theaterTitle),
 //          dateSpan: encodeURIComponent(dateSpan)
 //       });
 //       window.location.href = 'myweb/결제TEST?' + params.toString();
 //       }
   
   
    });
    
    // 상단 버튼들 함수 
        $('.button-reservation-restart').click(function(event) {
            event.preventDefault(); 
            location.reload(); 
        });
    	
    	 $('.button button-english').click(function(event) {
            event.preventDefault(); 
            location.reload();	 
        });
    
    

    // 날짜 선택 CSS  @click@
    $(document).on('click', '.date-list .content li.day a', function(event) {
        event.preventDefault();
		
		var currentDate = $(this);
    	var Dateli = currentDate.closest('li')
    
    if (Dateli.css('opacity') == 0.25) {
        if (confirm("선택한 날짜에 원하시는 상영스케줄이 없습니다.\n계속하시겠습니까? (선택한 영화 및 극장이 해제됩니다.)")) {
        
           $('#date_list .content li').css('opacity', '1');
			resetMovies();            
            resetTheaters(); 
            $('.day').removeAttr('style');
            $('.week').removeAttr('style');
        } else {
            return; // 취소를 클릭하면 이벤트 핸들러를 종료
        }
    }
		
		
		
        $('.date-list .content li.day a').css('background-color', 'transparent');
        $('.date-list .content li.day a .day').css('color', '');
        $('.date-list .content li.day a .dayweek').css('color', '');

        $(this).css('background-color', '#393535');
        $(this).find('.day').css('color', '#fff');
        $(this).find('.dayweek').css('color', '#fff');

        selectDate = $(this).find('.day').text();
        var $currentLi = $(this).closest('li.day');
        var $monthDimmed = $currentLi.prevAll('li.month.dimmed').first();
        if ($monthDimmed.length) {
            var year = $monthDimmed.find('.year').text();
            var month = $monthDimmed.find('.month').text();
            fullDate = year + '-' + month + '-' + selectDate;
            updateTheaterList();
            updateMovie();
            CallMovieTimes();
            truetime = true; 
    		updatetruetime();
        }
    });
     // 영화 마우스 휠 이벤트 핸들러
    function movieupdateScrollbar() {
        var $content = $('#movie');
        var $slider = $('#slider');
		
        var contentHeight = $content[0].scrollHeight; // 전체 콘텐츠 높이
        var containerHeight = $content.height(); // 컨테이너 높이
        var scrollTop = $content.scrollTop(); // 현재 스크롤 위치
        var maxSliderHeight = 50; // 스크롤바 최대 높이
        

        if (contentHeight > containerHeight) {
            // 스크롤바의 높이 비율 계산
            var scrollbarHeight = (containerHeight / contentHeight) * containerHeight;
            $slider.height(scrollbarHeight);
            // 스크롤바의 위치 비율 계산
            var scrollbarTop = (scrollTop / contentHeight) * containerHeight;
            $slider.css('top', scrollbarTop + 'px');
        } else {
            // 콘텐츠가 컨테이너보다 작으면 스크롤바를 숨김
            $slider.height(0);
        }
    }
    // 스크롤 이벤트 리스너 추가
    $('#movie').on('scroll', movieupdateScrollbar);

    // 페이지 로드 시 스크롤바 초기화
    movieupdateScrollbar();
    
     //극장 마우스 휠 이벤트 핸들러 
      function theaterupdateScrollbar() {
        var $content = $('#theater');
        var $slider = $('#slider2');
		
        var contentHeight = $content[0].scrollHeight; // 전체 콘텐츠 높이
        var containerHeight = $content.height(); // 컨테이너 높이
        var scrollTop = $content.scrollTop(); // 현재 스크롤 위치
        var maxSliderHeight = 50; // 스크롤바 최대 높이

        if (contentHeight > containerHeight) {
            // 스크롤바의 높이 비율 계산
            var scrollbarHeight = (containerHeight / contentHeight) * containerHeight;
             if (scrollbarHeight > maxSliderHeight) {
                scrollbarHeight = maxSliderHeight;
            }
            
            $slider.height(scrollbarHeight);
            // 스크롤바의 위치 비율 계산
            var maxScrollTop = contentHeight - containerHeight;
            var maxScrollbarTop = containerHeight - scrollbarHeight;
            var scrollbarTop = (scrollTop / maxScrollTop) * maxScrollbarTop;
            $slider.css('top', scrollbarTop + 'px');
        } else {
            // 콘텐츠가 컨테이너보다 작으면 스크롤바를 숨김
            $slider.height(0);
        }
    }
    // 스크롤 이벤트 리스너 추가
    $('#theater').on('scroll', theaterupdateScrollbar);

    // 페이지 로드 시 스크롤바 초기화
    theaterupdateScrollbar();
     
    
    // 시간 마우스 휠 이벤트 핸들러
    function dateupdateScrollbar() {
        var $content = $('#date');
        var $slider = $('#slider3');
		
        var contentHeight = $content[0].scrollHeight; // 전체 콘텐츠 높이
        var containerHeight = $content.height(); // 컨테이너 높이
        var scrollTop = $content.scrollTop(); // 현재 스크롤 위치
        var maxSliderHeight = 50; // 스크롤바 최대 높이

        if (contentHeight > containerHeight) {
            // 스크롤바의 높이 비율 계산
            var scrollbarHeight = (containerHeight / contentHeight) * containerHeight;
             if (scrollbarHeight > maxSliderHeight) {
                scrollbarHeight = maxSliderHeight;
            }
            
            $slider.height(scrollbarHeight);
            // 스크롤바의 위치 비율 계산
            var maxScrollTop = contentHeight - containerHeight;
            var maxScrollbarTop = containerHeight - scrollbarHeight;
            var scrollbarTop = (scrollTop / maxScrollTop) * maxScrollbarTop;
            $slider.css('top', scrollbarTop + 'px');
        } else {
            // 콘텐츠가 컨테이너보다 작으면 스크롤바를 숨김
            $slider.height(0);
        }
    }
    // 스크롤 이벤트 리스너 추가
    $('#date').on('scroll', dateupdateScrollbar);

    // 페이지 로드 시 스크롤바 초기화
    dateupdateScrollbar();
    
    // 초기화
    function resetMovies() {
    selectMovieTitle = '';
    $('.movie-list a').removeClass('selected-movie').css({
        'border': '',
        'color': '',
        'background-color': ''
    });
    
       $('.movie-list li span.text').css('color', 'rgb(51,51,51)');
       updatemoviebottom("","","");
       
       $('.info.movie .movie_poster img').css('display' , 'none');
       $('.info.movie .placeholder').css('display', 'inline');
       
    
}

function resetDates() {
    fullDate = '';
    $('.date-list a').removeClass('selected-date').css({
        'border': '',
        'color': '',
        'background-color': ''
    });
}
    
   
function resetTheaters() {
     selectMovieTitle = '';
     $('.area_theater_list ul[data-region] li a').removeClass('selected-theater').css({
        'border': '',
        'height': '',
        'line-height': '',
        'margin': '',
        'color': '',
        'background-color': ''
    });
    
    
    // 3. span.text의 색상을 rgb(51, 51, 51)로 설정
    $('.area_theater_list ul[data-region] li span.text').css('color', 'rgb(51, 51, 51)');
    
    // 4. updatetheaterbottom 호출
    updatetheaterbottom("", "", "");
    
    // 5. .info.theater의 row name, row date, row screen의 display를 none으로 설정하고 placeholder의 display를 inline으로 설정
    $('.info.theater .row.name').css('display', 'none');
    $('.info.theater .row.date').css('display', 'none');
    $('.info.theater .row.screen').css('display', 'none');
    $('.info.theater .placeholder').css('display', 'inline');
    
}   
    
    
   
   
   
   
    
    
});