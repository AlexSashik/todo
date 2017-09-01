<div class="main">
	<div class="main_header">
		<span>Список пользователей (<?php echo $res->num_rows;?>)</span>
	</div>
		
	<div class="main_body">
		<form method="post">
			<table>
				<tr class="main_table_header">
					<td class="second">Пользователь</td>
					<td class="third">Email</td>
					<td class="sixth">Возраст</td>
					<td class="fourth">Роль</td>
					<td class="fifth">Дата регистрации</td>
					<td class="fifth">Последняя активность</td>
					<td class="first">Действие</td>
				</tr>
				<tr class="main_table_action">
					<td class="second">
						<input type="text" name="login" <?php if (isset($search['login'])) echo 'value="'.htmlspecialchars($search['login']).'"';?>>
					</td>
					<td  class="third">
						<input type="text" name="email" <?php if (isset($search['email'])) echo 'value="'.htmlspecialchars($search['email']).'"';?>>
					</td>
					<td  class="sixth">
						<label for="age_from">от</label>
						<input 
							id="age_from" 
							<?php if (isset($age_err_from)) echo 'class="red_border"';?>
							type="text"
							name="age_from"
							<?php if (isset($search['age_from'])) echo 'value="'.htmlspecialchars($search['age_from']).'"'; ?>
							>
						<div class="clear"></div>
						<label for="age_to">до</label>
						<input 
							id="age_to"
							<?php if (isset($age_err_to)) echo 'class="red_border"';?>
							type="text" 
							name="age_to" 
							<?php if (isset($search['age_to'])) echo 'value="'.htmlspecialchars($search['age_to']).'"'; ?>
							>
						<div class="clear"></div>
					</td>
					<td class="fourth">
						<select name="role[]">
							<option <?php if (!isset($search['active']) && !isset($search['access'])) echo 'selected';?> value="all">Все</option>
							<option <?php if (isset($search['active'])) echo 'selected';?> value="0">Не активен</option>
							<option <?php if (isset($search['access']) && $search['access'] == 1) echo 'selected';?> value="1">Активен</option>
							<option <?php if (isset($search['access']) && $search['access'] == 0) echo 'selected';?> value="2">Забанен</option>
							<option <?php if (isset($search['access']) && $search['access'] == 5) echo 'selected';?> value="3">Админ</option>
						</select>
					</td>
					<td class="fifth">
						<input type="text" name="reg_date" <?php if (isset($search['reg_date'])) echo 'value="'.htmlspecialchars($search['reg_date']).'"';?>>
					</td>
					<td class="fifth">
						<input type="text" name="last_active_date" <?php if (isset($search['last_active_date'])) echo 'value="'.htmlspecialchars($search['last_active_date']).'"';?>>
					</td>
					<td class="first">
						<button type="submit" class="left" value="submit" name="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
							Поиск
						</button>
						<a class="reload" href="/admin/users" title="Reload"><i class="fa fa-refresh" aria-hidden="true"></i></a>
						<div class="clear"></div>
					</td>
				</tr>
				<?php
				$i = 1;
				while ($row = $res->fetch_assoc() ) {
					$silver_style = ($i % 2 == 0 ? true : false);
				?>
				<tr <?php if ($silver_style) echo 'class="silver_row"'?>>
					<td class="second"><?php echo htmlspecialchars($row['login']);?></td>
					<td class="third"><?php echo htmlspecialchars($row['email']);?></td>
					<td class="sixth"><?php if ($row['age'] == 0) echo ''; else echo htmlspecialchars($row['age']);?></td>
					<td class="fourth"><?php 
						if (!$row['active']) 
							echo 'Не активен'; 
						elseif($row['access'] == '0')
							echo 'Забанен';
						elseif ($row['access'] == '1')
							echo 'Активен';
						elseif ($row['access'] == '5')
							echo 'Админ';
					?></td>
					<td class="fifth"><?php echo htmlspecialchars($row['reg_date']);?></td>
					<td class="fifth"><?php echo htmlspecialchars($row['last_active_date']);?></td>
					<td class="first">
						<a class="edit" href="/admin/users/edit/<?php echo (int)$row['id'];?>" title="Редактировать"><i class="fa fa-pencil-square fa-2x" aria-hidden="true"></i></a>
						<a class="delete" onclick="return del();" href="/admin/users?action=delete&id=<?php echo (int)$row['id'];?>" title="Удалить"><i class="fa fa-minus-square fa-2x" aria-hidden="true"></i></a>
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