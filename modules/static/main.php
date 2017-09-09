<?php
CORE::$CSS[] = '<link href="/css/'.CORE::$STYLE.'/main1.00.less" rel="stylesheet" type="text/css">';
CORE::$JS[]  = '<script defer src="/js/'.CORE::$STYLE.'/main_effects1.05.js"></script>';
	
if (isset($_SESSION['info'])) {
	$info = array();
	foreach ($_SESSION['info'] as $k => $v) {
		$info[$k] = $v;
	}
	unset($_SESSION['info']);
}
	