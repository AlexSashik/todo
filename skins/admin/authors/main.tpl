<div class="main">
	<div class="main_header">
		<span>Список авторов (<?php echo $res->num_rows;?>)</span>
		<a href="/admin/authors/add" class="add"><i class="fa fa-plus-circle" aria-hidden="true"></i>Добавить нового автора</a>
	</div>
		
	<div class="main_body">
		<form method="post">
			<table>
				<tr class="main_table_header">
					<td class="second">Имя</td>
					<td class="third">Год рождения</td>
					<td class="third">Год смерти</td>
					<td class="sixth">Действие</td>
				</tr>
				<tr class="main_table_action">
					<td class="second"><input class="name" type="text" name="name" <?php if (isset($_POST['name'])) echo 'value="'.htmlspecialchars($_POST['name']).'"';?>></td>
					<td  class="third"><input class="yob" type="text" name="yob" <?php if (isset($_POST['yob'])) echo 'value="'.htmlspecialchars($_POST['yob']).'"';?>></td>
					<td class="third"><input class="yod" type="text" name="yod" <?php if (isset($_POST['yod'])) echo 'value="'.htmlspecialchars($_POST['yod']).'"';?>></td>
					<td class="sixth">
						<button type="submit" class="left" value="submit" name="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
							Поиск
						</button>
						<a class="reload" href="/admin/authors" title="Reload"><i class="fa fa-refresh" aria-hidden="true"></i></a>
						<div class="clear"></div>
					</td>
				</tr>
				<?php
				$i = 1;
				while ($row = $res->fetch_assoc()) {
                    $silver_style = ($i % 2 == 0 ? true : false);
					?>
					<tr <?php if ($silver_style) echo 'class="silver_row"'?>>
						<td class="second"><?php echo htmlspecialchars($row['name']);?></td>
						<td class="third">
                            <?php
                            if ($row['yob'] != 0 ) echo htmlspecialchars($row['yob']);
                            else echo '';
                            ?>
                        </td>
						<td class="third">
                            <?php
                            if ($row['yod'] != 0 ) echo htmlspecialchars($row['yod']);
                            else echo '';
                            ?></td>
                        </td>
						<td class="sixth">
							<a class="edit" href="/admin/authors/edit/<?php echo (int)$row['id'];?>" title="Редактировать"><i class="fa fa-pencil-square fa-2x" aria-hidden="true"></i></a>
							<a class="delete" onclick="return del();" href="/admin/authors?action=delete&id=<?php echo (int)$row['id'];?>" title="Удалить"><i class="fa fa-minus-square fa-2x" aria-hidden="true"></i></a>
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