<?php
if (isset($_SESSION['user'])) {
	$res = q ("
		SELECT * FROM `users`
		WHERE `id` = ".(int)$_SESSION['user']['id']."
	");
	if (!$res->num_rows) {
		header ('Location: /');
		exit;
	} else {
		$_SESSION['user'] = $res->fetch_assoc();
		if ($_SESSION['user']['access'] != 5) {
			header ('Location: /');
			exit;
		}
		q ("
			UPDATE `users` SET
			`last_active_date` = NOW(),
			online = 1
			WHERE `id` = ".(int)$_SESSION['user']['id']." 
		");
	}
} elseif ($_GET['module'] != 'cab') {
	header ('Location: /admin/cab');
	exit;
}