// таймер





$('#modal-header').on('click', function () {
    $('#name').css('border-color', 'silver');
    $('#tel').css('border-color', 'silver');
});

$('#application').on('click', function () {
    var flag = true;

    if ($('#name').val().trim() == '') {
        $('#name').css('border-color', 'red');
        flag = false;
    } else {
        $('#name').css('border-color', 'silver');
    }

    if ($('#tel').val().trim() == '') {
        $('#tel').css('border-color', 'red');
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