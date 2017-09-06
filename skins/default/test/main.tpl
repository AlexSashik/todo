<div class="main">
    <form method="post" enctype="multipart/form-data">
        <input type="file" name="file"><br>
        <input type="submit" name="submit" value="Загрузить фото"><br>
        <?php if (isset($err)) echo '<b>'.htmlspecialchars($err).'</b>'; ?>
    </form>
</div>