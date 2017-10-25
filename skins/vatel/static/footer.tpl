<footer>
    <div class="container">
        Футер
    </div>
</footer>

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