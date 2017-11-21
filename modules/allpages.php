<?php
if (isset($_SESSION['user'])) {
	$res = q ("
		SELECT * FROM `users`
		WHERE `id` = ".(int)$_SESSION['user']['id']."
	");
	if (!$res->num_rows) {
		if (!($_GET['module'] == 'cab' && $_GET['page'] == 'exit')) {
            header ('Location: /cab/exit');
            exit;
        }
    } else {
		$_SESSION['user'] = $res->fetch_assoc();
		if (($_SESSION['user']['active'] == 0) && !($_GET['module'] == 'cab' && $_GET['page'] == 'exit')) {
			header ('Location: /cab/exit');
			exit;
		}
		q ("
			UPDATE `users` SET
			`last_active_date` = NOW(),
			`online` = 1
			WHERE `id` = ".(int)$_SESSION['user']['id']." 
		");
	}
}

//авто-авторизация
if (!isset($_SESSION['user']) && isset($_COOKIE['hash'], $_COOKIE['id'] ) ) {
	$res = q ("
		SELECT * FROM `users`
		WHERE `id` = '".(int)$_COOKIE['id']."' AND `hash` = '".es($_COOKIE['hash'])."'
	");
	if ( $res->num_rows && $_COOKIE['hash'] ==  myHash($_SERVER['REMOTE_ADDR']) ) {
		$row = $res->fetch_assoc();
		$res->close();
		$_SESSION['user'] = $row;
		setcookie ('id', $row['id'], time() + 60 * 60 * 24 * 30, "/");
		setcookie ('hash', myHash($_SERVER['REMOTE_ADDR']), time() + 60 * 60 * 24 * 30, "/");
	} elseif (!($_GET['module'] == 'cab' && $_GET['page'] == 'exit')) {
		header ('Location: /cab/exit');
		exit;
	}
}