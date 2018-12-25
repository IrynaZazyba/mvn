<#macro navBar>
<div class="topBar"></div>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="#"><h3>АСТ Тест</h3></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <#if userrole?? && (userrole=="USER" ||userrole=="ADMIN")>
                <li class="nav-item">
                    <a class="nav-link" href="/testsRun">Тесты</a>
                </li></#if>
            <#if userrole?? &&userrole=="ADMIN">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Администрирование
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/userEdit">Редактирование пользователей</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/addTests">Редактирование тестов</a>
                    </div>
                </li>

            <#--<li class="nav-item">-->
            <#--<a class="nav-link" href="/adminPanel">Admin panel</a>-->
            <#--</li>-->
            </#if>
            <li class="nav-item">
                <a class="nav-link" href="#">О нас</a>
            </li>
        </ul>
        <#if auth==false>
            <button type="button" class="btn my-2 my-sm-0 but" data-toggle="modal"
                    data-target="#exampleModalCenter">Войти
            </button>
                   <#else> <span class="headerUser badge bg-color">${username}</span>
            <@l.logout />
        </#if>

    </div>
</nav>


</#macro>