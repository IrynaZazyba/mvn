<#import "parts/common.ftl" as c>
<#import "parts/adminMenu.ftl" as am>
<#import "parts/navBar.ftl" as n>
<#import "parts/login.ftl" as l>

<@c.page>
    <@n.navBar />
    <@am.adminMenu>



    <form action="/user" method="post">
        <div class="form-group col-3">
            <span>User editor</span>
            <input class="form-control" type="text" value="${user.username!"n/a"}" name="username">
            <#list roles as role>
                <div>
                    <div class="form-check">

                        <label><input class="form-control-input" type="checkbox"
                                      name="${role}" ${user.roles?seq_contains(role)?string("checked","")}>${role}
                        </label>
                    </div>
                </div>

            </#list>
            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button class="btn btn-outline-info mt10" type="submit">Save</button>
        </div>
    </form>

    </@am.adminMenu>
</@c.page>