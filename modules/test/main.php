<?php
CORE::$CSS[] = '<link href="/css/'.CORE::$STYLE.'/test.css" rel="stylesheet" type="text/css">';
CORE::$CSS[] = '<link rel="stylesheet" type="text/css" href="/bower/fancybox/jquery.fancybox.min.css">';
CORE::$JS[]  = '<script src="/bower/fancybox/jquery.fancybox.min.js"></script>';
CORE::$JS[]  = '<script defer src="/js/'.CORE::$STYLE.'/test.js"></script>';

if (isset($_FILES['file'])) {
    Uploader::$proportion['to'] = 5;
    Uploader::$min_size = 4000;
    Uploader::$max_size = 4000000;
    $info = Uploader::upload($_FILES['file']);
    if (!$info['error']) {
        Uploader::resize(500,500, $info, 'width', 'width');
    } else {
        $err = $info['err_text'];
    }
}
date_default_timezone_set('Europe/Kiev');
echo date("Y-m-d H:i:s").'<br>';
echo strtotime(date("Y-m-d H:i:s")) - strtotime('2017-11-20 23:48:40');
// ==== перегонка значений без дубликатов из таблицы cities в таблицу cities2 ==========
//
//    $name = array();
//    $res = q("
//      SELECT DISTINCT `name_ru` FROM `cities`
//    ");
//    while ($row = $res->fetch_assoc()) {
//        $name[] = "('".es(trim($row['name_ru']))."')";
//    }
//    $res->close();
//    $query_string = implode(',', $name);
//    $res = q("
//        INSERT INTO `cities2` (`name_ru`)
//        VALUES ".$query_string.";
//    ");


/*
// ЗАДАЧА 9: НЕ ЛЮБЛЮ ДЛИННЫЕ СЛОВА
$string = 'я купил бронетранспортер вчера';
$string = explode(' ', $string);
foreach ($string as $k => $v) {
    if (mb_strlen($v) > 6) {
        preg_match('#.{6}#ui', $v, $matches);
        $string[$k] = $matches[0].'*';
    }
}
$string = implode(' ', $string);
echo $string;
echo '<hr>';

// ЗАДАЧА 20: НЕ ВЫВОДИТЬ ДУБЛИ
$array = array(1,1,1,2,2,2,2,3);
$new_array = array();
foreach ($array as $v) {
    if (!in_array($v, $new_array)) {
        $new_array[] = $v;
        echo $v.'<br>';
    }
}

*/
/**
 *	Задачник. После каждого $array мы ОБЯЗАНЫ написать прям тут нужный нам код. Прогнать массив $array через foreach и обработать по заданию из $q.
 *	$q - массивы, то есть могут содержать несколько заданий, каждый из которых будет работать с имеющимся массивом
 *	Если у нас в задаче замена, но мы производим замену и выводим: $text = preg_replace('что','на что',$text),
 *	Если у нас в задаче поиск, то производим проверку через if-else и выводим: строку
 *	echo 'В такой-то строке: '.htmlspecialchars($array[$k]).' регулярка прошла УСПЕШНО или НЕ УСПЕШНО (подставить в if-else)';
 *	и если у нас поиск, то дополнительно вывести весь массив $matches, И нужную найденную строку, если нам надо её получить echo $matches[0][1] <- пример
 *  Задачки подготовил Inpost специально для курсов. Дата: 5 января 2012 года
 *	skype: imbalance_hero , пишите :)
 */

/**
 *	Подсказки:
 *	^ - начало строки, если указали, то проверка идёт от начала!
 *	$ - конец строки
 *	\s - пробел
 *	\t - табуляция
 *	* - {0,}
 *	+ - {1,}
 *	. - любой символ!
 *	Модификаторы:
 *	u - работаем в кодировке UTF-8
 *	i - регистронезависимый текст
 *	U - отмена жадного поиска
 *	Общие данные:
 *	[] - область допустимых символов в КОНКРЕТНОМ символе. [a-z]{3} <- 3 символа любых из a-z, вплоть даже до 3-х повторяющихся
 *	{} - количество символов, если не стоит, значит 1 символ! Если записано одно число, то РОВНОЕ значение, если 2, то min,max
 *	() - логические скобки И/ИЛИ карман, куда попадают данные
 */


$response['login'] = 'Поле обзательно';
echo array_key_exists ('err', $response);

// Task 1
$array = array(
    'Ваш логин: Inpost. Добро пожаловать',
    'Ваш логин: Николай. Добро пожаловать',
    'Ваш логин: Анна Семинович. Добро пожаловать',
    'Ваш логин: Борис_Бурда-2. Добро пожаловать',
);

$q = 'Поиском достать логин. 
      Особенности: логин стоит после двухиточия, может представлять из себя рус и англ символы, пробелы, тире и подчеркивание. 
	  Для для того, чтобы достать чистый логин, воспользуемся карманом (скобками)';

$res_array1 = array ();
foreach ($array as $v) {
    if (preg_match('#:\s([\sa-zа-яё_-]+)\.#iu', $v, $matches)) {
        $res_array1[] = $matches[1];
    }
}

// Task 2
$array = array(
    'main',
    'READ',
    'news"&\\/files',
    '../../index',
    'news',
    'kill_crash-and-destroy',
    'loveYou',
);

$q = 'Проверить допустимые имена файлов
      Важно заметить, что мы в юникс-системе будем использовать как большие, так и маленькие символы.
	  Необходимо недопустить попадания ТОЛЬКО запрещенных файловой системой имён, а так же попытки перейти между каталогами';

$fail_chars = preg_quote ('\/:*"<>|'); // больше вариантов запрещенных символов тут: https://ru.wikipedia.org/wiki/%D0%98%D0%BC%D1%8F_%D1%84%D0%B0%D0%B9%D0%BB%D0%B0
$fail_names = array ();
$good_names = array ();
foreach ($array as $v) {
    if (preg_match('#['.$fail_chars.']#ui', $v) ) {
        $fail_names[] = $v;
    } else {
        $good_names[] = $v;
    }
}

// Task 3
$array = array(
    'file.jpg',
    'file.jpeg',
    'zzz.png',
    'afafaf.php',
    'quad.jpg.',
    'quad2.JPG',
    'quad3.jpg.vir',
    'gif.doc',
    'file.virus',
);

$q = 'Загрузка фотографий. Необходимо допустить ТОЛЬКО: jpg,png,gif расширения
	  Важной особенностью будет то, что поиск лучше осуществлять с конца строки $ .
	  Интересный момент, что можно попасться на ошибку Попова :)';

$valid_img = array ();
$invalid_img = array ();
foreach ($array as $v) {
    if (preg_match('#\.(jpe?g|png|gif)$#ui',$v)){
        $valid_img[] = $v;
    } else {
        $invalid_img[] = $v;
    }
}

//Task4
$array = array(
    'Длинная строка. Главное, что мы научимся с ней идеально работать.  HOW do you do? Вот так и живём.Классно!',
);

$q = array(
    'Одна строка, заданий много:',
    'Получить все слова. Самая простая регулярка, поиск по всей строке, указать надо лишь допустимые символы и количество',
    'Получить все английские слова.',
    'Получить слова, которые стоят после точки. Обращаю внимание, что пробел после точки может БЫТЬ и даже не один, а может и не быть, символ пробела: \s',
    'Необходимо получить 5 символов от начала строки. Начало строки: ^ , и не забудем использовать кармашек, чтобы туда ушел нужный нам символ',
    'Получить все слова, в которых первым символ будет начинаться с большой буквы. Подсказка, необходимо использовать 2 квадратных скобки!',
);

preg_match_all('#[a-zа-яё]+#ui',$array[0],$matches1);
preg_match_all('#[a-z]+#ui',$array[0],$matches2);
preg_match_all('#\.\s*([a-zа-яё]+)#ui',$array[0],$matches3);
preg_match_all('#^(.)(.)(.)(.)(.)#ui',$array[0],$matches4);
preg_match_all('#[A-ZА-ЯЁ][A-ZА-ЯЁa-zа-яё]+#u',$array[0],$matches5);
preg_match_all('#^.{4}(.)#ui',$array[0],$matches6); // достали 5-й символ (доп задание)

//Task 5
$array = array(
    '2.2, 10, 22, 2.1, 2.5, 10.10, 500.1, 77, 10.11.12.13, 10.2 ,   0.2, .6, 0.333'
);

$q = array(
    'Достать ВСЕ дробные числа. Дробные - это числа, разделенные точкой',
);

$frac = array();
/* 1-й вариант с использованием нескольких регулярок

preg_match_all ('#(.*),#uU',$array[0], $matches); //изъятие чисел (набора символов), разделенных запятой
preg_match ('#,([^,]*)$#uU',$array[0], $additional); //изъятие последнего числа (набора символов)
$matches[1][] = $additional[1];
foreach ($matches[1] as $v) {
    if( preg_match('#^\s*\d+\.\d+\s*$#u',$v) ) {
        $frac[] = trim($v);
    }
}
*/

// 2-й вариант с использованием 1-го регулярного выражения
preg_match_all('#(^|\s|,)(\d+\.\d+)($|\s|,)#ui', $array[0], $matches);
$frac = $matches[2];

//Task 6
$array6 = array(
    'site.ru',
    'barakuda',
    'zimbabwe_ru',
    'zimbabwe',
    'zzz-zimbabwe',
    'http://site.ru',
    'www.site.com',
    'www.zimbabwe.com..........',
    'zimbabwe.com.ua',
    'http://zimbabwe.ru',
    'http://www.zimbabwe.com.'
);

$q = array(
    'Получить ссылки на реальные сайты (обязательно доменное имя), где имя сайта zimbabwe',
    'Немного сложная работа со строкой. Осуществить проверку каждого слова на присутствие в начале http://, и там, где его нет - дописать.
	 Для этих целей используем обход цикла foreach, и проверку preg_match. Не забываем про экранизацию при помощи preg_quote',
    'Похожее задание, но для сайтов, где не указано доменное имя - дописать .ru, это продолжение предыдущего задания, делается так же само, в одном цикле, просто 2 отдельных условия!',
);

$zimbabwe_links = array();
foreach ($array6 as $k => $v) {
    if (preg_match('#^(http\://)?(w{3}\.)?zimbabwe\.(ru|com|com\.ua)\.*$#ui',$v, $matches)) {
        $zimbabwe_links[] = $matches;
    }
    if (!preg_match('#^http\://#ui', $v)) {
        $array6[$k] = 'http://'.$v;
    }
    if (!preg_match('#\.(ru|com|com\.ua)\.*$#ui', $v)) {
        $array6[$k] = $array6[$k].'.ru';
    }
}

/* Получение допустимых url-запросов к сайту zimbabwe + их редиректы (удаление www, добавление http:// и удаление точек в конце адреса)

$protocol = 'http://';
$protocol_screen = preg_quote ($protocol);
$sites_old = array (); // массив реальных сайтов до редиректа
$sites_new = array (); // массив реальных сайтов после редиректа
$domains = 'ru|com|com\.ua'; // допустимые доменные имена сайта
foreach ($array6 as $v) {
    if (preg_match ('#^'.$protocol_screen.'zimbabwe\.('.$domains.')\.*$#ui',$v)) {
        $sites_old[] = $v;
        $sites_new[] =  preg_replace ('#\.*$#u' ,'' , $v);
    } elseif (preg_match ('#^'.$protocol_screen.'www\.zimbabwe\.('.$domains.')\.*$#ui',$v)) {
        $sites_old[] = $v;
        $sites_new[] = 	preg_replace ('#^'.$protocol_screen.'www\.#ui' , $protocol , preg_replace ('#\.*$#u' ,'' , $v));
    } elseif (preg_match ('#^zimbabwe\.('.$domains.')\.*$#ui',$v)) {
        $sites_old[] = $v;
        $sites_new[] = $protocol.preg_replace ('#\.*$#u' ,'' , $v);
    } elseif (preg_match ('#^www\.zimbabwe\.('.$domains.')\.*$#ui',$v)) {
        $sites_old[] = $v;
        $sites_new[] = preg_replace ('#^www\.#ui' , $protocol , preg_replace ('#\.*$#u' ,'' , $v));
    }
}
*/

//Task7
$array7 = array(
    'inpost',
    'Barabulka_ru',
    'Zimbabwe.ru',
    'Max',
    'Yojik',
    'Иван Тарасов',
    'Ёжик',
    'Борис Николаевич Кощуновский',
    'Ооооооооооооооооооооочень длинное имя',
    'Я',
    'go->drink->die',
    'Don`t sleep',
    '<Пивасик',
    '1',
    '123456789',
    '77777',
    '7ф777я7',
);

$q = array(
    'Теперь идут операции по работе с логинами и паролями. Очень важно именно при РЕГИСТРАЦИИ:',
    'Проверка на preg_match, разрешить только числам. Подсказка: числа точно так же как и буквы, а именно 0-9 (а-я)',
    'Пропустить только строки, состоящие из цифр 7 и символов ф,я',
    'Пропустить только рус и англ символы, подчеркивание и тире, пробел(!) длиной от 4 до 15 символов',
    'Выбрать логин, который начинается на M и заканчивается на x , я говорю про Max',
);

$res1 = array ();
$res2 = array ();
$res3 = array ();
$res4 = array ();

foreach ($array7 as $v) {
    if (preg_match('#^\d+$#u',$v) ) {
        $res1[] = $v;
    }
    if (preg_match('#^[7фя]+$#u',$v) ) {
        $res2[] = $v;
    }
    if (preg_match('#^[-A-ZА-ЯЁ_\s]{4,15}+$#iu',$v) ) {
        $res3[] = $v;
    }
    if (preg_match('#^(M|М).*(x|х)$#u',$v) ) {
        $res4[] = $v;
    }
}

//Task8
$array = array(
    'Я тебя ооооочеень            СИЛЬНО            ЛЮБЛЮ          МОЙ                    ДругБорис! Цёми-Цёми,    Пративный!',
);

$q = array(
    'Вчера писал для себя. Заменить подряд идущие пробелы на один. Чтобы не было их так много. preg_replace',
);

$str_without_spc = preg_replace ('#\s{2,}#u',' ',$array[0]);


//Task 9
$array = array(
    'Дата публикации: 27 августа 08:43. Был отличный год!',
);

$q = array(
    'Строку мы знаем, меняется лишь день,месяц,время. Необходимо достать:',
    'Время, когда опубликовали',
    'Полностью дату, а именно (27 августа 08:43), она может меняться!',
);
$all_monthes = 'января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря';
$no_febr = 'января|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря';
$longest_monthes = 'января|марта|мая|июля|августа|октября|декабря';

if (preg_match('#([0,1]\d|2[0-3]):[0-5]\d#ui',$array[0],$matches)) {
    $publ_time = $matches[0];
} else {
    $publ_time = 'Incorrect time!';
}

if (preg_match('#\s[0,1]?[1-9]\s+('.$all_monthes.')|2\d\s+('.$no_febr.')|2[0-8]\s+февраля|30\s+('.$no_febr.')|31\s+('.$longest_monthes.')#ui',$array[0],$matches)) {
    $publ_date = trim($matches[0]);
} else {
    $publ_date = 'Incorrect date!';
}

if ($publ_date != 'Incorrect date!' && $publ_time != 'Incorrect time!') {
    $publ_date_time = $publ_date.' '.$publ_time;
}

//Task 10
$array = array(
    '<a href="file.php">Это ссылка, и тут было классно</a>',
    '<a    href     =       "file.php"     >Это ссылка, и тут было классно</a>',
    '<a    href=file.php >Это ссылка, и тут было классно</a>',
    "<a    href='file.php' >Это ссылка, и тут было классно</a>",
);

$q = array(
    'Используем карманы, необходимо получить путь, куда ссылается и текст внутри тега!
	 Стоит обратить внимание на момент, где символ МОЖЕТ БЫТЬ, а может и не БЫТЬ',
);

$link = array ();
$intag = array ();
foreach ($array as $v) {
    if(preg_match('#href\s*=\s*[\'"]?([^"\']+)[\'"]?\s*\>(.*)\<#ui',$v,$matches)) {
        $link[] = $matches[1];
        $intag[] = $matches[2];
    }
}

//Task 11
$array = array(
    'text@',
    'yandex@@mega.com',
    'beer@mail.com',
    "inpost.dp.ua",
    "inpostdpua@gmail.com",
);

$q = array(
    'Проверить на валидность е-мейла. Краткая информация (ВАЖНАЯ!), емеил состоит из набора символов маленьких. 
	 Присутствует в центре собака, слева имя ящика, которое может состоять из обычных символов англ И подчеркивания И тире.
	 Справа находятся домены, отделенные точками.',
);

// email = имя_ящика@компоненты.суффикс, компоненты не обязательны
$good_emails = array ();
foreach ($array as $v) {
    if (preg_match('#^[a-z]+(\.[-a-z_]+)*@([a-z0-9]([-a-z0-9]{0,61}[a-z0-9])?\.)*[a-z]{2,4}$#u',$v) ) {
        $good_emails[] = $v;
    }
}