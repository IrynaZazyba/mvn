<#import "parts/common.ftl" as c>
<#import "parts/adminMenu.ftl" as am>
<#import "parts/navBar.ftl" as n>
<#import "parts/login.ftl" as l>

<@c.page>
    <@n.navBar />
    <@am.adminMenu>



    <h3 class="ml">Добавление нового пользователя</h3>
    <form class="mmain20 ml" action="/addUser" method="post">
        <div class="form-group row">
            <div class="col-2">
                <span>Логин</span>
            </div>
            <div class="col-3">
                <input class="form-control" type="text" name="username">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-2">
                <span>Пароль</span>
            </div>
            <div class="col-3">
                <input class="form-control" type="password" name="password">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-2">
            </div>
            <div class="col-3">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                <button class="btn btn but mt10 fr" type="submit">Сохранить</button>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <#if userSaved??>
                    <div class="alert alert-success" role="alert">
                    ${userSaved}
                    </div>
                </#if>
                <#if userExist??>
                    <div class="alert alert-danger" role="alert">
                    ${userExist}
                    </div>
                </#if>

            </div>
        </div>
    </form>

    </@am.adminMenu>
</@c.page>