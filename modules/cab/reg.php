<?php
if (isset($_SESSION['user'])) {
	header("Location: /");
	exit;
}

CORE::$CSS[] = '<link href="/css/'.CORE::$STYLE.'/cab1.01.css" rel="stylesheet" type="text/css">';
CORE::$JS[]  = '<script defer src="/js/'.CORE::$STYLE.'/cab1.02.js"></script>';
CORE::$META['title']  = 'Todo - registration';

if (isset($_SESSION['info'])) {
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}

if ( isset($_POST['login'], $_POST['email'], $_POST['pass'], $_POST['age']) ) {
	$_POST = trimAll($_POST);
		
	// Проверка логина
	if ($_POST['login'] == '') {
		$errors['login_err'] = 'Вы не ввели логин';
	} elseif (mb_strlen($_POST['login'], 'utf-8') < 2) {
		$errors['login_err'] = 'Cлишком короткий логин';
	} elseif (mb_strlen($_POST['login'], 'utf-8') > 30) {
		$errors['login_err'] = 'Cлишком длинный логин';
	} elseif (!checkUnique('users', 'login', $_POST['login'])) {
		$errors['login_err'] = 'Логин занят';
	}
	
	// Проверка email
	if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
		$errors['email_err'] = 'Некорректрный email';
	} elseif (!checkUnique('users', 'email', $_POST['email'])) {
		$errors['email_err'] = 'Email занят';
	}
		
	// Проверка пароля
	if ($_POST['pass'] == '') {
		$errors['pass_err'] = 'Вы не ввели пароль';
	} elseif (mb_strlen($_POST['pass'], 'utf-8') < 3) {
		$errors['pass_err'] = 'Cлишком короткий пароль';
	} elseif (mb_strlen($_POST['pass'], 'utf-8') > 50) {
		$errors['pass_err'] = 'Cлишком длинный пароль';
	}
	
	// Проверка возраста
	if (!empty($_POST['age'])) {
		if (!is_numeric($_POST['age']) || $_POST['age'] <= 0 || $_POST['age'] >= 200) {
			$errors['age_err'] = 'Некорректрный возраст';
		} else {
			$age_string = "`age` = '".es($_POST['age'])."',";
		}
	} else {
		$age_string = '';
	}
		
	if (!count($errors)) {
		q("INSERT INTO `users` SET
			`login` 	= '".es($_POST['login'])."',
			`pass` 		= '".es(myHash($_POST['pass']))."',
			`email` 	= '".es($_POST['email'])."',
			".$age_string."
			`hash`     = '".es(myHash($_POST['email'].$_POST['login']))."',
			`active`   = '0',
			`reg_date` = NOW(),
			`access`   = '-1'
		");
		$id = DB::_()->insert_id;
					
		MailMy::$to = $_POST['email'];
		MailMy::$subject = "Завершение регистрации";
		MailMy::$text = "\t Вы успешно зарегистрировались! Осталось совсем немного: для авторизации и активации Вашего аккаунта необходимо перейти по следующей ссылке: 
						  ".CORE::$DOMAIN.'cab?hash='.htmlspecialchars(myHash($_POST['email'].$_POST['login'])).'&id='.$id.'';
		MailMy::send();
		$_SESSION['info'] = 'Для завершения процедуры регистрации проверьте Вашу почту.';
		header ("Location: /cab/reg");
		exit;
	}
}