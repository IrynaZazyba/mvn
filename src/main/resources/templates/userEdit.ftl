<#import "parts/common.ftl" as c>
<#import "parts/adminMenu.ftl" as am>
<#import "parts/navBar.ftl" as n>
<#import "parts/login.ftl" as l>

<@c.page>
    <@n.navBar />
    <@am.adminMenu>


    User editor
    <form action="/user" method="post">
        <input type="text" value="${user.username!"n/a"}" name="username">
        <#list roles as role>
            <div>
                <label><input type="checkbox"
                              name="${role}" ${user.roles?seq_contains(role)?string("checked","")}>${role}</label>
            </div>

        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <button type="submit">Save</button>
    </form>

    </@am.adminMenu>
</@c.page>