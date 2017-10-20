<!DOCTYPE html>
<html lang="ru">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><?php echo CORE::$META['title']; ?></title>
		<meta name="description" content="<?php echo CORE::$META['description'];?>">
		<meta name="keywords" content="<?php echo CORE::$META['keywords'];?>">
		
		<link href="/img/default/ico.png" rel="shortcut icon" type="image/x-icon">
		<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="/css/<?php echo CORE::$STYLE?>/all_header_footer1.06.css" rel="stylesheet" type="text/css">
		<?php	if(isset(CORE::$CSS) ) echo implode("\n", CORE::$CSS);?>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

		<script defer src="/js/<?php echo CORE::$STYLE?>/header_effects1.02.js"></script>
		<?php  	if(isset(CORE::$JS) ) echo implode("\n		", CORE::$JS);?>
		
	</head>

	<body onload="<?php if(isset($_SESSION['login_comment'])) {echo 'login_comment()'; unset($_SESSION['login_comment']);}?>">
		
		<div id="wrapper">
				
			<div id="content">
				<?php
				require_once "./skins/".CORE::$STYLE."/static/header.tpl";
				echo $content;
				?>
			</div>
			
			<?php require_once "./skins/".CORE::$STYLE."/static/footer.tpl";?>
		</div>
		
	</body>

</html>