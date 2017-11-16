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
            $.ajax ({
                url   : '/chat/ajax?ajax',
                type  : "POST",
                cache : false,
                data  : {
                    'text' : text
                },
                dataType : 'json',
                timeout : 15000,
                success : function(response) {
                    alert('success');
                },
                error   : function (x, t) {
                    if (t === "timeout") {
                        alert ('Ожидание ответа с сервера слишком велико');
                    } else {
                        alert ('При отправке запроса возникли какие-то проблемы');
                    }
                }
            });
        }
    }

}