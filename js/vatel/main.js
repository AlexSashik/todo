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