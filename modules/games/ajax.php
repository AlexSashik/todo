<?php

if (!isset($_GET['ajax'])) {
    header ('Location: /errors/404');
    exit;
}

if (isset($_POST['city'], $_POST['named_cities']) && is_array($_POST['named_cities'])) {
    $_POST = trimAll($_POST);

    $row = array();
    $res = q("
        SELECT * FROM `cities`
        WHERE `name_ru` = '".es($_POST['city'])."'
    ");
    if ($res->num_rows) {
        $row = $res->fetch_assoc();
        $res->close();
        $city_arr = mbStringToArray(trim($row['name_ru']));
        $city_arr = array_reverse($city_arr);
        foreach ($city_arr as $v) {
            if ($v != 'ъ' && $v != 'ь' && $v != 'ы') {
                if ($v == 'й') {
                    $letter = 'и';
                    break;
                }  elseif ($v == 'ё') {
                    $letter = 'е';
                    break;
                } else {
                    $letter = $v;
                    break;
                }
            }
        }

        // ответ сервера
        $row = array();
        foreach ($_POST['named_cities'] as $k => $v) {
            $_POST['named_cities'][$k] = "'".es($v)."'";
        }
        $for_res = "AND `name_ru` NOT IN (".implode(',', $_POST['named_cities']).") ";

        $res = q("
            SELECT * FROM `cities`
            WHERE `name_ru` LIKE '".es($letter)."%' ".$for_res." AND `name_ru` <> '".es($_POST['city'])."'
            ORDER BY RAND()
        ");
        if ($res->num_rows) {
            $row = $res->fetch_assoc();
            $res->close();
            $city_arr = mbStringToArray(trim($row['name_ru']));
            $city_arr = array_reverse($city_arr);
            foreach ($city_arr as $v) {
                if ($v != 'ъ' && $v != 'ь'  && $v != 'ы') {
                    if ($v == 'й') {
                        $letter = 'и';
                        break;
                    }  elseif ($v == 'ё') {
                        $letter = 'е';
                        break;
                    } else {
                        $letter = $v;
                        break;
                    }
                }
            }
            $response = array(
                'name' => htmlspecialchars($row['name_ru']),
                'letter' => htmlspecialchars($letter)
            );
        } else {
            $response = array (
                'status' => 'win',
                'cause'  => 'Сервер в замешательстве',
                'dsf'    => $letter
            );
        }

    } else {
        $response = array (
            'status' => 'lose',
            'cause'  => htmlspecialchars($_POST['city']).' - такого города не существует'
        );
    }

    echo json_encode($response);
}