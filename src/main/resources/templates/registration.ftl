<#import "parts/registrommon.ftl" as registrcommon>
<#import "parts/login.ftl" as l>
<@registrcommon.page>
<#--<div>-->
<#--${message?ifExists}-->
<#--</div>-->

<form action="/registration" method="post" class="form-signin">
<#--<img class="mb-4" alt="" width="72" height="72">-->
    <h1 class="h3 mb-3 font-weight-normal">Please create account</h1>
    <div class="form-group">
        <label for="inputusername" class="sr-only">Username</label>
        <input type="text"  name="username" class="form-control" placeholder="Username" required>
    </div>
    <div class="form-group">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" class="form-control" placeholder="Password" required>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2018</p>
</form>

</@registrcommon.page>
