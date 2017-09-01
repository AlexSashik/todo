<div class="main">
	<div class="main_header">
		Редактирование пользователя
	</div>
	<form method="post" enctype="multipart/form-data">
		<label for="login">Логин:</label>
		<input type="text" id="login" name="login" <?php echo 'value="'.htmlspecialchars($row['login']).'"'; if (isset($err['login'])) echo 'class="red_border"';?>>
		<?php if (isset($err['login'])) echo '<span class="red_color">'.$err['login'].'</span>';?>
        <div class="clear"></div>
		
		<label for="email">Email:</label>
		<input type="email" id="email" name="email" <?php echo 'value="'.htmlspecialchars($row['email']).'"'; if (isset($err['email'])) echo 'class="red_border"';?>>
        <?php if (isset($err['email'])) echo '<span class="red_color">'.$err['email'].'</span>';?>
        <div class="clear"></div>

		<label for="pass">Изменить пароль:</label>
		<input type="text" id="pass" name="pass" <?php echo 'value="'.htmlspecialchars($row['pass']).'"'; if (isset($err['pass'])) echo 'class="red_border"';?>>
        <?php if (isset($err['pass'])) echo '<span class="red_color">'.$err['pass'].'</span>';?>
        <div class="clear"></div>
		
		<label for="age">Возраст (число):</label>
		<input type="text" id="age" name="age" <?php echo 'value="'.htmlspecialchars($row['age']).'"'; if (isset($err['age'])) echo 'class="red_border"';?>>
        <div class="clear"></div>
	
		<label for="role">Cтатус:</label>
		<select id="role" name="role[]" <?php if (isset($err['role'])) echo 'class="red_border"';?>>
			<option <?php if ($row['role'] == 0) echo 'selected';?> value="0">Не активен</option>
			<option <?php if ($row['role'] == 1) echo 'selected';?> value="1">Активен</option>
			<option <?php if ($row['role'] == 2) echo 'selected';?> value="2">Забанен</option>
			<option <?php if ($row['role'] == 3) echo 'selected';?> value="3">Админ</option>
		</select>
       	<div class="clear"></div>
		
		<label for="reg_date">Дата регистрации:</label>
		<input placeholder="<?php echo date('Y-m-d');?>" type="text" id="reg_date" name="reg_date" <?php echo 'value="'.htmlspecialchars($row['reg_date']).'"'; if (isset($err['reg_date'])) echo 'class="red_border"';?>>
        <?php if (isset($err['reg_date'])) echo '<span class="red_color">'.$err['reg_date'].'</span>';?>
        <div class="clear"></div>
		
		<label for="last_active_date">Последняя активность:</label>
		<input placeholder="<?php echo date('Y-m-d h:i:s');?>" type="text" id="last_active_date" name="last_active_date" <?php echo 'value="'.htmlspecialchars($row['last_active_date']).'"'; if (isset($err['last_active_date'])) echo 'class="red_border"';?>>
        <?php if (isset($err['last_active_date'])) echo '<span class="red_color">'.$err['last_active_date'].'</span>';?>
        <div class="clear"></div>
		
		<label>Текущий аватар:</label>
		<img src="/img/default/users/100x100/<?php echo htmlspecialchars($row['avatar']);?>">
		<div class="clear"></div>
		
		<label for="picture">Изменить аватар:</label>
		<input type="file" id="picture" name="picture" <?php if (isset($err['picture'])) echo 'class="red_border"';?>>
		<div class="clear"></div>
		<?php if (isset($err['picture'])) echo '<span class="red_color">'.$err['picture'].'</span>	<div class="clear"></div>';?>
		
		<a href="/admin/users" class="cancel"><i class="fa fa-ban" aria-hidden="true"></i>Отмена</a>
		<button type="submit" class="add"><i class="fa fa-plus-circle" aria-hidden="true"></i>Редактировать</button>
		<div class="clear"></div>
	</form>
</div>