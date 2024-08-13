$(document).ready(function() {
    // 설정할 인원 수
    var person = 3; // 이 값을 변경하여 인원 수 조정 가능

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
    
 });  // ready 끝    
    