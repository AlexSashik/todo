<?php
	error_reporting(-1);
	header ('Content-Type: text/html; charset=utf-8');
    mb_internal_encoding("UTF-8");
	session_start();
	
	include_once "./config.php";
	include_once "./libs/default.php";
	include_once "./variables.php";
	
	ob_start();
	    if (file_exists("./".CORE::$CONTR."/allpages.php")) {
            include "./".CORE::$CONTR."/allpages.php";
        }
		include_once "./".CORE::$CONTR."/".$_GET['module']."/".$_GET['page'].".php";
		include_once "./skins/".CORE::$STYLE."/".$_GET['module']."/".$_GET['page'].".tpl";
		$content = ob_get_contents();
	ob_clean();
	
	if (isset($_GET['ajax'])) {
		echo $content;
		exit;
	}
	
	include_once "./skins/".CORE::$STYLE."/index.tpl";