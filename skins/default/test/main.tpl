<div class="main">
    <form method="post" enctype="multipart/form-data">
        <input type="file" name="file"><br>
        <input type="submit" name="submit" value="Загрузить фото"><br>
        <?php if (isset($err)) echo '<b>'.htmlspecialchars($err).'</b>'; ?>
    </form>

    <p class="font-test one-more">
        Test
    </p>

    <a href="/img/default/test/1.png" data-fancybox="group" data-caption="Caption #1">
        <span>Click1</span>
    </a>

    <a href="/img/default/test/2.png" data-fancybox="group" data-caption="Caption #2">
        <span>Click2</span>
    </a>

</div>