<?php
// не в allpages т.к. это исключительное событие
if (isset($_SESSION['user']) && $_SESSION['user']['access'] == 5) {
    header ("Location: /admin");
    exit();
}

CORE::$CSS[] = '<link href="/css/'.CORE::$STYLE.'/cab/cab1.00.css" rel="stylesheet" type="text/css">';
CORE::$JS[]  = '<script defer src="/js/'.CORE::$STYLE.'/cab/cab1.00.js"></script>';

if ( isset($_POST['login'], $_POST['pass']) ) {
    $_POST = trimAll($_POST);

    // Проверка логина и пароля
    if ($_POST['login'] == '') {
        $errors['login_err'] = 'Вы не ввели логин';
    } elseif (mb_strlen(trim($_POST['login'])) > 50) {
        $errors['login_err'] = 'Cлишком длинный логин';
    } else {
        $res = q("
				SELECT * FROM `users`
				WHERE	`login`    = '".es($_POST['login'])."'
			");
        if (!($res->num_rows)) {
            $errors['login_err'] = 'Логин не зарегестрирован';
            $res->close();
        } else {
            $row = $res->fetch_assoc();
            $res->close();
            $errors['login_err'] = false;
            if (myHash($_POST['pass']) != $row['pass']) {
                $errors['pass_err'] = 'Неправильно введенный пароль';
            } elseif ($row['access'] != 5) {
                unset ($errors['login_err']);
                $errors['active_err']['header'] = 'Вход не выполнен';
                $errors['active_err']['img']    = '/img/admin/goods/error.png';
                $errors['active_err']['text']   = 'Вы не администратор. Доступ к ресурсу предоставляется только администраторам сайта.';
            } else {
                $_SESSION['info']['success_autoriz'] = true;
                $_SESSION['user'] = $row;
                if (isset ($_POST['remember']) ) {
                    setcookie ('id', $row['id'], time() + 60 * 60 * 24 * 30, "/");
                    setcookie ('hash', myHash($_SERVER['REMOTE_ADDR']),time() + 60 * 60 * 24 * 30, "/");
                    q ("
							UPDATE `users` SET
							`hash` = '".es(myHash($_SERVER['REMOTE_ADDR']))."'
							WHERE `id` = '".(int)$row['id']."'
						");
                }
                header("Location: /admin");
                exit;
            }
        }
    }
}