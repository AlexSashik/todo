<div class="main">
	<div class="main_header">
		Добавление новой книги
	</div>
	<form method="post" enctype="multipart/form-data">

        <label for="auth2">
            <span id="show_help">Авторы</span> (для выбора нескольких удерживайте кнопку Ctrl):
        </label>
        <select id="auth2" name="auth[]" multiple
            <?php
            if (isset($err['auth']))  echo 'class="red_border"';
            ?>>
            <?php
            while($row = $res->fetch_assoc()) {
                if (isset($_POST['auth']) && in_array($row['id'], $_POST['auth']) ) {
                    echo '<option selected value="'.(int)$row['id'].'">'.htmlspecialchars($row['name']).'</option>';
                } else {
                    echo '<option value="'.(int)$row['id'].'">'.htmlspecialchars($row['name']).'</option>';
                }
            }
            ?>
        </select>
        <?php if (isset($err['auth'])) echo '<span class="red_color">'.$err['auth'].'</span>' ?>
        <div id="help">
            <img alt="" src="/img/admin/info.png">
            <div class="info_text">
                <p>Добавление новых авторов</p>
                Для добавления новых авторов перейдите на вкладку "авторы" в меню навигации страницы, либо щелкните
                <a href="/admin/authors/add">здесь.</a>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>

		<label for="name">Название книги:</label>
		<input type="text" id="name" name="name"
        <?php
        if (isset($_POST['name'])) echo 'value="'.htmlspecialchars($_POST['name']).'"';
        if (isset($err['name']))   echo 'class="red_border"';
        ?>>
        <?php if (isset($err['name'])) echo '<span class="red_color">'.$err['name'].'</span>' ?>
		<div class="clear"></div>

      	<label for="year">Год издания:</label>
        <select id="year" name="year[]"
        <?php
        if (isset($err['year']))  echo 'class="red_border"';
        ?>>
            <option value="empty"></option>
            <?php
            if (isset($_POST['year'][0])) {
                for ($i = 1900; $i <= (int)date("Y"); $i++) {
                    if ($_POST['year'][0] == $i) {
                        echo '<option selected value="'.$i.'">'.$i.'</option>';
                    } else {
                        echo '<option value="'.$i.'">'.$i.'</option>';
                    }
                }
            } else {
                for ($i = 1900; $i <= (int)date("Y"); $i++) {
                    echo '<option value="' . $i . '">' . $i . '</option>';
                }
            }
            ?>
        </select>
		<div class="clear"></div>

		<label for="text">Описание книги:</label>
		<textarea id="text" name="text"
        <?php
        if (isset($err['text'])) echo 'class="red_border"';
        ?>><?php if(isset($_POST['text'])) echo htmlspecialchars($_POST['text']);?></textarea>
        <?php if (isset($err['text'])) echo '<span class="red_color">'.$err['text'].'</span>' ?>
        <div class="clear"></div>

		<label for="picture">Прикрепите фото книги:</label>
		<input type="file" id="picture" name="picture" <?php if (isset($err['picture'])) echo 'class="red_border"';?>>
		<div class="clear"></div>
		<?php if (isset($err['picture'])) echo '<label class="red_color">'.$err['picture'].'</label><div class="clear"></div>';?>
		
		<a href="/admin/books" class="cancel"><i class="fa fa-ban" aria-hidden="true"></i>Отмена</a>
		<button type="submit" class="add"><i class="fa fa-plus-circle" aria-hidden="true"></i>Добавить</button>
		<div class="clear"></div>
		
	</form>
</div>