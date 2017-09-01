<?php
CORE::$CSS[] = '<link href="/css/'.CORE::$STYLE.'/main/main1.00.css" rel="stylesheet" type="text/css">';
CORE::$JS[]  = '<script defer src="/js/'.CORE::$STYLE.'/main/main_effects1.00.js"></script>';

if (isset($_SESSION['info'])) {
    $info = array();
    foreach ($_SESSION['info'] as $k => $v) {
        $info[$k] = $v;
    }
    unset($_SESSION['info']);
}