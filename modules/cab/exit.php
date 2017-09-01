<?php
//Выход из системы
if (isset($_COOKIE['hash'], $_COOKIE['id'])) {
	setcookie ('id',   '', -1, "/");
	setcookie ('hash', '', -1, "/");
}

if (isset($_SESSION['user'])) {
	session_unset();
	session_destroy();
}
header("Location: /");
exit();