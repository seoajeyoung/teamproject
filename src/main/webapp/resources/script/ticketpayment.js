$(document).ready(function() {
    // 설정할 인원 수
    var person = 8; // 이 값을 변경하여 인원 수 조정 가능
    var selectedPerCategory = {};

    // 유형별로 초기화된 배열
    var types = ['일반', '청소년', '경로', '우대'];

    // peoSelTableBody 요소를 가져옴
    var tbody = $('#peoSelTableBody');

    // 각 유형에 대해 행을 추가
    $.each(types, function(index, type) {
        var tr = $('<tr></tr>'); // 새로운 행 생성

        // 유형 이름을 포함하는 첫 번째 셀
        var tdType = $('<td></td>').text(type);
        tr.append(tdType);

        // 인원 수에 따라 동적으로 td 요소 생성
        for (var i = 0; i <= person; i++) {
            var td = $('<td></td>');
            var div = $('<div></div>')
                .addClass('NumOfPeo' + (i === 0 ? ' SelectPeople' : '')) // 첫 번째 div에만 SelectPeople 클래스 추가
                .attr('value', type + i)
                .text(i);
            td.append(div);
            tr.append(td);
        }

        // 행을 tbody에 추가
        tbody.append(tr);
    });
    
    $('#DiscountInformation div').first().text(`*최대 ${person}명 선택 가능`);
    
     $('#peoSelTableBody .NumOfPeo.SelectPeople').addClass('selected');  // 인원선택 기본 초기값
    
    
    // 첫 좌석 가져오는 함수 
  function loadSeats() {
    $.ajax({
        url: '/myweb/LOADSEAT', 
        method: 'GET',
        dataType: 'json',
        data: {
            region: selectRegionName,
            th_name: theaterTitle,
            th_number: thNumber
        },
        success: function(data) {

            $('#seat_num').empty(); // 기존 좌석 삭제
	
            var currentRow = '';
            var rowDiv = null;
			$('#seat_num').before('<h1 id="screenArea">Screen</h1>');
			 
            data.forEach(function(seat) {
                var seatRow = seat.SE_SEAT.charAt(0); 
                if (currentRow !== seatRow) {
                
                    currentRow = seatRow;
                    
                    rowDiv = $('<div></div>').addClass('seat-row');
                    
                    $('#seat_num').append(rowDiv);
                }

                var seatDiv = $('<div></div>')
                    .attr('id', 'seat') 
                    .attr('value', seat.SE_SEAT) 
                    .text(seat.SE_SEAT) 
                    .addClass(seat.SE_TYPE);

                rowDiv.append(seatDiv); // 해당 행의 div에 좌석 추가
            });
        },
    });
}

loadSeats();

	// 인원 선택시 클릭 이벤트처리     
      $('#peoSelTableBody').on('click', '.NumOfPeo', function() {
                var $clickedDiv = $(this);
                var $parentRow = $clickedDiv.closest('tr');
				var category = $parentRow.find('td:first').text();
                var currentValue = parseInt($clickedDiv.text(), 10);
			
                // 카테고리별 선택된 인원 수를 추적합니다.
                selectedPerCategory[category] = selectedPerCategory[category] || 0;
                if ($clickedDiv.hasClass('selected')) {
                    $clickedDiv.removeClass('selected');
                    selectedPerCategory[category] -= currentValue;
                } else {
                    selectedPerCategory[category] += currentValue;

                    // 선택된 인원의 합이 person 값을 넘는지 확인합니다.
                    var totalSelected = Object.values(selectedPerCategory).reduce((a, b) => a + b, 0);
                    if (totalSelected > person) {
                        alert('총 인원 수를 초과했습니다!');
                        selectedPerCategory[category] -= currentValue;
                        return;
                    }

                    $parentRow.find('.NumOfPeo').removeClass('selected');
                    $clickedDiv.addClass('selected');
                }
            });
    
	// 좌석  선택 클릭 이벤트     
        $('#seat_num').on('click', '#seat.empty', function() {
        		var seattext = $(this).text();
        		
                var totalSelected = Object.values(selectedPerCategory).reduce((a, b) => a + b, 0);

                if (totalSelected === 0) {
                    alert('인원 선택을 먼저 해주세요.');
                    return;
                }

                var selectedSeats = $('#seat_num .empty.choose').length;

                if (selectedSeats < totalSelected) {
                    $(this).addClass('choose');
                } else {
                    alert('선택 가능한 좌석 수를 초과했습니다.');
                }
                
                
                
                debugger;
                
            });
    
    		
    		
    
    
    
    
 });  // ready 끝    
    