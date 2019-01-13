<#import "parts/registrommon.ftl" as registrcommon>
<#import "parts/login.ftl" as l>
<@registrcommon.page>
<#--<div>-->
<#--${message?ifExists}-->
<#--</div>-->

<form action="/" method="post" class="form-signin">
<#--<img class="mb-4" alt="" width="72" height="72">-->
    <div class="alert alert-danger" role="alert">
    <h5>Неверные учетные данные.</h5>
    <h6>Попробуйте еще раз, либо обратитесь в службу поддержки.</h6>
    </div>
    <h1 class="h3 mb-3 font-weight-normal mt10">Форма авторизации</h1>
    <div class="form-group">
        <label for="inputusername" class="sr-only">Username</label>
        <input type="text" name="username" class="form-control"
               id="formGroupExampleInput" placeholder="Username"/>

    </div>
    <div class="form-group">
        <label for="inputusername" class="sr-only">Password</label>
        <input type="password" name="password" class="form-control"
               placeholder="Password" id="formGroupExampleInput2"/>
    </div>

    <button type="submit" id="subButton" class="btn butSuccess btn-block">Войти</button>
    <a href="/"><button type="button" id="subButton" class="btn but btn-block mt10">На главную</button></a>

    <p class="mt-5 mb-3 text-muted">&copy; 2018</p>
</form>

</@registrcommon.page>
