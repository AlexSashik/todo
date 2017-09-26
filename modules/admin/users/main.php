<?php
CORE::$CSS[] = '<link href="/css/'.CORE::$STYLE.'/users/users_list1.00.css" rel="stylesheet" type="text/css">';
CORE::$JS[]  = '<script defer src="/js/'.CORE::$STYLE.'/users/all_header_footer1.00.js"></script>';
CORE::$META['title']  = 'TodoCMS - users';

if (isset($_SESSION['info'])) {
	$info_name = $_SESSION['info'][0];
	$info_text  = $_SESSION['info'][1];
	$info_type  = $_SESSION['info'][2];
	unset($_SESSION['info']);
}

if (isset($_SESSION['search'])) {
	foreach ($_SESSION['search'] as $k => $v) {
		$search[$k] = $v;
	}
	unset($_SESSION['search']);
}

// Обработка удаления пользователя
if (isset($_GET['action']) && $_GET['action'] == 'delete') {
	$res = q("
		SELECT * FROM `users`
		WHERE `id` = ".(int)$_GET['id']."
	");
	if (!($res->num_rows)) {
		$res->close();
		$_SESSION['info'] = array('Удаление пользователя', 'Пользователя не найден!', 'warning');
		header ("Location: /admin/users");
		exit;
	} else {
		$row = $res->fetch_assoc();
		$res->close();
		q ("
			UPDATE `comments` SET
			`avatar` = 'deleted_user.jpg',
			`status` = -1
			WHERE `user_id` = ".(int)$_GET['id']."
		");
		q ("
			DELETE FROM `users`
			WHERE `id` = ".(int)$_GET['id']."
		");
		if ($row['avatar'] != 'noavatar.png' && file_exists('./img/default/users/100x100/'.$row['avatar'])) {
			unlink('./img/default/users/100x100/'.$row['avatar']);
		}	
		
		$_SESSION['info'] = array('Удаление пользователя', 'Выбранный пользователь успешно удален!', 'success');
		header ("Location: /admin/users");
		exit;
	}
}


// Обработка формы поиска

if (isset($_POST['login'], $_POST['email'],  $_POST['age_from'], $_POST['age_to'], $_POST['role'], $_POST['reg_date'], $_POST['last_active_date'])) {
	$_POST = trimAll($_POST);
	
	if ($_POST['login'] != '') $_SESSION['search']['login'] = $_POST['login'];
	if ($_POST['email'] != '') $_SESSION['search']['email'] = $_POST['email'];
	if ($_POST['age_from'] != '') $_SESSION['search']['age_from'] = $_POST['age_from'];
	if ($_POST['age_to'] != '') $_SESSION['search']['age_to'] = $_POST['age_to'];
	if ($_POST['role'][0] == '0') {
		$_SESSION['search']['active'] = 0;
	} elseif ($_POST['role'][0] == '1') {
		$_SESSION['search']['access'] = 1;
	} elseif ($_POST['role'][0] == '2') {
		$_SESSION['search']['access'] = 0;
	} elseif ($_POST['role'][0] == '3') {
		$_SESSION['search']['access'] = 5;
	} 	
	if ($_POST['reg_date'] != '') $_SESSION['search']['reg_date'] = $_POST['reg_date'];
	if ($_POST['last_active_date'] != '') $_SESSION['search']['last_active_date'] = $_POST['last_active_date'];
	
	header ("Location: /admin/users");
	exit;
}

// Поиск по БД после успешной обработки формы поиска

$where = array();

if (isset($search)) {
	foreach ($search as $k => $v) {
		if ($k == 'access' || $k == 'active') {
			$where[] = "`".es($k)."` = '".es($v)."'";
		} elseif ($k == 'age_from') {
			if (is_numeric($v)) {
				$where[] = "`age` >= '".(int)$v."'";
			} else {
				$age_err_from = true;
				$where[] = "`age` < '0'";
			}
		} elseif ($k == 'age_to') {
			if (is_numeric($v)) {
				$where[] = "`age` <= '".(int)$v."'";
			} else {
				$age_err_to = true;
				$where[] = "`age` < '0'";
			} 
		} else {
			$where[] = "`".$k."` LIKE '%".es($v)."%'";
		}
	}
}

if (empty($where)) {
	$res = q ("
		SELECT * FROM `users`
	");
} else {
	$res = q ("
		SELECT * FROM `users`
		WHERE ".implode(' AND ', $where)." 
	");
}