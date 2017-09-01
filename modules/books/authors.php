<?php
CORE::$CSS[] = '<link href="/css/'.CORE::$STYLE.'/books1.04.css" rel="stylesheet" type="text/css">';

$res = q("
	SELECT * FROM `authors`
");