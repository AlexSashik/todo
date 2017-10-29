// таймер
var to =  Date.parse('2018-11-28T21:10:10');

// функция добавления нуля к числу от 0 до 9
function addZero (num, elem) {
    if (num < 10) {
        elem.html('0' + num);
    } else {
        elem.html(num);
    }
}

function clock (to) {
    var now = Date.now();
    var remaining = Math.round((to - now)/1000);
    if (remaining > 0) {
        var howDays = Math.floor(remaining / 86400);
        var howHours = Math.floor((remaining % 86400) / 3600);
        var howMinutes = Math.floor((remaining % 3600) / 60);
        var howSec = (remaining % 3600) - howMinutes*60;

        addZero(howDays, $('#days'));
        addZero(howHours, $('#hours'));
        addZero(howMinutes, $('#minutes'));
        addZero(howSec, $('#seconds'));
        return true;
    } else {
        $('#days').html('00');
        $('#hours').html('00');
        $('#minutes').html('00');
        $('#seconds').html('00');
        return false;
    }
}

clock(to);
var timerId = setInterval(function () {
    if (!clock(to)) clearInterval(timerId);
}, 1000);


// ====================================
// Модальные окна

$('#modal-header').on('click', function () {
    $('#name').css('border-color', 'silver');
    $('#tel').css('border-color', 'silver');
});

$('#application').on('click', function () {
    var flag = true;

    if ($('#name').val().trim() == '') {
        $('#name').css('border-color', 'red');
        setTimeout("$('#name').css('border-color', 'silver')", 5000);
        flag = false;
    } else {
        $('#name').css('border-color', 'silver');
    }

    if ($('#tel').val().trim() == '') {
        $('#tel').css('border-color', 'red');
        setTimeout("$('#tel').css('border-color', 'silver')", 5000);
        flag = false;
    } else {
        $('#tel').css('border-color', 'silver');
    }

    if(flag) {
        $('#modal').modal("hide");
        $('#modal').on('hidden.bs.modal', function() {
            if (flag === true) $('#modal-success').modal();
            $('#name').val('');
            $('#tel').val('');
            flag = false;
        });
    }
});

// функция "отправить заявку" не из модального окна

function application(name, tel, email, submit) {
    $(submit).on('click', function () {
        $(name).css('border-color', 'silver');
        var flag = true;

        if ($(name).val().trim() == '') {
            $(name).css('border-color', 'red');
            flag = false;
        } else {
            $(name).css('border-color', 'silver');
        }

        if ($(tel).val().trim() == '') {
            $(tel).css('border-color', 'red');
            flag = false;
        } else {
            $(tel).css('border-color', 'silver');
        }

        if ( $(email).val().trim() != '' && !($(email).val().match(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i))) {
            $(email).css('border-color', 'red');
            flag = false;
        } else {
            $(email).css('border-color', 'silver');
        }

        if(flag) {
            $('#modal-success').modal();
            $(name).val('');
            $(tel).val('');
            $(email).val('');
        }
    });
}

application($('#aside-name'), $('#aside-tel'), $('#aside-email'), $('#aside-application'));

$('#aside-application').on('click', function () {
    setTimeout("$('#aside-name').css('border-color', 'silver')", 5000);
    setTimeout("$('#aside-tel').css('border-color', 'silver')", 5000);
    setTimeout("$('#aside-email').css('border-color', 'silver')", 5000);
});