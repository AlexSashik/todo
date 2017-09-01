<!DOCTYPE html>
<html lang = "ru">

	<head>
		<meta http-equiv = "Content-Type" content="text/html; charset=utf-8">
		<title><?php echo CORE::$META['title']; ?></title>
		<meta name = "description" content="<?php echo CORE::$META['description'];?>">
		<meta name = "keywords" content="<?php echo CORE::$META['keywords'];?>">
		<meta name = "viewport" content="width=device-width, initial-scale=1">

		<link href = "/img/admin/ico.png" rel="shortcut icon" type = "image/x-icon">
		<link href = "/css/font-awesome.min.css" rel = "stylesheet" type = "text/css">
		<link href="/css/<?php echo CORE::$STYLE?>/all_header_footer1.02.css" rel="stylesheet" type="text/css">
		<?php	if(isset(CORE::$CSS) ) echo implode("\n", CORE::$CSS);?>
		
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
		<script defer src="/js/<?php echo CORE::$STYLE?>/header_effects1.01.js"></script>
		<?php  	if(isset(CORE::$JS) ) echo implode("\n		", CORE::$JS);?>
		
	</head>

	<body>
		
		<div id = "wrapper">
				
			<div id = "content">
				<?php 
                if ($_GET['module'] != 'cab') {
                    require_once "./skins/".CORE::$STYLE."/static/header.tpl";
                }
                echo $content;
               	?>
			</div>
			
			<?php if ($_GET['module'] != 'cab') require_once "./skins/".CORE::$STYLE."/static/footer.tpl";?>
		</div>
		
	</body>

</html>