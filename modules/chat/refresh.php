<?php

// Обновление чата
if (isset($_POST['query'], $_POST['lastId'])) {
    $res = q("
        SELECT * FROM `chat`
        WHERE `date` >= NOW() - INTERVAL 2 SECOND AND `id` > ".(int)$_POST['lastId']."
    ");
    $response = array();
    while($row = $res->fetch_assoc()) {
        if (isset($_SESSION['user'])) {
            if ($_SESSION['user']['login'] == $row['login']) {
                continue;
            } elseif (preg_match('#^'.$_SESSION['user']['login'].',\s#u', $row['text'], $matches)) {
                $response['forme'] = true;
            }
        }
        $response['id'][] = $row['id'];
        $response['login'][] = htmlspecialchars($row['login']);
        $response['text'][] = htmlspecialchars($row['text']);
    }
    echo json_encode($response);
    exit;
}