<div class="main">
	<div class="main_header">
		Добавление нового автора
	</div>
	<form method="post" enctype="multipart/form-data">

		<div class="clear"></div>
		<label for="name">Имя и фамилия автора (полностью, через пробел)</label>
		<input type="text" id="name" name="name"
        <?php
        if (isset($_POST['name'])) echo 'value="'.htmlspecialchars($_POST['name']).'"';
        if (isset($err['name']))   echo 'class="red_border"';
        ?>>
        <?php if (isset($err['name'])) echo '<span class="red_color">'.$err['name'].'</span>' ?>
		<div class="clear"></div>

        <label for="yob">Год рождения:</label>
        <input type="text" id="yob" name="yob"
        <?php
        if (isset($_POST['yob'])) echo 'value="'.htmlspecialchars($_POST['yob']).'"';
        if (isset($err['yob']))   echo 'class="red_border"';
        ?>>
        <?php if (isset($err['yob'])) echo '<span class="red_color">'.$err['yob'].'</span>' ?>
        <div class="clear"></div>

      	<label for="yod">Год смерти:</label>
        <input type="text" id="yod" name="yod"
            <?php
            if (isset($_POST['yod'])) echo 'value="'.htmlspecialchars($_POST['yod']).'"';
            if (isset($err['yod']))   echo 'class="red_border"';
            ?>>
        <?php if (isset($err['yod'])) echo '<span class="red_color">'.$err['yod'].'</span>' ?>
		<div class="clear"></div>

		<label for="picture">Фото автора:</label>
		<input type="file" id="picture" name="picture" <?php if (isset($err['picture'])) echo 'class="red_border"';?>>
		<div class="clear"></div>
		<?php if (isset($err['picture'])) echo '<label class="red_color">'.$err['picture'].'</label><div class="clear"></div>';?>
		
		<a href="/admin/authors" class="cancel"><i class="fa fa-ban" aria-hidden="true"></i>Отмена</a>
		<button type="submit" class="add"><i class="fa fa-plus-circle" aria-hidden="true"></i>Добавить</button>
		<div class="clear"></div>
		
	</form>
</div>