<div class="main">
	<h2>ИГРА В ГОРОДА</h2>
   <form action="" method="post">
       <div class="aside_div left">
           <div id="health_server" class="health">
               <i class="fa fa-heart-o fa-2x" aria-hidden="true"></i>
               <i class="fa fa-heart fa-2x" aria-hidden="true"></i>
               <i class="fa fa-heart fa-2x" aria-hidden="true"></i>
           </div>
           <p class="first_line"><b>Сервер</b></p>
           <div id="server_cities">
               <!--Города сервера-->
           </div>
       </div>
       <div class="city_div left">
           <label for="city">Введите город</label>
           <input id="city" class="input_city" type="text" name="city" autofocus>
           <input class="submit" type="button" name="submit" value="ГОТОВО" onclick="return myAjax()">
       </div>
       <div class="aside_div left">
           <div id="health_user" class="health">
               <i class="fa fa-heart-o fa-2x" aria-hidden="true"></i>
               <i class="fa fa-heart fa-2x" aria-hidden="true"></i>
               <i class="fa fa-heart fa-2x" aria-hidden="true"></i>
           </div>
           <p class="first_line">
               <strong>
                   <?php
                   if (isset($_SESSION['user'])) echo htmlspecialchars($_SESSION['user']['login']); else echo 'Пользователь'
                   ?>
               </strong>
           </p>
           <div id="user_cities">
               <!--Города пользователя-->
           </div>
       </div>
   </form>
</div>