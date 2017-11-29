<?php

// Обновление чата
if (isset($_POST['query'], $_POST['lastId'])) {
    $response = array();
    $res = q("
        SELECT * FROM `chat`
        WHERE `id` > ".(int)$_POST['lastId']."
    ");
    while($row = $res->fetch_assoc()) {
        if (isset($_SESSION['user']) && preg_match('#^'.$_SESSION['user']['login'].',\s#u', $row['text'], $matches)) {
            $response['forme'] = true;
        }
        $response['id'][] = $row['id'];
        $response['login'][] = htmlspecialchars($row['login']);
        $response['text'][] = htmlspecialchars($row['text']);
    }
    if (isset($_SESSION['user']) && $_SESSION['user']['access'] == 5) {
        $response['status'] = 'admin';
    }
    echo json_encode($response);
    exit;
}