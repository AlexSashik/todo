<div class="main">
	<div class="main_header">
		Редактирование книги
	</div>
	<form method="post" enctype="multipart/form-data">

        <label for="auth2">
            Изменить <span id="show_help">авторов</span> (для выбора нескольких удерживайте кнопку Ctrl):
        </label>
        <select id="auth2" name="auth[]" multiple
            <?php
            if (isset($err['auth']))  echo 'class="red_border"';
            ?>>
            <?php
            while($row_all_auth = $res_all_auth->fetch_assoc()) {
                if (in_array($row_all_auth['id'], $ids_array) ) {
                    echo '<option selected value="'.(int)$row_all_auth['id'].'">'.htmlspecialchars($row_all_auth['name']).'</option>';
                } else {
                    echo '<option value="'.(int)$row_all_auth['id'].'">'.htmlspecialchars($row_all_auth['name']).'</option>';
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
        <input type="text" id="name" name="name" value="<?php if (isset($row['name'])) echo htmlspecialchars($row['name']);?>"
            <?php
            if (isset($err['name']))   echo 'class="red_border"';
            ?>>
        <?php if (isset($err['name'])) echo '<span class="red_color">'.$err['name'].'</span>'; ?>
        <div class="clear"></div>

        <label for="year">Год издания:</label>
        <select id="year" name="year[]"
            <?php
            if (isset($err['year']))  echo 'class="red_border"';
            ?>>
            <?php
            if (isset($row['year'])) {
                for ($i = 1900; $i <= (int)date("Y"); $i++) {
                    if ($row['year'] == $i) {
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

        <label for="text">Описание товара:</label>
        <textarea id="text" name="text"
            <?php
            if (isset($err['text'])) echo 'class="red_border"';
            ?>><?php if(isset($row['text'])) echo htmlspecialchars($row['text']);?></textarea>
        <?php if (isset($err['text'])) echo '<span class="red_color">'.$err['text'].'</span>'; ?>
        <div class="clear"></div>

        <label>Текущее фото книги:</label>
        <img src="/img/default/books/100x100/<?php echo htmlspecialchars($row['img_name']);?>">
        <div class="clear"></div>

        <label for="picture">Изменить фото книги:</label>
        <input type="file" id="picture" name="picture" <?php if (isset($err['picture'])) echo 'class="red_border"';?>>
        <div class="clear"></div>
        <?php if (isset($err['picture'])) echo '<label class="red_color">'.$err['picture'].'</label>	<div class="clear"></div>';?>

		<a href="/admin/books" class="cancel"><i class="fa fa-ban" aria-hidden="true"></i>Отмена</a>
		<button type="submit" class="add"><i class="fa fa-plus-circle" aria-hidden="true"></i>Редактировать</button>
		<div class="clear"></div>
		
	</form>
</div>

<?php if (isset($info_name)) { ?>
<div id="info_back"></div>
<div id="info_text">
	<div class="info_header"> <?php echo $info_name;?></div>
	<div class="info_main">
		<img src="/img/admin/goods/<?php if($info_type == 'success') echo 'check-icon.png'; else echo 'attantion.png';?>" alt="">
		<p><?php echo $info_text;?></p>
		<div id="info_close">OK</div>
	</div>
</div>
<?php
}
?>