<?php
CORE::$CSS[] = '<link href="/css/'.CORE::$STYLE.'/chat1.01.css" rel="stylesheet" type="text/css">';
CORE::$JS[]  = '<script defer src="/js/'.CORE::$STYLE.'/chat/chat1.01.js"></script>';
CORE::$JS[]  = '<script defer src="/js/'.CORE::$STYLE.'/chat/jquery.nicescroll.min.js"></script>';
CORE::$META['title']  = 'Todo - chat';

$res = q ("
    SELECT * FROM `chat`
    ORDER BY `id` DESC
    LIMIT 1
");