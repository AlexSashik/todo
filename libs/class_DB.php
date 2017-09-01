<?php
class DB { 
	static public $mysqli  = array();
	static public $connect = array();
			
	static public function _ ($key = 0) {
		if (!isset(self::$mysqli[$key]) ) {
			if (!isset(self::$connect['server'])) {
				$connect['server'] = CORE::$DB_HOST;
			}
			if (!isset(self::$connect['user'])) {
				$connect['user'] = CORE::$DB_LOGIN;
			}
			if (!isset(self::$connect['pass'])) {
				$connect['pass'] = CORE::$DB_PASS;
			}
			if (!isset(self::$connect['db'])) {
				$connect['db'] = CORE::$DB_NAME;
			}
			
			self::$mysqli[$key] = @new mysqli($connect['server'], $connect['user'], $connect['pass'], $connect['db']); 
			//Почему с self::$connect[''] не работает, а на уроке - работает????????????????????????????????????????????
			
			if (mysqli_connect_errno () ) {
				echo "Не удалось подключилься к базе данных.";
				exit;
			}
			
			if (!self::$mysqli[$key]->set_charset("utf8") ) {
				echo "Ошибка при загрузке набора символов utf-8: ".self::$mysqli[$key]->error;
				exit;
			}
		}
		
		return self::$mysqli[$key];
	}
	
	static public function close($key = 0) {
		self::$mysqli[$key]->close();
		unset (self::$mysqli[$key]);
	}

}