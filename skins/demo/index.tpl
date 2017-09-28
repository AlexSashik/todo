<!DOCTYPE html>
<html lang="ru">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><?php echo CORE::$META['title']; ?></title>
		<meta name="description" content="<?php echo CORE::$META['description'];?>">
		<meta name="keywords" content="<?php echo CORE::$META['keywords'];?>">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link href="/img/default/ico.png" rel="shortcut icon" type="image/x-icon">
		<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="/css/<?php echo CORE::$STYLE?>/all_header_footer1.01.css" rel="stylesheet" type="text/css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script defer src="/js/demo/all_header_footer1.00.js"></script>
		<?php
        if(isset(CORE::$CSS) ) echo implode("\n", CORE::$CSS);
        if(isset(CORE::$JS) ) echo implode("\n		", CORE::$JS);?>

	</head>

	<body>
        <!--[if lt IE 9]>
        <script>
            document.createElement("header" );
            document.createElement("footer" );
            document.createElement("nav"    );
            document.createElement("main"   );
            document.createElement("section");
            document.createElement("article");
            document.createElement("address" );
        </script>
        <noscript>
            <strong>Warning !</strong>
            Because your browser does not support HTML5, some elements are created using JavaScript.
            Unfortunately your browser has disabled scripting. Please enable it in order to display this page.
        </noscript>
        <![endif]-->
    	<?php
		require_once "./skins/".CORE::$STYLE."/static/header.tpl";
		echo $content;
        require_once "./skins/".CORE::$STYLE."/static/footer.tpl";
        ?>
		
	</body>

</html>