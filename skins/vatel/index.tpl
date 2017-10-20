<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title><?php echo CORE::$META['title'];?></title>

    <meta name="description" content="<?php echo CORE::$META['description'];?>">
    <meta name="keywords" content="<?php echo CORE::$META['keywords'];?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="robots" content="index, follow">

    <link rel="icon" href="/img/vatel/favicon/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/img/vatel/favicon/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="/img/vatel/favicon/touch-icon-iphone.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/img/vatel/favicon/touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/img/vatel/favicon/touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/img/vatel/favicon/touch-icon-ipad-retina.png">

    <link rel="stylesheet" href="/bower/bootstrap/dist/css/bootstrap.min.css" type = "text/css">
    <link rel="stylesheet" href="/bower/bootstrap/dist/css/bootstrap-theme.min.css" type = "text/css">
    <?php if(isset(CORE::$CSS) ) echo implode("\n", CORE::$CSS);?>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="/bower/bootstrap/dist/js/bootstrap.min.js" defer></script>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js" defer></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js" defer></script>
    <![endif]-->
    <?php  if(isset(CORE::$JS) ) echo implode("\n		", CORE::$JS);?>

</head>
<body>
    <?php
    require_once "./skins/".CORE::$STYLE."/static/header.tpl";
    echo $content;
    require_once "./skins/".CORE::$STYLE."/static/footer.tpl";
    ?>
</body>
</html>