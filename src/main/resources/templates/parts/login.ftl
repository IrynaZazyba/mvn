<#macro login path>
<form action="${path}" method="post">
    <div><label> User Name : <input type="text" name="username"/> </label></div>
    <div><label> Password: <input type="password" name="password"/> </label></div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div><input type="submit" value="Войти"/></div>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="submit"  class="btn my-2 my-sm-0 but"  value="Выйти"/>
</form>
</#macro>