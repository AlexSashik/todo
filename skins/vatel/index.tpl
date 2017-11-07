<!DOCTYPE html>
<html lang="ru" prefix="og: http://ogp.me/ns#">
<head>
    <meta charset="UTF-8">
    <title><?php echo CORE::$META['title'];?></title>

    <meta name="description" content="<?php echo CORE::$META['description'];?>">
    <meta name="keywords" content="<?php echo CORE::$META['keywords'];?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="robots" content="index, follow">
    <meta name = "viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-dns-prefetch-control" content="on">
    <link rel="dns-prefetch" href="http://todo.kh.ua">
    <link rel="prefetch" href="/img/vatel/logo.png">
    <link rel="prefetch" href="/img/vatel/singers.jpg">
    <link rel="prefetch" href="/img/vatel/violin.jpg">
    <link rel="prefetch" href="/img/vatel/piano.jpg">
    <link rel="prefetch" href="/img/vatel/how-sprites.jpg">
    <link rel="prefetch" href="/img/vatel/sprites.png">
    <link rel="prefetch" href="/img/vatel/bg_partner.jpg">
    <link rel="prefetch" href="/img/vatel/response.jpg">
    <link rel="prefetch" href="/img/vatel/partners.png">

    <link rel="canonical" href="http://todo.kh.ua/vatel">
    <link rel="dns-prefetch" href="//www.youtube.com">

    <meta property="og:title" content="Vatel">
    <meta property="og:type" content="website">
    <meta property="og:image" content="http://todo.kh.ua/img/vatel/logo.png">
    <meta property="og:url" content="http://todo.kh.ua/vatel">
    <meta property="og:description" content="Музыкальный коллектив на праздник в Москве и МО">
    <meta property="og:locale" content="ru_RU" />


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
<body itemscope itemtype="http://schema.org/EntertainmentBusiness">
    <?php
    require_once "./skins/".CORE::$STYLE."/static/header.tpl";
    echo $content;
    require_once "./skins/".CORE::$STYLE."/static/footer.tpl";
    ?>

    <script type="application/ld+json">
       {
          "@context": "http://schema.org/",
          "@type": "EntertainmentBusiness",
          "url" : "http://todo.kh.ua/vatel",
          "logo" : "http://todo.kh.ua/img/vatel/logo.png",
          "image" : "http://todo.kh.ua/img/vatel/logo.png",
          "legalName" : "Праздничное агентство «Vatel»",
          "name": "Vatel",
          "telephone": "+7 (926) 586-80-03",
          "address": {
            "@type": "PostalAddress",
            "name": "Москва и МО"
          },
          "member": {
            "@type": "Thing",
            "name": "Светлана Чумакова и Константин Бовсуновский"
          }
       }
    </script>
</body>
</html>