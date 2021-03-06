<#import "parts/common.ftl" as c>
<#import "parts/adminMenu.ftl" as am>
<#import "parts/navBar.ftl" as n>
<#import "parts/login.ftl" as l>

<@c.page>
    <@n.navBar />
    <@am.adminMenu>


<h3 class="ml">Редактирование пользователя <span class="textitalic">${user.username!n/a}</span></h3>
    <form class="ml mmain20" action="/user" method="post">
        <div class="form-group row">
            <div class="col-2">
                <span>Логин</span>
            </div>
            <div class="col-3">
                <input class="form-control" type="text" value="${user.username!"n/a"}" name="username">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-2">
                <span>Пароль</span>
            </div>
            <div class="col-3">
                <input class="form-control" type="password" value="${user.password!"n/a"}" name="password">
            </div>
        </div>
        <div class="form-group row">

            <div class="col-2">
                <label>Роль</label>
            </div>
            <div class="col-3">
                <#list roles as role>
                    <input class="form-control-input mt10" type="checkbox"
                           name="${role}" ${user.roles?seq_contains(role)?string("checked","")}>${role}</br>
                </#list>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-2">
            </div>
            <div class="col-3">
                <input type="hidden" value="${user.id}" name="userId">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                <button class="btn btn but mt10 fr" type="submit">Сохранить</button>
            </div>
        </div>
    </form>

    </@am.adminMenu>
</@c.page>