<div class="main container">
    <div class="container-fluid table-header">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
            <span class="text-primary">Список пользователей (<?php echo $res->num_rows;?>)</span>
        </div>
    </div>


    <div class="table-responsive">
		<form method="post">
            <table class="table table-striped table-bordered">
                <thead class="navbar-inverse">
                <tr class="text-silver">
                    <th class="text-center">Пользователь</th>
                    <th class="text-center">Email</th>
                    <th class="text-center">Возраст</th>
                    <th class="text-center">Роль</th>
                    <th class="text-center">Дата регистрации</th>
                    <th class="text-center">Последняя активность</th>
                    <th class="text-center">Действие</th>
                </tr>

                <tr class="info">

                    <td>
                        <input class="form-control" type="text" name="login" <?php if (isset($search['login'])) echo 'value="'.htmlspecialchars($search['login']).'"';?>>
                    </td>

                    <td>
                        <input class="form-control" type="text" name="email" <?php if (isset($search['email'])) echo 'value="'.htmlspecialchars($search['email']).'"';?>>
                    </td>

                    <td>
                        <div class="form-group">
                            <div <?php if (isset($age_err_from)) echo 'class="has-error"';?>>
                                <input
                                        class="form-control"
                                        type="text"
                                        name="age_from"
                                        placeholder="от"
                                    <?php if (isset($search['age_from'])) echo 'value="'.htmlspecialchars($search['age_from']).'"'; ?>
                                >
                            </div>
                            <div <?php if (isset($age_err_to)) echo 'class="has-error"';?>>
                                <input
                                        class="form-control"
                                        type="text"
                                        name="age_to"
                                        placeholder="до"
                                    <?php if (isset($search['age_to'])) echo 'value="'.htmlspecialchars($search['age_to']).'"'; ?>
                                >
                            </div>
                        </div>

                    </td>

                    <td>
                        <select class="form-control" name="role[]">
                            <option <?php if (!isset($search['active']) && !isset($search['access'])) echo 'selected';?> value="all">Все</option>
                            <option <?php if (isset($search['active'])) echo 'selected';?> value="0">Не активен</option>
                            <option <?php if (isset($search['access']) && $search['access'] == 1) echo 'selected';?> value="1">Активен</option>
                            <option <?php if (isset($search['access']) && $search['access'] == 0) echo 'selected';?> value="2">Забанен</option>
                            <option <?php if (isset($search['access']) && $search['access'] == 5) echo 'selected';?> value="3">Админ</option>

                        </select>
                    </td>

                    <td>
                        <input type="text" class="form-control" name="reg_date" <?php if (isset($search['reg_date'])) echo 'value="'.htmlspecialchars($search['reg_date']).'"';?>>
                    </td>
                    <td>
                        <input type="text" class="form-control" name="last_active_date" <?php if (isset($search['last_active_date'])) echo 'value="'.htmlspecialchars($search['last_active_date']).'"';?>>
                    </td>

                    <td class="text-right">
                        <button type="submit" class="btn btn-info btn-adapt" value="submit" name="submit">
                            <i class="glyphicon glyphicon-search"></i>
                            Поиск
                        </button>
                        <a class="btn btn-info btn-adapt" href="/admin/users" title="Reload" data-toggle="tooltip" data-placement="left">
                            <i class="glyphicon glyphicon-refresh"></i>
                        </a>
                    </td>
                </tr>
                </thead>

				<?php
				$i = 1;
				while ($row = $res->fetch_assoc() ) {
				?>
				<tr>
					<td><?php echo htmlspecialchars($row['login']);?></td>
					<td><?php echo htmlspecialchars($row['email']);?></td>
					<td><?php if ($row['age'] == 0) echo ''; else echo htmlspecialchars($row['age']);?></td>
					<td><?php
						if (!$row['active']) 
							echo 'Не активен'; 
						elseif($row['access'] == '0')
							echo 'Забанен';
						elseif ($row['access'] == '1')
							echo 'Активен';
						elseif ($row['access'] == '5')
							echo 'Админ';
					?></td>
					<td><?php echo htmlspecialchars($row['reg_date']);?></td>
					<td><?php echo htmlspecialchars($row['last_active_date']);?></td>
                    <td class="text-center">
                        <a class="btn btn-success btn-adapt" href="/admin/users/edit/<?php echo (int)$row['id'];?>" title="Редактировать" data-toggle="tooltip">
                            <i class="glyphicon glyphicon-edit"></i>
                        </a>
                        <a class="btn btn-danger btn-adapt" onclick="return del();" href="/admin/users?action=delete&id=<?php echo (int)$row['id'];?>" title="Удалить" data-toggle="tooltip">
                            <i class="glyphicon glyphicon-minus"></i>
                        </a>
                    </td>
				</tr>
				<?php
					$i++;
				}
				?>
			</table>
		</form>
        <?php if ($i == 1) echo '<div class="text-center not-found">Поиск не дал результата</div>';?>
	</div>
</div>

<?php if (isset($info_name)) { ?>
    <div id="modal" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-<?php if($info_type == 'success') echo 'success'; else echo 'warning';?> panel-heading">
                    <button class="close" data-dismiss="modal">x</button>
                    <h4 class="modal-title text-center"><?php echo $info_name;?></h4>
                </div>
                <div class="modal-body"><?php echo $info_text;?></div>
                <div class="modal-footer">
                    <button class="btn btn-<?php if($info_type == 'success') echo 'success'; else echo 'warning';?>" data-dismiss="modal">Закрыть</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('#modal').modal();
    </script>
    <?php
}
?>