<#import "parts/common.ftl" as c>
<#import "parts/navBar.ftl" as n>
<#import "parts/login.ftl" as l>

<@c.page>
    <@n.navBar />


<div class="form">

    <form action="/editProfile" method="post">
        <div class="form-group row">
            <div class="col-1">
                <span>Логин</span>
            </div>
            <div class="col-2">
                <input class="form-control" type="text" value="${user.username!n/a}" name="username">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-1">
                <span>Пароль</span>
            </div>
            <div class="col-2">
                <input class="form-control" type="password" value="${user.password!n/a}" name="password">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-1">
            </div>
            <div class="col-2">
                <input type="hidden" value="${user.id}" name="userId">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                <button class="btn btn but mt10 fr" type="submit">
                    Сохранить
                </button>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <#if userSave??>
                    <div class="alert alert-success" role="alert">
                    ${userSave}
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
</div>


</@c.page>