<div class="main_cab">
    <h2>ВХОД В АДМИНКУ</h2>
    <form method="post" class="form_enter">
        <div class="reg_header">
            <input placeholder="Логин" class="logpas" type="text" name="login" <?php if (isset($_POST['login'])) echo 'value="'.htmlspecialchars($_POST['login']).'"';?> required>
            <div class="clear"></div>

            <input placeholder="Пароль" class="logpas" type="password" name="pass" <?php if (isset($_POST['pass'])) echo 'value="'.htmlspecialchars($_POST['pass']).'"';?> required>
            <div class="clear"></div>

        </div>
        <div class="reg_footer">
            <input class="submit" type="submit" name="reg" value="ВОЙТИ">
        </div>
    </form>
    <div class="footer">
        <div>НА ГЛАВНУЮ:</div>
        <a href="/" class="img"></a>
</div>
<?php
if (isset($errors['active_err'])) { ?>
    <div id="info_back"></div>
    <div id="info_text">
        <div class="info_header"><?php echo $errors['active_err']['header']; ?></div>
        <div class="info_main">
            <img src="<?php echo $errors['active_err']['img']; ?>" alt="">
            <div><?php echo $errors['active_err']['text']; ?></div>
        </div>
        <div id="info_close">OK</div>
    </div>
    <?php
}

if (isset($error)) {
    ?>
    <div id="info_err">
        <div id="info_err_close"> </div>
        <div class="clear"></div>
        <div class="content">
            <div class="img"> </div>
            <div class="text"><?php echo $error; ?></div>
        </div>
    </div>
<?php
}
?>