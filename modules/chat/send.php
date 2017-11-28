<?php

//Добавление сообщения
if (isset($_POST['text'])) {
    $_POST = trimAll($_POST);
    $response = array();
    if (!isset($_SESSION['user']) || $_SESSION['user']['access'] < 0) {
        $response['err'] = 'NO';
        echo json_encode($response);
        exit;
    } elseif ($_SESSION['user']['access'] == 0) {
        $response['err'] = 'BAN';
        echo json_encode($response);
        exit;
    }

    if (!empty($_POST['text'])) {
        q("
            INSERT INTO `chat` SET
            `login` = '".es($_SESSION['user']['login'])."',
            `text`  = '".es($_POST['text'])."',
            `date`  = NOW()
        ");
        $response['login'] = htmlspecialchars($_SESSION['user']['login']);
        $response['text']  = htmlspecialchars($_POST['text']);
        echo json_encode($response);
        exit;
    }
}