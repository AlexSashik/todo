function myAjax () {
    var text = $("#text").val();
    if (text !== undefined) {
        if (text.trim() == '') {
            $('#text').focus();
            alert('Вы не ввели сообщение');
        } else {
            $('#text').val('');
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

function usersList(id) {
    if (id === undefined) id = -1;
    $.ajax({
        url: '/chat/ajax?ajax',
        type: "POST",
        cache: false,
        data: {
            'query': 'usersList',
            'id'   : id
        },
        dataType: 'json',
        timeout: 15000,
        beforeSend : function () {
            $('#backToChat').css('display', 'none');
            $('#refreshList').css('display', 'none');
            $("#loading").css('display', 'block');
            $(".group > p").remove();
            $(".group").css('display', 'none');
        },
        success: function (resp) {
            $('#backToChat').css('display', 'block');
            $('#refreshList').css('display', 'block');
            var i;
            $("#loading").css('display', 'none');
            if (resp.admin !== undefined) {
                for (i = 0; i < resp.admin.length; i++) {
                    $("#admins").append('<p><span class="span-for-name">' + resp.admin[i] + '</span></p>');
                }
                $("#admins").css('display', 'block');
            }
            if (resp.online !== undefined) {
                for (i = 0; i < resp.online.length; i++) {
                    if (resp.status !== undefined) {
                        $("#online").append(
                            '<p>' +
                                '<span class="span-for-name">' + resp.online[i].login + '</span> ' +
                                '<span class="span-for-ban" data-id="' + resp.online[i].id + '">(забанить)</span>' +
                            '</p>'
                        );
                    } else {
                        $("#online").append('<p><span class="span-for-name">' + resp.online[i].login + '</span></p>');
                    }
                }
                $("#online").css('display', 'block');
            }
            if (resp.offline !== undefined) {
                for (i = 0; i < resp.offline.length; i++) {
                    if (resp.status !== undefined) {
                        $("#offline").append(
                            '<p>' +
                                '<span class="span-for-name">' + resp.offline[i].login + '</span> ' +
                                '<span class="span-for-ban" data-id="' + resp.offline[i].id + '">(забанить)</span>' +
                            '</p>'
                        );
                    } else {
                        $("#offline").append('<p><span class="span-for-name">' + resp.offline[i].login + '</span></p>');
                    }
                }
                $("#offline").css('display', 'block');
            }
            if (resp.ban !== undefined) {
                for (i = 0; i < resp.ban.length; i++) {
                    if (resp.status !== undefined) {
                        $("#ban").append(
                            '<p>' +
                                '<span class="span-for-name">' + resp.ban[i].login + '</span> ' +
                                '<span class="span-for-ban" data-id="'+resp.ban[i].id+'">(разбанить)</span>' +
                            '</p>'
                        );
                    } else {
                        $("#ban").append('<p><span class="span-for-name">' + resp.ban[i].login + '</span></p>');
                    }
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

// по нажатию на enter происходит отправка сообщения (и скрытие панели смайликов)
$(document).keydown(function(event){
    if (event.which == 13) {
        // очищаем textarea от enter-ов
        if(event.preventDefault) {
            event.preventDefault();
        }
        $('.smiles').css('display', 'none');
        $('#show-smiles').css('backgroundColor', '#FAF9FA');
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

$('#online').on('click', '.span-for-name', function() {
    $(".group > p").remove();
    $(".group").css('display', 'none');
    $('#chat-list').css('display', 'none');
    $('#chat-body').css('display', 'block');
    $('#text').val($(this).text() + ', ');
    $('#text').focus();
});

// обновление списка пользователей
$('#refreshList').on('click', function () {
    usersList();
});

//модерация пользователей
$('.group').on('click', '.span-for-ban', function() {
    if ($(this).attr('data-id') !== undefined) {
        usersList($(this).attr('data-id'));
    }
});

// появление и скрытие панели смайликов
$('#show-smiles').on('click', function () {
   if ($('.smiles').css('display') == 'none') {
       $('.smiles').css('display', 'block');
       $(this).css('backgroundColor', '#F2EFF5');
   } else {
       $('.smiles').css('display', 'none');
       $(this).css('backgroundColor', '#FAF9FA');
   }
});

$(document).click(function(event) {
    if ($(event.target).closest(".smiles").length || $(event.target).closest("#show-smiles").length || $(event.target).closest("#text").length) return;
    $('.smiles').css('display', 'none');
    $('#show-smiles').css('backgroundColor', '#FAF9FA');
});

//добавление смайла в текст
$('.smile').on('click', function () {
    $('#text').val($('#text').val() + $(this).attr('data-smile'));
    $('#text').focus();
});

//обновление чата
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