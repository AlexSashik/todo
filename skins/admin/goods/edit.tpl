<div class="main">
	<div class="main_header">
		Редактирование товара <?if(isset($err)) echo '<span class="red_color">(имеются ошибки!)</span>';?>
	</div>
	<form method="post" enctype="multipart/form-data">
		<label for="cat">Выберите категорию товата:</label>
		<select id="cat" name="cat[]" <?php if (isset($err['cat'])) echo 'class="red_border"';?>>
			<?php
			$res_cat = q ("
				SELECT * FROM `goods_cat`
			");
			while ($row = $res_cat->fetch_assoc()) {
				if ($row1['cat'] == $row['cat']) {
					echo '<option selected value="'.htmlspecialchars($row['cat']).'">'.htmlspecialchars($row['cat']).'</option>';
				} else {
					echo '<option value="'.htmlspecialchars($row['cat']).'">'.htmlspecialchars($row['cat']).'</option>';
				}
			}
			$res_cat->close();
			?>
		</select>
		<div class="clear"></div>

		<label for="name">Введите название товара:</label>
		<input type="text" id="name" name="name" <?php echo 'value="'.htmlspecialchars(trim($row1['name'])).'"'; if (isset($err['name'])) echo 'class="red_border"';?>>
        <?php if (isset($err['name'])) echo '<span class="red_color">'.$err['name'].'</span>'?>
        <div class="clear"></div>

		<label>Активен ли товар:</label>
		<table <?php if (isset($err['is_in_sight'])) echo 'class="red_border"';?>>
			<tr>
				<td><input id="yes" name="is_in_sight" type="radio" value="1" 
					<?php if ($row1['is_in_sight'] != '0') echo 'checked';?>></td>
				<td><input id="no" name="is_in_sight" type="radio" value="0"
					<?php if ($row1['is_in_sight'] == '0') echo 'checked';?>></td>
			</tr>
			<tr>
				<td><label for="yes">В продаже</label></td>
				<td><label for="no">Отсутствует</label></td>
			</tr>
		</table>
		<div class="clear"></div>

		<label for="price">Цена(в грн):</label>
		<input type="text" id="price" name="price" <?php echo 'value="'.htmlspecialchars($row1['price']).'"'; if (isset($err['price'])) echo 'class="red_border"';?>>
        <?php if (isset($err['price'])) echo '<span class="red_color">'.$err['price'].'</span>'?>
        <div class="clear"></div>

		<label for="text">Описание товара:</label>
		<textarea id="text" name="text"  <?php if (isset($err['text'])) echo 'class="red_border"';?>><?php echo htmlspecialchars($row1['text']);?></textarea>
        <?php if (isset($err['text'])) echo '<span class="red_color">'.$err['text'].'</span>'?>
        <div class="clear"></div>

		<?php
		$flag = true;
		while ($row2 = $res2->fetch_assoc()) {
		if($row2['img_name'] == 'no-photo.jpg') $flag = false;
		?>
		<hr>
		<?php if (!$row2['is_main']) echo '<a class="del_photo" href="/admin/goods/edit/'.(int)$_GET['key1'].'&img_id='.$row2['id'].'" onclick="return del()">Удалить фото</a>' ?>
		<label class = "photo_label">Изменить <?php if ($row2['is_main']) echo 'главное';?> фото товара:</label>
		<img src="/img/default/goods/100x100/<?php echo htmlspecialchars($row2['img_name'])?>">
		<input class = "photo_label" type="file" name="<?php echo htmlspecialchars($row2['id'])?>" <?php if (isset($err[$row2['id']])) echo 'class="red_border"';?>>
		<div class="clear"></div>
		<?php if (isset($err[$row2['id']])) echo '<label class="red_color">'.$err[$row2['id']].'</label><div class="clear"></div>';
		}
		if ($flag) {
		?>
		<hr>
		<label class = "photo_label">Добавить новое фото товара:</label>
		<input class = "photo_label" type="file" name="new_photo" <?php if (isset($err['new_photo'])) echo 'class="red_border"';?>>
		<div class="clear"></div>
		<?php if (isset($err['new_photo'])) echo '<label class="red_color">'.$err['new_photo'].'</label><div class="clear"></div>';
		}
		?>
			
		<a href="/admin/goods" class="cancel"><i class="fa fa-ban" aria-hidden="true"></i>Отмена</a>
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