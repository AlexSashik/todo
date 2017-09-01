<div class="main">
	<form method="post" id="del_form" onsubmit="return delAll();"></form>
	<div class="main_header">
		<span>Список товаров (<?php echo $res->num_rows;?>)</span>
		<button form="del_form" type="submit" name="delete" class="delete_all"><i class="fa fa-trash" aria-hidden="true"></i>Удалить</button>
		<a href="/admin/goods/add" class="add"><i class="fa fa-plus-circle" aria-hidden="true"></i>Добавить</a>
	</div>
		
	<div class="main_body">
		<form method="post">
			<table>
				<tr class="main_table_header">
					<td class="first">Выбор</td>
					<td class="second">Название</td>
					<td class="third">Категория</td>
					<td class="fourth">Активен</td>
					<td class="fifth">Цена(грн)</td>
					<td class="sixth">Действие</td>
				</tr>
				<tr class="main_table_action">
					<td class="first"><input type="checkbox" id="all_goods"></td>
					<td class="second">
					<input class="name" type="text" name="name" <?php if (isset($_SESSION['name'])) {echo 'value="'.htmlspecialchars($_SESSION['name']).'"'; unset($_SESSION['name']);}?>></td>
					<td  class="third">
						<select class="cat" name="cat[]">
							<?php
							$res_cat = q ("
								SELECT * FROM `goods_cat`
							");
							if (!isset($_SESSION['search_by_cat'])) {
								echo '<option selected value="all">Все</option>';
								while ($row = $res_cat->fetch_assoc()) {
									echo '<option value="'.htmlspecialchars($row['cat']).'">'.htmlspecialchars($row['cat']).'</option>';
								}
							} else {
								echo '<option value="all">Все</option>';
								while ($row = $res_cat->fetch_assoc()) {
									if ($_SESSION['search_by_cat'] == $row['cat']) {
										echo '<option selected value="'.htmlspecialchars($row['cat']).'">'.htmlspecialchars($row['cat']).'</option>';
									} else {
										echo '<option value="'.htmlspecialchars($row['cat']).'">'.htmlspecialchars($row['cat']).'</option>';
									}
								}
								unset($_SESSION['search_by_cat']);
							}
							$res_cat->close();
							?>
						</select>
					</td>
					<td class="fourth">
						<select class="is_in_sight" name="is_in_sight[]">
							<?php
							if (!isset($_SESSION['is_in_sight'])) {
							?>
							<option selected value="all">Все</option>
							<option value="1">В наличии</option>
							<option value="0">Отсутствует</option>
							<?php
							} else {
							?>
							<option value="all">Все</option>
							<option <?php if ($_SESSION['is_in_sight'] == 1) echo 'selected';?> value="1">В наличии</option>
							<option <?php if ($_SESSION['is_in_sight'] == 0) echo 'selected';?> value="0">Отсутствует</option>
							<?php
							unset ($_SESSION['is_in_sight']);
							}
							?>
						</select>
					</td>
					<td class="fifth">
						<label for="price_from">от</label>
						<input 
							id="price_from" 
							<?php if (isset($price_err)) echo 'class="red_border"';?>
							type="text"
							name="price_from"
							<?php 
							if (isset($_SESSION['price_from'])) {
								echo 'value="'.htmlspecialchars($_SESSION['price_from']).'"'; 
								unset($_SESSION['price_from']);
							}?>
							>
						<div class="clear"></div>
						<label for="price_to">до</label>
						<input 
							id="price_to"
							<?php if (isset($price_err)) echo 'class="red_border"';?>
							type="text" 
							name="price_to" 
							<?php if (isset($_SESSION['price_to'])) {
								echo 'value="'.htmlspecialchars($_SESSION['price_to']).'"';
								unset($_SESSION['price_to']);
							}
							?>>
						<div class="clear"></div>
					</td>
					<td class="sixth">
						<button type="submit" class="left" value="submit" name="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
							Поиск
						</button>
						<a class="reload" href="/admin/goods" title="Reload"><i class="fa fa-refresh" aria-hidden="true"></i></a>
						<div class="clear"></div>
					</td>
				</tr>
				<?php
				$i = 1;
				while ($row = $res->fetch_assoc() ) {
					$silver_style = ($i % 2 == 0 ? true : false);
				?>
				<tr <?php if ($silver_style) echo 'class="silver_row"'?>>
					<td class="first"><input form="del_form" type="checkbox" name="ids[]" value="<?php echo $row['id'];?>" class="goods_checkboxes"></td>
					<td class="second"><?php echo htmlspecialchars($row['name']);?></td>
					<td class="third"><?php echo htmlspecialchars($row['cat']);?></td>
					<td class="fourth"><?php if ($row['is_in_sight']) echo 'В наличии'; else echo 'Отсутствует';?></td>
					<td class="fifth"><?php echo htmlspecialchars($row['price']);?></td>
					<td class="sixth">
						<a class="edit" href="/admin/goods/edit/<?php echo (int)$row['id'];?>" title="Редактировать"><i class="fa fa-pencil-square fa-2x" aria-hidden="true"></i></a>
						<a class="delete" onclick="return del();" href="/admin/goods?action=delete&id=<?php echo (int)$row['id'];?>" title="Удалить"><i class="fa fa-minus-square fa-2x" aria-hidden="true"></i></a>
					</td>
				</tr>
				<?php
					$i++;
				}
				?>
			</table>
		</form>
	<?php if ($i == 1) echo '<div class="search_not_found">Поиск не дал результата</div>';?>
	</div>
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