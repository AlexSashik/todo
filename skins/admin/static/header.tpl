<header>
    <div class="container">
        <div class="row">
            <div class="col-xs-4 col-sm-6 col-md-6 col-lg-6">
                <a href="/admin" title="На главную" data-toggle="tooltip" data-placement="bottom"><img alt="" src="/img/admin/short-logo.png"></a>
            </div>
            <div class="col-xs-8 col-sm-6 col-md-6 col-lg-6 text-primary text-right salut">
                <div>Здравствуйте, <?php echo htmlspecialchars($_SESSION['user']['login'])?>!</div>
                <a class="btn btn-success btn-adapt" href="<?php
                if($_GET['module'] == 'goods')
                    echo '/goods';
                elseif ($_GET['module'] == 'books')
                    echo '/books';
                elseif($_GET['module'] == 'authors')
                    echo '/books/authors';
                else
                    echo '/';
                ?>" target="_blank">
                    <i class="glyphicon glyphicon-eye-open"></i>
                    <span class="large">Просмотр сайта</span>
                    <span class="small">На сайт</span>
                </a>
                <a class="btn btn-danger btn-adapt" href="/" title="Выйти из админки" data-toggle="tooltip" data-placement="bottom">
                    <i class="glyphicon glyphicon-log-in"></i>
                    Exit
                </a>
            </div>
        </div>
    </div>

    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle" data-toggle="collapse" data-target="#mainNav">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div class="collapse navbar-collapse" id="mainNav">
                <ul class="nav navbar-nav">
                    <li class="<?php if ($_GET['module'] == 'static') echo 'active';?>"">
                    <a href="/admin">
                        <i class="glyphicon glyphicon-home"></i>
                        Главная
                    </a>
                    </li>
                    <li class="<?php if ($_GET['module'] == 'goods') echo 'active';?>">
                        <a href="/admin/goods">
                            <i class="glyphicon glyphicon-shopping-cart"></i>
                            Товары
                        </a>
                    </li>
                    <li class="<?php if ($_GET['module'] == 'users') echo 'active';?>">
                        <a href="/admin/users">
                            <i class="glyphicon glyphicon-user"></i>
                            Пользователи
                        </a>
                    </li>
                    <li class="<?php if ($_GET['module'] == 'books') echo 'active';?>">
                        <a href="/admin/books">
                            <i class="glyphicon glyphicon-book"></i>
                            Книги
                        </a>
                    </li>
                    <li class="<?php if ($_GET['module'] == 'authors') echo 'active';?>">
                        <a href="/admin/authors">
                            <i class="glyphicon glyphicon-pencil"></i>
                            Авторы
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<div id="upward" class = "animate"></div>