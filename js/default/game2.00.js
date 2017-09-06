var city_array = [''];
var letter = false;

//window.location.href = "/"; - переадресация

function myAjax () {
    var check = true;
    if ($('#city').val() !== undefined) {
        if ($('#city').val() == '') {
           alert('Вы не ввели название города!');
           $('#city').focus();
           check = false;
        } else if ($.inArray($('#city').val().trim(), city_array) != -1) {
            alert($('#city').val() + ' уже был назван');
            $('#city').focus();
            check = false;
        } else if (letter !== false && $('#city').val()[0].toUpperCase() != letter.toUpperCase()) {
            alert ('Вы называете город не с той буквы!');
            $('#city').val(letter.toUpperCase());
            $('#city').focus();
            check = false;
        }
    } else {
        check = false;
    }

    if (check) {
        $.ajax ({
            url   : '/games/ajax?ajax',
            type  : "POST",
            cache : false,
            data  : {
                'city' : $('#city').val(),
                'named_cities' : city_array
            },
            dataType : 'json',
            timeout : 15000,
            success : function(response) {
                if (response.name !== undefined) {
                    city_array[city_array.length] = $('#city').val().trim();
                    city_array[city_array.length] = response.name.trim();
                    letter = response.letter;
                    $('#user_cities').append('<p>' + $('#city').val() + '</p>');
                    $('#server_cities').append('<p>' + response.name + '</p>');
                    $('#user_cities').scrollTop('5000000');
                    $('#server_cities').scrollTop('5000000');
                    $('#city').val(response.letter.toUpperCase());
                    $('#city').focus();

                } else if (response.status !== undefined) {
                    alert (response.cause);
                    $('#city').focus();
                }
            },
            error   : function (x, t) {
                if (t === "timeout") {
                    alert ('Ожидание ответа с сервера слишком велико');
                } else {
                    alert ('При отправке комментария возникли какие-то проблемы');
                }
            }
        });
    }
}