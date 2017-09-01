<div class="main_cab">
    <h2>ВХОД В АДМИНКУ</h2>
    <form method="post" class="form_enter">
        <div class="reg_header">
            <label for="login">Логин</label>
            <input id="login" class="lep" type="text" name="login" <?php if (isset($_POST['login'])) echo 'value="'.htmlspecialchars($_POST['login']).'"';?> required>
            <?php
            if (isset($errors['login_err'])) {
                if ($errors['login_err'] === false) {
                    echo '<div class="info_success"><i class="fa fa-check" aria-hidden="true"></i>Логин принят</div>';
                } else {
                    echo '<div class="info_err"><i class="fa fa-times" aria-hidden="true"></i>'.$errors['login_err'].'</div>';
                }
            }
            ?>
            <div class="clear"></div>

            <label for="pass">Пароль</label>
            <input id="pass" class="lep" type="password" name="pass" <?php if (isset($_POST['pass'])) echo 'value="'.htmlspecialchars($_POST['pass']).'"';?> required>
            <?php
            if (isset($errors['pass_err'])) {
                echo '<div class="info_err"><i class="fa fa-times" aria-hidden="true"></i>'.$errors['pass_err'].'</div>';
            }
            ?>
            <div class="clear"></div>

            <label for="remember">Запомнить меня?</label>
            <input id="remember" class="remember" type="checkbox" name="remember[]">
            <div class="clear"></div>
        </div>
        <div class="reg_footer">
            <input class="submit" type="submit" name="reg" value="Авторизоваться">
            <a href="/">На главную</a>
        </div>

    </form>

    <?php if (isset($activation)) { ?>
        <div id="info_back"></div>
        <div id="info_text">
            <div class="info_header">Завершение регистрации</div>
            <div class="info_main">
                <img src="/img/admin/goods/<?php if($activation) echo 'check-icon.png'; else echo 'attantion.png';?>" alt="">
                <?php
                if($activation) {
                    echo '<p>Активация Вашего аккаунта прошла успешно. Для входа на сайт заполните поля авторизации.</p>';
                } else {
                    echo '<p>Вы перешли по несуществующей ссылке. Активация Вашего аккаунта не завершена!</p>';
                }
                ?>
                <div id="info_close">OK</div>
            </div>
        </div>
        <?php
    }
    if (isset($errors['active_err'])) { ?>
    <div id="info_back"></div>
    <div id="info_text">
        <div class="info_header"><?php echo $errors['active_err']['header']; ?></div>
        <div class="info_main">
            <img src="<?php echo $errors['active_err']['img']; ?>" alt="">
            <p><?php echo $errors['active_err']['text']; ?></p>
            <div id="info_close">OK</div>
        </div>
    </div>
    <?php
    }
    ?>
</div>