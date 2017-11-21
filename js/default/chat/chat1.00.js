function myAjax () {
    var text = $("#text").val();
    if (text !== undefined) {
        if (text.trim() == '') {
            $('#text').focus();
            alert('Вы не ввели сообщение');
        } else {
            $('#text').val('');
            // очищаем textarea от enter-ов
            if(event.preventDefault) {
                event.preventDefault();
            }
            $.ajax({
                url: '/chat/ajax?ajax',
                type: "POST",
                cache: false,
                data: {
                    'text': text
                },
                dataType: 'json',
                timeout: 15000,
                success: function (resp) {
                    if (resp.err !== undefined) {
                        if (resp.err == 'NO') {
                            alert('Вы не авторизованы!');
                        } else {
                            alert('Вы забанены администратором сайта и не можете участвовать в чате.');
                        }
                    } else {
                        var p = document.createElement('p');
                        p.innerHTML = "<strong><em>" + resp.login + "</em></strong>: " + resp.text;
                        chatSpace.appendChild(p);
                        //прокрутка скролла вниз
                        chatSpace.scrollTop = chatSpace.scrollHeight;
                    }
                },
                error: function (x, t) {
                    if (t === "timeout") {
                        alert('Ожидание ответа с сервера слишком велико');
                    } else {
                        alert('При отправке запроса возникли какие-то проблемы');
                    }
                }
            });
        }
    }
}

function usersList() {
    $.ajax({
        url: '/chat/ajax?ajax',
        type: "POST",
        cache: false,
        data: {
            'query': 'usersList'
        },
        dataType: 'json',
        timeout: 15000,
        beforeSend : function () {
            $('#backToChat').css('display', 'none');
            $("#loading").css('display', 'block');
        },
        success: function (resp) {
            $('#backToChat').css('display', 'block');
            var i;
            $("#loading").css('display', 'none');
            if (resp.admin !== undefined) {
                for (i = 0; i < resp.admin.length; i++) {
                    $("#admins").append('<p>' + resp.admin[i] + '</p>');
                }
                $("#admins").css('display', 'block');
            }
            if (resp.online !== undefined) {
                for (i = 0; i < resp.online.length; i++) {
                    $("#online").append('<p>' + resp.online[i] + '</p>');
                }
                $("#online").css('display', 'block');
            }
            if (resp.offline !== undefined) {
                for (i = 0; i < resp.offline.length; i++) {
                    $("#offline").append('<p>' + resp.offline[i] + '</p>');
                }
                $("#offline").css('display', 'block');
            }
            if (resp.ban !== undefined) {
                for (i = 0; i < resp.ban.length; i++) {
                    $("#ban").append('<p>' + resp.ban[i] + '</p>');
                }
                $("#ban").css('display', 'block');
            }
        }
    });
}

// стилизация скролла
$(document).ready (function () {
    $('.main-chat').niceScroll();
    $('.chat-list-main').niceScroll();
});

// по нажатию на enter происходит отправка сообщения
$(document).keydown(function(event){
    if (event.which == 13) {
        // очищаем textarea от enter-ов
        if(event.preventDefault) {
            event.preventDefault();
        }
        myAjax ();
    }
});

// переключатель режима "чат - список пользователей"
$('#users').on('click', function () {
    $('#chat-body').css('display', 'none');
    $('#chat-list').css('display', 'block');
});

$('#backToChat').on('click', function () {
    $(".group > p").remove();
    $(".group").css('display', 'none');
    $('#chat-list').css('display', 'none');
    $('#chat-body').css('display', 'block');
});

// Именная приставка из чата и из спискоа онлайн соответственно
$('#chatSpace').on('click', 'em', function() {
    $('#text').val($(this).text() + ', ');
    $('#text').focus();
});

$('#online').on('click', 'p', function() {
    $(".group > p").remove();
    $(".group").css('display', 'none');
    $('#chat-list').css('display', 'none');
    $('#chat-body').css('display', 'block');
    $('#text').val($(this).text() + ', ');
    $('#text').focus();
});

setInterval(function() {
    $.ajax({
        url: '/chat/ajax?ajax',
        type: "POST",
        cache: false,
        data: {
            'query': 'chat'
        },
        dataType: 'json',
        timeout: 15000,
        success: function (resp) {
            if (resp.login !== undefined && resp.login.length > 0) {
                for (var i = 0; i < resp.login.length; i++) {
                    var p = document.createElement('p');
                    if (resp.forme !== undefined) {
                        p.className = "for-me";
                    }
                    p.innerHTML = "<strong><em>" + resp.login[i] + "</em></strong>: " + resp.text[i];
                    chatSpace.appendChild(p);
                    //прокрутка скролла вниз
                    chatSpace.scrollTop = chatSpace.scrollHeight;
                }
            }
        }
    });
}, 3000);