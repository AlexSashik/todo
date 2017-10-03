<div class="main">
    <form method="post" enctype="multipart/form-data">
        <input type="file" name="file"><br>
        <input type="submit" name="submit" value="Загрузить фото"><br>
        <?php if (isset($err)) echo '<b>'.htmlspecialchars($err).'</b>'; ?>
    </form>
</div>

<!-- HTML письмо -->
<div style="max-width: 600px; text-align: center; font-family: Verdana, Geneva, sans-serif; margin: auto; padding:0; line-height: 1.5; font-size: 16px; border: 1px solid #E6E6E6;">

<div role="banner" style="padding: 20px 0; border-bottom: 5px solid #72A9D0;">
<img src="http://todo.kh.ua/img/default/logo.png" alt="IT Ideas" border="0" width="317" height="81" style="display:inline-block;"/>
</div>

<div role="main" style="padding: 20px 0;">
<b style="font-size: 22px;">Здравствуйте, Имя.</b><br><br>
Добро пожаловать на <a href="#" target="_blank" style="color: #267f00 !important; text-decoration: underline;"><span style="color: #267f00;">todo.kh.ua</span></a>!<br><br>
<b>Данные для входа на сайт </b><a href="#" target="_blank" style="color: #267f00 !important; text-decoration: underline;"><span style="color: #267f00;">todo.kh.ua</span></a>:<br>
<table border="0" cellpadding="0" cellspacing="0" style="margin:auto; padding:0; text-align: left; line-height: 1;">
<tr>
<td style="padding: 0 5px;">Логин:</td>
<td style="padding: 0 5px;">ЛОГИН</td>
</tr>
<tr>
<td style="padding: 0 5px;">Пароль:</td>
<td style="padding: 0 5px;">123</td>
</tr>
</table><br><br>
Нажмите на кнопку ниже для подтверждения Вашего E-mail адреса<br>
<a href="#" target="_blank" style="display: inline-block; text-decoration: none; margin: 10px auto; background-color: #50AED2; padding: 15px 10px; color: #FFFFFF; border-radius: 5px;"><span style="color: #FFFFFF;">АКТИВИРОВАТЬ АККАУНТ</span></a><br>
С уважением,<br>
команда <a href="#" target="_blank" style="color: #267f00 !important; text-decoration: underline;"><span style="color: #267f00;">todo.kh.ua</span></a>.
</div>

<div role="footer" style="background-color: #363535; color: #FFFFFF; font-size: 12px; padding: 10px 20px;">
&copy; <?php echo date('Y');?> <a href="#" target="_blank" style="color: #FFFFFF !important; text-decoration: none;"><span style="color: #FFFFFF;">todo.kh.ua</span></a>
</div>

</div>