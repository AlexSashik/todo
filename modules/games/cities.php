<?php

CORE::$CSS[] = '<link href="/css/'.CORE::$STYLE.'/games/game2.01.css" rel="stylesheet" type="text/css">';
CORE::$JS[]  = '<script defer src="/js/'.CORE::$STYLE.'/game2.05.js"></script>';
CORE::$META['title']  = 'Todo - games - the cities';

$_SESSION['user_hp_cities']   = 3;
$_SESSION['server_hp_cities'] = 3;