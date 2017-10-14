<?php
CORE::$CSS[] = '<link href="/css/'.CORE::$STYLE.'/main/main1.00.css" rel="stylesheet" type="text/css">';

if (isset($_SESSION['info'])) {
    $info = array();
    foreach ($_SESSION['info'] as $k => $v) {
        $info[$k] = $v;
    }
    unset($_SESSION['info']);
}