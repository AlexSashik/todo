<?php

CORE::$CSS[] = '<link href="/css/'.CORE::$STYLE.'/games/game1.02.css" rel="stylesheet" type="text/css">';
CORE::$META['title']  = 'Todo - games over';

$flag = true;

if (isset($_GET['key1'])) {
    if ($_GET['key1'] == 'lose') {
        $title = 'ИГРА В ГОРОДА';
        $result = 'lose';
        $url = 'cities';
        $flag = false;
    } elseif ($_GET['key1'] == 'win') {
        $title = 'ИГРА В ГОРОДА';
        $result = 'win';
        $url = 'cities';
        $flag = false;
    }
}

if ($flag) {
    if (isset($_SESSION['user_hp'],$_SESSION['server_hp']) ) {
        if ($_SESSION['user_hp'] <=0 ) {
            $title = 'БИТВА АЛКОГОЛИКОВ';
            $result = 'lose';
            $url = 'alcoholics';
            unset($_SESSION['user_hp']);
            unset($_SESSION['server_hp']);
        } elseif ($_SESSION['server_hp'] <=0) {
            $title = 'БИТВА АЛКОГОЛИКОВ';
            $result = 'win';
            $url = 'alcoholics';
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
}