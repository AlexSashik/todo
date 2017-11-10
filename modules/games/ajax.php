<?php

if (!isset($_GET['ajax'])) {
    header ('Location: /errors/404');
    exit;
}

if (isset($_POST['city'], $_POST['named_cities']) && is_array($_POST['named_cities'])) {
    $_POST = trimAll($_POST);
    $probability = 97.3;

    // функция определения последней буквы слова, с которой может начинаться новый город
    function lastLetterSearch ($string) {
        $city_arr = array_reverse(mbStringToArray(trim($string)));
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

        if (!isset($letter)) $letter = 'a';

        return $letter;
    }

    if ($_POST['city'] == 'false') {
        if (empty($_POST['named_cities'][count($_POST['named_cities'])-1])) {
            $letter = 'а';
            $probability = 100;
        } else {
            $letter = lastLetterSearch($_POST['named_cities'][count($_POST['named_cities'])-1]);
        }

        if (rand(0,100) <= $probability) {
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
                $letter = lastLetterSearch($row['name_ru']);
                $response = array(
                    'name' => htmlspecialchars($row['name_ru']),
                    'letter' => htmlspecialchars($letter),
                    'absence' => 1
                );
            } else {
                $response = array (
                    'status' => 'win',
                    'cause'  => 'Компьютор в замешательстве',
                    'letter'    => $letter,
                    'absence' => 1
                );
            }
        } else {
            $response = array (
                'status'  => 'win',
                'cause'   => 'Компьютор в замешательстве',
                'letter'  => $letter,
                'absence' => 1
            );
        }
    } else {
        $row = array();
        $res = q("
            SELECT * FROM `cities`
            WHERE `name_ru` = '".es($_POST['city'])."'
        ");

        if ($res->num_rows) {
            $row = $res->fetch_assoc();
            $res->close();
            $letter = lastLetterSearch($row['name_ru']);

            // ответ сервера

            if (rand(0,100) <= $probability) {
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
                    $letter = lastLetterSearch($row['name_ru']);
                    $response = array(
                        'name' => htmlspecialchars($row['name_ru']),
                        'letter' => htmlspecialchars($letter)
                    );
                } else {
                    $response = array (
                        'status' => 'win',
                        'cause'  => 'Компьютор в замешательстве',
                        'letter'    => $letter
                    );
                }
            } else {
                $response = array (
                    'status' => 'win',
                    'cause'  => 'Компьютор в замешательстве',
                    'letter'    => $letter
                );
            }
        } else {
            $response = array (
                'status' => 'lose',
                'cause'  => htmlspecialchars($_POST['city']).' - такого города не существует'
            );
        }
    }
    echo json_encode($response);
}