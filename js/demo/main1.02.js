// animation - маркер, идет ли анимация; id - номер фото (значения: 0, 1, 2)
var delta, animation, id = 0;
if (document.documentElement.clientWidth > 995) {
    delta = 939;
} else if (document.documentElement.clientWidth > 767) {
    delta = 750;
} else if (document.documentElement.clientWidth > 479) {
    delta = 402;
} else {
    delta = 279.5;
}

$(window).resize(function() {
    $('#galery').stop();
    if (document.documentElement.clientWidth > 995) {
        delta = 939;
    } else if (document.documentElement.clientWidth > 767) {
        delta = 750;
    } else if (document.documentElement.clientWidth > 479) {
        delta = 402;
    } else {
        delta = 279.5;
    }
    $('#galery').css('backgroundPositionX', -id*delta);
});

var intervalID = setInterval(function () {
    animation = true;
    $('#galery').animate({ backgroundPosition: parseFloat($('#galery').css('backgroundPositionX')) - delta}, 500);
    setTimeout("animation = false", 500);
    id = (id + 4)%3;
    if (Math.abs(parseFloat($('#galery').css('backgroundPositionX'))) >= delta*3) {
        $('#galery').stop();
        setTimeout("$('#galery').css('backgroundPositionX', '0')", 500);
    }
}, 3000);

// картинка налево
$("#prev").on('click', function () {
    clearInterval(intervalID);
    if (!animation) {
        if (Math.abs(parseFloat($('#galery').css('backgroundPositionX'))) >= delta*3) {
            $('#galery').css('backgroundPositionX', '0');
        }
        animation = true;
        $('#galery').animate({ backgroundPosition: parseFloat($("#galery").css('backgroundPositionX')) + delta}, 500);
        setTimeout("animation = false", 500);
        id = (id + 5)%3;
    }
});

// картинка направо
$("#next").on('click', function () {
    clearInterval(intervalID);
    if (!animation) {
        if (Math.abs(parseFloat($('#galery').css('backgroundPositionX'))) >= delta*3) {
            $('#galery').css('backgroundPositionX', '0');
        }
        animation = true;
        $('#galery').animate({ backgroundPosition: parseFloat($("#galery").css('backgroundPositionX')) - delta}, 500);
        setTimeout("animation = false", 500);
        id = (id + 4)%3;
    }
});