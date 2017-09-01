<div class="main">
	<h2>ИГРА В ГОРОДА</h2>
   <form action="" method="post">
       <div class="aside_div left">
           <p><b>Сервер</b></p>
           <div id="server_cities">

           </div>
       </div>
       <div class="city_div left">
           <label for="city">Введите город</label>
           <input id="city" class="input_city" type="text" name="city" autofocus>
           <input class="submit" type="button" name="submit" value="ГОТОВО" onclick="return myAjax()">
       </div>
       <div class="aside_div left">
           <p><b><?php if (isset($_SESSION['user'])) echo htmlspecialchars($_SESSION['user']['login']); else echo 'Пользователь'?></b></p>
           <div id="user_cities">

           </div>
       </div>
   </form>
</div>