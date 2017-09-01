<?php

CORE::$CSS[] = '<link href="/css/'.CORE::$STYLE.'/games/game1.01.css" rel="stylesheet" type="text/css">';
CORE::$META['title']  = 'Todo - games over - battle of alcoholics';

if (isset($_SESSION['user_hp'],$_SESSION['server_hp']) ) {
	if ($_SESSION['user_hp'] <=0 ) {
		$result = 'lose';
		unset($_SESSION['user_hp']);
		unset($_SESSION['server_hp']);
	} elseif ($_SESSION['server_hp'] <=0) {
		$result = 'win';
		unset($_SESSION['user_hp']);
		unset($_SESSION['server_hp']);
	} else {
		header ("Location: /games/alcoholics");
		exit;
	}
} else {
	header ("Location: /games/alcoholics");
	exit;
}
