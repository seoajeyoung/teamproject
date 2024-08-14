$(document).ready(function() {
    // 설정할 인원 수
    var person = 8; // 이 값을 변경하여 인원 수 조정 가능

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

    
    
    
    
    
    
    
    
    
    
 });  // ready 끝    
    