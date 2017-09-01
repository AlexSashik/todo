<?php
function wtf ($array, $exit = 0) {
	echo "<pre>".htmlspecialchars(print_r($array,1))."</pre>";
	if ($exit == 1) exit();
}

function q ($query, $key = 0) {
	$res = DB::_($key)->query($query);
	if ($res === false) {
		$info = debug_backtrace();
		$error = "<strong>QUERY</strong>: ".htmlspecialchars($query)."<br>\n\r ".DB::_($key) -> error."<br>\n\r".
				 "<strong>FILE</strong>: ".$info[0]['file']."<br>\n\r". 
				 "<strong>LINE</strong>: approximately ".$info[0]['line']."<br>\n\r".
				 "<strong>DATE</strong>:".date("Y-m-d H:i:s")."<br>\n\r".
				 "========================================================================";
		file_put_contents ("./logs/mysql.log", strip_tags($error)."\n\n\r", FILE_APPEND);
		echo $error;
		exit();
	} else {
		return $res;
	}
}
	
function trimAll ($el) {
	if (!is_array($el)) {
		$el = trim($el);
	} else {
		$el = array_map('trimAll', $el);
	}
	return $el;
}

function intAll ($el) {
	if (!is_array($el)) {
		$el = (int)$el;
	} else {
		$el = array_map('intAll', $el);
	}
	return $el;
}
	
function floatAll ($el) {
	if (!is_array($el)) {
		$el = (float)$el;
	} else {
		$el = array_map('floatAll', $el);
	}
	return $el;
}
	
function es ($var, $key = 0) {
	return DB::_($key)->real_escape_string ($var);
}
	
function __autoload($class) {
	include './libs/class_'.$class.'.php';
}

function myHash($var) {
	$salt1 = 'alex';
	$salt2 = 'inpost';
	$var = crypt( md5($var.$salt1), $salt2);
	return $var;
}


// Функция устанавливает, является ли значение $comparable уникальным в колонке $column таблицы $table
function checkUnique ($table, $column, $comparable) {
	$res = q("
		SELECT * FROM `".es($table)."`
		WHERE `".es($column)."` = '".es($comparable)."'
	");
	if ($res->num_rows) {
		return false;
	} else {
		return true;
	}
}

// валидация даты формата 1989-02-25 с учетом високосных годов
function is_date($str) {
	if (preg_match('#^([\d]{4})-([\d]{2})-([\d]{2})$#ui', $str, $matches)) {
		if ($matches[2] == 0 || $matches[3] == 0) {
			$err = true;
		} else {
			if (in_array($matches[2], array (1, 3, 5, 7, 8, 10, 12))) {
				if ($matches[3] > 31) {
					$err = true;
				}
			} elseif (in_array($matches[2], array (4, 6, 9, 11))) {
				if ($matches[3] > 30) {
					$err = true;
				}
			} elseif ($matches[2] == 2) {
				$leap_year = ($matches[1] % 4 == 0 && ($matches[1] % 100 != 0 || $matches[1] % 400 == 0)) ? true : false;
				if (($leap_year && $matches[3] > 29) || (!$leap_year && $matches[3] > 28)) {
					$err = true;
				}
			} else {
				$err = true;
			}
		}
	} else {
		$err = true;
	}
	
	if (isset($err)) {
		return false; 
	} else {
		return true;
	}
}

// Преобразует строку в массив
function mbStringToArray($string, $encoding = 'UTF-8') {
    $strlen = mb_strlen($string);
    while ($strlen) {
        $array[] = mb_substr($string, 0, 1, $encoding);
        $string = mb_substr($string, 1, $strlen, $encoding);
        $strlen = mb_strlen($string, $encoding);
    }
    return ($array);
}