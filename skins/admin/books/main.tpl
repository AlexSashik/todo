<div class="main">
	<div class="main_header">
		<span>Список книг (<?php echo $res->num_rows;?>)</span>
		<a href="/admin/books/add" class="add"><i class="fa fa-plus-circle" aria-hidden="true"></i>Добавить новую книгу</a>
	</div>
		
	<div class="main_body">
		<form method="post">
			<table>
				<tr class="main_table_header">
					<td class="second">Название</td>
					<td class="third">Авторы</td>
					<td class="fourth">Год</td>
					<td class="sixth">Действие</td>
				</tr>
				<tr class="main_table_action">
					<td class="second"><input class="name" type="text" name="name" <?php if (isset($_POST['name'])) echo 'value="'.htmlspecialchars($_POST['name']).'"';?>></td>
					<td  class="third"><input class="name" type="text" name="auth" <?php if (isset($_POST['auth'])) echo 'value="'.htmlspecialchars($_POST['auth']).'"';?>></td>
					<td class="fourth">
						<select name="year[]">
							<option value="all"></option>
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
									echo '<option value="'.$i.'">'.$i.'</option>';
								}
							}
							
							?>
						</select>
					</td>
					<td class="sixth">
						<button type="submit" class="left" value="submit" name="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
							Поиск
						</button>
						<a class="reload" href="/admin/books" title="Reload"><i class="fa fa-refresh" aria-hidden="true"></i></a>
						<div class="clear"></div>
					</td>
				</tr>
				<?php
				$i = 1;
				if(isset($data)) {
					foreach ($data as $v) {
						$silver_style = ($i % 2 == 0 ? true : false);
					?>
					<tr <?php if ($silver_style) echo 'class="silver_row"'?>>
						<td class="second"><?php echo htmlspecialchars($v['name']);?></td>
						<td class="third">
						<?php 
						foreach ($v['auth'] as $author) {
							echo htmlspecialchars($author).'<br>';
						}
						?> 
						</td>
						<td class="fourth"><?php echo htmlspecialchars($v['year']);?></td>
						<td class="sixth">
							<a class="edit" href="/admin/books/edit/<?php echo (int)$v['id'];?>" title="Редактировать"><i class="fa fa-pencil-square fa-2x" aria-hidden="true"></i></a>
							<a class="delete" onclick="return del();" href="/admin/books?action=delete&id=<?php echo (int)$v['id'];?>" title="Удалить"><i class="fa fa-minus-square fa-2x" aria-hidden="true"></i></a>
						</td>
					</tr>
					<?php
						$i++;
					}
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