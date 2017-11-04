// таймер

var to =  Date.parse('2018-02-01T00:00:00'), timerId, timerIdFooter;

// функция добавления нуля к числу от 0 до 9
function addZero (num, elem) {
    if (num < 10) {
        elem.html('0' + num);
    } else {
        elem.html(num);
    }
}

function clock (to, days, hours, minutes, seconds) {
    var remaining = Math.round((to - Date.now())/1000), howDays, howHours, howMinutes, howSec;
    if (remaining > 0) {
        howDays = Math.floor(remaining / 86400),
        howHours = Math.floor((remaining % 86400) / 3600),
        howMinutes = Math.floor((remaining % 3600) / 60),
        howSec = (remaining % 3600) - howMinutes*60;

        addZero(howDays, days);
        addZero(howHours, hours);
        addZero(howMinutes, minutes);
        addZero(howSec, seconds);
        return true;
    } else {
        days.html('00');
        hours.html('00');
        minutes.html('00');
        seconds.html('00');
        return false;
    }
}

clock(to, $('#days'), $('#hours'), $('#minutes'), $('#seconds'));
clock(to, $('#footer-days'), $('#footer-hours'), $('#footer-minutes'), $('#footer-seconds'));
timerId = setInterval(function () {
    if (!clock(to,$('#days'),$('#hours'),$('#minutes'),$('#seconds'))) clearInterval(timerId);
}, 1000);
timerIdFooter = setInterval(function () {
    if (!clock(to, $('#footer-days'), $('#footer-hours'), $('#footer-minutes'), $('#footer-seconds'))) clearInterval(timerIdFooter);
}, 1000);


// ====================================
// Модальные окна

$('#modal-header').on('click', function () {
    $('#name').css('border-color', 'silver');
    $('#tel').css('border-color', 'silver');
});
$('#modal-footer').on('click', function () {
    $('#name').css('border-color', 'silver');
    $('#tel').css('border-color', 'silver');
});

$('#application').on('click', function () {
    var flag = true;

    if ($('#name').val().trim() === '') {
        $('#name').css('border-color', 'red');
        setTimeout("$('#name').css('border-color', 'silver')", 5000);
        flag = false;
    } else {
        $('#name').css('border-color', 'silver');
    }

    if ($('#tel').val().trim() === '') {
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

function application(name, tel, submit, email) {
    $(submit).on('click', function () {
        $(name).css('border-color', 'silver');
        var flag = true;

        if (name.val().trim() === '') {
            name.css('border-color', 'red');
            flag = false;
        } else {
            name.css('border-color', 'silver');
        }

        if (tel.val().trim() === '') {
            tel.css('border-color', 'red');
            flag = false;
        } else {
            tel.css('border-color', 'silver');
        }
        if (email !== undefined) {
            if ( email.val().trim() !== '' && !(email.val().match(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i))) {
                email.css('border-color', 'red');
                flag = false;
            } else {
                email.css('border-color', 'silver');
            }
        }

        if(flag) {
            $('#modal-success').modal();
            name.val('');
            tel.val('');
            if (email !== undefined) {
                email.val('');
            }
        }
    });
}

application($('#aside-name'), $('#aside-tel'), $('#aside-application'), $('#aside-email'));
application($('#footer-name'), $('#footer-tel'), $('#footer-application'));

$('#aside-application').on('click', function () {
    setTimeout("$('#aside-name').css('border-color', 'silver')", 5000);
    setTimeout("$('#aside-tel').css('border-color', 'silver')", 5000);
    setTimeout("$('#aside-email').css('border-color', 'silver')", 5000);
});

$('#footer-application').on('click', function () {
    setTimeout("$('#footer-name').css('border-color', 'silver')", 5000);
    setTimeout("$('#footer-tel').css('border-color', 'silver')", 5000);
});

// ===============================================================================
// Ускорение загрузки youtube роликов

function r(f){/in/.test(document.readyState)?setTimeout('r('+f+')',9):f()}
r(function(){
    var videos, nb_videos, i, play;
    if (!document.getElementsByClassName) {
        // Поддержка IE8
        var a, re, els, getElementsByClassName = function(node, classname) {
            a = [];
            re = new RegExp('(^| )'+classname+'( |$)');
            els = node.getElementsByTagName("*");
            for(var i=0,j=els.length; i<j; i++)
                if(re.test(els[i].className))a.push(els[i]);
            return a;
        };
        videos = getElementsByClassName(document.body,"youtube");
    } else {
        videos = document.getElementsByClassName("youtube");
    }

    nb_videos = videos.length;
    for (i=0; i<nb_videos; i++) {
        // Находим постер для видео, зная ID нашего видео
        videos[i].style.backgroundImage = 'url(http://i.ytimg.com/vi/' + videos[i].id + '/sddefault.jpg)';

        // Размещаем над постером кнопку Play, чтобы создать эффект плеера
        play = document.createElement("div");
        play.setAttribute("class","play");
        videos[i].appendChild(play);

        videos[i].onclick = function() {
            // Создаем iFrame и сразу начинаем проигрывать видео, т.е. атрибут autoplay у видео в значении 1
            var iframe = document.createElement("iframe"),
            iframe_url = "https://www.youtube.com/embed/" + this.id + "?autoplay=1&autohide=1&rel=0&amp;showinfo=0";
            if (this.getAttribute("data-params")) iframe_url+='&'+this.getAttribute("data-params");
            iframe.setAttribute("src",iframe_url);
            iframe.setAttribute("frameborder",'0');

            // Высота и ширина iFrame будет как у элемента-родителя
            iframe.style.width  = this.style.width;
            iframe.style.height = this.style.height;

            // Заменяем начальное изображение (постер) на iFrame
            this.parentNode.replaceChild(iframe, this);
        }
    }
});