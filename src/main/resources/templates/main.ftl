<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
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
            <#if userrole?? && (userrole=="USER" ||userrole=="ADMIN")>
                <li class="nav-item">
                    <a class="nav-link" href="/getStatistics">Статистика</a>
                </li></#if>
            <li class="nav-item">
                <a class="nav-link" href="aboutAs">О нас</a>
            </li>
        </ul>
        <#if auth==false>
            <button type="button" class="btn my-2 my-sm-0 but" data-toggle="modal"
                    data-target="#exampleModalCenter">Войти
            </button>
        <#else> <button  type="button" class="btn btn butSuccess mr7"><a href="/editProfile"> ${username}</a></button>
            <@l.logout />
        </#if>

    </div>

</nav>
<div class="color-for-bar bgstart"></div>

<div class="container">
    <div class="row margintotop">
        <div class="col-12 pmain20">
            <h4 class="texal">Добро пожаловать в автоматизированную систему тестирования "АСТ Тест".</h4><h5 class="texal">Мы поможем сделать процесс
                тестирования простым и понятным.</h5>
            <div class="row mmain20">
                <div class="col-md-4">
                    <div class="login-icon">
                        <center><i class="far fa-thumbs-up texal fcolor"></i></center>
                    </div>
                    <h5 class="texal mcol">Удобство использования</h5>
                    <h6 class="texal">Не требует скачивания и установки.</h6>
                </div>
                <div class="col-md-4">
                    <center><i class="fas fa-list-ol texal fcolor"></i></center>
                    <h5 class="texal mcol">Универсальность</h5>
                    <h6 class="texal">Тестирование может выполняться по любым отраслям знаний.</h6>
                </div>
                <div class="col-md-4">
                    <center><i class="fas fa-wrench texal fcolor"></i></center>
                    <h5 class="texal mcol">Гибкость</h5>
                    <h6 class="texal">Широкие возможности редактирования данных в системе.</h6>
                </div>
            </div>
        </div>
    </div>



    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalCenterTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Форма авторизации</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fas fa-times"></i></span>
                    </button>
                </div>
                <form action="/" id="login" method="post">
                    <div class="modal-body">

                        <div class="form-group">
                            <label for="formGroupExampleInput">Username</label>
                            <input type="text" name="username" class="form-control"
                                   id="formGroupExampleInput" placeholder="Username"/>
                        </div>
                        <div class="form-group">
                            <label for="formGroupExampleInput2">Password</label>
                            <input type="password" name="password" class="form-control"
                                   placeholder="Password" id="formGroupExampleInput2"/>
                        </div>

                    <#---->
                    <#---->
                    <#--<div><input type="text" name="username" class="form-control" type="text" placeholder="Username"></div>-->
                    <#--<div><input type="password" name="password" class="form-control" type="text" placeholder="Password"></div>-->
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <#--<div><input type="submit" value="Sign In"/></div>-->


                    </div>
                    <div class="modal-footer">
                    <#--<div class="create_account"><a href="/registration">Create account</a></div>-->
                    <#--<button type="button" class="btn btn-secondary" data-dismiss="modal">Exit</button>-->
                        <button type="submit" id="subButton" class="btn btn-primary but">Войти</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</@c.page>