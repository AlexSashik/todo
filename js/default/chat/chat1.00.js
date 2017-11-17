$(document).ready (function () {
    $('.main-chat').niceScroll();
});

function myAjax () {
    var text = $("#text").val();
    if (text !== undefined) {
        if (text.trim() == '') {
            $('#text').focus();
            alert('Вы не ввели сообщение');
        } else {
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
                        $('#text').val('');
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
                    p.innerHTML = "<strong><em>" + resp.login[i] + "</em></strong>: " + resp.text[i];
                    chatSpace.appendChild(p);
                    //прокрутка скролла вниз
                    chatSpace.scrollTop = chatSpace.scrollHeight;
                }
            }
        }
    });
}, 3000);