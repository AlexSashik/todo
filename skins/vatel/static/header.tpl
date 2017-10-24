<header>
    <div class="container">
         <div class="left">
             <a href="/vatel"><img src="/img/vatel/logo.png" alt=""></a>
             <h1>Музыкальный коллектив на праздник в Москве и МО</h1>
         </div>
         <div class="right">
             <button data-toggle="modal" data-target="#modal">
                 Закажите звонок
             </button>
             <div class="tel">
                 <p>+7 (495) 760-96-50</p>
                 <p>+7 (926) 586-80-03</p>
             </div>
         </div>
    </div>
</header>

<div id="modal" class="modal fade" tabindex="-1">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body">
                <p class="text-center">Отправьте заявку и мы обязательно Вам перезвоним</p>
                <form action="" method="post" class="text-center"  onsubmit="return false;">
                    <div class="name text-left">
                        <label for="name">Ваше имя* </label>
                        <input id="name" type="text" required>
                    </div>
                    <div class="tel text-left">
                        <label for="tel">Ваш телефон* </label>
                        <input id="tel" type="text" required>
                    </div>
                    <input type="submit" value="оставить заявку" id="application">
                </form>
            </div>
        </div>
    </div>
</div>

<div id="modal-success" class="modal fade" tabindex="-1">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body">
                <div class="text-center thanks">СПАСИБО ЗА ЗАЯВКУ!</div>
                <div class="text-center info">Наш менеджер перезвонит Вам в ближайшее время.</div>
            </div>
        </div>
    </div>
</div>

<!--<script defer>-->
<!--    $(document).ready(function() {-->
<!--        $('#modal-success').modal();-->
<!--    });-->
<!--</script>-->