<div class="main">
	<div class="main_header">
		Добавление нового товара
	</div>
	<form method="post" enctype="multipart/form-data">
		<label for="cat">Выберите категорию товата:</label>
		<select id="cat" name="cat[]" <?php if (isset($err['cat'])) echo 'class="red_border"';?>>
			<option>&nbsp;</option>
			<?php
			$res_cat = q ("
				SELECT * FROM `goods_cat`
			");
			while ($row = $res_cat->fetch_assoc()) {
				if (isset($_POST['cat'][0]) && $_POST['cat'][0] == $row['cat']) {
					echo '<option selected value="'.htmlspecialchars($row['cat']).'">'.htmlspecialchars($row['cat']).'</option>';
				} else {
					echo '<option value="'.htmlspecialchars($row['cat']).'">'.htmlspecialchars($row['cat']).'</option>';
				}
			}
			$res_cat->close();
			?>
		</select>
        <?php if (isset($err['cat'])) echo '<span class="red_color">'.$err['cat'].'</span>'?>
		<div class="clear"></div>

		<label for="name">Введите название товара:</label>
		<input type="text" id="name" name="name" <?php if(isset($_POST['name'])) echo 'value="'.htmlspecialchars(trim($_POST['name'])).'"'; if (isset($err['name'])) echo 'class="red_border"';?>>
        <?php if (isset($err['name'])) echo '<span class="red_color">'.$err['name'].'</span>'?>
        <div class="clear"></div>

		<label>Активен ли товар:</label>
		<table <?php if (isset($err['is_in_sight'])) echo 'class="red_border"';?>>
			<tr>
				<td><input id="yes" name="is_in_sight" type="radio" value="1" 
					<?php if (!isset($_POST['is_in_sight']) || (isset($_POST['is_in_sight']) && $_POST['is_in_sight'] == '1')) echo 'checked';?>></td>
				<td><input id="no" name="is_in_sight" type="radio" value="0"
				<?php if (isset($_POST['is_in_sight']) && $_POST['is_in_sight'] == '0') echo 'checked';?>></td>
			</tr>
			<tr>
				<td><label for="yes">В продаже</label></td>
				<td><label for="no">Отсутствует</label></td>
			</tr>
		</table>
		<div class="clear"></div>

		<label for="price">Цена(в грн):</label>
		<input type="text" id="price" name="price" <?php if(isset($_POST['price'])) echo 'value="'.htmlspecialchars(trim($_POST['price'])).'"'; if (isset($err['price'])) echo 'class="red_border"';?>>
        <?php if (isset($err['price'])) echo '<span class="red_color">'.$err['price'].'</span>'?>
        <div class="clear"></div>

		<label for="text">Описание товара:</label>
		<textarea id="text" name="text" <?php if (isset($err['text'])) echo 'class="red_border"';?>><?php if(isset($_POST['text'])) echo htmlspecialchars(trim($_POST['text']));?></textarea>
        <?php if (isset($err['text'])) echo '<span class="red_color">'.$err['text'].'</span>'?>
        <div class="clear"></div>

		<label for="picture">Прикрепите фото товара:</label>
		<input type="file" id="picture" name="picture[]" <?php if (isset($err['picture'])) echo 'class="red_border"';?> multiple>
		<div class="clear"></div>
		<?php if (isset($err['picture'])) echo '<label class="red_color">'.$err['picture'].'</label>	<div class="clear"></div>';?>
		
		<a href="/admin/goods" class="cancel"><i class="fa fa-ban" aria-hidden="true"></i>Отмена</a>
		<button type="submit" class="add"><i class="fa fa-plus-circle" aria-hidden="true"></i>Добавить</button>
		<div class="clear"></div>
		
	</form>
</div>