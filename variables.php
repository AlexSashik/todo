<?php
	
if(isset ($_GET['route'])) {
	$temp = explode ('/',$_GET['route']);
	
	if ($temp[0] == 'index.php') {
		array_shift($temp);
	}
		
	if (!empty($temp) && $temp[0] == 'admin' ) {
		CORE::$CONTR = CORE::$CONTR.'/admin';
		CORE::$STYLE = 'admin';
		CORE::$META['description'] = '';
		CORE::$META['keywords']    = '';
		CORE::$META['title']       = 'TodoCMS';
		array_shift($temp);
	} elseif (!empty($temp) && $temp[0] == 'demo' ) {
        CORE::$CONTR = CORE::$CONTR.'/demo';
        CORE::$STYLE = 'demo';
        CORE::$META['description'] = '';
        CORE::$META['keywords']    = '';
        CORE::$META['title']       = 'Todo-Demo';
        array_shift($temp);
    } elseif (!empty($temp) && $temp[0] == 'vatel' ) {
        CORE::$CONTR = CORE::$CONTR . '/vatel';
        CORE::$STYLE = 'vatel';
        CORE::$META['description'] = '';
        CORE::$META['keywords'] = '';
        CORE::$META['title'] = 'Vatel';
        array_shift($temp);
    }

	foreach ($temp as $k => $v) {
		switch ($k) {
			case 0:
				if (!empty($v) ) {
					$_GET['module'] = $v;
				}
				break;
			case 1:
				if (!empty($v) ) {
					$_GET['page'] = $v;
				}
				break;
			default:
			$_GET['key'.($k-1)] = $v;
		}
	}
	unset ($_GET['route']);
}

if (isset($_GET['module'], $_GET['page'], $_GET['key1'], $_GET['key2'], $_GET['key3']) && $_GET['module'] == 'home' && $_GET['page'] == 'todo00' && $_GET['key1'] == 'todo.kh.ua' && $_GET['key2'] == 'www' && $_GET['key3'] == 'todo.kh.ua') {
	header ("Location: / ");
	exit;
}
	
if (CORE::$STYLE == 'admin') {
	//Допустимые значения модулей и страниц админки
	$modules_and_pages = array (
		'static'  => array ('main'),
		'goods'   => array ('main', 'add', 'edit'),
		'users'   => array ('main', 'edit'),
		'books'   => array ('main', 'add', 'edit'),
        'authors' => array ('main', 'add', 'edit'),
        'cab'     => array ('main')
	);
} elseif (CORE::$STYLE == 'demo' || CORE::$STYLE == 'vatel') {
    //Допустимые значения модулей и страниц демо-страниц Agrolux и Vatel
    $modules_and_pages = array (
        'static'  => array ('main')
    );
} else {
	//Допустимые значения модулей и страниц главной части сайта
	$modules_and_pages = array (
		'static'   	 => array ('main'),
		'calculator' => array ('main'),
		'games'  	 => array ('main', 'alcoholics', 'gameover', 'cities', 'ajax'),
		'mvc'		 => array ('main'),
		'comments'   => array ('main', 'ajax'),
		'goods'      => array ('main', 'description'),
		'books'      => array ('main', 'authors'),
		'cab'        => array ('main', 'reg', 'exit'),
		'errors'     => array ('400', '403', '404', '500'),
        'test'       => array ('main'),
        'chat'       => array ('main', 'userlist', 'send', 'refresh')
	);
}
	
if (!(isset($_GET['module']))) {
	$_GET['module'] = 'static';
	$_GET['page'] = 'main';
} elseif (!preg_match('#^[a-z0-9-_]*$#ui',$_GET['module']) ) {
	header ("Location: /errors/404");
	exit;
} elseif ( array_key_exists($_GET['module'],$modules_and_pages)) {
	if (!(isset($_GET['page']))) {
		$_GET['page'] = 'main';
	} elseif (!preg_match('#^[a-z0-9-_]*$#ui',$_GET['page'])) {
		header ("Location: /errors/404");
		exit;
	} elseif (!(in_array($_GET['page'], $modules_and_pages[''.$_GET['module'].'']))) {
		header ("Location: /errors/404");
		exit;
	}
} else {
	header ("Location: /errors/404");
	exit;
}	