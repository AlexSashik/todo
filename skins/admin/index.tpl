<!DOCTYPE html>
<html lang = "ru">

	<head>
		<meta http-equiv = "Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title><?php echo CORE::$META['title']; ?></title>
		<meta name = "description" content="<?php echo CORE::$META['description'];?>">
		<meta name = "keywords" content="<?php echo CORE::$META['keywords'];?>">
		<meta name = "viewport" content="width=device-width, initial-scale=1">

		<link href = "/img/admin/ico.png" rel="shortcut icon" type = "image/x-icon">

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <link rel="stylesheet" href="/bower/bootstrap/dist/css/bootstrap.min.css" type = "text/css">
        <link rel="stylesheet" href="/bower/bootstrap/dist/css/bootstrap-theme.min.css" type = "text/css">
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
		<link href="/css/<?php echo CORE::$STYLE?>/all_header_footer1.03.css" rel="stylesheet" type="text/css">
		<?php	if(isset(CORE::$CSS) ) echo implode("\n", CORE::$CSS);?>

        <script src="/bower/bootstrap/dist/js/bootstrap.min.js"></script>
		<script defer src="/js/<?php echo CORE::$STYLE?>/header_effects1.02.js"></script>
		<?php  	if(isset(CORE::$JS) ) echo implode("\n		", CORE::$JS);?>
		
	</head>

	<body>

        <?php
        if ($_GET['module'] != 'cab') {
            require_once "./skins/".CORE::$STYLE."/static/header.tpl";
        }
        echo $content;

        if ($_GET['module'] != 'cab') require_once "./skins/".CORE::$STYLE."/static/footer.tpl";?>

        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            })
        </script>
    </body>

</html>