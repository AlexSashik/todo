<main>
    <div class="chat">
        <div class="header">TodoChat</div>
        <div id="chat-body">
            <div id="chatSpace" class="main-chat">
                <span class="welcome">Добро пожаловать в чат!</span>
                <!--<p>Текст</p>-->
            </div>
            <form method="post" action="" onsubmit="return false;">
                <textarea placeholder="Отправить сообщение" id="text"></textarea>
                <div class="send">
                    <div class="settings">
                        <i class="fa fa-cog fa-lg" aria-hidden="true"></i>
                    </div>
                    <div id="users" onclick="return usersList();">
                        <i class="fa fa-list fa-lg" aria-hidden="true"></i>
                    </div>
                    <button onclick="return myAjax();">Чат</button>
                </div>
            </form>
        </div>
        <div id="chat-list">
            <div class="chat-list-header">
                <i id="backToChat" class="fa fa-times fa-lg" aria-hidden="true" title="To chat"></i>
                <i id="refreshList" class="fa fa-refresh fa-lg" aria-hidden="true" title="Refresh"></i>
                Список участников
            </div>
            <div class="chat-list-main">
                <div id="loading">
                    <i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>
                </div>
                <div class="group" id="admins">
                    МОДЕРАТОРЫ
                </div>
                <div class="group" id="online">
                    ОНЛАЙН
                </div>
                <div class="group" id="offline">
                    ОФФЛАЙН
                </div>
                <div class="group" id="ban">
                    ЗАБАНЕНЫ
                </div>
            </div>
        </div>
    </div>
</main>