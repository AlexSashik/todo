<main class="main container">
    <h2>АДМИНКА</h2>
    <p>
        Добро пожаловать в админку сайта <a href="/" target="_blank">http://todo.kh.ua</a>! В данном разделе Вы можете управлять контентом сайта.
        Среди прочего, имеется возможность добавления, редактирования и удаления соответствующих элементов таких
        разделов, как:
    </p>
    <ul>
        <li>товары;</li>
        <li>пользователи;</li>
        <li>книги;</li>
        <li>авторы книг.</li>
    </ul>
    <p>
       Раздел "Комментарии" доступен для редактирования из основной части сайта и поэтому не был вынесен отдельно в
       панель администратора.
    </p>
    <p>
       Перейти на указанные страницы можно воспользовавшись навигационной панелью в верхней части админки. Результат
       внесенных изменений всегда можно посмотреть на сайте, щелкнув на кнопку "Просмотр сайта" в правом верхнем углу
       навигационной панели.
    </p>
    <p>
       Покинуть админ панель можно нажав на кнопку "Exit" в правом верхнем углу станицы. При этом Вы останетесь
        авторизованным пользователем.
    </p>
</main>

<?php if (isset($info['success_autoriz'])) { ?>
    <div id="modal" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-success panel-heading">
                    <button class="close" data-dismiss="modal">x</button>
                    <h4 class="modal-title text-center">Вход в админ панель выполнен</h4>
                </div>
                <div class="modal-body">
                    <p>
                        Добро пожаловать, <?php echo htmlspecialchars($_SESSION['user']['login']);?>! Вам предоставлен доступ
                        к панели администратора сайта <a class="animate" href="/" target="_blank">todo.kh.ua</a>
                    </p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-success" data-dismiss="modal">Закрыть</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('#modal').modal();
    </script>
    <?php
}
?>