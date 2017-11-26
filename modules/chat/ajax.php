<?php
function chars2smiles ($string) {
    $string = preg_replace('#'.preg_quote(":D").'#i','<span class="smile1"></span>', $string);
    $string = preg_replace('#'.preg_quote(":''(").'#i','<span class="smile2"></span>', $string);
    $string = preg_replace('#'.preg_quote("^_^").'#i','<span class="smile3"></span>', $string);
    $string = preg_replace('#'.preg_quote(":-*").'#i','<span class="smile4"></span>', $string);
    $string = preg_replace('#'.preg_quote("&gt;:-(").'#i','<span class="smile5"></span>', $string);
    $string = preg_replace('#'.preg_quote(":'(").'#i','<span class="smile6"></span>', $string);
    $string = preg_replace('#'.preg_quote(";)").'#i','<span class="smile7"></span>', $string);
    $string = preg_replace('#'.preg_quote(":)").'#i','<span class="smile8"></span>', $string);
    $string = preg_replace('#'.preg_quote("B)").'#i','<span class="smile9"></span>', $string);
    return $string;
}

// Обновление чата
if (isset($_POST['query'], $_POST['lastId'])) {
    $res = q("
        SELECT * FROM `chat`
        WHERE `date` >= NOW() - INTERVAL 2 SECOND AND `id` > ".(int)$_POST['lastId']."
    ");
    $response = array();
    while($row = $res->fetch_assoc()) {
        if (preg_match('#^'.$_SESSION['user']['login'].',\s#u', $row['text'], $matches)) {
            $response['forme'] = true;
        }
        $response['id'][] = $row['id'];
        $response['login'][] = htmlspecialchars($row['login']);
        $row['text'] = chars2smiles(htmlspecialchars($row['text'], ENT_COMPAT));
        $response['text'][] = $row['text'];
    }
    echo json_encode($response);
    exit;
}

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
        $_POST['text'] = chars2smiles(htmlspecialchars($_POST['text'], ENT_COMPAT));
        $response['text']  = $_POST['text'];
        echo json_encode($response);
        exit;
    }
}

// вывод списка пользователей + их модерация
if (isset($_POST['query'], $_POST['id']) && $_POST['query'] == 'usersList') {
    $response = array();
    if (isset($_SESSION['user']) && $_SESSION['user']['access'] == 5) {
        $response['status'] = 'admin';
        if ((int)$_POST['id'] >= 0) {
            $res = q("
              UPDATE `users` SET
              `access` = 
                CASE `access`
                  WHEN 0 THEN 1
                  WHEN 1 THEN 0
                END 
              WHERE `id` = ".(int)$_POST['id']."
            ");
        }
    }
    $res = q("
      SELECT * FROM `users`
      WHERE `access` >= 0
    ");
    while($row = $res->fetch_assoc()) {
        if ($row['access'] > 0) {
            if ($row['access'] == 5) {
                $response['admin'][] = htmlspecialchars($row['login']);
            } elseif ($row['online'] == 1 && (strtotime(date('Y-m-d H:i:s')) - strtotime($row['last_active_date'])) < 300) {
                $response['online'][] = array (
                    'id' => $row['id'],
                    'login' => htmlspecialchars($row['login'])
                );
            } else {
                $response['offline'][] = array (
                    'id' => $row['id'],
                    'login' => htmlspecialchars($row['login'])
                );
            }
        } else {
            $response['ban'][] = array (
                'id' => $row['id'],
                'login' => htmlspecialchars($row['login'])
            );
        }
    }
    echo json_encode($response);
    exit;
}