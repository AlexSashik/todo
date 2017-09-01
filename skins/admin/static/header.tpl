<div class="light_silver_background">
	<header>
		<a href="/admin" title="На главную">
			<img alt="" src="/img/admin/short-logo.png">
			<div class="cms">CMS</div>
		</a>
		<div class="salut">
			Здравствуйте, <?php echo htmlspecialchars($_SESSION['user']['login'])?>!
			<a href="/" title="Выйти из админки"><i class="fa fa-sign-out" aria-hidden="true"></i>Exit</a>
		</div>
	</header>
</div>
<div class="blue_background">
	<div class="under_header">
		<a class="nav <?php if ($_GET['module'] == 'static') echo 'active';?>" href="/admin">
            <i class="fa fa-home" aria-hidden="true"></i>
            Главная
        </a>
		<a class="nav <?php if ($_GET['module'] == 'goods') echo 'active';?>" href="/admin/goods">
            <i class="fa fa-shopping-basket" aria-hidden="true"></i>
            Товары
        </a>
		<a class="nav <?php if ($_GET['module'] == 'users') echo 'active';?>" href="/admin/users">
            <i class="fa fa-user" aria-hidden="true"></i>
            Пользователи
        </a>
		<a class="nav <?php if ($_GET['module'] == 'books') echo 'active';?>" href="/admin/books">
            <i class="fa fa-book" aria-hidden="true"></i>
            Книги
        </a>
        <a id="auth_nav" class="nav <?php if ($_GET['module'] == 'authors') echo 'active';?>" href="/admin/authors">
            <div id="auth"></div>
            Авторы
        </a>

		<a class="to_site" href="<?php
        if($_GET['module'] == 'goods')
		    echo '/goods';
		elseif ($_GET['module'] == 'books')
            echo '/books';
		elseif($_GET['module'] == 'authors')
            echo '/books/authors';
        else
            echo '/';
        ?>" target="_blank">
            <i class="fa fa-eye" aria-hidden="true"></i>
            Просмотр сайта
        </a>
	</div>
</div>

<div id="upward" class = "animate"></div>