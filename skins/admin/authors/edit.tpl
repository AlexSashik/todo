<div class="main">
	<div class="main_header">
		Редактирование автора
	</div>
	<form method="post" enctype="multipart/form-data">
		<label for="name">Имя и фамилия (полностью, через пробел)</label>
		<input type="text" id="name" name="name"
            <?php
            echo 'value="'.htmlspecialchars($row['name']).'"';
            if (isset($err['name'])) echo 'class="red_border"';
            ?>>
		<?php if (isset($err['name'])) echo '<span class="red_color">'.$err['name'].'</span>';?>
        <div class="clear"></div>

        <label for="yob">Год рождения:</label>
        <input type="text" id="yob" name="yob"
            <?php
            echo 'value="'.htmlspecialchars($row['yob']).'"';
            if (isset($err['yob']))   echo 'class="red_border"';
            ?>>
        <?php if (isset($err['yob'])) echo '<span class="red_color">'.$err['yob'].'</span>' ?>
        <div class="clear"></div>

        <label for="yod">Год смерти:</label>
        <input type="text" id="yod" name="yod"
            <?php
           echo 'value="'.htmlspecialchars($row['yod']).'"';
            if (isset($err['yod']))   echo 'class="red_border"';
            ?>>
        <?php if (isset($err['yod'])) echo '<span class="red_color">'.$err['yod'].'</span>' ?>
        <div class="clear"></div>
		
		<label>Текущее фото:</label>
		<img src="/img/default/authors/100x100/<?php echo htmlspecialchars($row['img_name']);?>">
		<div class="clear"></div>
		
		<label for="picture">Изменить фото:</label>
		<input type="file" id="picture" name="picture" <?php if (isset($err['picture'])) echo 'class="red_border"';?>>
		<div class="clear"></div>
		<?php if (isset($err['picture'])) echo '<span class="red_color">'.$err['picture'].'</span>	<div class="clear"></div>';?>
		
		<a href="/admin/authors" class="cancel"><i class="fa fa-ban" aria-hidden="true"></i>Отмена</a>
		<button type="submit" class="add"><i class="fa fa-plus-circle" aria-hidden="true"></i>Редактировать</button>
		<div class="clear"></div>
	</form>
</div>